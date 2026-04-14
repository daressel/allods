---@meta

---@class astralUnitLib
astralUnit = {}

---Возвращает иконку астрального моба, отображаемую на карте.
---@param unitId ObjectId идентификатор юнита
---@return TextureId
function astralUnit.GetImage(unitId) end

---Возвращает уровень астрального моба.
---@param unitId ObjectId идентификатор юнита
---@return integer
function astralUnit.GetLevel(unitId) end

---Возвращает true, если астральный моб агрессивен к кораблю, на котором находится главный игрок. См. также EVENT_ASTRAL_UNIT_AGGRO_CHANGED
---@param unitId ObjectId идентификатор юнита
---@return boolean
function astralUnit.HasAggro(unitId) end
