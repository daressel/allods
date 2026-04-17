---@meta

--- CategoryInventory
--- События и функции Lua API, относящиеся к работе с инвентарем персонажа.

--- Текстовый enum для представления результата операции с сундучком.
ENUM_BoxOperationResult_SlotNumberOutOfBounds = "ENUM_BoxOperationResult_SlotNumberOutOfBounds"
ENUM_BoxOperationResult_SlotIsEmpty = "ENUM_BoxOperationResult_SlotIsEmpty"
ENUM_BoxOperationResult_NoFreeSpace = "ENUM_BoxOperationResult_NoFreeSpace"
ENUM_BoxOperationResult_ItemIsNotBox = "ENUM_BoxOperationResult_ItemIsNotBox"
ENUM_BoxOperationResult_ItemIsNotKey = "ENUM_BoxOperationResult_ItemIsNotKey"
ENUM_BoxOperationResult_BoxLocked = "ENUM_BoxOperationResult_BoxLocked"
ENUM_BoxOperationResult_BoxUnlocked = "ENUM_BoxOperationResult_BoxUnlocked"
ENUM_BoxOperationResult_KeyDoesNotMatch = "ENUM_BoxOperationResult_KeyDoesNotMatch"
ENUM_BoxOperationResult_OperationSuccess = "ENUM_BoxOperationResult_OperationSuccess"
ENUM_BoxOperationResult_TransactionFailed = "ENUM_BoxOperationResult_TransactionFailed"
ENUM_BoxOperationResult_WrongStackCount = "ENUM_BoxOperationResult_WrongStackCount"

--- Текстовый енум. Префикс для автоматической проверки "ENUM_DressResult"
ENUM_DressResult_Success = "ENUM_DressResult_Success"
ENUM_DressResult_FailureVoid = "ENUM_DressResult_FailureVoid"
ENUM_DressResult_Undressable = "ENUM_DressResult_Undressable"
ENUM_DressResult_WrongSlot = "ENUM_DressResult_WrongSlot"
ENUM_DressResult_WrongCharacterClass = "ENUM_DressResult_WrongCharacterClass"
ENUM_DressResult_WrongCreatureLevel = "ENUM_DressResult_WrongCreatureLevel"
ENUM_DressResult_NoSpace = "ENUM_DressResult_NoSpace"
ENUM_DressResult_TooSmallBag = "ENUM_DressResult_TooSmallBag"
ENUM_DressResult_NotProficient = "ENUM_DressResult_NotProficient"
ENUM_DressResult_InCombat = "ENUM_DressResult_InCombat"
ENUM_DressResult_WrongDress = "ENUM_DressResult_WrongDress"
ENUM_DressResult_SecondaryDressLocked = "ENUM_DressResult_SecondaryDressLocked"
--- предмет нельзя экипировать в заданный слот из-за того, что качество предмета выше, чем разрешено для этого слота
ENUM_DressResult_SlotLocked = "ENUM_DressResult_SlotLocked"
ENUM_DressResult_SmallerBag = "ENUM_DressResult_SmallerBag"
ENUM_DressResult_SmallerDepositBox = "ENUM_DressResult_SmallerDepositBox"
--- предмет нельзя экипировать в заданный слот из-за того, что качество одного или более самоцветов, вставленных в предмет, выше, чем разрешено для этого слота
ENUM_DressResult_EnchantLocked = "ENUM_DressResult_EnchantLocked"
--- В гардеробе итем уже есть.
ENUM_DressResult_DuplicateItem = "ENUM_DressResult_DuplicateItem"

--- Перечисление DRESS_SLOT_..., определено в коде:
---@type integer
DRESS_SLOT_HELM = nil
---@type integer
DRESS_SLOT_ARMOR = nil
---@type integer
DRESS_SLOT_PANTS = nil
---@type integer
DRESS_SLOT_BOOTS = nil
---@type integer
DRESS_SLOT_MANTLE = nil
---@type integer
DRESS_SLOT_GLOVES = nil
---@type integer
DRESS_SLOT_BRACERS = nil
---@type integer
DRESS_SLOT_BELT = nil
---@type integer
DRESS_SLOT_RING1 = nil
---@type integer
DRESS_SLOT_RING2 = nil
---@type integer
DRESS_SLOT_EARRING1 = nil
---@type integer
DRESS_SLOT_NECKLACE = nil
---@type integer
DRESS_SLOT_CLOAK = nil
---@type integer
DRESS_SLOT_SHIRT = nil
---@type integer
DRESS_SLOT_MAINHAND = nil
---@type integer
DRESS_SLOT_OFFHAND = nil
---@type integer
DRESS_SLOT_RANGED = nil
---@type integer
DRESS_SLOT_AMMO = nil
---@type integer
DRESS_SLOT_TABARD = nil
---@type integer
DRESS_SLOT_TRINKET = nil
---@type integer
DRESS_SLOT_BAG = nil
---@type integer
DRESS_SLOT_DEATHINSURANCE = nil
---@type integer
DRESS_SLOT_LIFESTYLEHEAD = nil
---@type integer
DRESS_SLOT_LIFESTYLEBACK = nil
---@type integer
DRESS_SLOT_LIFESTYLESUIT = nil
---@type integer
DRESS_SLOT_LIFESTYLEUNDERWEAR = nil
---@type integer
DRESS_SLOT_LIFESTYLESHOULDER = nil
---@type integer
DRESS_SLOT_LIFESTYLEPET = nil
---@type integer
DRESS_SLOT_POWEREDLSWEAPON = nil
---@type integer
DRESS_SLOT_EARRING2 = nil
---@type integer
DRESS_SLOT_DEPOSITBOX = nil
---@type integer
DRESS_SLOT_OFFENSIVERUNE1 = nil
---@type integer
DRESS_SLOT_OFFENSIVERUNE2 = nil
---@type integer
DRESS_SLOT_OFFENSIVERUNE3 = nil
---@type integer
DRESS_SLOT_DEFENSIVERUNE1 = nil
---@type integer
DRESS_SLOT_DEFENSIVERUNE2 = nil
---@type integer
DRESS_SLOT_DEFENSIVERUNE3 = nil
---@type integer
DRESS_SLOT_LIFESTYLESHOULDER = nil
---@type integer
DRESS_SLOT_POWEREDLSWEAPON = nil
---@type integer
DRESS_SLOT_HIDDENPOWER = nil
---@type integer
DRESS_SLOT_LIFESTYLEPET = nil
---@type integer
DRESS_SLOT_HAT = nil
---@type integer
DRESS_SLOT_UNDRESSABLE = nil
---@type integer
DRESS_SLOT_TWOHANDED = nil
---@type integer
DRESS_SLOT_DUALWIELD = nil
---@type integer
DRESS_SLOT_RING = nil
---@type integer
DRESS_SLOT_EARRINGS = nil
---@type integer
DRESS_SLOT_RUNE = nil
---@type integer
DRESS_SLOT_ARTIFACT = nil
---@type integer
DRESS_SLOT_ARTIFACT1 = nil
---@type integer
DRESS_SLOT_ARTIFACT2 = nil
---@type integer
DRESS_SLOT_ARTIFACT3 = nil
---@type integer
DRESS_SLOT_NONPREVIEW = nil

--- Тип привязки предмета к аватару.
---@type integer
ITEM_BINDING_BIND_NONE = nil
---@type integer
ITEM_BINDING_BIND_ON_PICKUP = nil
---@type integer
ITEM_BINDING_BIND_ON_EQUIP = nil
---@type integer
ITEM_BINDING_BIND_ON_USE = nil

--- Константы типов итеммольных предметов:
---@type integer
ITEMMALL_ITEM_NOTITEMMALLABLE = nil
---@type integer
ITEMMALL_ITEM_ITEMMALLABLE = nil
---@type integer
ITEMMALL_ITEM_CREDIT = nil
---@type integer
ITEMMALL_ITEM_SELLABLE = nil

---@class inventoryLib
inventory = {}

--- Попытка переместить несколько предметов, лежащих в контейнере, в начало контейнера в заданном порядке.
---@param moves массив индексом является номер слота В который надо поместить итем, а значением - номер слота (считая с начала кармана) ИЗ которого надо переместить итем.
---@param compact boolean производить ли компактинг стекающихся итемов и пустых слотов
---@param container number в каком контейнере переставляем предметы. Допустимые контейнеры: сумка, банковская ячейка. В банковской ячейке нельзя переставлять предметы, если она не открыта.
---@param pocket integer|nil карман. Базовый карман имеет индекс -1, остальные считаются с нуля. Значение по умолчанию -1.
function inventory.ArrangeContainerItems(moves, compact, container, pocket) end

--- Экипировать предмет с указанным идентификатором. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ).
---@param itemId ObjectId идентификатор предмета
function inventory.EquipItemById(itemId) end

--- Экипировать предмет с указанным идентификатором в указанный слот в экипировке. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ).
---@param itemId ObjectId идентификатор предмета
---@param equipSlot integer индекс слота в экипировке.
function inventory.EquipItemByIdToSlot(itemId, equipSlot) end

--- Возвращает стоимость улучшения мета-предмета в меди.
---@param sourceId ObjectId идентификатор предмета который улучшаем
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор агента улучшения
---@return number
function inventory.GetMetaUpgradeCost(sourceId, enhancerId, agentId) end

--- Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Слоты индексируются с 0 по всему объему инвентаря, включая карманы.
---@param itemId ObjectId идентификатор предмета
---@param slot integer индекс слота
---@return boolean
function inventory.InventoryCanPlaceItemToSlot(itemId, slot) end

--- Возвращает базовое число слотов (без карманов, только сумка) в инвентаре главного персонажа.
---@return number
function inventory.InventoryGetBaseBagSlotCount() end

--- Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Этот метод возвращает индекс кармана, в который можно положить предмет.
---@param itemId ObjectId идентификатор предмета
---@return number
function inventory.InventoryGetItemPocket(itemId) end

--- Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Слоты индексируются с 0 по всему объему инвентаря, включая карманы.
---@param slot integer индекс слота
---@return number
function inventory.InventoryGetPocketIndexBySlot(slot) end

--- Возвращает таблицу с информацией о кармане инвентаря главного игрока.
---@param pocketIndex integer индекс кармана, начиная с 0
---@return table|nil
function inventory.InventoryGetPocketInfo(pocketIndex) end

--- Возвращает число карманов в инвентаре главного персонажа.
---@return number
function inventory.InventoryGetPocketsCount() end

--- Проверяет, будет ли предмет при перемещении из одного слота контейнера (инвентарь, переполненная сумка, банковская ячейка) в другой слот (возможно другого контейнера) объединён с предметом в целевом слоте. Предназначена для определения необходимости проверки на изменение связанности и времени существования предметов при перемещении.
---@param itemFromId ObjectId перемещаемый предмет (должен находиться в одном из контейнеров)
---@param itemToId ObjectId предмет, находящийся в слоте, куда предполагается переместить предмет itemFromId
---@return boolean
function inventory.IsItemsStackable(itemFromId, itemToId) end

--- Попытка открыть сундуки. Результат операции приходит в виде события EVENT_BOX_OPERATION_RESULT.
---@param boxId ObjectId item id сундучка, сундучок должен находиться в одном из контейнеров (например в инвентаре или переполненной сумке)
---@param quantity integer|nil необязательный параметр, количество открываемых сундуков; по умолчанию 1.
function inventory.OpenBox(boxId, quantity) end

--- Необходимо вызывать из скрипта при открытии/закрытии диалога улучшения мета-предметов. Это необходимо для корректого отслеживания закрытия диалога по внутренним причинам ( EVENT_META_UPGRADE_BREAK).
---@param show boolean true, если начали показывать диалог
function inventory.ShowMetaUpgradeDialog(show) end

--- Попытка снять указанный предмет из в указанную ячейку инвентаря.
---@param itemId ObjectId идентификатор предмета
---@param inventorySlot integer индекс ячейки в инвентаре [0..GetInventorySize() - 1]
function inventory.UnequipItemToSlot(itemId, inventorySlot) end

-- Events

--- Уведомление о результате взаимодействия с сундучком.
EVENT_BOX_OPERATION_RESULT = "EVENT_BOX_OPERATION_RESULT"

--- Событие о провале попытки экипировать предмет. Приходит либо itemId либо slot.
EVENT_EQUIP_FAILED = "EVENT_EQUIP_FAILED"

--- Событие об изменении содержимого инвентаря главного персонажа.
EVENT_INVENTORY_CHANGED = "EVENT_INVENTORY_CHANGED"

--- Событие об изменении размера инвентаря главного персонажа.
EVENT_INVENTORY_SIZE_CHANGED = "EVENT_INVENTORY_SIZE_CHANGED"

--- Событие об изменении содержимого слота инвентаря главного персонажа.
EVENT_INVENTORY_SLOT_CHANGED = "EVENT_INVENTORY_SLOT_CHANGED"

--- Событие посылается , когда игрок запросил avatar.RequestQuestsForItem( itemId ).
EVENT_ITEM_QUESTS_RECEIVED = "EVENT_ITEM_QUESTS_RECEIVED"

--- Событие о провале попытки снять предмет.
EVENT_UNEQUIP_FAILED = "EVENT_UNEQUIP_FAILED"
