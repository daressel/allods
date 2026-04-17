---@meta

--- CategoryVariable
--- События и функции Lua Api, относящиеся к гейммеханическим переменнным шлавного игрока.

---@class variableLib
variable = {}

--- Метод возвращает информацию о геймдизайнерской переменной и её значение у главного игрока.
---@param variableId VariableId или идентификатор ресурса переменной или алиас
---@return table|nil
function variable.GetVariableInfo(variableId) end

--- У игрока могут быть некоторые гейммеханические переменные (например, количество Сил Льда у мага). Этот метод возвращает список идентификаторов этих переменных.
---@return table
function variable.GetVariables() end

-- Events

--- Событие присылается при появлении у гдавного игрока значения геймдизайнерской переменной.
EVENT_VARIABLE_ADDED = "EVENT_VARIABLE_ADDED"

--- Событие присылается при исчезновении у главного игрока значения геймдизайнерской переменной.
EVENT_VARIABLE_REMOVED = "EVENT_VARIABLE_REMOVED"

--- Событие присылается при изменении значения геймдизайнерской переменной главного игрока.
EVENT_VARIABLE_VALUE_CHANGED = "EVENT_VARIABLE_VALUE_CHANGED"
