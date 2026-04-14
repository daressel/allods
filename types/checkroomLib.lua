---@meta

---@class checkroomLibLib
checkroomLib = {}

---@class CheckroomLibGetItemCategoriesResult
---@field categoryId CheckRoomCategoryId идентификатор ресурса категории
---@field collectionId CheckRoomCollectionId идентификатор ресурса коллекции

---@class CheckroomLibGetSortedItemsInfoResult
---@field id ObjectId идентификатор предмета
---@field resourceId ItemId идентификатор ресурса предмета
---@field name string название предмета
---@field icon TextureId текстура с иконкой предмета
---@field quality Number качество предмета
---@field dressSlot Number слот одежды или оружия, если предмет надевается: DRESS_SLOT_XXXX
---@field hideNotLearned boolean true если нужно скрывать предмет до появления в гардеробе

---Закрывает гардероб. Содержимое гардероба убирается с клиента. Должно прийти событие  EVENT_CHECKROOM_CHANGED.
---@return нет
function checkroomLib.Close() end

---Надевает гардеробный предмет в соответствующий слот.
---@param itemId ObjectId идентификатор предмета
---@return нет
function checkroomLib.EquipItem(itemId) end

---Надевает гардеробные предметы в соответствующие слоты. Максимально за раз можно переодевать не более 6 предметов.
---@param itemIds ObjectId[] идентификаторы предметов
---@return нет
function checkroomLib.EquipItems(itemIds) end

---Возвращает идентификатор предмета в гардеробе, соответствующего какому-то реальному предмету в другом контейнере или где-то ещё.
---@param itemId ObjectId идентификатор предмета
---@return ObjectId|nil
function checkroomLib.FindCheckroomItem(itemId) end

---Возвращает индексированный с 1 список идентификатор ресурсов корневых категорий гардероба.
---@return CheckRoomCategoryId[]
function checkroomLib.GetCategories() end

---Возвращает индексированный с 1 список идентификатор ресурсов коллекций одной корневой категории гардероба.
---@param categoryId CheckRoomCategoryId идентификатор ресурса коневой категории гардероба
---@return CheckRoomCollectionId[]
function checkroomLib.GetCollections(categoryId) end

---Возвращает категорию и коллекцию гардероба, в которой находится данный предмет. Возвращает данные для любого гардеробного предмета, не обязательно физически находящегося в гардеробе.
---@param itemId ObjectId идентификатор предмета
---@return CheckroomLibGetItemCategoriesResult
function checkroomLib.GetItemCategories(itemId) end

---Возвращает индексированный с 1 список идентификаторов предметов одной коллекции гардероба.
---@param collectionId CheckRoomCollectionId идентификатор ресурса коллекции гардероба
---@return ObjectId[]
function checkroomLib.GetItems(collectionId) end

---Возвращает индексированный с 1 отсортированный список информации о предметах в одной коллекции гардероба.
---@param collectionId CheckRoomCollectionId идентификатор ресурса коллекции гардероба
---@return CheckroomLibGetSortedItemsInfoResult
function checkroomLib.GetSortedItemsInfo(collectionId) end

---Возвращает индексированный с 1 список идентификаторов ресурсов заклинаний одной коллекции гардероба.
---@param collectionId CheckRoomCollectionId идентификатор ресурса коллекции гардероба
---@return SpellId[]
function checkroomLib.GetSpells(collectionId) end

---Возвращает true, если предмет является гардеробным, то есть принадлежит какой-то коллекции гардероба.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function checkroomLib.IsCheckroomItem(itemId) end

---Возвращает true, если заклинание нужно скрывать в коллекции пока оно не изучено.
---@param spellId SpellId идентификатор ресурса заклинания
---@return boolean
function checkroomLib.IsHideSpellWhileNotLearned(spellId) end

---Возвращает true, если этот или такой-же гардеробный предмет надет на персонажа.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function checkroomLib.IsItemEquipped(itemId) end

---Возвращает true, если предмет есть в гардеробе или экипирован на аватара.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function checkroomLib.IsItemInCheckroom(itemId) end

---Возвращает таблицу с true/false для каждого итема, если этот или такой-же гардеробный предмет надет на персонажа. Функция является массовым аналогом checkroomLib.IsItemEquipped
---@param itemIds ObjectId[] список идентификаторов предметов для проверки
---@return table
function checkroomLib.IsItemsEquipped(itemIds) end

---Возвращает таблицу с true/false для каждого итема, если предмет есть в гардеробе или экипирован на аватара. Функция является массовым аналогом checkroomLib.IsItemInCheckroom
---@param itemIds ObjectId[] список идентификаторов предметов для проверки
---@return table
function checkroomLib.IsItemsInCheckroom(itemIds) end

---Возвращает true, если гардероб открыт после вызова  checkroomLib.Open().
---@return boolean
function checkroomLib.IsOpened() end

---Открывает гардероб. Содержимое гардероба передаётся на клиент. Должно прийти событие  EVENT_CHECKROOM_CHANGED.
---@return нет
function checkroomLib.Open() end
