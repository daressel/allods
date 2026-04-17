---@meta

--- CategoryPoweredLSWeaponsLib
--- Различные методы и события по работе с прокаченым оружием главного игрока.

---@class poweredLSWeaponsLibLib
poweredLSWeaponsLib = {}

--- Возвращает идентификатор рула (эвента) для прокачанного оружия.
---@return RuleId
function poweredLSWeaponsLib.GetEvent() end

--- Возвращает индексированный с 1 cписок предметов прокачанного оружия для соответствующего рула (эвента)
---@return ObjectId[]|nil
function poweredLSWeaponsLib.GetEventItemsList() end

--- Возвращает индексированный с 1 список фейковых предметов, которые могут попасть в контейнер прокачанного оружия.
---@return table
function poweredLSWeaponsLib.GetItems() end

--- Возвращает предмет на замену для павер-итема по классу заменяемого итема
---@param powerItemId ObjectId идентификатор павер-итема
---@param itemClass ItemClassId класс заменяемого итема
---@return ObjectId|nil
function poweredLSWeaponsLib.GetItemToReplace(powerItemId, itemClass) end

--- Возвращает true, если этот или такой-же предмет надет на персонажа.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function poweredLSWeaponsLib.IsItemEquipped(itemId) end

--- Возвращает true, если предмет есть в прокаченом оружии или экипирован на аватара.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function poweredLSWeaponsLib.IsItemInPoweredContainer(itemId) end

-- Events

--- Событие посылается при открытии/закрытии контейнера прокачанного оружия.
EVENT_POWEREDLSWEAPONS_CHANGED = "EVENT_POWEREDLSWEAPONS_CHANGED"

--- Событие возникающее при добавлении предмета в прокаченое оружие.
EVENT_POWEREDLSWEAPONS_ITEM_ADDED = "EVENT_POWEREDLSWEAPONS_ITEM_ADDED"
