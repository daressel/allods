---@meta

--- CategoryLoot
--- События и функции Lua API, относящиеся к луту.

--- Выбор при Greed/Need ролле:
---@type integer
CHOICE_GREED_NEED_PASS = nil
---@type integer
CHOICE_GREED_NEED_GREED = nil
---@type integer
CHOICE_GREED_NEED_NEED = nil

--- Типы схем дележа лута:
---@type integer
LOOT_SCHEME_TYPE_FREE_FOR_ALL = nil
---@type integer
LOOT_SCHEME_TYPE_MASTER = nil
---@type integer
LOOT_SCHEME_TYPE_GROUP = nil

--- Тип получения предмета игроком:
--- предмет пришёл из лута
ENUM_TakeItemActionType_Loot = "ENUM_TakeItemActionType_Loot"
--- предмет получен/забран квестом (выдан в начале, забран в конце, ревард)
ENUM_TakeItemActionType_Quest = "ENUM_TakeItemActionType_Quest"
--- итем забрали по причине отказа от квеста
ENUM_TakeItemActionType_QuestAbandon = "ENUM_TakeItemActionType_QuestAbandon"
--- итем появился/исчез по причине каста спела
ENUM_TakeItemActionType_Spell = "ENUM_TakeItemActionType_Spell"
--- итем появился/исчез при разговоре с вендором
ENUM_TakeItemActionType_Vendor = "ENUM_TakeItemActionType_Vendor"
--- при каком-то крафтинге (итем взят из крафт бега)
ENUM_TakeItemActionType_Craft = "ENUM_TakeItemActionType_Craft"
--- из почты
ENUM_TakeItemActionType_Mail = "ENUM_TakeItemActionType_Mail"
--- игрок выкинул итем
ENUM_TakeItemActionType_Drop = "ENUM_TakeItemActionType_Drop"
--- итем был уничтожен по времени
ENUM_TakeItemActionType_SelfAnnihilation = "ENUM_TakeItemActionType_SelfAnnihilation"
--- простая операция с деньгами
ENUM_TakeItemActionType_Money = "ENUM_TakeItemActionType_Money"
ENUM_TakeItemActionType_Box = "ENUM_TakeItemActionType_Box"
ENUM_TakeItemActionType_RuneCombine = "ENUM_TakeItemActionType_RuneCombine"
ENUM_TakeItemActionType_SkilledItemGeneration = "ENUM_TakeItemActionType_SkilledItemGeneration"
--- игрок делает ставку
ENUM_TakeItemActionType_AuctionBet = "ENUM_TakeItemActionType_AuctionBet"
--- игрок выставляет предмет на аукцион и с него берут залог
ENUM_TakeItemActionType_AuctionCreate = "ENUM_TakeItemActionType_AuctionCreate"
--- игрок выкупает предмет на аукционе
ENUM_TakeItemActionType_AuctionBuyout = "ENUM_TakeItemActionType_AuctionBuyout"
ENUM_TakeItemActionType_Other = "ENUM_TakeItemActionType_Other"
ENUM_TakeItemActionType_CurrencyExchange = "ENUM_TakeItemActionType_CurrencyExchange"
ENUM_TakeItemActionType_Mentor = "ENUM_TakeItemActionType_Mentor"
ENUM_TakeItemActionType_ItemMall = "ENUM_TakeItemActionType_ItemMall"

---@class lootLib
loot = {}

--- Закрывает сумку с лутом.
function loot.CloseLootBag() end

--- Вернуть общее число слотов в открытой сумке с лутом, включая пустые. Деньги не считаются слотом - это отдельная сущность.
---@return number
function loot.GetLootBagSlotCount() end

--- Возвращает количество денег и список вещей в сумке с лутом - содержимое всех слотов. Список индексируется от 0 до avatar.GetLootBagSlotCount() - 1. Для пустых слотов возвращается nil.
---@return integer
function loot.GetLootBagSlots() end

--- Возвращает состояние сумки с лутом на сервере - открыта она для лута или нет.
---@return boolean
function loot.IsLootBagOpen() end

--- Узнать можно ли менять схему дележа лута в рейде/группе. Схема дележа лута запрещена, например, в автоматически созданных рейдах. Это свойство не меняется в течение жизни рейда/группы.
---@return boolean
function loot.CanSetLootScheme() end

--- Позволяет получить информацию общего характера, неизменную в процессе игры.
---@return table
function loot.GetCommonInfo() end

--- Возвращает время в миллисекундах, через которое будет произведен автоматический Greed/Need ролл.
---@return number
function loot.GetGreedNeedForLootTimeMs() end

--- Сколько осталось времени для Greed/Need ролла.
---@param rollId ObjectId уникальный идентификатор ролла
---@return number
function loot.GetGreedNeedTimeRemainingMs(rollId) end

--- Позволяет получить информацию о текущем варианте выпадения лута на астральных островах.
---@return table
function loot.GetLootGroupPartInfo() end

--- Узнать текущую схему дележа лута.
---@return number
function loot.GetLootScheme() end

--- Узнать пороговое качество итемов для текущей лут схемы.
---@return number
function loot.GetMinItemQualityForLootScheme() end

--- Cделать выбор для Greed/Need ролла.
---@param rollId ObjectId уникальный идентификатор ролла
---@param choice integer выбор
function loot.SelectGreedNeedForLoot(rollId, choice) end

--- Позволяет установить вариант выпадения лута на астральных островах.
---@param lootGroupId LootGroupId идентификатор выбранного варианта, может быть выбран из списка loot.GetCommonInfo().allLoot
function loot.SelectLootGroup(lootGroupId) end

--- Cделать выбор для Master ролла.
---@param rollId ObjectId уникальный идентификатор ролла
---@param winnerId ObjectId уникальный идентификатор игрока, получающего лут
function loot.SelectWinnerForLoot(rollId, winnerId) end

--- Задать схему дележа лута.
---@param scheme integer тип лут схемы
function loot.SetLootScheme(scheme) end

--- Задать пороговое качество итемов для текущей лут схемы.
---@param quality integer идентификатор качества итема
function loot.SetMinItemQualityForLootScheme(quality) end

--- Переключить ролл с master на greed-need схему распределения.
---@param rollId ObjectId уникальный идентификатор ролла
function loot.SwitchToGreedNeed(rollId) end

-- Events

--- Сообщение приходит, когда главный игрок теряет предмет. В сообщеннии приходит ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
EVENT_AVATAR_ITEM_DROPPED = "EVENT_AVATAR_ITEM_DROPPED"

--- Сообщение приходит, когда главный игрок получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
EVENT_AVATAR_ITEM_TAKEN = "EVENT_AVATAR_ITEM_TAKEN"

--- Сообщение приходит, когда согрупник или соотрядник главного игрока получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE = "EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE"

--- Сообщение приходит, когда главный игрок потерял деньги.
EVENT_AVATAR_MONEY_DROPPED = "EVENT_AVATAR_MONEY_DROPPED"

--- Сообщение приходит, когда главный игрок получает деньги.
EVENT_AVATAR_MONEY_TAKEN = "EVENT_AVATAR_MONEY_TAKEN"

--- Сообщение приходит, когда согрупник или соотрядник главного игрока получает деньги.
EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE = "EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE"

--- Уведомление об окончании ролла:
EVENT_DISTRIBUTION_FINISHED = "EVENT_DISTRIBUTION_FINISHED"

--- Уведомление о результатах ролла при Greed/Need ролле:
EVENT_GREED_NEED_ROLLS = "EVENT_GREED_NEED_ROLLS"

--- Уведомление о сделанном выборе при Greed/Need ролле:
EVENT_GREED_NEED_SELECTED = "EVENT_GREED_NEED_SELECTED"

--- Уведомление о смене качества итемов для текущей схемы дележа лута в группе.
EVENT_GROUP_ITEM_QUALITY_CHANGED = "EVENT_GROUP_ITEM_QUALITY_CHANGED"

--- Уведомление о смене схемы дележа лута в группе.
EVENT_GROUP_LOOT_SCHEME_CHANGED = "EVENT_GROUP_LOOT_SCHEME_CHANGED"

--- Событие посылается каждый раз, когда появился какой-нибудь контейнер с лутом.
EVENT_LOOT_BAG_APPEARED = "EVENT_LOOT_BAG_APPEARED"

--- Событие посылается на изменение контейнера с лутом. Если одновременно изменились несколько элементов, то событие присылается только раз.
EVENT_LOOT_BAG_CHANGED = "EVENT_LOOT_BAG_CHANGED"

--- Событие посылается на исчезновение контейнера с лутом.
EVENT_LOOT_BAG_DISAPPEARED = "EVENT_LOOT_BAG_DISAPPEARED"

--- Событие посылается на исчезновение объекта в контейнера с лутом.
EVENT_LOOT_BAG_ITEM_DISAPPEARED = "EVENT_LOOT_BAG_ITEM_DISAPPEARED"

--- Событие посылается на исчезновение денег в контейнере с лутом.
EVENT_LOOT_BAG_MONEY_DISAPPEARED = "EVENT_LOOT_BAG_MONEY_DISAPPEARED"

--- Событие посылается на открытие/закрытие сумки с лутом.
EVENT_LOOT_BAG_OPEN_STATE_CHANGED = "EVENT_LOOT_BAG_OPEN_STATE_CHANGED"

--- Событие посылается при селекте контейнера с лутом. (В настоящий момент только на клик в неселекченный труп - т.е. в момент селекта - моба с лутом.)
EVENT_LOOT_BAG_SELECTED = "EVENT_LOOT_BAG_SELECTED"

--- Уведомление о начале ролла при Master ролле. Приходит всем, кроме мастера (мастеру приходит EVENT_LOOT_TO_DISTRIBUTE).
EVENT_LOOT_DISTRIBUTION_STARTED = "EVENT_LOOT_DISTRIBUTION_STARTED"

--- Сообщение приходит при начале дележа при Greed/Need ролле:
EVENT_LOOT_FOR_GREED_NEED = "EVENT_LOOT_FOR_GREED_NEED"

--- Сообщение приходит, когда меняется информация о текущем варианте выпадения лута на астральных островах.
EVENT_LOOTSELECTOR_CHANGED = "EVENT_LOOTSELECTOR_CHANGED"

--- Уведомление о начале ролла при Master ролле (приходит только мастеру):
EVENT_LOOT_TO_DISTRIBUTE = "EVENT_LOOT_TO_DISTRIBUTE"
