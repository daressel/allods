---@meta

--- CategoryConditionEvent
--- События и функции Lua API, относящиеся к некоторым условиям, заданными дизайнерами.

---@class conditionEventLib
conditionEvent = {}

--- Возвращает информацию, выполняется ли некоторое условие, заданное дизайнером.
---@param alias string строковое название условия
---@return boolean
function conditionEvent.IsConditionValid(alias) end

-- Events

--- Событие посылается, если изменилось некоторое условие, заданное дизанерами. Информацию см.  avatar.IsConditionValid( alias ).
EVENT_CONDITION_EVENT = "EVENT_CONDITION_EVENT"
