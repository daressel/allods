---@meta

--- CategoryAstralUnit
--- Методы и события для работы с астральными мобами.

---@class astralUnitLib
astralUnit = {}

--- Возвращает список идентификаторов астральных мобов в хабе главного игрока.
---@return table
function astralUnit.GetUnits() end

--- Возвращает иконку астрального моба, отображаемую на карте.
---@param unitId ObjectId идентификатор юнита
---@return TextureId
function astralUnit.GetImage(unitId) end

--- Возвращает уровень астрального моба.
---@param unitId ObjectId идентификатор юнита
---@return number
function astralUnit.GetLevel(unitId) end

--- Возвращает true, если астральный моб агрессивен к кораблю, на котором находится главный игрок.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function astralUnit.HasAggro(unitId) end

-- Events

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает астральный объект.
EVENT_ASTRAL_OBJECTS_CHANGED = "EVENT_ASTRAL_OBJECTS_CHANGED"

--- Событие, если астральный моб изменил агрессивность по отношению к главному игроку.
EVENT_ASTRAL_UNIT_AGGRO_CHANGED = "EVENT_ASTRAL_UNIT_AGGRO_CHANGED"

--- Событие присылается при изменении координат астрального моба.
EVENT_ASTRAL_UNIT_POS_CHANGED = "EVENT_ASTRAL_UNIT_POS_CHANGED"

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или астральный монстр.
EVENT_ASTRAL_UNITS_CHANGED = "EVENT_ASTRAL_UNITS_CHANGED"
