---@meta

--- CategoryItemLib
--- События и функции Lua API, относящиеся к предметам.

--- Виды основных бюджетов статов
ENUM_FloatingBudgetType_MainBudget = "ENUM_FloatingBudgetType_MainBudget"
ENUM_FloatingBudgetType_DefenceBudget = "ENUM_FloatingBudgetType_DefenceBudget"
ENUM_FloatingBudgetType_OffenceBudget = "ENUM_FloatingBudgetType_OffenceBudget"

---@class itemLibLib
itemLib = {}

--- Если предикат не выполнился, то вернет причину невыполнения.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetBlockingPredicateCause(itemId) end

--- Проверяет можно ли активировать предмет для применения на другом предмете. Исходный предмет должен обладать свойством IsUseItemAndTakeActions
---@param sourceId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function itemLib.CanActivateForUseItem(sourceId) end

--- Проверяет можно ли активировать предмет для применения на другом предмете. Исходный предмет должен обладать свойством IsUseOnItemAndTakeActions
---@param sourceId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function itemLib.CanActivateForUseOnItem(sourceId) end

--- Проверяет можно ли активировать предмет для применения на маунта. Исходный предмет должен обладать свойством IsUseOnMountAndTakeActions
---@param itemId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function itemLib.CanActivateForUseOnMount(itemId) end

--- Можно ли выставить этот предмет на аукцион.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.CanCreateAuction(itemId) end

--- Можно ли выкинуть предмет из инвентаря.
---@param itemId ObjectId идентификатор предмета-"образца"
---@return boolean
function itemLib.CanDrop(itemId) end

--- Проверка можно ли передавать предмет по внутриигровой почте.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.CanSendByMail(itemId) end

--- Проверка можно ли передавать предмет другому игроку.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.CanTrade(itemId) end

--- Проверяет можно ли применить один предмет на другом предмете.
---@param sourceId ObjectId идентификатор предмета, который используют
---@param targerId ObjectId идентификатор предмета, на котором используют
function itemLib.CanUseOnItem(sourceId, targerId) end

--- Проверяет можно ли применить предмет на маунта.
---@param itemId ObjectId идентификатор предмета, который используют
---@param mountId ObjectId идентификатор маунта, на котором используют предмет
---@return boolean|nil
function itemLib.CanUseOnMount(itemId, mountId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом к группам заклинаний.
---@param itemId ObjectId идентификатор предмета
---@return tables[]|nil
function itemLib.GetActionGroupsInfo(itemId) end

--- Возвращает информацию об активации созданных предметов.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetActivationInfo(itemId) end

--- Получить список описаний активаторов, которыми в принципе можно активировать данный предмет.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetActivators(itemId) end

--- Получить список альтернативных валют, которыми можно заплатить за активацию данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetActivatorsAlternative(itemId) end

--- Информация о привязке предмета.
---@param itemId ObjectId идентификатор предмета
---@return table[]
function itemLib.GetAlternativePriceInfo(itemId) end

--- Информация о привязке предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetBindingInfo(itemId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetBonus(itemId) end

--- Информация о сундучке, если предмет таковым является.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetBoxInfo(itemId) end

--- Основные бюджеты статов предмета подверженных рефорджу.
---@param itemId ObjectId идентификатор предмета
---@return number[]|nil
function itemLib.GetBudgets(itemId) end

--- Если предмет является бандлом, то возвращает список предметов, входящих в бандл.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemLib.GetBundle(itemId) end

--- Возвращает id категории, к которой относится предмет.
---@param itemId ObjectId идентификатор предмета
---@return ItemCategoryId
function itemLib.GetCategory(itemId) end

--- Информация о категории, к которой относится предмет.
---@param itemCategoryId ItemCategoryId идентификатор категории предмета
---@return table
function itemLib.GetCategoryInfo(itemCategoryId) end

--- Возвращает список идентификаторов (ItemCategoryId) терминальных категорий предметов для корневой категории.
---@param itemCategoryId ItemCategoryId идентификатор корневой категории
---@return table
function itemLib.GetChildCategories(itemCategoryId) end

--- Получить идентификатор класса предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemClassId
function itemLib.GetClass(itemId) end

--- Получить информацию о классе предмета по идентификатору класса предмета.
---@param itemClassId ItemClassId идентификатор класса предмета
---@return table
function itemLib.GetClassInfo(itemClassId) end

--- Возвращает список слотов в которые можно одеть предмет. Если предмет одеть нельзя - список пуст.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetCompatibleSlots(itemId) end

--- Информация о количестве "зарядов" в предмете.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetCountInfo(itemId) end

--- Возвращает информацию о предмете-купоне.
---@param itemId ItemId идентификатор ресурса предмета
---@return table
function itemLib.GetCouponInfo(itemId) end

--- Возвращает таблицу с информацией о предмете, связанную с крафтами.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetCraftInfo(itemId) end

--- Возвращает информацию о ремесленном инструменте, если это инструмент.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetCraftToolInfo(itemId) end

--- Возвращает номер сезона в котором предмету будет разрушен.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemLib.GetDestroyValue(itemId) end

--- Возвращает слот к которому относится данный предмет. Список доступных слотов:  DRESS_SLOT_...
---@param objectId int идентификатор предмета
---@return integer
function itemLib.GetDressSlot(objectId) end

--- Получить сообщение, которое необходимо показать перед выбрасыванием предмета предмета.
---@param itemId ObjectId идентификатор предмета
---@return WString|nil
function itemLib.GetDropInfo(itemId) end

--- Проверяет можно ли обменять предмет на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetExchangeInfo(itemId) end

--- Возвращает список дополнительных строк описания предмета. Обычно он содержат начальную строку и список названий предмеов, которые каким-либо образом добываются из данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetExtraDescs(itemId) end

--- Возвращает список рейтингов, соответствующих дополнительным строкам описания предмета из  itemLib.GetExtraDescs( itemId ).
---@param itemId ObjectId идентификатор предмета
function itemLib.GetExtraDescsRatings(itemId) end

--- Возвращает значение рейтинга предмета.
---@param itemId ObjectId идентификатор предмета
---@return number
function itemLib.GetGearScore(itemId) end

--- Информация о мобе (существе), который даёт этот предмет при использовании из бестиария при растановке на личном острове, если есть.
---@param itemId ObjectId id предмета
---@return table|nil
function itemLib.GetIncludedMob(itemId) end

--- Скин маунта, который даёт этот предмет при использовании (если есть).
---@param itemId ObjectId id предмета
---@return ObjectId|nil
function itemLib.GetIncludedMountSkin(itemId) end

--- Общая информация о предмете.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetItemInfo(itemId) end

--- Получить уровень предмета.
---@param itemId ObjectId идентификатор предмета
---@return any
function itemLib.GetLevel(itemId) end

--- Возвращает таблицу с информацией о мета-свойствах предмета.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetMetaInfo(itemId) end

--- Возвращает название предмете.
---@param itemId ObjectId идентификатор предмета
---@return WString
function itemLib.GetName(itemId) end

--- Суммарное количество "зарядов" всех подобных предметов, имеющихся у игрока (в сумке и эквипменте). Предметы идентифицируются по ресурсу.
---@param itemId ObjectId идентификатор предмета-"образца"
---@return number
function itemLib.GetOverallCount(itemId) end

--- Суммарное количество  всех подобных предметов у игрока в сумке и в инвентори (с учётом количеств в пачках). Предметы идентифицируются по ресурсу.
---@param itemId ObjectId идентификатор предмета-"образца"
---@return number
function itemLib.GetOverallStackCount(itemId) end

--- Возвращает информацию об ограничении количества предметов во владении, т.е. сколько максимум таких предметов единовременно может находится "на руках" у персонажа.
---@param itemId ObjectId(Number) идентификатор предмета
---@return number
function itemLib.GetOwnershipLimit(itemId) end

--- Цены предмета при покупке/продаже в торговца.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetPriceInfo(itemId) end

--- Получить качество предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetQuality(itemId) end

--- Возвращает список отдельных целей заданий, для которых нужен этот предмет.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemLib.GetRelatedQuestObjectives(itemId) end

--- Возвращает ItemId (ResourceId) ресурса предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemId
function itemLib.GetResourceId(itemId) end

--- Возвращает список идентификаторов (ItemCategoryId) корневых категорий предметов.
---@return table
function itemLib.GetRootCategories() end

--- Информация о руне, если предмет является руной.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetRuneInfo(itemId) end

--- Информация  об инструменте, если предмет таковым является.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetRuneInstrumentInfo(itemId) end

--- Возвращает информацию о сетовом бонусе предмета.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetSetBonusInfo(itemId) end

--- Возвращает информацию о всех доступных в игре сетовых бонусах.
---@return table|nil
function itemLib.GetSetBonusRoot() end

--- Происхождение предмета.
---@param itemId ObjectId идентификатор предмета
---@return string
function itemLib.GetSource(itemId) end

--- Id спелла, прикреплённого к предмету.
---@param itemId ObjectId идентификатор предмета
function itemLib.GetSpell(itemId) end

--- Получить информацию о стеке предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetStackInfo(itemId) end

--- Возвращает длительность специального суточного кулдауна на использование предмета. Такой кулдаун назначается для некоторых предметов при их использовании и длится до начала какого-либо дня.
---@param itemId ObjectId идентификатор предмета
---@return nil
function itemLib.GetStateCooldownMs(itemId) end

--- Информация о временном предмете, если предмет таковым является.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function itemLib.GetTemporaryInfo(itemId) end

--- Возвращает индексированный с 0 список идентификаторов предметов, которые может улучшить этот улучшитель. В случае ошибки возвращает nil.
---@param itemId ObjectId идентификатор предмета
---@return ObjectId[]|nil
function itemLib.GetUniversalMetaEnchancerItems(itemId) end

--- Информация связанная с использованием данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetUsageInfo(itemId) end

--- Информация об использовании предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetUsageItemInfo(itemId) end

--- Информация об использовании предмета на предмет.
---@param itemId ObjectId идентификатор предмета
---@param tergetItemId ObjectId идентификатор цели
---@return table
function itemLib.GetUsageOnItemInfo(itemId, tergetItemId) end

--- Информация об использовании предмета на маунта.
---@param itemId ObjectId идентификатор предмета
---@param mountId ObjectId идентификатор маунта
---@return table
function itemLib.GetUsageOnMountInfo(itemId, mountId) end

--- Информация об использовании предмета.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetUsagesItemInfo(itemId) end

--- Информация об использовании предмета на предмет.
---@param itemId ObjectId идентификатор предмета
---@param targetItemId ObjectId идентификатор цели
---@return table
function itemLib.GetUsagesOnItemInfo(itemId, targetItemId) end

--- Информация об использовании предмета на маунта.
---@param itemId ObjectId идентификатор предмета
---@param mountId ObjectId идентификатор маунта
---@return table
function itemLib.GetUsagesOnMountInfo(itemId, mountId) end

--- Возвращает алиас курсора для использования на другой предмет с выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return string
function itemLib.GetUseOnItemCursor(itemId) end

--- Возвращает алиас курсора для использования на маунта с выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return string
function itemLib.GetUseOnMountCursor(itemId) end

--- Информация о знаке зодиака руны.
---@param zodiacSignId ZodiacSignId идентификатор знака зодиака
---@return table|nil
function itemLib.GetZodiacSignInfo(zodiacSignId) end

--- Возвращает true если в предмете есть компоненты, изменяющиеся в зависимости от состояния гильдии игрока (например, гильдейские наплечники).
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.HasGuildComponent(itemId) end

--- Проверяет, предназначен ли данный предмет для пополнения бестиария.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsBeast(itemId) end

--- Признак того, что предмет можно конвертировать в подобные предметы.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsConvertible(itemId) end

--- Был ли предмет скопирован, если да - его нельзя продать на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsCopied(itemId) end

--- Показывает проклят ли предмет.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsCursed(itemId) end

--- Проверка предназначен ли предмет для дерева талантов души.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsGem(itemId) end

--- Является ли предмет предметом для создания гильдии.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsGuildCreator(itemId) end

--- Определяет нужно ли скрывать данный предмет в гардеробе до тех пор пока он туда не добавлен.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsHideLifestyleWhileNotEquipped(itemId) end

--- Проверяет, есть ли предмет с таким itemId.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsItem(itemId) end

--- Является ли предмет инструментом для конвертации метаитема-улучшителя в обычный итем.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsMetaEnhancerConvertor(itemId) end

--- Можно ли многократно использовать предмет (не сбрасывается ли состояние юза после первого использования). Применяется вместе с itemLib.IsUseItemAndTakeActions( itemId )
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsMultipleUse(itemId) end

--- Для используемых предметов признак того, что их надо использовать на точку местности.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsPointed(itemId) end

--- Проверка является ли предмет пробником.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsProbe(itemId) end

--- Может ли предмет дать квесты. Действительно только для имеющихся у игрока предметов.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsQuestOperator(itemId) end

--- Является ли предмет квестовым (нужен для завершения или использования в квесте). Действительно только для имеющихся у игрока предметов.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsQuestRelated(itemId) end

--- Является ли предмет сигнальным фейрверком.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsSOSMessageSender(itemId) end

--- Предмет автоматически распаковывается при попадании в сумку.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUnpackOnPickup(itemId) end

--- Возможно ли использование предмета. Значение поля недействительно для предметов во время лута (всегда false).
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUsable(itemId) end

--- Является ли предметом, который можно использовать с проверкой итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUseItemAndTakeActions(itemId) end

--- Является ли предметом, который можно использовать на другой предмет с проверкой на том итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@param count number количество предметов используемых из стека (по умолчанию - 1 )
---@return boolean
function itemLib.IsUseOnItemAndTakeActions(itemId, count) end

--- Является ли предметом, который можно использовать на маунта с проверкой на том итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUseOnMountAndTakeActions(itemId) end

--- Показывать ли пользовательский выбор вариантов действий. Применяется вместе с itemLib.IsUseItemAndTakeActions( itemId )
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUserChoice(itemId) end

--- Является ли предмет оружием.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsWeapon(itemId) end

--- Возвращает список предметов, требующихся для применения умения.
---@param id SpellId Id умения
---@return table
function itemLib.GetRequiredResources(id) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом в определенном слоте экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slot integer индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType integer тип контейнера
---@return any
function itemLib.GetEquipmentSlotBonus(unitId, slot, slotType) end

--- Возвращает новый экземпляр ValuedObject по Id предмета.
function GetValuedObject() end
