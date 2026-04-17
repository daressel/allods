---@meta

--- CategoryItemInfo
--- События и функции Lua Api, относящиеся к игровым предметам.

--- Текстовый enum. Префикс для автоматической проверки - "ENUM_ItemSource".
ENUM_ItemSource_Quest = "ENUM_ItemSource_Quest"
ENUM_ItemSource_FixedDrop = "ENUM_ItemSource_FixedDrop"
ENUM_ItemSource_WorldDrop = "ENUM_ItemSource_WorldDrop"
ENUM_ItemSource_Crafted = "ENUM_ItemSource_Crafted"
ENUM_ItemSource_Conjured = "ENUM_ItemSource_Conjured"
ENUM_ItemSource_Vendor = "ENUM_ItemSource_Vendor"
ENUM_ItemSource_QuestItem = "ENUM_ItemSource_QuestItem"

--- Свойства ремесленных инструментов и их улучшителей.
ENUM_ToolProperty_Quality = "ENUM_ToolProperty_Quality"
ENUM_ToolProperty_Stable = "ENUM_ToolProperty_Stable"
ENUM_ToolProperty_Handy = "ENUM_ToolProperty_Handy"
ENUM_ToolProperty_Optimized = "ENUM_ToolProperty_Optimized"

---@class itemInfoLib
itemInfo = {}

--- Активировать предмет.
---@param itemId ObjectId идентификатор предмета
---@param instrumentId Object идентификатор инструмента-активатора
function itemInfo.ActivateItem(itemId, instrumentId) end

--- Активировать предмет.
---@param itemId ObjectId идентификатор предмета
function itemInfo.ActivateItemAlternative(itemId) end

--- Показывает, можно ли активировать данный предмет данным активатором.
---@param itemId ObjectId идентификатор предмета
---@param instrumentId Object идентификатор инструмента-активатора
function itemInfo.CanActivateItem(itemId, instrumentId) end

--- Показывает, можно ли активировать данный предмет, потратив данную альтернативную валюту. Не проверяет нехватку валюты - это бессмысленно, поскольку при нехватке для активации может быть одновременно использовано несколько альтернативных валют из списка  itemLib.GetActivatorsAlternative( itemId ).
---@param itemId ObjectId идентификатор предмета
---@param currrencyId CurrencyId идентификатор альтернативной валюты
function itemInfo.CanActivateItemAlternative(itemId, currrencyId) end

--- Есть ли возможность разломать указанный предмет указанным инструментом.
---@param instrumentId ObjectId идентификатор инструмента для дизассемблинга в контейнере
---@param itemId integer идентификатор разламываемого предмета в контейнере
---@return boolean
function itemInfo.CanDisassembleItem(instrumentId, itemId) end

--- Проверка, можно ли использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function itemInfo.CheckCanUseItem(itemId, isSendEvent) end

--- Проверка, можно ли использовать предмет в контейнере игрока на точку на ландшафте.
---@param itemId ObjectId идентификатор предмета
---@param position table
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function itemInfo.CheckCanUseItemOnPoint(itemId, position, isSendEvent) end

--- Конвертировать метаитем-улучшитель в обычный предмет применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-конвертором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
function itemInfo.ConvertMetaEnhancer(itemId, instrumentId) end

--- Копировать метаитем-улучшитель применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-дубликатором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
function itemInfo.DuplicateMetaEnhancerItem(itemId, instrumentId) end

--- Возвращает информацию о том, является ли инструментом для копирования метаитема-улучшителя.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemInfo.IsMetaEnhancerDuplicator(itemId) end

--- Запрос заданий у предмета в слоте контейнера (сумка, переполненная сумка, банковская ячейка). В ответ придет сообщение EVENT_ITEM_QUESTS_RECEIVED
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
function itemInfo.RequestQuestsForItem(itemId) end

--- Попытка использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
function itemInfo.UseItem(itemId) end

--- Использовать выбранную вещь и выполнить какие-то воздействия сообразно предмету, который применяется.
---@param itemId ObjectId идентификатор предмета (должен иметь парт UseItemAndTakeActions - проверяется itemLib.IsUseItemAndTakeActions( itemId ))
function itemInfo.UseItemAndTakeActions(itemId) end

--- Использовать выбранную вещь на другой предмет и выполнить какие-то воздействия сообразно предмету, на который вещь применяется.
---@param sourceItemId ObjectId идентификатор предмета, который применяется на другой итем (должен иметь парт UseOnItemAndTakeActions - проверяется itemLib.IsUseOnItemAndTakeActions( itemId ))
---@param targetItemId ObjectId идентификатор предмета, на который отправляется запрос на действие и на котором будут проверяться предикаты
function itemInfo.UseItemOnItemAndTakeActions(sourceItemId, targetItemId) end

--- Использовать выбранную вещь на маунта и выполнить какие-то воздействия.
---@param itemId ObjectId идентификатор предмета, который применяется на маунта
---@param mountId ObjectId идентификатор маунта, на который будет применятся предмет
function itemInfo.UseItemOnMountAndTakeActions(itemId, mountId) end

--- Попытка использовать предмет в контейнере игрока на точку на ландшафте.
---@param itemId ObjectId идентификатор предмета
---@param position table
function itemInfo.UseItemOnPoint(itemId, position) end

--- Проверка можно ли передавать предмет по внутриигровой почте.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemInfo.CanSendByMail(itemId) end

--- Проверка можно ли передавать предмет другому игроку.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemInfo.CanTrade(itemId) end

--- Возвращает информацию об активации созданных предметов.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemInfo.GetActivationInfo(itemId) end

--- Получить список описаний активаторов, которыми в принципе можно активировать данный предмет.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemInfo.GetActivators(itemId) end

--- Получить список альтернативных валют, которыми можно заплатить за активацию данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemInfo.GetActivatorsAlternative(itemId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemInfo.GetBonus(itemId) end

--- Если предмет является бандлом, то возвращает список предметов, входящих в бандл.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemInfo.GetBundle(itemId) end

--- Возвращает список идентификаторов (ItemCategoryId) терминальных категорий предметов для корневой категории.
---@param itemCategoryId ItemCategoryId идентификатор корневой категории
---@return table
function itemInfo.GetChildCategories(itemCategoryId) end

--- Возвращает список слотов в которые можно одеть предмет. Если предмет одеть нельзя - список пуст.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemInfo.GetCompatibleSlots(itemId) end

--- Возвращает информацию о предмете-купоне.
---@param itemId ItemId идентификатор ресурса предмета
---@return table
function itemInfo.GetCouponInfo(itemId) end

--- Возвращает таблицу с информацией о предмете, связанную с крафтами.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemInfo.GetCraftInfo(itemId) end

--- Возвращает информацию о ремесленном инструменте, если это инструмент.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemInfo.GetCraftToolInfo(itemId) end

--- Возвращает номер сезона в котором предмету будет разрушен.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemInfo.GetDestroyValue(itemId) end

--- Проверяет можно ли обменять предмет на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemInfo.GetExchangeInfo(itemId) end

--- Возвращает список дополнительных строк описания предмета. Обычно он содержат начальную строку и список названий предмеов, которые каким-либо образом добываются из данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemInfo.GetExtraDescs(itemId) end

--- Возвращает список рейтингов, соответствующих дополнительным строкам описания предмета из  itemLib.GetExtraDescs( itemId ).
---@param itemId ObjectId идентификатор предмета
function itemInfo.GetExtraDescsRatings(itemId) end

--- Возвращает значение рейтинга предмета.
---@param itemId ObjectId идентификатор предмета
---@return number
function itemInfo.GetGearScore(itemId) end

--- Возвращает таблицу с информацией о мета-свойствах предмета.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemInfo.GetMetaInfo(itemId) end

--- Возвращает информацию об ограничении количества предметов во владении, т.е. сколько максимум таких предметов единовременно может находится "на руках" у персонажа.
---@param itemId ObjectId(Number) идентификатор предмета
---@return number
function itemInfo.GetOwnershipLimit(itemId) end

--- Возвращает список отдельных целей заданий, для которых нужен этот предмет.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemInfo.GetRelatedQuestObjectives(itemId) end

--- Возвращает ItemId (ResourceId) ресурса предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemId
function itemInfo.GetResourceId(itemId) end

--- Возвращает список идентификаторов (ItemCategoryId) корневых категорий предметов.
---@return table
function itemInfo.GetRootCategories() end

--- Возвращает информацию о сетовом бонусе предмета.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemInfo.GetSetBonusInfo(itemId) end

--- Возвращает информацию о всех доступных в игре сетовых бонусах.
---@return table|nil
function itemInfo.GetSetBonusRoot() end

--- Возвращает длительность специального суточного кулдауна на использование предмета. Такой кулдаун назначается для некоторых предметов при их использовании и длится до начала какого-либо дня.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemInfo.GetStateCooldownMs(itemId) end

--- Возвращает true если в предмете есть компоненты, изменяющиеся в зависимости от состояния гильдии игрока (например, гильдейские наплечники).
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemInfo.HasGuildComponent(itemId) end

--- Был ли предмет скопирован, если да - его нельзя продать на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemInfo.IsCopied(itemId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом в определенном слоте экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slot integer индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType integer тип контейнера
---@return any
function itemInfo.GetEquipmentSlotBonus(unitId, slot, slotType) end

--- Возвращает новый экземпляр ValuedObject по Id предмета.
function GetValuedObject() end

-- Events

--- Событие об изменении предмета (например, изменилось количество в стеке).
EVENT_GAME_ITEM_CHANGED = "EVENT_GAME_ITEM_CHANGED"

--- Событие об изменении проклятости предмета. Одновременно, приходит событие  EVENT_GAME_ITEM_CHANGED.
EVENT_GAME_ITEM_CURSED_CHANGED = "EVENT_GAME_ITEM_CURSED_CHANGED"

--- Событие приходит, если была попытка использовать/надеть/снять предмет, но он не доступен для использования (персонаж мертв или предмет и так находится в процессе переодевания).
EVENT_ITEM_DISABLED = "EVENT_ITEM_DISABLED"

--- Событие возникает при успешном перемещении предмета.
EVENT_ITEM_MOVED = "EVENT_ITEM_MOVED"

--- Приходит, если изменился список заданий, связанных с предметом.
EVENT_ITEM_RELATED_QUESTS_CHANGED = "EVENT_ITEM_RELATED_QUESTS_CHANGED"

--- Сообщение приходит, когда по каким-либо причинам необходимо показать информацию по определенным предметам. В сообщеннии приходит список ValuedObject-ов - объектов, в которых содержится информация о предметах. Эти объекты можно добавлять в какой либо ValuedText.
EVENT_SHOW_ITEMS_INFO = "EVENT_SHOW_ITEMS_INFO"
