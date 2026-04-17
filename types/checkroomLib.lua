---@meta

--- CategoryCheckroomLib
--- Различные методы и события по работе с гардеробом главного игрока.

---@class checkroomLibLib
checkroomLib = {}

--- Закрывает гардероб. Содержимое гардероба убирается с клиента. Должно прийти событие  EVENT_CHECKROOM_CHANGED.
function checkroomLib.Close() end

--- Надевает гардеробный предмет в соответствующий слот.
---@param itemId ObjectId идентификатор предмета
function checkroomLib.EquipItem(itemId) end

--- Надевает гардеробные предметы в соответствующие слоты. Максимально за раз можно переодевать не более 6 предметов.
---@param itemIds ObjectId[] идентификаторы предметов
function checkroomLib.EquipItems(itemIds) end

--- Возвращает идентификатор предмета в гардеробе, соответствующего какому-то реальному предмету в другом контейнере или где-то ещё.
---@param itemId ObjectId идентификатор предмета
---@return ObjectId|nil
function checkroomLib.FindCheckroomItem(itemId) end

--- Возвращает индексированный с 1 список идентификатор ресурсов корневых категорий гардероба.
---@return table
function checkroomLib.GetCategories() end

--- Возвращает индексированный с 1 список идентификатор ресурсов коллекций одной корневой категории гардероба.
---@param categoryId CheckRoomCategoryId идентификатор ресурса коневой категории гардероба
---@return table
function checkroomLib.GetCollections(categoryId) end

--- Возвращает категорию и коллекцию гардероба, в которой находится данный предмет. Возвращает данные для любого гардеробного предмета, не обязательно физически находящегося в гардеробе.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function checkroomLib.GetItemCategories(itemId) end

--- Возвращает индексированный с 1 список идентификаторов предметов одной коллекции гардероба.
---@param collectionId CheckRoomCollectionId идентификатор ресурса коллекции гардероба
---@return table
function checkroomLib.GetItems(collectionId) end

--- Возвращает индексированный с 1 отсортированный список информации о предметах в одной коллекции гардероба.
---@param collectionId CheckRoomCollectionId идентификатор ресурса коллекции гардероба
---@return table
function checkroomLib.GetSortedItemsInfo(collectionId) end

--- Возвращает индексированный с 1 список идентификаторов ресурсов заклинаний одной коллекции гардероба.
---@param collectionId CheckRoomCollectionId идентификатор ресурса коллекции гардероба
---@return table
function checkroomLib.GetSpells(collectionId) end

--- Возвращает true, если предмет является гардеробным, то есть принадлежит какой-то коллекции гардероба.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function checkroomLib.IsCheckroomItem(itemId) end

--- Возвращает true, если заклинание нужно скрывать в коллекции пока оно не изучено.
---@param spellId SpellId идентификатор ресурса заклинания
---@return boolean
function checkroomLib.IsHideSpellWhileNotLearned(spellId) end

--- Возвращает true, если этот или такой-же гардеробный предмет надет на персонажа.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function checkroomLib.IsItemEquipped(itemId) end

--- Возвращает true, если предмет есть в гардеробе или экипирован на аватара.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function checkroomLib.IsItemInCheckroom(itemId) end

--- Возвращает таблицу с true/false для каждого итема, если этот или такой-же гардеробный предмет надет на персонажа.
---@param itemIds ObjectId[] список идентификаторов предметов для проверки
---@return table
function checkroomLib.IsItemsEquipped(itemIds) end

--- Возвращает таблицу с true/false для каждого итема, если предмет есть в гардеробе или экипирован на аватара.
---@param itemIds ObjectId[] список идентификаторов предметов для проверки
---@return table
function checkroomLib.IsItemsInCheckroom(itemIds) end

--- Возвращает true, если гардероб открыт после вызова  checkroomLib.Open().
---@return boolean
function checkroomLib.IsOpened() end

--- Открывает гардероб. Содержимое гардероба передаётся на клиент. Должно прийти событие  EVENT_CHECKROOM_CHANGED.
function checkroomLib.Open() end

--- Надевает предмет в соответствующий слот.
---@param itemId ObjectId идентификатор предмета
function checkroomLib.EquipItem(itemId) end

--- Снимает предмет из соответствующего слота.
---@param itemId ObjectId идентификатор предмета
function checkroomLib.UnequipItem(itemId) end

-- Events

--- Событие посылается, когда игрок запросил  checkroomLib.Open() или  checkroomLib.Close() и произошла передача на клиент или было убрано с клиента содержимое гардероба.
EVENT_CHECKROOM_CHANGED = "EVENT_CHECKROOM_CHANGED"

--- Событие возникающее при добавлении одежды в гардероб.
EVENT_CHECKROOM_ITEM_ADDED = "EVENT_CHECKROOM_ITEM_ADDED"

--- Событие посылается, приходит при изменении полей предмета в гардеробе. Например, при надевании или снимании.
EVENT_CHECKROOM_ITEM_CHANGED = "EVENT_CHECKROOM_ITEM_CHANGED"
