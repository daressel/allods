---@meta

--- CategoryFairy
--- События и функции Lua Api, относящиеся к покровителям (fairy).

---@class fairyLib
fairy = {}

--- Возвращает информацию о механике покровителей.
---@return table|nil
function fairy.GetFairyMechanicsInfo() end

--- Возвращает информацию о покровителе. Наличие покровителя можно определить по флагу isExist.
---@param unitId ObjectId идентификатор юнита
---@return table|nil
function fairy.GetFairyInfo(unitId) end

--- Возвращает величину прибавки к Могуществу от уровня покровителя. При изменении приходит событие  EVENT_UNIT_FAIRY_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return number
function fairy.GetFairyPowerBonus(unitId) end

--- Возвращает информацию о знаке зодиака покровителя указанного юнита.
---@param unitId ObjectId идентификатор юнита
---@return table|nil
function fairy.GetFairyZodiacSignInfo(unitId) end

-- Events

--- Событие присылается при изменении покровителя.
EVENT_UNIT_FAIRY_CHANGED = "EVENT_UNIT_FAIRY_CHANGED"

--- Событие присылается при изменении ранга покровителя - номера или статуса временный/постоянный.
EVENT_UNIT_FAIRY_RANK_CHANGED = "EVENT_UNIT_FAIRY_RANK_CHANGED"
