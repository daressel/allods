---@meta

---@class poweredLSWeaponsLibLib
poweredLSWeaponsLib = {}

---@class PoweredLSWeaponsLibGetItemsResult
---@field item ObjectId идентификатор предмета
---@field inactiveItem ObjectId|nil идентификатор деактивированной версии предмета

---Надевает предмет в соответствующий слот.
---@param itemId ObjectId идентификатор предмета
---@return нет
function poweredLSWeaponsLib.EquipItem(itemId) end

---Возвращает идентификатор рула (эвента) для прокачанного оружия.
---@return ruleId: RuleId или nil
function poweredLSWeaponsLib.GetEvent() end

---Возвращает индексированный с 1 cписок предметов прокачанного оружия для соответствующего рула (эвента)
---@return ObjectId|nil[]
function poweredLSWeaponsLib.GetEventItemsList() end

---Возвращает индексированный с 1 список фейковых предметов, которые могут попасть в контейнер прокачанного оружия.
---@return PoweredLSWeaponsLibGetItemsResult
function poweredLSWeaponsLib.GetItems() end

---Возвращает предмет на замену для павер-итема по классу заменяемого итема
---@param powerItemId ObjectId идентификатор павер-итема
---@param itemClass ItemClassId класс заменяемого итема
---@return ObjectId|nil
function poweredLSWeaponsLib.GetItemToReplace(powerItemId, itemClass) end

---Возвращает true, если этот или такой-же предмет надет на персонажа.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function poweredLSWeaponsLib.IsItemEquipped(itemId) end

---Возвращает true, если предмет есть в прокаченом оружии или экипирован на аватара.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function poweredLSWeaponsLib.IsItemInPoweredContainer(itemId) end

---Снимает предмет из соответствующего слота.
---@param itemId ObjectId идентификатор предмета
---@return нет
function poweredLSWeaponsLib.UnequipItem(itemId) end
