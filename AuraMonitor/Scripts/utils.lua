--------------------------------------------------------------------------------
-- AuraMonitor / utils.lua
--
-- Общие утилиты, доступные всем скриптам этого аддона:
--   chatMsg(text)              — отправить строку себе в чат
--   tryCall(path_or_fn, ...)   — безопасный вызов; ошибка уходит в чат
--   safe(path_or_fn, ...)      — то же, но возвращает только значение (или nil)
--   guard(ctx, fn)             — обернуть event-handler так, чтобы он не падал
--
-- path может быть:
--   строкой типа "avatarInfo.GetNecromancerBloodPool" — тогда функция
--     резолвится через _G пошагово, БЕЗ падения, если по пути что-то nil;
--   функцией (тогда контекст для ошибок берётся как "<anon>").
--
-- Это важно, потому что в игре часть библиотек (например, avatarInfo)
-- может вовсе отсутствовать как глобал — и прямое индексирование
-- "avatarInfo.Xxx" падает ещё ДО вызова pcall. Path-форма это чинит.
--------------------------------------------------------------------------------

Global("AURAMON_TAG", "[AuraMonitor]")

--------------------------------------------------------------------------------
-- chatMsg: единственный канал вывода. Никогда не поднимает исключение.
--------------------------------------------------------------------------------

---@param text string|any
function chatMsg(text)
	if type(text) ~= "string" then text = tostring(text) end
	local ok, ws = pcall(userMods.ToWString, text)
	if not ok or not ws then return end
	pcall(userMods.SendSelfChatMessage, ws)
end

--------------------------------------------------------------------------------
-- Резолвер путей вида "a.b.c" через _G. Возвращает (value, nil) или (nil, err).
--------------------------------------------------------------------------------

---@param path string
---@return any|nil value
---@return string|nil err
local function resolvePath(path)
	if type(path) ~= "string" then
		return nil, "path is not a string"
	end
	local node = _G
	local walked = ""
	for part in string.gmatch(path, "[^.]+") do
		walked = (walked == "") and part or (walked .. "." .. part)
		if type(node) ~= "table" then
			return nil, "not a table at '" .. walked .. "'"
		end
		node = node[part]
		if node == nil then
			return nil, "nil at '" .. walked .. "'"
		end
	end
	return node
end

--------------------------------------------------------------------------------
-- tryCall: резолвит путь (или принимает функцию напрямую) и вызывает через pcall.
-- Любая ошибка (как при резолве, так и при вызове) уходит в чат как ERR.
-- Возвращает (ok, result_or_error).
--------------------------------------------------------------------------------

---@param pathOrFn string|function
---@param ... any
---@return boolean ok
---@return any result_or_error
function tryCall(pathOrFn, ...)
	local fn
	local ctx
	if type(pathOrFn) == "function" then
		fn = pathOrFn
		ctx = "<anon>"
	else
		ctx = tostring(pathOrFn)
		local resolved, err = resolvePath(pathOrFn)
		if not resolved then
			chatMsg(AURAMON_TAG .. "[ERR] " .. ctx .. ": " .. tostring(err))
			return false, err
		end
		if type(resolved) ~= "function" then
			chatMsg(AURAMON_TAG .. "[ERR] " .. ctx .. ": target is not a function (got " .. type(resolved) .. ")")
			return false, "not a function"
		end
		fn = resolved
	end
	local ok, res = pcall(fn, ...)
	if not ok then
		chatMsg(AURAMON_TAG .. "[ERR] " .. ctx .. ": " .. tostring(res))
		return false, res
	end
	return true, res
end

--------------------------------------------------------------------------------
-- safe: как tryCall, но возвращает сразу значение (или nil при ошибке).
-- Удобно для сбора снапшотов: один битый API не ломает весь дамп.
--------------------------------------------------------------------------------

---@generic T
---@param pathOrFn string|fun(...):T
---@param ... any
---@return T|nil
function safe(pathOrFn, ...)
	local ok, res = tryCall(pathOrFn, ...)
	if ok then return res end
	return nil
end

--------------------------------------------------------------------------------
-- guard: обёртка для event-handler'а. При ошибке внутри handler'а
-- сообщает о ней в чат и подавляет исключение, чтобы не выпилился аддон.
--------------------------------------------------------------------------------

---@param ctx string
---@param fn fun(params:any)
---@return fun(params:any)
function guard(ctx, fn)
	return function(params)
		local ok, err = pcall(fn, params)
		if not ok then
			chatMsg(AURAMON_TAG .. "[ERR] " .. tostring(ctx) .. ": " .. tostring(err))
		end
	end
end

--------------------------------------------------------------------------------
-- chatTree: многострочный вывод таблицы в чат (аналог console.group из JS).
-- Глубина обозначается дефисами:
--     [AuraMonitor][buff_added]
--     - objectId: 0x1234
--     - buffId:   0x5678
--     - info:
--     -- name: "Fire"
--     -- duration: 1800
--     -- icon:
--     --- path: "icon.tga"
-- Игра режет длинные строки в чате, поэтому каждый ключ/значение — своя строка.
--------------------------------------------------------------------------------

---@param value any
---@return string
local function formatLeaf(value)
	local tp = type(value)
	if tp == "string"  then return '"' .. value .. '"' end
	if tp == "nil"     then return "nil" end
	if tp == "boolean" then return tostring(value) end
	if tp == "number"  then return tostring(value) end
	return "<" .. tp .. ">"
end

---@param t table
---@return boolean isArray
---@return integer length
local function isArrayLike(t)
	local n = 0
	for k, _ in pairs(t) do
		if type(k) ~= "number" then return false, 0 end
		n = n + 1
	end
	for i = 1, n do
		if t[i] == nil then return false, 0 end
	end
	return true, n
end

---@class ChatTreeLimits
---@field maxLines? integer    Максимум строк на одно событие (по умолчанию 60).
---@field maxDepth? integer    Максимум глубины таблицы (по умолчанию 6).
---@field maxLen?   integer    Максимум длины value-строки (по умолчанию 180).
---@field maxArray? integer    Максимум элементов массива (по умолчанию 20).

--- Рекурсивно добавляет value в out-массив в формате дерева с дефисами.
---@param name string|nil
---@param value any
---@param depth integer        0 = верхний уровень (prefix "-").
---@param out string[]
---@param seen table
---@param limits ChatTreeLimits
local function appendTree(name, value, depth, out, seen, limits)
	if #out >= limits.maxLines then
		if out[#out] ~= "... (truncated)" then
			out[#out + 1] = "... (truncated)"
		end
		return
	end

	local prefix = string.rep("-", depth + 1) .. " "

	if type(value) == "table" then
		if seen[value] then
			out[#out + 1] = prefix .. (name and (tostring(name) .. ": <cycle>") or "<cycle>")
			return
		end
		if depth >= limits.maxDepth then
			out[#out + 1] = prefix .. (name and (tostring(name) .. ": <max-depth>") or "<max-depth>")
			return
		end
		if next(value) == nil then
			out[#out + 1] = prefix .. (name and (tostring(name) .. ": {}") or "{}")
			return
		end
		seen[value] = true

		-- Заголовок вложения. Без имени (name==nil) заголовок пропускаем — выводим
		-- содержимое прямо на текущем уровне.
		if name ~= nil then
			out[#out + 1] = prefix .. tostring(name) .. ":"
		end

		local childDepth = (name ~= nil) and (depth + 1) or depth
		local isArr, n = isArrayLike(value)
		if isArr then
			local limit = math.min(n, limits.maxArray)
			for i = 1, limit do
				appendTree("[" .. i .. "]", value[i], childDepth, out, seen, limits)
			end
			if n > limit then
				out[#out + 1] = string.rep("-", childDepth + 1) .. " ... " .. (n - limit) .. " more"
			end
		else
			for k, v in pairs(value) do
				appendTree(k, v, childDepth, out, seen, limits)
			end
		end
	else
		local s = formatLeaf(value)
		if #s > limits.maxLen then s = string.sub(s, 1, limits.maxLen) .. "..." end
		out[#out + 1] = prefix .. (name and (tostring(name) .. ": " .. s) or s)
	end
end

--- Отправляет в чат заголовок и многострочное представление `value`.
--- Для примитивов пишет одну строку. Для таблиц — дерево с дефисами.
---@param header string            Строка-заголовок (например "[AuraMonitor][buff_added]").
---@param value any                Что логируем — обычно таблица.
---@param limits? ChatTreeLimits   Пределы глубины/длины/кол-ва строк.
function chatTree(header, value, limits)
	limits = limits or {}
	limits.maxLines = limits.maxLines or 60
	limits.maxDepth = limits.maxDepth or 6
	limits.maxLen   = limits.maxLen   or 180
	limits.maxArray = limits.maxArray or 20

	chatMsg(header)
	if type(value) ~= "table" then
		chatMsg("- " .. formatLeaf(value))
		return
	end

	local lines = {}
	local seen = {}
	-- Верхний уровень обходим без заголовка (name=nil), чтобы избежать лишнего
	-- пустого заголовка вида «- : » — содержимое сразу попадает на depth 0.
	appendTree(nil, value, 0, lines, seen, limits)
	for _, line in ipairs(lines) do
		chatMsg(line)
	end
end
