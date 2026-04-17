---@meta

--- CategoryHealth
--- Функции и события Lua API, относящиеся к жизни юнитов и других объектов.

---@class healthLib
health = {}

--- Возвращает информацию о рунической сложности ран юнита.
---@param unitId ObjectId идентификатор юнита
---@return number
function health.GetRuneWoundsComplexity(unitId) end

-- Events

--- Событие присылается при изменении процентного значения здоровья интерактивных объектов и числового значения здоровья для персонажа игрока
EVENT_OBJECT_HEALTH_CHANGED = "EVENT_OBJECT_HEALTH_CHANGED"

--- Событие присылается при изменении процентного значения маны интерактивных объектов и числового значения маны для персонажа игрока
EVENT_OBJECT_MANA_CHANGED = "EVENT_OBJECT_MANA_CHANGED"

--- Событие присылается при изменения здоровья и состояния неуязвимости объектов
EVENT_OBJECTS_HEALTH_CHANGED = "EVENT_OBJECTS_HEALTH_CHANGED"
