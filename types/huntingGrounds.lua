---@meta

--- CategoryHuntingGrounds
--- События и методы для, которые относится к Диким Землям.

--- Сложность игровой зоны
--- обычная
---@type integer
ZONE_TIER_DIFFICULTY_DEFAULT = nil
--- никакая
---@type integer
ZONE_TIER_DIFFICULTY_NONE = nil
--- лёгкая
---@type integer
ZONE_TIER_DIFFICULTY_EASY = nil
--- средняя
---@type integer
ZONE_TIER_DIFFICULTY_MEDIUM = nil
--- тяжелая
---@type integer
ZONE_TIER_DIFFICULTY_HARD = nil
--- сверх тяжелая
---@type integer
ZONE_TIER_DIFFICULTY_INSANE = nil

---@class huntingGroundsLib
huntingGrounds = {}

--- Возвращает описание "отслеживаемого" объекта - Track - в зоне игрока. Такие объекты, например, могут обозначать хорунжего или т.п.
---@param objectId ObjectId идентификатор Track-а
---@return table|nil
function huntingGrounds.GetTrackInfo(objectId) end

-- Events

--- Событие присылается при изменении модификатора зоны мутации.
EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED = "EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED"

--- Событие присылается при изменении заполненности игровой зоны мутации.
EVENT_MUTATION_ZONE_POPULATION_CHANGED = "EVENT_MUTATION_ZONE_POPULATION_CHANGED"
