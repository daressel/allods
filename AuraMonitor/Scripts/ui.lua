--------------------------------------------------------------------------------
-- AuraMonitor / ui.lua
--
-- Мини-фреймворк поверх виджетов Allods. Зависит от utils.lua (chatMsg, tryCall).
-- Типы описаны в AuraMonitor/types/AuraMonitor.lua (@class UI, StatusRowOpts,
-- StatusRowHandle, ...). LuaLS подхватывает их через .luarc.json.
--
-- Два уровня API:
--   1. Работа с существующими виджетами (pre-declared в XDB):
--      ui.bind, ui.onClick, ui.setText, ui.show/hide/toggle/isVisible,
--      ui.getPlacement, ui.setPos, ui.setSize, ui.setRect.
--   2. Шаблоны + клонирование (один виджет в XDB → N копий в Lua):
--      ui.registerTemplate(name), ui.create(name, parent),
--      ui.createStatusRow(parent, opts) — готовая обёртка.
--------------------------------------------------------------------------------

Global("ui", {})

--------------------------------------------------------------------------------
-- Внутренние хелперы
--------------------------------------------------------------------------------

--- Локальный кэш: name → widgetDesc.
---@type table<string, any>
local templates = {}

--- Конвертация string → WString с подавлением ошибок.
---@param text string|any
---@return WString|nil
local function toWString(text)
	if type(text) ~= "string" then text = tostring(text) end
	local ok, ws = pcall(userMods.ToWString, text)
	if ok then return ws end
	return nil
end

--- Проверить виджет на nil; при отсутствии — лог в чат.
---@param w WidgetSafe|nil
---@param ctx string
---@return boolean
local function ensureWidget(w, ctx)
	if not w then
		chatMsg(AURAMON_TAG .. "[ERR] " .. tostring(ctx) .. ": widget is nil")
		return false
	end
	return true
end

--------------------------------------------------------------------------------
-- 1. Работа с существующими виджетами
--------------------------------------------------------------------------------

---@param parent WidgetSafe|FormSafe
---@param name string
---@param recursive? boolean
---@return WidgetSafe|nil
function ui.bind(parent, name, recursive)
	if not parent then
		chatMsg(AURAMON_TAG .. "[ERR] ui.bind('" .. tostring(name) .. "'): parent is nil")
		return nil
	end
	-- GetChildChecked бросает на отсутствующем имени; используем Unchecked, чтобы
	-- получить nil и сообщить понятную ошибку, а не <anon> от tryCall.
	local ok, w = pcall(function()
		return parent:GetChildUnchecked(name, recursive and true or false)
	end)
	if not ok then
		chatMsg(AURAMON_TAG .. "[ERR] ui.bind('" .. tostring(name) .. "'): " .. tostring(w))
		return nil
	end
	if not w then
		chatMsg(AURAMON_TAG .. "[ERR] ui.bind('" .. tostring(name) .. "'): not found in parent")
		return nil
	end
	return w
end

---@param reactionName string
---@param handler fun(params:any)
function ui.onClick(reactionName, handler)
	if type(handler) ~= "function" then
		chatMsg(AURAMON_TAG .. "[ERR] ui.onClick('" .. tostring(reactionName) .. "'): handler is not a function")
		return
	end
	local wrapped = guard("onClick:" .. tostring(reactionName), handler)
	tryCall("common.RegisterReactionHandler", wrapped, reactionName)
end

---@param widget WidgetSafe
---@param text string|WString
function ui.setText(widget, text)
	if not ensureWidget(widget, "ui.setText") then return end
	local ws = toWString(text)
	if not ws then return end
	tryCall(function() widget:SetVal("value", ws) end)
end

---@param widget WidgetSafe
---@param visible? boolean
function ui.show(widget, visible)
	if not ensureWidget(widget, "ui.show") then return end
	if visible == nil then visible = true end
	tryCall(function() widget:Show(visible and true or false) end)
end

---@param widget WidgetSafe
function ui.hide(widget)
	ui.show(widget, false)
end

---@param widget WidgetSafe
---@return boolean
function ui.isVisible(widget)
	if not widget then return false end
	local ok, v = tryCall(function() return widget:IsVisible() end)
	if ok then return v and true or false end
	return false
end

---@param widget WidgetSafe
function ui.toggle(widget)
	if not ensureWidget(widget, "ui.toggle") then return end
	ui.show(widget, not ui.isVisible(widget))
end

---@param widget WidgetSafe
---@return table|nil
function ui.getPlacement(widget)
	if not ensureWidget(widget, "ui.getPlacement") then return nil end
	local ok, p = tryCall(function() return widget:GetPlacementPlain() end)
	if ok then return p end
	return nil
end

---@param widget WidgetSafe
---@param x number
---@param y number
function ui.setPos(widget, x, y)
	local p = ui.getPlacement(widget)
	if not p then return end
	if p.posX ~= nil then p.posX = x end
	if p.posY ~= nil then p.posY = y end
	-- запасной путь через p.X/p.Y (если движок отдал nested-формат)
	if p.X and type(p.X) == "table" and p.X.Pos ~= nil then p.X.Pos = x end
	if p.Y and type(p.Y) == "table" and p.Y.Pos ~= nil then p.Y.Pos = y end
	tryCall(function() widget:SetPlacementPlain(p) end)
end

---@param widget WidgetSafe
---@param w number
---@param h number
function ui.setSize(widget, w, h)
	local p = ui.getPlacement(widget)
	if not p then return end
	if p.sizeX ~= nil then p.sizeX = w end
	if p.sizeY ~= nil then p.sizeY = h end
	if p.X and type(p.X) == "table" and p.X.Size ~= nil then p.X.Size = w end
	if p.Y and type(p.Y) == "table" and p.Y.Size ~= nil then p.Y.Size = h end
	tryCall(function() widget:SetPlacementPlain(p) end)
end

---@param widget WidgetSafe
---@param x number
---@param y number
---@param w number
---@param h number
function ui.setRect(widget, x, y, w, h)
	local p = ui.getPlacement(widget)
	if not p then return end
	if p.posX  ~= nil then p.posX  = x end
	if p.posY  ~= nil then p.posY  = y end
	if p.sizeX ~= nil then p.sizeX = w end
	if p.sizeY ~= nil then p.sizeY = h end
	if p.X and type(p.X) == "table" then
		if p.X.Pos  ~= nil then p.X.Pos  = x end
		if p.X.Size ~= nil then p.X.Size = w end
	end
	if p.Y and type(p.Y) == "table" then
		if p.Y.Pos  ~= nil then p.Y.Pos  = y end
		if p.Y.Size ~= nil then p.Y.Size = h end
	end
	tryCall(function() widget:SetPlacementPlain(p) end)
end

--------------------------------------------------------------------------------
-- 2. Шаблоны + клонирование (GetWidgetDesc / CreateChildByDesc)
--------------------------------------------------------------------------------

--- Забрать descriptor у пред-объявленного виджета-шаблона (ребёнка `parent`)
--- и уничтожить сам шаблон. После этого его можно клонировать через `ui.create`.
--- Паттерн взят из SampleCommon/Scripts/WidgetFactory.lua:99-102.
---@param templateName string
---@param parent? WidgetSafe|FormSafe
---@return boolean
function ui.registerTemplate(templateName, parent)
	parent = parent or mainForm
	if templates[templateName] then
		return true -- уже зарегистрирован
	end
	local w = ui.bind(parent, templateName, false)
	if not w then return false end
	local ok, desc = tryCall(function() return w:GetWidgetDesc() end)
	if not ok or not desc then
		chatMsg(AURAMON_TAG .. "[ERR] ui.registerTemplate('" .. templateName .. "'): GetWidgetDesc failed")
		return false
	end
	tryCall(function() w:DestroyWidget() end)
	templates[templateName] = desc
	return true
end

--- Создать новый виджет из зарегистрированного шаблона, прикрепить к `parent`.
---@param templateName string
---@param parent? WidgetSafe|FormSafe
---@return WidgetSafe|nil
function ui.create(templateName, parent)
	parent = parent or mainForm
	local desc = templates[templateName]
	if not desc then
		chatMsg(AURAMON_TAG .. "[ERR] ui.create('" .. tostring(templateName) .. "'): template not registered")
		return nil
	end
	local ok, w = tryCall(function() return parent:CreateChildByDesc(desc) end)
	if not ok or not w then return nil end
	return w
end

--- Создать «строку-статус» (label + value) из шаблона `StatusRowTemplate`.
--- Требует `ui.registerTemplate("StatusRowTemplate")` в Init.
---@param parent WidgetSafe|FormSafe
---@param opts StatusRowOpts
---@return StatusRowHandle|nil
function ui.createStatusRow(parent, opts)
	opts = opts or {}
	local w = ui.create("StatusRowTemplate", parent)
	if not w then return nil end

	local label = opts.label or ""
	local xx    = opts.x or 10
	local yy    = opts.y or 10
	local ww    = opts.width or 200
	local hh    = opts.height or 20

	ui.setRect(w, xx, yy, ww, hh)
	ui.show(w, true)

	---@type StatusRowHandle
	local row = {
		widget = w,
		label  = label,
		value  = "",
	}
	---@param s string
	function row:setLabel(s)
		self.label = tostring(s)
		ui.setText(self.widget, self.label .. ": " .. self.value)
	end
	---@param s string|number
	function row:setValue(s)
		self.value = tostring(s)
		ui.setText(self.widget, self.label .. ": " .. self.value)
	end
	function row:destroy()
		if self.widget then
			tryCall(function() self.widget:DestroyWidget() end)
			self.widget = nil
		end
	end

	row:setValue("")
	return row
end
