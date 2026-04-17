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

function chatMsg(text)
	if type(text) ~= "string" then text = tostring(text) end
	local ok, ws = pcall(userMods.ToWString, text)
	if not ok or not ws then return end
	pcall(userMods.SendSelfChatMessage, ws)
end

--------------------------------------------------------------------------------
-- Резолвер путей вида "a.b.c" через _G. Возвращает (value, nil) или (nil, err).
--------------------------------------------------------------------------------

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

function safe(pathOrFn, ...)
	local ok, res = tryCall(pathOrFn, ...)
	if ok then return res end
	return nil
end

--------------------------------------------------------------------------------
-- guard: обёртка для event-handler'а. При ошибке внутри handler'а
-- сообщает о ней в чат и подавляет исключение, чтобы не выпилился аддон.
--------------------------------------------------------------------------------

function guard(ctx, fn)
	return function(params)
		local ok, err = pcall(fn, params)
		if not ok then
			chatMsg(AURAMON_TAG .. "[ERR] " .. tostring(ctx) .. ": " .. tostring(err))
		end
	end
end
