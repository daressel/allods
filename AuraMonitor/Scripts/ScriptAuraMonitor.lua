--------------------------------------------------------------------------------
-- AuraMonitor — основной скрипт
--
-- Зависит от utils.lua (должен быть первым в ScriptFileRefs).
-- Оттуда берёт: chatMsg, tryCall, safe, guard, AURAMON_TAG
--
-- Все API-вызовы идут через safe("lib.Fn", args...) — путь резолвится через _G
-- БЕЗ падения, даже если самой библиотеки (например, avatarInfo) нет как глобала.
--------------------------------------------------------------------------------

Global("AURAMON_SECTION", "AuraMonitor_lastSnapshot")
Global("wtOutput", nil)           -- текстовый виджет на форме
Global("outputLines", {})         -- кольцевой буфер последних событий
Global("OUTPUT_MAX_LINES", 12)
Global("wtAMButton", nil)         -- кнопка AM
Global("wtHealthWindow", nil)     -- суб-окно с HP
Global("hpRow", nil)              -- handle строки HP внутри окна

--------------------------------------------------------------------------------
-- JSON encoder (минимальный)
--------------------------------------------------------------------------------

Global("json", {})

local function escape_str(s)
	s = string.gsub(s, "\\", "\\\\")
	s = string.gsub(s, '"', '\\"')
	s = string.gsub(s, "\n", "\\n")
	s = string.gsub(s, "\r", "\\r")
	s = string.gsub(s, "\t", "\\t")
	return s
end

local function is_array(t)
	local n = 0
	for k, _ in pairs(t) do
		if type(k) ~= "number" then return false end
		n = n + 1
	end
	for i = 1, n do
		if t[i] == nil then return false end
	end
	return true, n
end

local function encode_value(v, depth)
	if depth > 8 then return '"<max-depth>"' end
	local tp = type(v)
	if v == nil then
		return "null"
	elseif tp == "boolean" then
		return v and "true" or "false"
	elseif tp == "number" then
		if v ~= v then return "null" end
		if v == math.huge or v == -math.huge then return "null" end
		return tostring(v)
	elseif tp == "string" then
		return '"' .. escape_str(v) .. '"'
	elseif tp == "table" then
		local isArr, n = is_array(v)
		if isArr then
			local parts = {}
			for i = 1, n do
				parts[i] = encode_value(v[i], depth + 1)
			end
			return "[" .. table.concat(parts, ",") .. "]"
		else
			local parts = {}
			for k, val in pairs(v) do
				if type(k) == "string" or type(k) == "number" then
					parts[#parts + 1] = '"' .. escape_str(tostring(k)) .. '":' .. encode_value(val, depth + 1)
				end
			end
			return "{" .. table.concat(parts, ",") .. "}"
		end
	else
		return '"<' .. tp .. '>"'
	end
end

function json.encode(v)
	return encode_value(v, 0)
end

--------------------------------------------------------------------------------
-- Вывод в виджет на форме (последние N строк) + дубль в чат
--------------------------------------------------------------------------------

---@param line string
local function pushOutputLine(line)
	outputLines[#outputLines + 1] = line
	while #outputLines > OUTPUT_MAX_LINES do
		table.remove(outputLines, 1)
	end
	if wtOutput then
		local text = table.concat(outputLines, "\n")
		local ok, ws = pcall(userMods.ToWString, text)
		if ok and ws then
			pcall(function() wtOutput:SetVal("value", ws) end)
		end
	end
end

--- Единая точка логирования. Выводит событие:
---   1. в on-screen widget (короткой строкой-сводкой),
---   2. в чат игрока — многострочно через chatTree, чтобы не обрезалось.
---@param kind string      Короткое имя события (buff_added, health_changed, snapshot, ...).
---@param payload any       Любая сериализуемая структура.
local function logJson(kind, payload)
	-- Виджет-лента: одна строка с коротким JSON (чтобы не забивать весь экран).
	local encoded = json.encode(payload)
	local short = encoded
	if #short > 200 then short = string.sub(short, 1, 200) .. "..." end
	pushOutputLine("[" .. kind .. "] " .. short)

	-- Чат: красивое дерево с дефисами (console.group-style).
	chatTree(AURAMON_TAG .. "[" .. kind .. "]", payload)
end

--------------------------------------------------------------------------------
-- Снапшот состояния
--------------------------------------------------------------------------------

---@return ObjectId|nil
local function getAvatarId()
	return safe("avatar.GetId") or safe("avatarInfo.GetId")
end

---@class ResourcesSnapshot
---@field health any             Таблица от object.GetHealthInfo, содержит .current / .maximum
---@field mana any               Табл. от unit.GetMana/mana.GetMana
---@field manaPct integer|nil
---@field rage number|nil
---@field will number|nil
---@field bloodPool integer|nil  Только у некроманта
---@field druidPetCommand integer|nil

---@param avatarId ObjectId|nil
---@return ResourcesSnapshot
local function getResources(avatarId)
	return {
		health          = safe("object.GetHealthInfo", avatarId),
		mana            = safe("unit.GetMana", avatarId) or safe("mana.GetMana", avatarId),
		manaPct         = safe("unit.GetManaPercentage", avatarId),
		rage            = safe("unit.GetRage", avatarId),
		will            = safe("unit.GetWill", avatarId),
		bloodPool       = safe("avatarInfo.GetNecromancerBloodPool"),
		druidPetCommand = safe("avatarInfo.GetDruidPetCommandPoints"),
	}
end

---@class BuffSnapshot
---@field buffId string
---@field sysName string|nil
---@field info table            Информация о ресурсе бафа (имя, описание и т.д.)
---@field dynamic table         Длительность / оставшееся время / стаки

---@param buffId ObjectId
---@return BuffSnapshot
local function describeBuff(buffId)
	return {
		buffId  = tostring(buffId),
		sysName = safe("buff.GetBuffSysName", buffId),
		info    = safe("buff.GetBuffInfo", buffId, true) or {},
		dynamic = safe("buff.GetBuffDynamicInfo", buffId) or {},
	}
end

---@param avatarId ObjectId|nil
---@return BuffSnapshot[]
local function getAuras(avatarId)
	local list = safe("buff.GetBuffs", avatarId, false) or {}
	local out = {}
	for i, id in ipairs(list) do
		out[i] = describeBuff(id)
	end
	return out
end

---@param ids any[]|nil
---@param infoPath string
---@return table[]
local function collectSpells(ids, infoPath)
	local out = {}
	if type(ids) ~= "table" then return out end
	for i, id in ipairs(ids) do
		out[i] = { id = tostring(id), info = safe(infoPath, id) }
	end
	return out
end

---@class SpellsSnapshot
---@field spellbook table[]      avatar.GetSpellBook() — активные заклинания
---@field abilities table[]      avatar.GetAbilities() — пассивные
---@field skills    table[]      avatar.GetSkills()

---@return SpellsSnapshot
local function getSpells()
	return {
		spellbook = collectSpells(safe("avatar.GetSpellBook"), "avatar.GetSpellInfo"),
		abilities = collectSpells(safe("avatar.GetAbilities"), "avatar.GetAbilityInfo"),
		skills    = collectSpells(safe("avatar.GetSkills"),    "avatar.GetSkillInfo"),
	}
end

---@param slotType integer  ITEM_CONT_INVENTORY | ITEM_CONT_EQUIPMENT | ...
---@return { size: integer|nil, items: table[] }
local function dumpContainer(slotType)
	return {
		size  = safe("containerLib.GetSize", slotType),
		items = (function()
			local items = safe("containerLib.GetItems", slotType) or {}
			local list = {}
			for slot, itemId in pairs(items) do
				list[#list + 1] = {
					slot   = slot,
					itemId = tostring(itemId),
					bonus  = safe("itemLib.GetBonus", itemId),
				}
			end
			return list
		end)(),
	}
end

---@class ContainersSnapshot
---@field inventory { size: integer|nil, items: table[] }
---@field equipment { size: integer|nil, items: table[] }

---@return ContainersSnapshot
local function getInventory()
	return {
		inventory = dumpContainer(ITEM_CONT_INVENTORY),
		equipment = dumpContainer(ITEM_CONT_EQUIPMENT),
	}
end

---@class AuraSnapshot
---@field avatarId string
---@field resources ResourcesSnapshot
---@field auras BuffSnapshot[]
---@field spells SpellsSnapshot
---@field containers ContainersSnapshot

---@return AuraSnapshot
local function buildSnapshot()
	local avatarId = getAvatarId()
	return {
		avatarId   = tostring(avatarId),
		resources  = getResources(avatarId),
		auras      = getAuras(avatarId),
		spells     = getSpells(),
		containers = getInventory(),
	}
end

--------------------------------------------------------------------------------
-- EVENT HANDLERS
--------------------------------------------------------------------------------

--- Подмножество полей, по которым isAvatar вычисляет, к кому относится событие.
--- Любая из таблиц EVENT_*_Data «приводится» к ObjectEventLike (структурная типизация).
---@class ObjectEventLike
---@field objectId? ObjectId  — EVENT_OBJECT_BUFF_*, прочие объектные события
---@field unitId?   ObjectId  — EVENT_UNIT_*_CHANGED (мана, ярость, воля)
---@field targetId? ObjectId  — некоторые player-target события
---@field id?       ObjectId  — EVENT_OBJECT_HEALTH_CHANGED

--- Проверяет, что событие касается самого игрока (а не другого объекта в мире).
---@param params ObjectEventLike|nil
---@return boolean
local function isAvatar(params)
	if not params then return false end
	local me = getAvatarId()
	if not me then return false end
	local id = params.objectId or params.unitId or params.targetId or params.id
	if id == nil then return true end
	local ok, eq = pcall(function() return me == id or (me.IsEqual and me:IsEqual(id)) end)
	return ok and eq or false
end

---@param params EVENT_OBJECT_BUFF_ADDED_Data
local function rawOnBuffAdded(params)
	if not isAvatar(params) then return end
	logJson("buff_added", { event = params, buff = describeBuff(params.buffId) })
end

---@param params EVENT_OBJECT_BUFF_CHANGED_Data
local function rawOnBuffChanged(params)
	if not isAvatar(params) then return end
	logJson("buff_changed", { event = params, buff = describeBuff(params.buffId) })
end

---@param params EVENT_OBJECT_BUFF_REMOVED_Data
local function rawOnBuffRemoved(params)
	if not isAvatar(params) then return end
	logJson("buff_removed", { event = params })
end

--- Обновить строку HP в HealthWindow (если окно видимо).
local function refreshHealthText()
	if not hpRow then return end
	local avatarId = getAvatarId()
	---@type { current: integer?, maximum: integer? }|nil
	local h = safe("object.GetHealthInfo", avatarId)
	local s = "?"
	if h and h.current and h.maximum then
		s = tostring(h.current) .. " / " .. tostring(h.maximum)
	end
	hpRow:setValue(s)
end

---@param params EVENT_OBJECT_HEALTH_CHANGED_Data
local function rawOnHealthChanged(params)
	if not isAvatar(params) then return end
	local avatarId = getAvatarId()
	logJson("health_changed", {
		event  = params,
		health = safe("object.GetHealthInfo", avatarId),
	})
	if ui and ui.isVisible(wtHealthWindow) then
		refreshHealthText()
	end
end

---@param params EVENT_UNIT_MANA_CHANGED_Data
local function rawOnManaChanged(params)
	if not isAvatar(params) then return end
	local avatarId = getAvatarId()
	logJson("mana_changed", {
		event = params,
		mana  = safe("unit.GetMana", avatarId),
	})
end

---@param params EVENT_UNIT_RAGE_CHANGED_Data
local function rawOnRageChanged(params)
	if not isAvatar(params) then return end
	local avatarId = getAvatarId()
	logJson("rage_changed", {
		event = params,
		rage  = safe("unit.GetRage", avatarId),
	})
end

---@param params EVENT_UNIT_WILL_CHANGED_Data
local function rawOnWillChanged(params)
	if not isAvatar(params) then return end
	local avatarId = getAvatarId()
	logJson("will_changed", {
		event = params,
		will  = safe("unit.GetWill", avatarId),
	})
end

---@param params EVENT_NECROMANCER_BLOOD_POOL_CHANGED_Data
local function rawOnBloodPoolChanged(params)
	logJson("blood_pool_changed", {
		event     = params,
		bloodPool = safe("avatarInfo.GetNecromancerBloodPool"),
	})
end

---@param params EVENT_DRUID_PET_COMMAND_POINTS_CHANGED_Data
local function rawOnDruidCommandChanged(params)
	logJson("druid_command_changed", {
		event  = params,
		points = safe("avatarInfo.GetDruidPetCommandPoints"),
	})
end

-- Обёрнутые handler'ы — экспорт наружу как глобалы (нужно common.RegisterEventHandler)
OnBuffAdded           = guard("OnBuffAdded",           rawOnBuffAdded)
OnBuffChanged         = guard("OnBuffChanged",         rawOnBuffChanged)
OnBuffRemoved         = guard("OnBuffRemoved",         rawOnBuffRemoved)
OnHealthChanged       = guard("OnHealthChanged",       rawOnHealthChanged)
OnManaChanged         = guard("OnManaChanged",         rawOnManaChanged)
OnRageChanged         = guard("OnRageChanged",         rawOnRageChanged)
OnWillChanged         = guard("OnWillChanged",         rawOnWillChanged)
OnBloodPoolChanged    = guard("OnBloodPoolChanged",    rawOnBloodPoolChanged)
OnDruidCommandChanged = guard("OnDruidCommandChanged", rawOnDruidCommandChanged)

--------------------------------------------------------------------------------
-- INIT
--------------------------------------------------------------------------------

local function rawInit()
	chatMsg(AURAMON_TAG .. " init start")

	-- Виджет вывода на форме
	if mainForm then
		local ok, w = tryCall(function()
			return mainForm:GetChildChecked("Output", false)
		end)
		if ok and w then
			wtOutput = w
			tryCall(function() wtOutput:Show(true) end)
			tryCall(function() mainForm:Show(true) end)
			pushOutputLine("AuraMonitor ready")
		else
			chatMsg(AURAMON_TAG .. " WARN: Output widget not found on mainForm")
		end
	else
		chatMsg(AURAMON_TAG .. " WARN: mainForm is nil")
	end

	-- Демо UI: кнопка AM + окно с HP (через ui-фреймворк)
	wtAMButton     = ui.bind(mainForm, "AMButton")
	wtHealthWindow = ui.bind(mainForm, "HealthWindow")
	ui.hide(wtHealthWindow)

	-- Зарегистрировать шаблон строки-статуса, создать строку HP внутри окна
	if ui.registerTemplate("StatusRowTemplate") then
		hpRow = ui.createStatusRow(wtHealthWindow, { label = "HP", x = 10, y = 10, width = 200, height = 20 })
	end

	-- Клик по AM — toggle окна, при открытии обновить HP
	ui.onClick("amButtonClick", function()
		chatMsg(AURAMON_TAG .. "[click] amButtonClick")
		ui.toggle(wtHealthWindow)
		if ui.isVisible(wtHealthWindow) then
			refreshHealthText()
		end
	end)

	-- Регистрация обработчиков
	local events = {
		{ OnBuffAdded,           "EVENT_OBJECT_BUFF_ADDED" },
		{ OnBuffChanged,         "EVENT_OBJECT_BUFF_CHANGED" },
		{ OnBuffRemoved,         "EVENT_OBJECT_BUFF_REMOVED" },
		{ OnHealthChanged,       "EVENT_OBJECT_HEALTH_CHANGED" },
		{ OnManaChanged,         "EVENT_UNIT_MANA_CHANGED" },
		{ OnRageChanged,         "EVENT_UNIT_RAGE_CHANGED" },
		{ OnWillChanged,         "EVENT_UNIT_WILL_CHANGED" },
		{ OnBloodPoolChanged,    "EVENT_NECROMANCER_BLOOD_POOL_CHANGED" },
		{ OnDruidCommandChanged, "EVENT_DRUID_PET_COMMAND_POINTS_CHANGED" },
	}
	for _, e in ipairs(events) do
		tryCall("common.RegisterEventHandler", e[1], e[2])
	end

	-- Начальный снапшот
	local snapshot = buildSnapshot()
	logJson("snapshot", snapshot)

	-- Персистентное хранение
	tryCall("userMods.SetAvatarConfigSection", AURAMON_SECTION, snapshot)

	chatMsg(AURAMON_TAG .. " init done: buffs/health/mana/rage/will/blood/druid handlers registered")
end

function Init()
	local ok, err = pcall(rawInit)
	if not ok then
		chatMsg(AURAMON_TAG .. "[ERR] Init: " .. tostring(err))
	end
end

--------------------------------------------------------------------------------
Init()
--------------------------------------------------------------------------------
