---@meta

--- CategoryExperience
--- Методы и события Lua API, относящиеся к получению опыта.

---@class experienceLib
experience = {}

--- Возвращает информацию об Очках Судьбы персонажа
---@return table
function experience.GetDestinyPoints() end

--- Возвращает информацию об опыте персонажа
---@return table
function experience.GetExperience() end

--- Возвращает количество опыта персонажа, требуемое на указанный уровень
---@return number
function experience.GetExpToLevel() end

-- Events

--- Событие посылается каждый раз, когда меняется количество Очков Судьбы у персонажа игрока.
EVENT_AVATAR_DESTINY_POINTS_CHANGED = "EVENT_AVATAR_DESTINY_POINTS_CHANGED"

--- Событие посылается каждый раз, когда изменился опыт персонажа игрока.
EVENT_AVATAR_EXPERIENCE_CHANGED = "EVENT_AVATAR_EXPERIENCE_CHANGED"
