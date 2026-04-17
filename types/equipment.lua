---@meta

--- CategoryEquipment
--- События и функции Lua API, относящиеся к работе с экипировкой персонажа.

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

--- Тип контейнера с предметами экипированными на персонаже игрока.
--- первичный набор экипировки
---@type integer
DUMMY_TYPE_PRIMARY = nil
--- вторичный набор экипировки (первый набор экипировки для "драконьего облика")
---@type integer
DUMMY_TYPE_SECONDARY = nil
--- третичный набор экипировки (второй набор экипировки для "драконьего облика")
---@type integer
DUMMY_TYPE_TERTIARY = nil
--- четвертичный набор экипировки (третий набор экипировки для "драконьего облика")
---@type integer
DUMMY_TYPE_QUATERNARY = nil

--- Тип привязки предмета к аватару.
---@type integer
ITEM_BINDING_BIND_NONE = nil
---@type integer
ITEM_BINDING_BIND_ON_PICKUP = nil
---@type integer
ITEM_BINDING_BIND_ON_EQUIP = nil
---@type integer
ITEM_BINDING_BIND_ON_USE = nil

--- Константы качества предмета:
--- служебное значение, не означающее никакого качества
---@type integer
ITEM_QUALITY_SYSTEM = nil
---@type integer
ITEM_QUALITY_JUNK = nil
---@type integer
ITEM_QUALITY_GOODS = nil
---@type integer
ITEM_QUALITY_COMMON = nil
---@type integer
ITEM_QUALITY_UNCOMMON = nil
---@type integer
ITEM_QUALITY_RARE = nil
---@type integer
ITEM_QUALITY_EPIC = nil
---@type integer
ITEM_QUALITY_LEGENDARY = nil
---@type integer
ITEM_QUALITY_RELIC = nil
---@type integer
ITEM_QUALITY_DRAGON = nil

---@class equipmentLib
equipment = {}

--- Экипировать предмет с указанным идентификатором. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ).
---@param itemId ObjectId идентификатор предмета
function equipment.EquipItemById(itemId) end

--- Экипировать предмет с указанным идентификатором в указанный слот в экипировке. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ).
---@param itemId ObjectId идентификатор предмета
---@param equipSlot integer индекс слота в экипировке.
function equipment.EquipItemByIdToSlot(itemId, equipSlot) end

--- Позволяет узнать текущий активный набор ритуальных вещей.
---@return number
function equipment.GetRitualActivePreset() end

--- Проверяет, будет ли предмет при перемещении из одного слота контейнера (инвентарь, переполненная сумка, банковская ячейка) в другой слот (возможно другого контейнера) объединён с предметом в целевом слоте. Предназначена для определения необходимости проверки на изменение связанности и времени существования предметов при перемещении.
---@param itemFromId ObjectId перемещаемый предмет (должен находиться в одном из контейнеров)
---@param itemToId ObjectId предмет, находящийся в слоте, куда предполагается переместить предмет itemFromId
---@return boolean
function equipment.IsItemsStackable(itemFromId, itemToId) end

--- Визуально показывает/убирает оружие. Циклически переключаются следующие состояния: показать ближнее оружие/показать дальнее оружие/убрать оружие.
function equipment.SheathNext() end

--- Попытка снять указанный предмет.
---@param itemId ObjectId идентификатор предмета
function equipment.UnequipItem(itemId) end

--- Попытка снять указанный предмет из в указанную ячейку инвентаря.
---@param itemId ObjectId идентификатор предмета
---@param inventorySlot integer индекс ячейки в инвентаре [0..GetInventorySize() - 1]
function equipment.UnequipItemToSlot(itemId, inventorySlot) end

--- Возвращает идентификатор указанного предмета экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slot integer индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType integer тип контейнера
---@return ObjectId
function equipment.GetEquipmentItemId(unitId, slot, slotType) end

--- Возвращает таблицу со всей экипировкой данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slotType integer тип контейнера
---@return table
function equipment.GetEquipmentItemIds(unitId, slotType) end

--- Возвращает состояние разлоченности для слота экипировки главного или инспектируемого игрока.
---@param unitId ObjectId идентификатор игрока
---@param equipmentSlot integer индекс слота в экипировке
---@return table
function equipment.GetEquipmentItemSlotUnlockedQualities(unitId, equipmentSlot) end

--- Возвращает количество слотов под экипировку у данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@return number
function equipment.GetEquipmentSize(unitId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом в определенном слоте экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slot integer индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType integer тип контейнера
---@return any
function equipment.GetEquipmentSlotBonus(unitId, slot, slotType) end

--- Позволяет узнать текущий активный набор ритуальных вещей.
---@param unitId ObjectId идентификатор игрока
---@return number
function equipment.GetRitualActivePreset(unitId) end

--- Возвращает информацию о наличии экипировки у данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function equipment.HasEquipment(unitId) end

-- Events

--- Событие о провале попытки экипировать предмет. Приходит либо itemId либо slot.
EVENT_EQUIP_FAILED = "EVENT_EQUIP_FAILED"

--- Событие посылается, когда поменялся текущий активный набор ритуальных вещей  enum DUMMY_TYPE.
EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED = "EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED"

--- Событие посылается, когда главному или инспектируемому игроку становятся доступны ритуальные вещи (контейнер, действия и т.п.).
EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED = "EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED"

--- Событие о провале попытки снять предмет.
EVENT_UNEQUIP_FAILED = "EVENT_UNEQUIP_FAILED"

--- Событие об изменении экипировки юнита (главный игрок или игрок, инспектируемый главным).
EVENT_UNIT_EQUIPMENT_CHANGED = "EVENT_UNIT_EQUIPMENT_CHANGED"
