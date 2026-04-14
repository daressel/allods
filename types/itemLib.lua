---@meta

---@class itemLibLib
itemLib = {}

---@class ItemLibGetBlockingPredicateCauseResult
---@field bool isInNotPredicate использовался предикат NOT
---@field string sysCause причина невыполненного предиката (например, "ENUM_ActionFailCause_CreatureLevelTooSmall" )

---@class ItemLibGetActionGroupsInfoResult
---@field actionGroupId ActionGroupId|nil идентификатор группы заклинаний
---@field statBonuses table таблица с бонусами к статам персонажа во время использования заклинаний из группы actionGroupId; формат:

---@class ItemLibGetActivationInfoResult
---@field isInactive boolean предмет неактивирован, требует активации
---@field cost number nil если предмет не требует активации или активация бесплатна; иначе стоимость активации предмета
---@field isItemActivator boolean этот предмет - инструмент для активации других предметов

---@class ItemLibGetActivatorsResult
---@field name string имя активатора (локализованное)
---@field description string описание активатора (локализованное)
---@field image TextureId иконка активатора

---@class ItemLibGetAlternativePriceInfoResult
---@field currencyId CurrencyId идентификатор ресурса альтернативной валюты
---@field value integer цена в этой валюте

---@class ItemLibGetBindingInfoResult
---@field isBound boolean привязан ли итем к аватару
---@field binding number тип привязки итема к аватару
---@field guildBound number|nil идентификатор гильдии к которой привязан предмет
---@field bindDescription string|nil специальный вопрос, задаваемый перед привязыванием предмета

---@class ItemLibGetBonusResult
---@field innateStats table бонус к основным характеристикам персонажа, поля аналогичны таковым из avatar.GetInnateStats(), но поле effective содержат сумму только base и enchants
---@field resistances table бонус к сопротивляемостям персонажа, поля аналогичны таковым из avatar.GetResistances(), но поле effective содержат сумму только base и enchants
---@field miscStats table различные бонусы, назначение полей:
---@field power tables[] могущество
---@field stamina tables[] выносливость
---@field wisdom tables[] мудрость
---@field minDamage tables[] минимальный урон
---@field maxDamage tables[] максимальный урон
---@field spellPower tables[] среднее значение силы заклинаний(см. также maxSpellPower и minSpellPower)
---@field maxSpellPower tables[] максимальное значение силы заклинаний
---@field minSpellPower tables[] минимальное значение силы заклинаний
---@field weaponSpeed float скорость (для оружия)
---@field summondDps boolean галочка, которая  говорит, что считать эту шмотку нужно сверх текущей, а не вместо
---@field hideDPS boolean скрывает отображение урона у оружия
---@field base number базовое значение характеристики
---@field effective number эффективное (текущее) значение
---@field enchants number величина изменения от энчантов, вставленных в надетые на игрока предметы
---@field specStats table[1,..] of tables различные спец-статы:
---@field id SpecialStatId идентификатор стата
---@field name string название спец-стата
---@field tooltipName string упрощенное название спец-стата
---@field shortDescription string упрощенное описание спец-стата
---@field value number значение спец-стата
---@field type number класс характеристика

---@class ItemLibGetBoxInfoResult
---@field canUseStack boolean true, если можно открывать такие сундуку пачками

---@class ItemLibGetCategoryInfoResult
---@field sysName string или nil системное имя категории (нелокализуемое, для использования в скриптах); nil если отсутствует
---@field name string название категории
---@field root boolean true, если у подкатегории есть дочерние категории
---@field rootId ItemCategoryId или nil идентификатор ресурса родительской категории; nil если родительская категория отсутствует
---@field showAuction boolean true, если категорию надо показать в аукционе

---@class ItemLibGetClassInfoResult
---@field name string имя класса предмета
---@field sysName string или nil системное имя (если есть)
---@field debugName string или nil путь к файлу описания класса предмета (отладочная информация)

---@class ItemLibGetCountInfoResult
---@field count integer количество зарядов в предмете
---@field limit integer максимальное количество зарядов, возможное для предмета

---@class ItemLibGetCouponInfoResult
---@field isCoupon boolean является ли предмет купоном (true) или нет (false)
---@field items table или nil если ошибка, то nil; иначе список (таблица, индексированная целыми числами, начиная от 0) id (Itemid) предметов, которые можно купить при наличии данного купона в сумке

---@class ItemLibGetCraftToolInfoResult
---@field properties string[] список (индексированная от 0 таблица) таблица со списком свойств инструмента, которые у него уже есть
---@field toolImprovers table список (индексированная от 0 таблица) с описаниями предметов-улучшителей, способных улучшить данный инструмент; элементы - таблицы с полями:
---@field item ObjectId идентификатор предмета-улучшителя
---@field properties table список (индексированная от 0 таблица) со списком свойств, которые добавляет к инструменту соответствующий улучшитель, элементы: enum "ENUM_ToolProperty_..."

---@class ItemLibGetExchangeInfoResult
---@field isRewardsExchange boolean true, если такой предмет есть на бирже
---@field canExchange boolean true, если предмет можно продать на биржу

---@class ItemLibGetIncludedMobResult
---@field type number тип моба в личном приключении
---@field sysType string тип моба в личном приключении
---@field mob table таблица с полями
---@field name string название существа
---@field title string титул существа
---@field description string описание существа
---@field kind table описание вида существ
---@field race number раса существа
---@field sysRrace string раса существа

---@class ItemLibGetItemInfoResult
---@field id ObjectId идентификатор предмета
---@field name string название предмета
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field sourceDescription GlossaryId|nil идентификатор ресурса универсального описателя для источника предмета (при наличии)
---@field dressSlot number слот одежды или оружия, если предмет надевается: DRESS_SLOT_XXXX
---@field sysName string специальные интерфейсные особенности предмета.
---@field level integer уровень предмета
---@field forceShowLevel boolean нужно ли показывать уровень на иконке предмета (поле в ресурсе forceShowLevel = false)
---@field requiredLevel integer уровень персонажа, необходимый для ношения предмета
---@field requiredReputationLevel number уровнь репутации, необходимый для покупки предмета
---@field requiredReputationQuantity integer минимальное значение репутации, необходимое для покупки предмета
---@field isRitual boolean является ли предмет ритуальным (надевается, если игрок прошел ритуал и лежит в контейнере ITEM_CONT_EQUIPMENT_RITUAL)
---@field debugName string путь к файлу описания предмета (отладочная информация)
---@field icon TextureId текстура с иконкой предмета (доступно только в UI)
---@field isDoubleHands boolean является ли предмет двуручным (оружие)
---@field isIgnoreDressSlotLevel boolean если true, то предмет можно одеть в заблокированный по уровню слот
---@field isDressable boolean является ли предметом одежды
---@field isUsable boolean можно ли применять
---@field isWeapon boolean является ли оружием
---@field isGuildItem boolean предмет привязывается к гильдии
---@field buyConfirmationRequired boolean при покупке предмета у вендора показывать подтверждение
---@field needCheckPredicates boolean нужно ли проверять предикаты при отображении
---@field showOnlyIconInLink boolean отображать только иконку данного предмета в итемлинке

---@class ItemLibGetMetaInfoResult
---@field isInactive boolean true, если предмет неактивирован, требует активации, без которой не может подвергаться апгрейду или апгрейдить другие предметы
---@field hasMetaState boolean true, если это мета-предмет, который и которым можно апгрейдить (если isInactive false)
---@field isMetaEnchancer boolean true, если это мета-предмет которым можно апгрейдить другие такие же метапредметы (если isInactive false)
---@field isUniversalMetaEnchancer boolean true, если это мета-предмет которым можно апгрейдить другие метапредметы из некоторого списка
---@field isUpgradeAgent boolean true, если это агент, необходимый для улучшения мета-предметов
---@field isSingleUpgradeAgent boolean true, если это агент, необходимый для улучшения мета-предметов, который можно использовать не более, чем одну штуку за раз (см. также поле maxImprovement у avatar.GetMetaUpgradeResults)
---@field improvement number улучшенность состояния предмета на данный момент. От 0.0 до 99.9. 0.0 - совсем не улучшен. 99.9 - практически достиг следующего уровня

---@class ItemLibGetPriceInfoResult
---@field sellPrice integer цена предмета при продаже текущему торговцу (или по-умолчанию), -1, если нельзя продавать вендору
---@field auctionPrice integer цена предмета с которой берётся налог на аукционе, -1, если нельзя продавать на аукционе
---@field buyPrice integer цена предмета при покупке у текущего торговца (или по-умолчанию равна базовой цене, не из buyback-а и secondhand-а)
---@field basePrice integer базовая цена предмета по умолчанию. Используется, например, для расчета стоимости аукциона
---@field altPrices table или nil nil если нет информации; иначе список (индексируется от 1) цен в альтернативных валютах, элемент списка - таблица с полями:
---@field currencyId CurrencyId идентификатор альтернативной валюты (получение информации об альтернативной валюте по CurrencyId - см. avatar.GetCurrencyInfo(currencyId))
---@field value integer цена в этой альтернативной валюте

---@class ItemLibGetQualityResult
---@field quality number качество предмета
---@field isNeedVisualize boolean требуется ли отображать рамку качества предмета в интерфейсе
---@field isCursed boolean является ли предмет проклятым
---@field hasSetBonus boolean является ли предмет частью набора

---@class ItemLibGetRuneInfoResult
---@field level integer уровень руны
---@field zodiacSignId ZodiacSignId id знака зодиака руны
---@field offensiveBonus number на какой процент увеличивается атака, благодаря руне
---@field defensiveBonus number на какой процент увеличивается защита, благодаря руне
---@field upgradedRuneItem ObjectId|nil идентификатор предмета руны следующего уровня, если такая есть

---@class ItemLibGetRuneInstrumentInfoResult
---@field isCombiner boolean является ли инструментом для соединения рун

---@class ItemLibGetSetBonusInfoResult
---@field hasSetBonus boolean true, если предмет имеет сетовый бонус
---@field name string|nil название сетового бонуса, или nil если у предмета нету сетового бонуса
---@field description ValuedText|nil описание сетового бонуса, или nil если у предмета нету сетового бонуса
---@field loreDescription string|nil художественное описание сетового бонуса, или nil если у предмета нету сетового бонуса
---@field sourceDescription GlossaryId|nil идентификатор ресурса для описания источника получения, или nil если у предмета нету сетового бонуса

---@class ItemLibGetSetBonusRootResult
---@field name string название сетового бонуса
---@field description ValuedText описание сетового бонуса
---@field loreDescription string художественное описание сетового бонуса
---@field sourceDescription GlossaryId идентификатор ресурса для описания источника получения

---@class ItemLibGetStackInfoResult
---@field count integer количество предметов в пачке
---@field limit integer максимальное количество предметов в пачке

---@class ItemLibGetTemporaryInfoResult
---@field durationMs number сколько миллисикунд всего длится жизнь предмета в сумке
---@field remainingMs number через сколько миллисекунд предмет исчезнет. Может быть 0, если предмет не в сумке. а, например, у торговца
---@field expireItem ObjectId|nil идентификатор предмета, в который превратиться данный предмет по истечении срока

---@class ItemLibGetUsageInfoResult
---@field isUseItemAndTakeAction boolean является ли предметом, который можно использовать с проверкой итем предикатов и выполнением кастомных действий.
---@field isUseOnItemAndTakeAction boolean является ли предметом, который можно использовать на другом предмете.
---@field isUseOnMountAndTakeAction boolean является ли предметом, который можно использовать на средство передвижения(маунта).
---@field warningUseText string|nil текст с предупреждением об использовании
---@field useStack boolean можно ли использовать сразу на группе предметов, на стопке
---@field useAmount integer сколько предметов использовать за раз; рекомендуемое значение, по умолчанию -1 (использовать все)

---@class ItemLibGetUsageItemInfoResult
---@field consumeItems integer количество потребляемых предметов

---@class ItemLibGetUsageOnItemInfoResult
---@field consumeUsedItem integer|nil количество потребляемых используемых предметов
---@field consumeTargetItem integer|nil количество потребляемых предметов, на которых используется

---@class ItemLibGetUsageOnMountInfoResult
---@field consumeUsedItem integer|nil количество потребляемых используемых предметов
---@field sysName string|nil служебное название действия
---@field warningUseText string|nil предупреждение об использовании

---@class ItemLibGetUsagesItemInfoResult
---@field sysIndex integer индекс (zero-based) конкретного использования (Usage)
---@field consumeItems integer количество потребляемых предметов
---@field usageDesc string|nil локализованное описание использования
---@field usageImage TextureId|nil иконка использования
---@field givenAltCurrency CurrencyId|nil выдающаяся в этом использовании альтвалюта
---@field givenItem Game::Id|nil выдающийся в этом использовании предмет
---@field givenCount number|nil количество выдаваемых предметов или альтвалюты
---@field givenUnlock UnlockId|nil выдающийся в этом использовании анлок
---@field maxStack integer|nil если предмет может использоваться стеком, то максимальный размер стека (0 означает, что ограничения нет)

---@class ItemLibGetUsagesOnItemInfoResult
---@field sysIndex integer индекс (zero-based) конкретного использования (Usage)
---@field consumeUsedItem integer количество потребляемых используемых предметов
---@field consumeTargetItem integer количество потребляемых предметов, на которых используется
---@field usageDesc string|nil локализованное описание использования
---@field usageImage TextureId|nil иконка использования
---@field givenAltCurrency CurrencyId|nil выдающаяся в этом использовании альтвалюта
---@field givenItem Game::Id|nil выдающийся в этом использовании предмет
---@field givenCount number|nil количество выдаваемых предметов или альтвалюты
---@field givenUnlock UnlockId|nil выдающийся в этом использовании анлок

---@class ItemLibGetUsagesOnMountInfoResult
---@field sysIndex integer индекс (zero-based) конкретного использования (Usage)
---@field sysName string|nil служебное название действия
---@field warningUseText string|nil предупреждение об использовании
---@field consumeUsedItem integer количество потребляемых используемых предметов

---@class ItemLibGetZodiacSignInfoResult
---@field name string название знака зодиака
---@field description string описание знака зодиака
---@field image TextureId иконка
---@field sysName string системное имя (для внутреннего употребления, не для показа игроку)

---Если предикат не выполнился, то вернет причину невыполнения.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetBlockingPredicateCauseResult
function itemLib.GetBlockingPredicateCause(itemId) end

---Проверяет можно ли активировать предмет для применения на другом предмете. Исходный предмет должен обладать свойством IsUseItemAndTakeActions
---@param sourceId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function itemLib.CanActivateForUseItem(sourceId) end

---Проверяет можно ли активировать предмет для применения на другом предмете. Исходный предмет должен обладать свойством IsUseOnItemAndTakeActions
---@param sourceId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function itemLib.CanActivateForUseOnItem(sourceId) end

---Проверяет можно ли активировать предмет для применения на маунта. Исходный предмет должен обладать свойством IsUseOnMountAndTakeActions
---@param itemId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function itemLib.CanActivateForUseOnMount(itemId) end

---Можно ли выставить этот предмет на аукцион.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.CanCreateAuction(itemId) end

---Можно ли выкинуть предмет из инвентаря.
---@param itemId ObjectId идентификатор предмета-"образца"
---@return boolean
function itemLib.CanDrop(itemId) end

---Проверка можно ли передавать предмет по внутриигровой почте.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.CanSendByMail(itemId) end

---Проверка можно ли передавать предмет другому игроку.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.CanTrade(itemId) end

---Проверяет можно ли применить один предмет на другом предмете.
---@param sourceId ObjectId идентификатор предмета, который используют
---@param targerId ObjectId идентификатор предмета, на котором используют
---@return boolean|nil
function itemLib.CanUseOnItem(sourceId, targerId) end

---Проверяет можно ли применить предмет на маунта.
---@param itemId ObjectId идентификатор предмета, который используют
---@param mountId ObjectId идентификатор маунта, на котором используют предмет
---@return boolean|nil
function itemLib.CanUseOnMount(itemId, mountId) end

---Возвращает таблицу с информацией о бонусах, даваемых предметом к группам заклинаний.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetActionGroupsInfoResult
function itemLib.GetActionGroupsInfo(itemId) end

---Возвращает информацию об активации созданных предметов. См.  avatar.ActivateItem( itemId, instrumentId ) (устаревшее) или  avatar.ActivateItemAlternative( itemId )
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetActivationInfoResult
function itemLib.GetActivationInfo(itemId) end

---Получить список описаний активаторов, которыми в принципе можно активировать данный предмет.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetActivatorsResult
function itemLib.GetActivators(itemId) end

---Получить список альтернативных валют, которыми можно заплатить за активацию данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return table или nil
function itemLib.GetActivatorsAlternative(itemId) end

---Информация о привязке предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetAlternativePriceInfoResult
function itemLib.GetAlternativePriceInfo(itemId) end

---Информация о привязке предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetBindingInfoResult
function itemLib.GetBindingInfo(itemId) end

---Возвращает таблицу с информацией о бонусах, даваемых предметом.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetBonusResult
function itemLib.GetBonus(itemId) end

---Информация о сундучке, если предмет таковым является.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetBoxInfoResult
function itemLib.GetBoxInfo(itemId) end

---Основные бюджеты статов предмета подверженных рефорджу.
---@param itemId ObjectId идентификатор предмета
---@return number|nil[]
function itemLib.GetBudgets(itemId) end

---Если предмет является бандлом, то возвращает список предметов, входящих в бандл. Внимание! При появлении бандла на клиенте информация о его составе приходит не сразу, а через некоторое время. После изменения приходит  EVENT_GAME_ITEM_CHANGED и соответствующие события об изменениях в слоте контейнера, если предмет находится в контейнере (сумка, экипировка и т.п.).
---@param itemId ObjectId идентификатор предмета
---@return nil|ObjectId[]
function itemLib.GetBundle(itemId) end

---Возвращает id категории, к которой относится предмет.
---@param itemId ObjectId идентификатор предмета
---@return ItemCategoryId или nil
function itemLib.GetCategory(itemId) end

---Информация о категории, к которой относится предмет.
---@param itemCategoryId ItemCategoryId идентификатор категории предмета
---@return ItemLibGetCategoryInfoResult
function itemLib.GetCategoryInfo(itemCategoryId) end

---Возвращает список идентификаторов (ItemCategoryId) терминальных категорий предметов для корневой категории.
---@param itemCategoryId ItemCategoryId идентификатор корневой категории
---@return ItemCategoryId[]
function itemLib.GetChildCategories(itemCategoryId) end

---Получить идентификатор класса предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemClassId или nil
function itemLib.GetClass(itemId) end

---Получить информацию о классе предмета по идентификатору класса предмета.
---@param itemClassId ItemClassId идентификатор класса предмета
---@return ItemLibGetClassInfoResult
function itemLib.GetClassInfo(itemClassId) end

---Возвращает список слотов в которые можно одеть предмет. Если предмет одеть нельзя - список пуст.
---@param itemId ObjectId идентификатор предмета
---@return table
function itemLib.GetCompatibleSlots(itemId) end

---Информация о количестве "зарядов" в предмете.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetCountInfoResult
function itemLib.GetCountInfo(itemId) end

---Возвращает информацию о предмете-купоне.
---@param itemId ItemId идентификатор ресурса предмета
---@return ItemLibGetCouponInfoResult
function itemLib.GetCouponInfo(itemId) end

---Возвращает информацию о ремесленном инструменте, если это инструмент. См.  "ENUM_ToolProperty_..."
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetCraftToolInfoResult
function itemLib.GetCraftToolInfo(itemId) end

---Возвращает номер сезона в котором предмету будет разрушен.
---@param itemId ObjectId идентификатор предмета
---@return nil|integer
function itemLib.GetDestroyValue(itemId) end

---Возвращает слот к которому относится данный предмет. Список доступных слотов:  DRESS_SLOT_...
---@param objectId integer идентификатор предмета
---@return int
function itemLib.GetDressSlot(objectId) end

---Получить сообщение, которое необходимо показать перед выбрасыванием предмета предмета.
---@param itemId ObjectId идентификатор предмета
---@return dropDescription: WString|nil
function itemLib.GetDropInfo(itemId) end

---Проверяет можно ли обменять предмет на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetExchangeInfoResult
function itemLib.GetExchangeInfo(itemId) end

---Возвращает список дополнительных строк описания предмета. Обычно он содержат начальную строку и список названий предмеов, которые каким-либо образом добываются из данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return ValuedText[]
function itemLib.GetExtraDescs(itemId) end

---Возвращает список рейтингов, соответствующих дополнительным строкам описания предмета из  itemLib.GetExtraDescs( itemId ).
---@param itemId ObjectId идентификатор предмета
---@param name string имя переменной, откуда взят соответствующий рейтинг (не для показа игроку, может быть использовано для подстановки в ValuedText как имя поля)
---@param numberValue number численное значение рейтинга
---@param textValue ValuedText|nil имя рейтинга, локализованный текст, может быть показан игроку
function itemLib.GetExtraDescsRatings(itemId, name, numberValue, textValue) end

---Возвращает значение рейтинга предмета.
---@param itemId ObjectId идентификатор предмета
---@return number|nil
function itemLib.GetGearScore(itemId) end

---Информация о мобе (существе), который даёт этот предмет при использовании из бестиария при растановке на личном острове, если есть. См.  ENUM_CreatureRace_...,  ENUM_BeastType_...
---@param itemId ObjectId id предмета
---@return ItemLibGetIncludedMobResult
function itemLib.GetIncludedMob(itemId) end

---Скин маунта, который даёт этот предмет при использовании (если есть).
---@param itemId ObjectId id предмета
---@return ObjectId|nil
function itemLib.GetIncludedMountSkin(itemId) end

---Общая информация о предмете.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetItemInfoResult
function itemLib.GetItemInfo(itemId) end

---Получить уровень предмета.
---@param itemId ObjectId идентификатор предмета
---@return В случае ошибки не возвращает ничего
function itemLib.GetLevel(itemId) end

---Возвращает таблицу с информацией о мета-свойствах предмета. Мета-предмет - это предмет у которого существует 4 градации качества. Мета-предмет можно улучшать из одного качества в другое. При этом на каждом типе качества характеристики предмета соответствуют обычному предмету данного качества.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetMetaInfoResult
function itemLib.GetMetaInfo(itemId) end

---Возвращает название предмете.
---@param itemId ObjectId идентификатор предмета
---@return string
function itemLib.GetName(itemId) end

---Суммарное количество "зарядов" всех подобных предметов, имеющихся у игрока (в сумке и эквипменте). Предметы идентифицируются по ресурсу.
---@param itemId ObjectId идентификатор предмета-"образца"
---@return integer
function itemLib.GetOverallCount(itemId) end

---Суммарное количество  всех подобных предметов у игрока в сумке и в инвентори (с учётом количеств в пачках). Предметы идентифицируются по ресурсу.
---@param itemId ObjectId идентификатор предмета-"образца"
---@return integer
function itemLib.GetOverallStackCount(itemId) end

---Возвращает информацию об ограничении количества предметов во владении, т.е. сколько максимум таких предметов единовременно может находится "на руках" у персонажа.
---@param itemId ObjectId|ItemId идентификатор предмета
---@return integer
function itemLib.GetOwnershipLimit(itemId) end

---Цены предмета при покупке/продаже в торговца.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetPriceInfoResult
function itemLib.GetPriceInfo(itemId) end

---Получить качество предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetQualityResult
function itemLib.GetQuality(itemId) end

---Возвращает список отдельных целей заданий, для которых нужен этот предмет.
---@param itemId ObjectId идентификатор предмета
---@return nil|ObjectId[]
function itemLib.GetRelatedQuestObjectives(itemId) end

---Возвращает ItemId (ResourceId) ресурса предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemId
function itemLib.GetResourceId(itemId) end

---Возвращает список идентификаторов (ItemCategoryId) корневых категорий предметов.
---@return ItemCategoryId[]
function itemLib.GetRootCategories() end

---Информация о руне, если предмет является руной.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetRuneInfoResult
function itemLib.GetRuneInfo(itemId) end

---Информация  об инструменте, если предмет таковым является.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetRuneInstrumentInfoResult
function itemLib.GetRuneInstrumentInfo(itemId) end

---Возвращает информацию о сетовом бонусе предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetSetBonusInfoResult
function itemLib.GetSetBonusInfo(itemId) end

---Возвращает информацию о всех доступных в игре сетовых бонусах.
---@return ItemLibGetSetBonusRootResult
function itemLib.GetSetBonusRoot() end

---Происхождение предмета.
---@param itemId ObjectId идентификатор предмета
---@return string (enum "ENUM_ItemSource_...") или nil
function itemLib.GetSource(itemId) end

---Id спелла, прикреплённого к предмету.
---@param itemId ObjectId идентификатор предмета
---@return SpellId или nil
function itemLib.GetSpell(itemId) end

---Получить информацию о стеке предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetStackInfoResult
function itemLib.GetStackInfo(itemId) end

---Возвращает длительность специального суточного кулдауна на использование предмета. Такой кулдаун назначается для некоторых предметов при их использовании и длится до начала какого-либо дня.
---@param itemId ObjectId идентификатор предмета
---@return nil|integer
function itemLib.GetStateCooldownMs(itemId) end

---Информация о временном предмете, если предмет таковым является.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetTemporaryInfoResult
function itemLib.GetTemporaryInfo(itemId) end

---Возвращает индексированный с 0 список идентификаторов предметов, которые может улучшить этот улучшитель. В случае ошибки возвращает nil.
---@param itemId ObjectId идентификатор предмета
---@return ObjectId|nil[]
function itemLib.GetUniversalMetaEnchancerItems(itemId) end

---Информация связанная с использованием данного предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetUsageInfoResult
function itemLib.GetUsageInfo(itemId) end

---Информация об использовании предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetUsageItemInfoResult
function itemLib.GetUsageItemInfo(itemId) end

---Информация об использовании предмета на предмет.
---@param itemId ObjectId идентификатор предмета
---@param tergetItemId ObjectId идентификатор цели
---@return ItemLibGetUsageOnItemInfoResult
function itemLib.GetUsageOnItemInfo(itemId, tergetItemId) end

---Информация об использовании предмета на маунта.
---@param itemId ObjectId идентификатор предмета
---@param mountId ObjectId идентификатор маунта
---@return ItemLibGetUsageOnMountInfoResult
function itemLib.GetUsageOnMountInfo(itemId, mountId) end

---Информация об использовании предмета.
---@param itemId ObjectId идентификатор предмета
---@return ItemLibGetUsagesItemInfoResult
function itemLib.GetUsagesItemInfo(itemId) end

---Информация об использовании предмета на предмет.
---@param itemId ObjectId идентификатор предмета
---@param targetItemId ObjectId идентификатор цели
---@return ItemLibGetUsagesOnItemInfoResult
function itemLib.GetUsagesOnItemInfo(itemId, targetItemId) end

---Информация об использовании предмета на маунта.
---@param itemId ObjectId идентификатор предмета
---@param mountId ObjectId идентификатор маунта
---@return ItemLibGetUsagesOnMountInfoResult
function itemLib.GetUsagesOnMountInfo(itemId, mountId) end

---Возвращает алиас курсора для использования на другой предмет с выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return string
function itemLib.GetUseOnItemCursor(itemId) end

---Возвращает алиас курсора для использования на маунта с выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return string
function itemLib.GetUseOnMountCursor(itemId) end

---Возвращает новый экземпляр ValuedObject по Id предмета.
function itemLib.GetValuedObject() end

---Информация о знаке зодиака руны.
---@param zodiacSignId ZodiacSignId идентификатор знака зодиака
---@return ItemLibGetZodiacSignInfoResult
function itemLib.GetZodiacSignInfo(zodiacSignId) end

---Возвращает true если в предмете есть компоненты, изменяющиеся в зависимости от состояния гильдии игрока (например, гильдейские наплечники).
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.HasGuildComponent(itemId) end

---Проверяет, предназначен ли данный предмет для пополнения бестиария.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsBeast(itemId) end

---Признак того, что предмет можно конвертировать в подобные предметы.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsConvertible(itemId) end

---Был ли предмет скопирован, если да - его нельзя продать на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsCopied(itemId) end

---Показывает проклят ли предмет.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsCursed(itemId) end

---Проверка предназначен ли предмет для дерева талантов души.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsGem(itemId) end

---Является ли предмет предметом для создания гильдии.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsGuildCreator(itemId) end

---Определяет нужно ли скрывать данный предмет в гардеробе до тех пор пока он туда не добавлен.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsHideLifestyleWhileNotEquipped(itemId) end

---Проверяет, есть ли предмет с таким itemId.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsItem(itemId) end

---Является ли предмет инструментом для конвертации метаитема-улучшителя в обычный итем.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsMetaEnhancerConvertor(itemId) end

---Можно ли многократно использовать предмет (не сбрасывается ли состояние юза после первого использования). Применяется вместе с itemLib.IsUseItemAndTakeActions( itemId )
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsMultipleUse(itemId) end

---Для используемых предметов признак того, что их надо использовать на точку местности.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsPointed(itemId) end

---Проверка является ли предмет пробником.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsProbe(itemId) end

---Может ли предмет дать квесты. Действительно только для имеющихся у игрока предметов.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsQuestOperator(itemId) end

---Является ли предмет квестовым (нужен для завершения или использования в квесте). Действительно только для имеющихся у игрока предметов.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsQuestRelated(itemId) end

---Является ли предмет сигнальным фейрверком.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsSOSMessageSender(itemId) end

---Предмет автоматически распаковывается при попадании в сумку.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUnpackOnPickup(itemId) end

---Возможно ли использование предмета. Значение поля недействительно для предметов во время лута (всегда false).
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUsable(itemId) end

---Является ли предметом, который можно использовать с проверкой итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUseItemAndTakeActions(itemId) end

---Является ли предметом, который можно использовать на другой предмет с проверкой на том итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@param count number количество предметов используемых из стека (по умолчанию - 1 )
---@return boolean
function itemLib.IsUseOnItemAndTakeActions(itemId, count) end

---Является ли предметом, который можно использовать на маунта с проверкой на том итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUseOnMountAndTakeActions(itemId) end

---Показывать ли пользовательский выбор вариантов действий. Применяется вместе с itemLib.IsUseItemAndTakeActions( itemId )
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsUserChoice(itemId) end

---Является ли предмет оружием.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function itemLib.IsWeapon(itemId) end
