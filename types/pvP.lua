---@meta

--- CategoryPvP
--- Функции и события Lua API, относящиеся к PvP.

---@class pvPLib
pvP = {}

--- Возвращает информацию о количестве убитых в PvP противников. При изменении приходит  EVENT_VICTIM_TRACKER_CHANGED.
---@return number
function pvP.GetKills() end

--- Переключает пользовательский флаг PvP главного игрока.
---@param isOn boolean true, если надо включить PvP флаг
function pvP.SwitchPvPFlag(isOn) end

--- Возвращает информацию PvP флаге юнита. При изменении приходит  EVENT_UNIT_PVP_FLAG_CHANGED.
---@param unitId ObjectId
---@return table
function pvP.GetPvPFlagInfo(unitId) end

--- Возвращает информацию о PvP-опасности зоны для персонажа.
---@param unitId ObjectId
---@return string
function pvP.GetZonePvPDanger(unitId) end

--- Возвращает информацию о PvP-типе зоны для персонажа.
---@param unitId ObjectId
---@return number
function pvP.GetZonePvPType(unitId) end

-- Events

--- Событие посылается при изменении PvP флага какого-либо юнита (игрока или моба).
EVENT_UNIT_PVP_FLAG_CHANGED = "EVENT_UNIT_PVP_FLAG_CHANGED"

--- Событие посылается при изменении PvP-типа зоны для игрока.
EVENT_UNIT_ZONE_PVP_TYPE_CHANGED = "EVENT_UNIT_ZONE_PVP_TYPE_CHANGED"

--- Событие посылается при изменении счётчика убитых противников в PvP.
EVENT_VICTIM_TRACKER_CHANGED = "EVENT_VICTIM_TRACKER_CHANGED"
