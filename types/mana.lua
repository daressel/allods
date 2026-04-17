---@meta

--- CategoryMana
--- Функции и события Lua API, относящиеся к мане юнитов.

---@class manaLib
mana = {}

--- Возвращает информацию об мане персонажа. Если значения каких-то параметров неизвестны, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return table
function mana.GetMana(unitId) end

--- Возвращает информацию об мане персонажа в процентах. Если значение маны неизвестно, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return integer|nil
function mana.GetManaPercentage(unitId) end

-- Events

--- Событие присылается при исчезании у юнита пула анти-хила.
EVENT_HEAL_ABSORB_POOL_DISAPPEARED = "EVENT_HEAL_ABSORB_POOL_DISAPPEARED"

--- Событие присылается при измениние маны юнита другим юнитом.
EVENT_MANA_RECEIVED = "EVENT_MANA_RECEIVED"

--- Событие присылается при изменении процентного значения маны юнита и числового значение для аватара.
EVENT_UNIT_MANA_CHANGED = "EVENT_UNIT_MANA_CHANGED"

--- Событие присылается при измениние маны юнита.
EVENT_UNIT_MANA_PERCENTAGE_CHANGED = "EVENT_UNIT_MANA_PERCENTAGE_CHANGED"
