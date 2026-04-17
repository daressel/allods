---@meta

--- CategoryLuaReadyCheck
--- События и функции Lua API, относящиеся к опросу о готовности группы или рейда.

--- Состояние готовности персонажа.
---@type integer
READY_CHECK_READY_STATE_UNKNOWN = nil
---@type integer
READY_CHECK_READY_STATE_READY = nil
---@type integer
READY_CHECK_READY_STATE_NOT_READY = nil

---@class luaReadyCheckLib
luaReadyCheck = {}

--- Возвращает информацию о текущем состоянии проверки готовности группы.
---@return table|nil
function luaReadyCheck.GetReadyCheckInfo() end

--- Уведомление группы о своей готовности или неготовности к действиям (для текущего активного запроса).
---@param ready boolean готов ли игрок к действиям
function luaReadyCheck.ReportReadyCheck(ready) end

--- Запрос серверу о начале проверки готовности группы.
function luaReadyCheck.StartReadyCheck() end

--- Возвращает информацию о текущем состоянии проверки готовности рейда.
---@return table|nil
function luaReadyCheck.GetReadyCheckInfo() end

--- Уведомление рейду о своей готовности или неготовности к действиям (для текущего активного запроса).
---@param ready boolean готов ли игрок к действиям
function luaReadyCheck.ReportReadyCheck(ready) end

--- Запрос серверу о начале проверки готовности рейда.
function luaReadyCheck.StartReadyCheck() end

-- Events

--- Событие посылается при завершении опроса о готовности группы или рейда.
EVENT_READY_CHECK_ENDED = "EVENT_READY_CHECK_ENDED"

--- Событие посылается каждый раз, когда меняется состояние готовности игрока в группе или рейде (для текущего активного опроса). На начало и окончание опроса приходят отдельные события, данное событие в этих случаях не приходит.
EVENT_READY_CHECK_INFO_CHANGED = "EVENT_READY_CHECK_INFO_CHANGED"

--- Событие посылается при начале опроса о готовности группы или рейда.
EVENT_READY_CHECK_STARTED = "EVENT_READY_CHECK_STARTED"
