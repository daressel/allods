---@meta

--- CategoryAvatar
--- События и функции Lua API, относящиеся к персонажу игрока (аватару).

--- Результат работы с именноваными каналами. Текстовый енум, проверяется на билдере. Префикс для проверки "ENUM_AccessionResult".
ENUM_AccessionResult_NoChat = "ENUM_AccessionResult_NoChat"
ENUM_AccessionResult_Success = "ENUM_AccessionResult_Success"
ENUM_AccessionResult_WrongFaction = "ENUM_AccessionResult_WrongFaction"
ENUM_AccessionResult_AlreadyIn = "ENUM_AccessionResult_AlreadyIn"

--- Причина по которой не удалось отослать сообщение в чат.
ENUM_ChatFailedType_Mute = "ENUM_ChatFailedType_Mute"
ENUM_ChatFailedType_InternalError = "ENUM_ChatFailedType_InternalError"
ENUM_ChatFailedType_Silence = "ENUM_ChatFailedType_Silence"
ENUM_ChatFailedType_NoPoints = "ENUM_ChatFailedType_NoPoints"
ENUM_ChatFailedType_EnemyFaction = "ENUM_ChatFailedType_EnemyFaction"
ENUM_ChatFailedType_Ignored = "ENUM_ChatFailedType_Ignored"

--- Текстовый енум. Проверяется на билдере. Префикс для проверки: "ENUM_DisassemblingResult".
ENUM_DisassemblingFailCause_NoFail = "ENUM_DisassemblingFailCause_NoFail"
ENUM_DisassemblingFailCause_ItemType = "ENUM_DisassemblingFailCause_ItemType"
ENUM_DisassemblingFailCause_ItemLevel = "ENUM_DisassemblingFailCause_ItemLevel"
ENUM_DisassemblingFailCause_System = "ENUM_DisassemblingFailCause_System"
ENUM_DisassemblingFailCause_NotDisassembler = "ENUM_DisassemblingFailCause_NotDisassembler"
ENUM_DisassemblingFailCause_NoSkill = "ENUM_DisassemblingFailCause_NoSkill"
ENUM_DisassemblingOperationResult_SlotNumberOutOfBounds = "ENUM_DisassemblingOperationResult_SlotNumberOutOfBounds"
ENUM_DisassemblingOperationResult_SlotIsEmpty = "ENUM_DisassemblingOperationResult_SlotIsEmpty"
ENUM_DisassemblingOperationResult_ItemIsNotDisassembler = "ENUM_DisassemblingOperationResult_ItemIsNotDisassembler"
ENUM_DisassemblingOperationResult_CannotDisassembleThis = "ENUM_DisassemblingOperationResult_CannotDisassembleThis"
ENUM_DisassemblingOperationResult_AvatarBusy = "ENUM_DisassemblingOperationResult_AvatarBusy"
ENUM_DisassemblingOperationResult_Success = "ENUM_DisassemblingOperationResult_Success"

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

--- Текстовый енум. Проверяется на билдере. Префикс для проверки: "ENUM_ExchangeResult".
ENUM_MsgStartExchangeResultResult_SUCCESS = "ENUM_MsgStartExchangeResultResult_SUCCESS"
ENUM_MsgStartExchangeResultResult_ERROR = "ENUM_MsgStartExchangeResultResult_ERROR"
ENUM_MsgStartExchangeResultResult_INVITEDAVATARISBUSY = "ENUM_MsgStartExchangeResultResult_INVITEDAVATARISBUSY"
ENUM_MsgStartExchangeResultResult_INVITERAVATARISBUSY = "ENUM_MsgStartExchangeResultResult_INVITERAVATARISBUSY"
ENUM_MsgStartExchangeResultResult_INVITEDAVATARNOTFOUND = "ENUM_MsgStartExchangeResultResult_INVITEDAVATARNOTFOUND"
ENUM_MsgStartExchangeResultResult_TOOFAR = "ENUM_MsgStartExchangeResultResult_TOOFAR"
ENUM_MsgStartExchangeResultResult_INVITEDAVATARISDEAD = "ENUM_MsgStartExchangeResultResult_INVITEDAVATARISDEAD"
ENUM_MsgStartExchangeResultResult_INVITERAVATARISDEAD = "ENUM_MsgStartExchangeResultResult_INVITERAVATARISDEAD"
ENUM_MsgStartExchangeResultResult_YOUAREINVISIBLE = "ENUM_MsgStartExchangeResultResult_YOUAREINVISIBLE"
ENUM_MsgExchangeErrorErrorType_MONEYNOTENOUGH = "ENUM_MsgExchangeErrorErrorType_MONEYNOTENOUGH"
ENUM_MsgExchangeErrorErrorType_PRIMARYCONFIRMATIONREQUIRED = "ENUM_MsgExchangeErrorErrorType_PRIMARYCONFIRMATIONREQUIRED"
ENUM_MsgExchangeErrorErrorType_ITEMNOTFOUND = "ENUM_MsgExchangeErrorErrorType_ITEMNOTFOUND"
ENUM_MsgExchangeErrorErrorType_SLOTISUSED = "ENUM_MsgExchangeErrorErrorType_SLOTISUSED"
ENUM_MsgExchangeErrorErrorType_ITEMISUSED = "ENUM_MsgExchangeErrorErrorType_ITEMISUSED"
ENUM_MsgExchangeErrorErrorType_ITEMISBOUND = "ENUM_MsgExchangeErrorErrorType_ITEMISBOUND"

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

--- Текстовый enum. Префикс для автоматической проверки - "ENUM_ItemSource".
ENUM_ItemSource_Quest = "ENUM_ItemSource_Quest"
ENUM_ItemSource_FixedDrop = "ENUM_ItemSource_FixedDrop"
ENUM_ItemSource_WorldDrop = "ENUM_ItemSource_WorldDrop"
ENUM_ItemSource_Crafted = "ENUM_ItemSource_Crafted"
ENUM_ItemSource_Conjured = "ENUM_ItemSource_Conjured"
ENUM_ItemSource_Vendor = "ENUM_ItemSource_Vendor"
ENUM_ItemSource_QuestItem = "ENUM_ItemSource_QuestItem"

--- Типы схем дележа лута:
---@type integer
LOOT_SCHEME_TYPE_FREE_FOR_ALL = nil
---@type integer
LOOT_SCHEME_TYPE_MASTER = nil
---@type integer
LOOT_SCHEME_TYPE_GROUP = nil

--- Типы урона (действия заклинаний или атаки).
ENUM_SubElement_PHYSICAL = "ENUM_SubElement_PHYSICAL"
ENUM_SubElement_FIRE = "ENUM_SubElement_FIRE"
ENUM_SubElement_COLD = "ENUM_SubElement_COLD"
ENUM_SubElement_LIGHTNING = "ENUM_SubElement_LIGHTNING"
ENUM_SubElement_HOLY = "ENUM_SubElement_HOLY"
ENUM_SubElement_SHADOW = "ENUM_SubElement_SHADOW"
ENUM_SubElement_ASTRAL = "ENUM_SubElement_ASTRAL"
ENUM_SubElement_POISON = "ENUM_SubElement_POISON"
ENUM_SubElement_DISEASE = "ENUM_SubElement_DISEASE"
ENUM_SubElement_ACID = "ENUM_SubElement_ACID"

---@class avatarLib
avatar = {}

--- Возвращает информацию о доступных в данный момент таргетных продажах.
---@return table|nil
function avatar.GetTargetSales() end

--- Отклоняет предложение таргетной продажи.
---@param saleId ObjectId
function avatar.RejectTargetSale(saleId) end

--- Попытка получить задание у NPC, который является текущей целью аватара. *Нельзя получить задание у NPC, не являющегося текущей целью. Вызывать можно только после  FunctionAvatarRequestInteractions*
---@param questId QuestId
function avatar.AcceptQuest(questId) end

--- Согласие принять разделяемое задание от другого игрока.
---@param shareId ObjectId уникальный идентификатор предложения
function avatar.AcceptShareQuest(shareId) end

--- Активировать предмет.
---@param itemId ObjectId идентификатор предмета
---@param instrumentId Object идентификатор инструмента-активатора
function avatar.ActivateItem(itemId, instrumentId) end

--- Активировать предмет.
---@param itemId ObjectId идентификатор предмета
function avatar.ActivateItemAlternative(itemId) end

--- Выучить помеченные таланты и вехи.
function avatar.ApplyStoredTalents() end

--- Попытка переместить несколько предметов, лежащих в контейнере, в начало контейнера в заданном порядке.
---@param moves массив индексом является номер слота В который надо поместить итем, а значением - номер слота (считая с начала кармана) ИЗ которого надо переместить итем.
---@param compact boolean производить ли компактинг стекающихся итемов и пустых слотов
---@param container number в каком контейнере переставляем предметы. Допустимые контейнеры: сумка, банковская ячейка. В банковской ячейке нельзя переставлять предметы, если она не открыта.
---@param pocket integer|nil карман. Базовый карман имеет индекс -1, остальные считаются с нуля. Значение по умолчанию -1.
function avatar.ArrangeContainerItems(moves, compact, container, pocket) end

--- Привязывает запуск эмоции главного игрока к слоту экшен панели.
---@param emoteId ObjectId Id эмоции, привязываемой к слоту
---@param index integer индекс слота от 0 до max
function avatar.BindEmoteToActionPanel(emoteId, index) end

--- Привязывает предмет к слоту экшен панели.
---@param itemId ObjectId Id предмета, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function avatar.BindItemToActionPanel(itemId, index) end

--- Привязывает вызов маунта-метаморфа из конюшни главного игрока к слоту экшен панели.
---@param index integer индекс слота от 0 до max
function avatar.BindMountMetamorphToActionPanel(index) end

--- Привязывает вызов маунта с определенным скином из конюшни главного игрока к слоту экшен панели.
---@param skinId ObjectId Id скина маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function avatar.BindMountSkinToActionPanel(skinId, index) end

--- Привязывает вызов маунта из конюшни главного игрока к слоту экшен панели.
---@param mountId ObjectId Id маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function avatar.BindMountToActionPanel(mountId, index) end

--- Привязывает умение из книги умений к слоту экшен панели.
---@param spellId SpellId Id умения, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function avatar.BindSpellToActionPanel(spellId, index) end

--- Попытаться купить вещь у NPC-торговца.
---@param objectId ObjectId Id предмета для покупки
---@param quantity number( количество предметов для покупки
function avatar.Buy(objectId, quantity) end

--- Попытаться купить вещь у NPC-торговца и поместить в определённый слот инвентаря.
---@param objectId ObjectId Id предмета для покупки
---@param quantity number( количество предметов для покупки
---@param slot number( номер слота инвентаря
function avatar.Buy(objectId, quantity, slot) end

--- Высчитывает и возвращает текущий рейтинг экипировки аватара
---@return number
function avatar.CalcCurrentGearScore() end

--- Попытаться преждевременно вызвать искру главного игрока, находящегося на кладбище. Вызов искры оплачивается мирро. Если требуемого количества не обнаружится, то прийдёт EVENT_CALL_SPARK_FAILED.
function avatar.CallSpark() end

--- Показывает, можно ли активировать данный предмет данным активатором.
---@param itemId ObjectId идентификатор предмета
---@param instrumentId Object идентификатор инструмента-активатора
function avatar.CanActivateItem(itemId, instrumentId) end

--- Показывает, можно ли активировать данный предмет, потратив данную альтернативную валюту. Не проверяет нехватку валюты - это бессмысленно, поскольку при нехватке для активации может быть одновременно использовано несколько альтернативных валют из списка  itemLib.GetActivatorsAlternative( itemId ).
---@param itemId ObjectId идентификатор предмета
---@param currrencyId CurrencyId идентификатор альтернативной валюты
function avatar.CanActivateItemAlternative(itemId, currrencyId) end

--- Отменить текущее алхимическое действо. После этого прийдёт EVENT_ALCHEMY_CANCELED.
function avatar.CancelAlchemy() end

--- Отсылает на сервер отказ от продолжения процесса смены класса (работает на стадии выбора замен для предметов, см.  avatar.GetClassChangerInfo()).
function avatar.CancelClassChanger() end

--- Есть ли возможность разломать указанный предмет указанным инструментом.
---@param instrumentId ObjectId идентификатор инструмента для дизассемблинга в контейнере
---@param itemId integer идентификатор разламываемого предмета в контейнере
---@return boolean
function avatar.CanDisassembleItem(instrumentId, itemId) end

--- Можно ли проапдейтить (или выучить) талант из базовой таблицы талантов.
---@param layer integer номер строки
---@param line integer номер столбца
---@return boolean
function avatar.CanUpdateBaseTalent(layer, line) end

--- Можно ли проапдейтить (или выучить) талант из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return boolean
function avatar.CanUpdateFieldTalent(field, row, column) end

--- Привязывает бонус от покровителя к заданной характеристике (должна присутствовать в списке характеристик, к которым в данный момент можно привязать бонус, см  avatar.GetStatsBonusesPart(), поле fairyBonus.allowedStats).
---@param stat integer индекс характеристики из таблицы fairyBonus.allowedStats
function avatar.ChangeFairyBonus(stat) end

--- Проверка, можно ли использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function avatar.CheckCanUseItem(itemId, isSendEvent) end

--- Проверка, можно ли использовать предмет в контейнере игрока на точку на ландшафте.
---@param itemId ObjectId идентификатор предмета
---@param position table
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function avatar.CheckCanUseItemOnPoint(itemId, position, isSendEvent) end

--- Сбрасывает эмоцию у главного игрока.
function avatar.ClearMood() end

--- Сбросить помеченные таланты и вехи.
function avatar.ClearStoredTalents() end

--- Закрывает сумку с лутом.
function avatar.CloseLootBag() end

--- Конвертировать метаитем-улучшитель в обычный предмет применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-конвертором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
function avatar.ConvertMetaEnhancer(itemId, instrumentId) end

--- Попытка завершить использование устройства.
function avatar.DeactivateUsableDevice() end

--- Отказ принять разделяемое задание от другого игрока.
---@param shareId ObjectId уникальный идентификатор предложения
function avatar.DeclineShareQuest(shareId) end

--- Попытка выкинуть задание из журнала заданий аватара.
---@param questId QuestId
function avatar.DiscardQuest(questId) end

--- Копировать метаитем-улучшитель применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-дубликатором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
function avatar.DuplicateMetaEnhancerItem(itemId, instrumentId) end

--- Включить/выключить бескорыстную помощь.
---@param enable boolean для включения: true, для выключения: false
function avatar.EnableFreeKeys(enable) end

--- Закончить инспектирование цели главного игрока.
function avatar.EndInspect() end

--- Экипировать предмет с указанным идентификатором. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ).
---@param itemId ObjectId идентификатор предмета
function avatar.EquipItemById(itemId) end

--- Экипировать предмет с указанным идентификатором в указанный слот в экипировке. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ).
---@param itemId ObjectId идентификатор предмета
---@param equipSlot integer индекс слота в экипировке.
function avatar.EquipItemByIdToSlot(itemId, equipSlot) end

--- Команда на оживление аватара из чистилища в мир.
function avatar.FinallyRespawn() end

--- Посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест из линейки квестов этапа тайны мира.
---@param secretId QuestId id основного квеста тайны мира
---@param componentIndex num порядковый номер интересующей компоненты (берется из avatar.GetSecretComponents( secretId ))
---@return QuestId|nil
function avatar.FindCurrentSecretComponentQuest(secretId, componentIndex) end

--- Если список текущих заданий пуст, посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест.
---@param mode integer где искать следующий квест (зона, в которой находится аватар или весь игровой мир)
function avatar.FindNextQuest(mode) end

--- Посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест из линейки квестов этапа тайны мира.
---@param secretId QuestId id основного квеста тайны мира
---@param componentIndex num порядковый номер интересующей компоненты (берется из avatar.GetSecretComponents( secretId ))
function avatar.FindNextSecretComponentQuest(secretId, componentIndex) end

--- Возвращает список Id пассивных умений. Список активных умений и заклинаний можно получить, используя avatar.GetSpellBook().
---@return table
function avatar.GetAbilities() end

--- Возвращает информацию об абилке по идентификатору её ресурса.
---@param id AbilityId Id ресурса умения
---@return nil
function avatar.GetAbilityInfo(id) end

--- Возвращает подменяющее заклинание абилке по идентификатору её ресурса.
---@param id AbilityId идентификатор ресурса умения
---@return SpellId|nil
function avatar.GetAbilityReplacementSpell(id) end

--- Возвращает подменяющее заклинание абилке по идентификатору её ресурса.
---@param id AbilityId идентификатор ресурса умения
---@return SpellId[]|nil
function avatar.GetAbilityReplacementSpells(id) end

--- Возвращает количество очков заработанных в событии.
---@param ruleId RuleId(ResourceId) идентификатор события
---@return number
function avatar.GetAchievementValue(ruleId) end

--- Возвращает заклинания из указанной группы, принадлежащие указанному классу.
---@param actionGroupId ActionGroupId идентификатор ресурса группы заклинаний
---@param characterClassId CharacterClassId идентификатор ресурса класса игрока
---@return table
function avatar.GetActionGroupSpells(actionGroupId, characterClassId) end

--- Выдаёт информацию о бонусе к статам аватара при использовании заклинаний из группы actionGroupId.
---@param actionGroupId ActionGroupId Id группы заклинаний
---@return table|nil
function avatar.GetActionGroupStatBonus(actionGroupId) end

--- Вернуть информацию о наличии действия в слоте экшен-панели и его параметры.
---@param index integer
---@return nil
function avatar.GetActionInfo(index) end

--- Получить номер активной специализации.
---@return number
function avatar.GetActiveBuild() end

--- Возвращает идентификатор крафтового скила, которые сейчас активен, то есть сейчас совершается крафт. если никакого крафта сейчас не присходит, то возвращается nil.
---@return SkillId|nil
function avatar.GetActiveCraftingSkill() end

--- Возвращает id используемого устройства. Например, корабельные устройства (управление, пушки и т.д.).
---@return ObjectId
function avatar.GetActiveUsableDevice() end

--- Возвращает информацию о действии используемого устройства. Например корабельного (управление, пушки и т.д.).
---@param index integer индекс действия [0..(pDevice-&gt;GetActionCount() - 1)]
---@return table|nil
function avatar.GetActiveUsableDeviceActionInfo(index) end

--- Возвращает базовую информацию о барабане умения алхимии. Если барабан не используется (алхимия не начата, или слот не доступен в имеющемся алхимическом инструменте), то вернёт nil.
---@param drum number( номер барабана (слота) текущего алхимического действа
---@return nil
function avatar.GetAlchemyDrumInfo(drum) end

--- Возвращает базовую информацию об умении алхимии главного игрока.
---@return nil
function avatar.GetAlchemyInfo() end

--- Возвращает информацию о рецепте, по которому создастся предмет в выбранной строке после проведения алхимической реакции (учитываются текущие корректировки). Если рецепт не найден, то возвращается nil, иначе возвращается идентификатор ресурса рецепта и флаг, бонусное ли расположение компонент для этого рецепта. Это расположение компонент в инструменте такое же как в рецепте. В таком случае количество произведенного продукта увеличивается на некую величину (см. avatar.GetAlchemyInfo()).
---@param line number( строка в которой необходимо узнать результат
---@return nil
function avatar.GetAlchemyMatchedRecipe(line) end

--- Попытка получить у предмета в инвентаре список заданий, которые он может выдать персонажу.
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
---@return table
function avatar.GetAvailableItemQuests(itemId) end

--- Попытка получить у собеседника список заданий, которые он может выдать персонажу.
---@return table
function avatar.GetAvailableQuests() end

--- Возвращает начальную длительность барьеров (паладина) в миллисекундах.
---@return number
function avatar.GetBarriersDelay() end

--- Возвращает информацию о барьерах (паладина).
---@return table
function avatar.GetBarriersInfo() end

--- Получить информацию о таланте из базовой таблицы талантов.
---@param layer integer номер строки
---@param line integer номер столбца
---@return table
function avatar.GetBaseTalentInfo(layer, line) end

--- Получить размер базовой таблицы талантов.
---@return integer
function avatar.GetBaseTalentTableSize() end

--- Возвращает Id транспортного средства, которое привязано к главному игроку (игрок вызвал его в ангаре).
function avatar.GetBindedTransport() end

--- Получить количество специализаций аватара. Может быть больше числа доступных специализаций в случае если их число когда-либо было временно увеличено а затем вновь уменьшилось. Сохраненные данные специализации будут доступны, но активировать ее будет нельзя.
---@return number
function avatar.GetBuildsCount() end

--- Получить количество доступных специализаций аватара.
---@return number
function avatar.GetBuildsUnlockedCount() end

--- Получить id спелла, переключающего специализацию (билд) аватара. Используется для получения информации об условиях переключения.
---@return QuestId
function avatar.GetBuildSwitchSpell() end

--- Возвращает информацию о валютах главного игрока, содержащихся в одной категории валют.
---@param categoryId CurrencyCategoryId категория валюты
---@return table
function avatar.GetCategoryCurrencies(categoryId) end

--- Возвращает информацию о каналах в текущей зоне.
---@return integer
function avatar.GetChannelsInfo() end

--- Возвращает класс аватара
---@return string
function avatar.GetClass() end

--- Возвращает информациюю связанную со сменой класса
---@return table
function avatar.GetClassChangeData() end

--- Рассчитывает сумму бонусов, даваемых предметами, выбранными для замены экипировки на соответствующей стадии процесса смены класса (набор замен для предметов). Входные данные аналогичны  avatar.SetClassChangerInfo( changeList ) (однако набор замен не обязательно должен быть полным), выходные данные аналогичны itemLib.GetBonus( itemId ) (с той только разницей, что тут бонусы не от одного предмета, а от всех, указанных во входных параметрах). Состояние процесса смены класса при этом остаётся неизменным.
---@param changeList table аналогично avatar.SetClassChangerInfo( changeList ), список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен
---@return any
function avatar.GetClassChangerBonusStats(changeList) end

--- Возвращает информацию, необходимую для смены класса аватара, например варианты для замены вещей на подходящие новому классу. Имеет смысл, только если аватар находится в соответствующем состоянии (см.  EVENT_CHARACTER_CLASS_CHANGER_CHANGED), когда класс для замены уже выбран (для выбора используется  ClassSelectQuestion) и требуется уточнить детали замены.
---@return table|nil
function avatar.GetClassChangerInfo() end

--- Рассчитывает сумму бонусов, даваемых дистанционным оружием, выбранным для замены экипировки на соответствующей стадии процесса смены класса (набор замен для предметов). Входные данные аналогичны  avatar.SetClassChangerInfo( changeList ) (однако набор замен не обязательно должен быть полным), выходные данные аналогичны itemLib.GetBonus( itemId ) (с той только разницей, что тут бонусы только для предмета из слота DRESS_SLOT_RANGED). Состояние процесса смены класса при этом остаётся неизменным.
---@param changeList table аналогично avatar.SetClassChangerInfo( changeList ), список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен
---@return any
function avatar.GetClassChangerRangeBonusStats(changeList) end

--- Возвращает  идентификатор класса главного игрока.
---@return CharacterClassId
function avatar.GetClassId() end

--- Получить информацию о поле талантов.
---@param field integer номер поля (от 1)
---@return table
function avatar.GetCommonFieldTalentInfo(field) end

--- Возвращает описание крафтового компонента по идентификатору ресурса.
---@param id ComponentPropertyId Id ресурса компонента
---@return nil
function avatar.GetComponentInfo(id) end

--- Вернуть информацию о кулдауне контекстного действия.
---@param id ObjectId идентификатор контекстного действия
---@return table|nil
function avatar.GetContextActionCooldown(id) end

--- Вернуть информацию о контекстном действии. Контекстное действие может находится в списке контекстных действий аватара, но в то же время быть недоступным (например цель не в зоне действия или не в той полусфере игрока). Поле enabled принимает значение true, если действие доступно и false, если не доступно. В случае изменения поля, на клиент приходит  EVENT_CONTEXT_ACTIONS_CHANGED.
---@param id ObjectId идентификатор контекстного действия
---@return nil
function avatar.GetContextActionInfo(id) end

--- Вернуть список идентификаторов контекстных действий. В списке перечислены идентификаторы созданных экземпляров контекстных действий.
---@param withMount boolean|nil true добавлять контекстные действия маунта; по-умолчанию true
---@return table
function avatar.GetContextActions(withMount) end

--- Вернуть информацию о контекстном действии. Контекстное действие может находится в списке контекстных действий аватара, но в то же время быть недоступным (например цель не в зоне действия или не в той полусфере игрока). Поле enabled принимает значение true, если действие доступно и false, если не доступно. В случае изменения поля, на клиент приходит  EVENT_CONTEXT_ACTIONS_CHANGED.
---@param id ObjectId идентификатор контекстного действия
---@return table|nil
function avatar.GetContextActionShortInfo(id) end

--- В игре встречаются альтернативные валюты. Этот метод возвращает информацию об этой валюте и её количество у игрока.
---@return table
function avatar.GetCurrencies() end

--- Возвращает информацию о категориях валют, имеющихся у главного игрока.
---@return table
function avatar.GetCurrencyCategories() end

--- Возвращает описание альтернативной валюты.
---@return ValuedText|nil
function avatar.GetCurrencyDescription() end

--- Возвращает информацию об альтернативной валюте по её внутриигровому имени.
---@param sysName string|nil внутриигровое имя альтернативной валюты.
---@return CurrencyId|nil
function avatar.GetCurrencyId(sysName) end

--- В игре встречаются альтернативные валюты. Этот метод возвращает её количество у игрока.
---@param currencyId CurrencyId|nil идентификатор ресурса альтернативной валюты.
---@return table|nil
function avatar.GetCurrencyValue(currencyId) end

--- Возвращает максимально возможный уровень скилла для текущего уровня главного игрока.
---@param skillId ObjectId идентификатор скилла
---@return number
function avatar.GetCurrentMaxSkillScore(skillId) end

--- Возвращает id квеста, объявленного как текущий.
---@return QuestId
function avatar.GetCurrentQuest() end

--- Возвращает информацию об Очках Судьбы персонажа
---@return table
function avatar.GetDestinyPoints() end

--- Возвращает список Id объектов (устройство или юнит), отслеживаемых главным игроком на карте.
---@return table
function avatar.GetDetectedObjects() end

--- Получить список всех устройств в зоне действия аватара
---@return table
function avatar.GetDeviceList() end

--- Возвращает информацию о направлении аватара.
---@return number
function avatar.GetDir() end

--- Возвращает базовую информацию о слоте экипировки. Список доступных слотов:  DRESS_SLOT_...
---@param dressSlot int номер слота ( enum DRESS_SLOT_... )
---@return table|nil
function avatar.GetDressSlotInfo(dressSlot) end

--- Возвращает значение CommandPoints пета друида, если у друида есть пет, и nil в противном случае.
function avatar.GetDruidPetCommandPoints() end

--- Вернуть информацию об эмоции.
---@param index ObjectId id эмоции
---@return table|nil
function avatar.GetEmoteInfo(index) end

--- Возвращает список Id эмоций.
---@return table
function avatar.GetEmotes() end

--- Возвращает специальные заклинания для класса инженера
---@return table
function avatar.GetEngineerPetCommands() end

--- Возвращает информацию об опыте персонажа
---@return table
function avatar.GetExperience() end

--- Возвращает количество опыта персонажа, требуемое на указанный уровень
---@return number
function avatar.GetExpToLevel() end

--- Получить дополнительные данные о фракции
---@param factionId FactionId
---@return table
function avatar.GetFactionInfo(factionId) end

--- Возвращает информацию о механике покровителей.
---@return table|nil
function avatar.GetFairyMechanicsInfo() end

--- Получить информацию о таланте из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return any
function avatar.GetFieldTalentInfo(field, row, column) end

--- Получить размер поля талантов.
---@return integer
function avatar.GetFieldTalentTableSize() end

--- Возвращает текущий рейтинг экипировки аватара, а так же информацию об уровнях и наградах за достижение рейтинга.
---@return table|nil
function avatar.GetGearScoreInfo() end

--- Возвращает информацию о глобальном времени восстановления умений у аватара.
---@return table
function avatar.GetGlobalCooldown() end

--- Получить описание  GlossaryResource.
---@param glossaryId GlossaryId идентификатор ресурса глоссария
---@return ValuedText
function avatar.GetGlossaryDescription(glossaryId) end

--- Возвращает значение регена здоровья главного игрока. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName.
---@return table
function avatar.GetHealthRegen() end

--- Возвращает информацию о кулдауне HearthStone.
function avatar.GetHearthStoneCooldown() end

--- Возвращает информацию о месте в которое ведет HearthStone (карта, зона, локатор).
---@return WString
function avatar.GetHearthStoneLocator() end

--- Возвращает заклинание HearthStone.
---@return SpellId
function avatar.GetHearthStoneSpell() end

--- получить идентификатор аватара.
---@return ObjectId
function avatar.GetId() end

--- Возвращает список категорий постоянных возможностей (анлоков), имеющихся у аватара.
---@return table
function avatar.GetInfiniteUnlockCategories() end

--- Возвращает список имеющихся у главного игрока идентификаторов возможностей (анлоков) с неограниченным сроком жизни.
---@return table
function avatar.GetInfiniteUnlocks() end

--- Возвращает список идентификаторов постоянных возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return table
function avatar.GetInfiniteUnlocksInCategory(unlockCategoryId) end

--- Возвращает описание InnateStat характеристики аватара.
---@param sysName string("ENUM_InnateStats") служебное имя характеристики
---@return ValuedText|nil
function avatar.GetInnateStatDescription(sysName) end

--- Возвращает основные характеристики аватара. Перечисления: ENUM_InnateStats.
---@return table
function avatar.GetInnateStats() end

--- Возвращает информацию об умении игрока просматривать вещи другого игрока и текущих просматриваемых объектах.
---@return table
function avatar.GetInspectInfo() end

--- Возвращает реплику NPC-собеседника. Ответы можно получить в  avatar.GetInteractorNextCues().
---@return nil
function avatar.GetInteractorCue() end

--- Возвращает идентификатор точки телепортации, в которой находится мастер телепорта, с которым сейчас разговаривает главный игрок.
---@return ObjectId|nil
function avatar.GetInteractorCurrentLocation() end

--- Возвращает информацию по собеседнику, если он есть. Возвращаемая информация такая же, как и в  object.GetInteractorInfo( id ).
---@return table|nil
function avatar.GetInteractorInfo() end

--- Возвращает список возможных ответов на реплику NPC-собеседника  avatar.GetInteractorCue(). Ответ представлен полной информацией о следующей реплике, приходящей от NPC, в случае выбора этого ответа.
---@return table
function avatar.GetInteractorNextCues() end

--- Возвращает список точек телепортации мастера телепорта, с которым сейчас разговаривает главный игрок.
---@return table
function avatar.GetInteractorTeleportLocations() end

--- Возвращает информацию о текущем собеседнике аватара. Собеседником может быть устройство или NPC, см.  CategoryObject.
---@return ObjectId
function avatar.GetInterlocutor() end

--- Возвращает информацию о количестве убитых в PvP противников. При изменении приходит  EVENT_VICTIM_TRACKER_CHANGED.
---@return number
function avatar.GetKills() end

--- Вернуть общее число слотов в открытой сумке с лутом, включая пустые. Деньги не считаются слотом - это отдельная сущность.
---@return number
function avatar.GetLootBagSlotCount() end

--- Возвращает количество денег и список вещей в сумке с лутом - содержимое всех слотов. Список индексируется от 0 до avatar.GetLootBagSlotCount() - 1. Для пустых слотов возвращается nil.
---@return integer
function avatar.GetLootBagSlots() end

--- Возвращает значение скорости атаки основным оружием аватара.
function avatar.GetMainhandSpeed() end

--- Возвращает значение регена маны главного игрока. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName.
---@return table
function avatar.GetManaRegen() end

--- Возвращает информацию о причине и времени до выброса главного игрока из инстанса. Если счетчика нет, возвращает nil.
---@return table|nil
function avatar.GetMapInstanceKick() end

--- Вернуть общее (суммарное) количество слотов на всех ActionBar-ах (как пустых, так и непустых).
---@return integer
function avatar.GetMaxActionCount() end

--- Возвращает максимально возможный уровень скилла в игре.
---@param skillId ObjectId идентификатор скилла
---@return number
function avatar.GetMaxSkillScore(skillId) end

--- Возвращает стоимость улучшения мета-предмета в меди.
---@param sourceId ObjectId идентификатор предмета который улучшаем
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор агента улучшения
---@return number
function avatar.GetMetaUpgradeCost(sourceId, enhancerId, agentId) end

--- Возвращает предсказание по улучшению мета-предмета.
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор предмета-агента, требуемого для улучшения
---@param agentCount integer количество используемых агентов
---@return table|nil
function avatar.GetMetaUpgradeResults(sourceId, enhancerId, agentId, agentCount) end

--- Возвращает информацию о количестве денег у игрока. В текущий момент ограничение около 2 млрд (int32).
---@return number
function avatar.GetMoney() end

--- Возвращает информацию о режиме движения в точку для аватара игрока.
---@return table
function avatar.GetMoveToPointState() end

--- Возвращает значение BloodPool некроманта.
---@return integer
function avatar.GetNecromancerBloodPool() end

--- Возвращает описание возможности (анлока), необходимой для получения следующего уровня главного игрока.
---@return table|nil
function avatar.GetNextLevelUnlockInfo() end

--- Возвращает Id астрального моба, которое просматривается через навигационное устройство корабля, на котором находится главный игрок (навигатор корабля игрока назумился на другой корабль).
function avatar.GetObservedAstralUnit() end

--- Возвращает Id о транспортном средстве, которое просматривается через навигационное устройство корабля, на котором находится главный игрок (навигатор корабля игрока назумился на другой корабль). У просматриваемого транспорта доступна информация по устройствам
function avatar.GetObservedTransport() end

--- Возвращает значение скорости атаки дополнительным оружием аватара.
function avatar.GetOffhandSpeed() end

--- Возвращает индекс активного заклинания пета аватара.
---@return number
function avatar.GetPetActiveSpell() end

--- Возвращает текущий тип поведения пета аватара. Типы см. avatar.SetPetAggroMode( mode )
---@return number
function avatar.GetPetAggroMode() end

--- Возвращает текущий тип движения пета аватара. Типы см. avatar.SetPetMoveMode( mode )
---@return number
function avatar.GetPetMoveMode() end

--- Возвращает список идентификаторов ресурсов переключаемых заклинаний пета аватара.
---@return table
function avatar.GetPetSpells() end

--- Возвращает информацию о координатах аватара.
---@return GamePosition
function avatar.GetPos() end

--- Возвращает количество Могущества аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatar.GetPower() end

--- Возвращает список Id профессий главного игрока. Этот список зависит от класса персонажа и его уровня. В данный момент - это умения персонажа носить определенный класс предметов.
---@return table
function avatar.GetProficiencies() end

--- Возвращает информацию о профессии главного игрока по идентификатору. В данный момент это умение носить вещи определенного класса. Зависит от уровня и класса персонажа.
---@param id ObjectId Id объекта профессии
---@return nil
function avatar.GetProficiencyInfo(id) end

--- Главный герой псионик может установить псионический контакт с несколькими целями. Каждый псионический контакт определенного типа может быть установлен с одной целью.
function avatar.GetPsionicContacts() end

--- Возвращает специальные заклинания для класса мистика
---@return table
function avatar.GetPsionicOrders() end

--- Получить список заданий, находящихся в данный момент в журнале заданий аватара.
---@return table
function avatar.GetQuestBook() end

--- Получить список заданий, выполненных аватаром.
---@return table
function avatar.GetQuestHistory() end

--- Возвращает идентификатор текстуры изображения, которое относится к тексту описания задания.
---@param questId QuestId идентификатор ресурса задания
---@return TextureId|nil
function avatar.GetQuestImage(questId) end

--- Получить описание задания.
---@param questId QuestId идентификатор задания.
---@return table
function avatar.GetQuestInfo(questId) end

--- Получить информацию об одной цели какого-либо задания игрока.
---@param objectiveId ObjectId идентификатор цели задания
function avatar.GetQuestObjectiveInfo(objectiveId) end

--- Получить информацию о состоянии конкретного задания, находящегося в журнале заданий аватара.
---@param questId QuestId идентификатор квеста
function avatar.GetQuestProgress(questId) end

--- Получить описание награды за выполнение задания.
---@param questId QuestId
---@return table|nil
function avatar.GetQuestReward(questId) end

--- Возвращает список приглашений от игроков, которые делятся своими заданиями.
---@return table
function avatar.GetQuestShareInvitations() end

--- Возвращает максимально допустимое количество заданий.
---@return number
function avatar.GetQuestsLimit() end

--- Возвращает значение скорости атаки дистанционныим оружием аватара.
function avatar.GetRangedSpeed() end

--- Возвращает идентификатор предмета, выдающего озарение, для указанного рецепта по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return ItemId
function avatar.GetRecipeAfflatusItem(id) end

--- Возвращает информацию о рецепте по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return nil
function avatar.GetRecipeInfo(id) end

--- Возвращает текущие рекомендованные характеристики для аватара(зависит от класса и включенного аспекта).
---@return table
function avatar.GetRecommendedStats() end

--- Получить у аватара информацию о репутации с фракцией.
---@param factionId FactionId фракция
---@return table
function avatar.GetReputationInfo(factionId) end

--- Получить у аватара список открытых репутаций.
---@return table
function avatar.GetReputationsList() end

--- Получить значение репутации соответствующее уровню репутации.
---@param reputationLevel integer уровень репутации
---@return number
function avatar.GetReputationValue(reputationLevel) end

--- Возвращает сопротивляемости аватара. Перечисления:  RESISTANCE_.../"ENUM_Element_...". Возвращаемые значения как в  avatar.GetInnateStats()
---@return table
function avatar.GetResistances() end

--- Попытка получить у NPC-собеседника список заданий, которые NPC может принять.
---@return table
function avatar.GetReturnableQuests() end

--- Позволяет узнать текущий активный набор ритуальных вещей.
---@return number
function avatar.GetRitualActivePreset() end

--- Возвращает уровня игрока, с которого доступно распределение вех.
---@return number
function avatar.GetRubyStartLevel() end

--- Возвращает список Id вещей вторичного рынка на продажу у NPC-торговца.
---@return VendorItem[]
function avatar.GetSecondhandList() end

--- Возвращает список описаний компонент тайны мира.
---@param objectId ObjectId идентификатор тайны мира
---@return table
function avatar.GetSecretComponents(objectId) end

--- Возвращает описание тайны мира.
---@param objectId ObjectId идентификатор тайны мира
---@return table|nil
function avatar.GetSecretInfo(objectId) end

--- Возвращает список идентификаторов всех тайн мира, которые уже доступны или будут доступны когда-то аватару.
---@return table
function avatar.GetSecrets() end

--- получить постоянный идентификатор аватара.
---@return PersistentId
function avatar.GetServerId() end

--- Возвращает левелкап текущего шарда.
---@return number
function avatar.GetShardLevelCap() end

--- Возвращает информацию о скилле по идентификатору ресурса. Дает информацию по любому скиллу, даже если он не изучен игроком. В этом случае score = nil.
---@param id SkillId Id умения (скила)
---@return nil
function avatar.GetSkillInfo(id) end

--- Возвращает список скилов главного героя.
---@return table
function avatar.GetSkills() end

--- Возвращает стоимость (в мирро) преждевременного вызова искры главного игрока, находящегося в данный момент на кладбище. Эта стоимость постоянно меняется из-за разных условий. При изменении стоимости в момент нахождения на кладбище приходит EVENT_CALL_SPARK_COST_CHANGED.
---@return number
function avatar.GetSparkCost() end

--- Возвращает время (в миллисекундах), требуемое на возвращение искры к главному игроку (воскрещения) после появления главного игрока на кладбище с помощью avatar.Respawn().
---@return number
function avatar.GetSparkReturnDelay() end

--- Возвращает специальные характеристики аватара.
---@return table
function avatar.GetSpecialStats() end

--- Возвращает список Id умений и заклинаний аватара. пассивные умения можно получить, используя avatar.GetAbilities().
---@return table
function avatar.GetSpellBook() end

--- Получить информацию о количестве вложенных очков талантов.
---@return number
function avatar.GetSpentTalentPoints() end

--- Метод возвращает список стрел в колчане сталкера.
function avatar.GetStalkerCartridge() end

--- Возвращает значения барьеров лучника (если они есть и активны)
---@return table
function avatar.GetStalkerDamagePoolInfo() end

--- Возвращает размер (максимальное время жизни) барьеров лучника.
---@return integer
function avatar.GetStalkerDamagePoolSize() end

--- Возвращает количество Выносливости у аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatar.GetStamina() end

--- Возвращает информацию о бонусах к характеристикам аватара. При изменении информации о fairyBonus приходит событие  EVENT_FAIRY_BONUS_CHANGED.
---@return table
function avatar.GetStatsBonusesPart() end

--- Возвращает минимальный уровень аватара, начиная с которого доступно распределение очков таланта
---@return number
function avatar.GetTalentSelectMinLevel() end

--- Возвращает информацию о точке телепортации. Информацию можно получить для имеющихся точек телепортации главного игрока, а также точек телепортации мастера телепорта, с которым разговаривает главный игрок, включая точку, в которой стоит мастер.
---@param locationId ObjectId идентификатор точки телепорта
---@return table|nil
function avatar.GetTeleportLocationInfo(locationId) end

--- Возвращает список известных главному игроку точек телепортации от мастеров телепортов.
---@return table
function avatar.GetTeleportLocations() end

--- Возвращает список категорий временных возможностей (анлоков), имеющихся у аватара.
---@return table
function avatar.GetTemporaryUnlockCategories() end

--- Возвращает список имеющихся у главного игрока идентификаторов возможностей (анлоков) с ограниченным сроком жизни.
---@return table
function avatar.GetTemporaryUnlocks() end

--- Возвращает список идентификаторов временных возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return table
function avatar.GetTemporaryUnlocksInCategory(unlockCategoryId) end

--- Возвращает время (в миллисекундах), прошедшее после появления главного игрока на кладбище после вызова avatar.Respawn().
---@return number
function avatar.GetTimeAfterRespawn() end

--- Получить список всех транспортов в зоне действия аватара
---@return table
function avatar.GetTransportList() end

--- Возвращает уникальный постоянный(кросс-серверный) идентификатор аватара.
---@return UniqueId
function avatar.GetUniqueId() end

--- Получить список всех юнитов в зоне действия аватара ( сам аватар исключается )
---@return table
function avatar.GetUnitList() end

--- Возвращает список категорий возможностей (анлоков), имеющихся у аватара.
---@return table
function avatar.GetUnlockCategories() end

--- Возвращает описание возможности (анлока), имеющейся у аватара .
---@param unlockId ObjectId(Number) идентификатор возможности (анлока)
---@return table
function avatar.GetUnlockInfo(unlockId) end

--- Возвращает список идентификаторов всех возможностей (анлоков), имеющихся у главного игрока.
---@return table
function avatar.GetUnlocks() end

--- Возвращает список идентификаторов возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return table
function avatar.GetUnlocksInCategory(unlockCategoryId) end

--- Возвращает информацию об устройстве. Например, корабельные устройства (управление, пушки и т.д.).
---@return table|nil
function avatar.GetUsableDeviceInfo() end

--- Метод возвращает информацию о геймдизайнерской переменной и её значение у главного игрока.
---@param variableId VariableId или идентификатор ресурса переменной или алиас
---@return table|nil
function avatar.GetVariableInfo(variableId) end

--- У игрока могут быть некоторые гейммеханические переменные (например, количество Сил Льда у мага). Этот метод возвращает список идентификаторов этих переменных.
---@return table
function avatar.GetVariables() end

--- Возвращает список Id проданных вещей на выкуп у NPC-торговца.
---@return VendorItem[]
function avatar.GetVendorBuyback() end

--- Возвращает список Id вещей на продажу у NPC-торговца (исключая товары вторичного рынка).
---@return VendorItem[]
function avatar.GetVendorList() end

--- Получить номер специализации, данные о которой доступны для просмотра.
---@return number
function avatar.GetViewedBuild() end

--- Возвращает количество свободных вех развиия, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return number
function avatar.GetViewedBuildFreeRubyPoints() end

--- Возвращает количество пунктов характеристик, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return number
function avatar.GetViewedBuildFreeStatPoints() end

--- Возвращает количество свободных очков умений, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return number
function avatar.GetViewedBuildFreeTalentPoints() end

--- Метод возвращает величину боевого духа война.
function avatar.GetWarriorCombatAdvantage() end

--- Возвращает значения барьеров воина (если они есть и активны)
---@return table
function avatar.GetWarriorDamagePoolInfo() end

--- Возвращает количество Мудрости у аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatar.GetWisdom() end

--- Возвращает информацию о наличии HearthStone у аватара.
---@return boolean
function avatar.HasHearthStone() end

--- Возвращает true, если собеседник имеет реплику для разговора. Также можно получить информацию о реплике с помощью  avatar.GetInteractorCue().
---@return boolean
function avatar.HasInteractorCue() end

--- Возвращает true, если собеседник имеет квест на выдачу или может принять квест.
---@return boolean
function avatar.HasInteractorQuest() end

--- Псионики могут писать и просматривать классовый канал чата. Этот метод возвращает true, если главный игрок имеет доступ к такому каналу.
function avatar.HasPsionicChannel() end

--- Проверка наличия спелла у аватара. Смотрит в спеллбук, если спелл является специальным и не выдается в спеллбук, то вернет false.
---@return boolean
function avatar.HasSpell() end

--- Возвращает true, если у аватара имеется соответствующий анлок. Иначе false.
---@param unlockId UnlockId(ResourceId) идентификатор возможности (анлока)
---@return boolean
function avatar.HasUnlock(unlockId) end

--- Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Слоты индексируются с 0 по всему объему инвентаря, включая карманы.
---@param itemId ObjectId идентификатор предмета
---@param slot integer индекс слота
---@return boolean
function avatar.InventoryCanPlaceItemToSlot(itemId, slot) end

--- Возвращает базовое число слотов (без карманов, только сумка) в инвентаре главного персонажа.
---@return number
function avatar.InventoryGetBaseBagSlotCount() end

--- Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Этот метод возвращает индекс кармана, в который можно положить предмет.
---@param itemId ObjectId идентификатор предмета
---@return number
function avatar.InventoryGetItemPocket(itemId) end

--- Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Слоты индексируются с 0 по всему объему инвентаря, включая карманы.
---@param slot integer индекс слота
---@return number
function avatar.InventoryGetPocketIndexBySlot(slot) end

--- Возвращает таблицу с информацией о кармане инвентаря главного игрока.
---@param pocketIndex integer индекс кармана, начиная с 0
---@return table|nil
function avatar.InventoryGetPocketInfo(pocketIndex) end

--- Возвращает число карманов в инвентаре главного персонажа.
---@return number
function avatar.InventoryGetPocketsCount() end

--- Сообщает, доступно ли клиентское управление перемещением аватара.
---@return boolean
function avatar.IsAbleToMove() end

--- Возвращает true, если в алхимическом приборе достаточно реагентов для начала реакции.
---@return boolean
function avatar.IsAlchemyComponentsReady() end

--- Возвращает базовую информацию об умении алхимии главного игрока.
---@param line number( строка результата (-1, 0, 1)
---@return boolean
function avatar.IsAlchemyLineAvailable(line) end

--- получить идентификатор аватара.
---@return boolean
function avatar.IsAlive() end

--- Возвращает состояние детектора интерактивных объектов на клиенте. Это могут быть детекторы квестгиверов, торговцев и т.п. См. avatar.EnableClientDetector( type, enable ).
---@param type integer тип детектора
---@return boolean
function avatar.IsClientDetectorEnabled(type) end

--- Возвращает информацию, выполняется ли некоторое условие, заданное дизайнером.
---@param alias string строковое название условия
---@return boolean
function avatar.IsConditionValid(alias) end

--- true, если главный игрок уже существует. Иначе false.
---@return boolean
function avatar.IsExist() end

--- Проверяем доступность быстрой прокачки.
---@return boolean
function avatar.IsFastLevelUpAvailable() end

--- После смерти главный игрок переносится на кладбище с помощью avatar.Respawn(). После этого его искра возвращается к нему и игрок окончательно воскресает. Пока искра двигается к игроку, игрок находится в состоянии воскрешения и avatar.IsInRespawn() возвращает true. Во всех остальных случаях возвращается false.
---@return boolean
function avatar.IsInRespawn() end

--- Проверка доступности функции инспектирования игрока.
---@return boolean
function avatar.IsInspectAllowed() end

--- Возвращает true, если собеседник имеет в данный момент начальную реплику для разговора. Эта реплика повляется в самом начале разговора и, начиная от неё, игрок может продолжить разговор с собеседником (NPC).
---@return boolean
function avatar.IsInteractorRootCue() end

--- Возвращает true, если собеседник является учителем. Иначе false.
---@return boolean
function avatar.IsInteractorTrainer() end

--- Возвращает true, если собеседник является торговцем. Иначе false.
---@return boolean
function avatar.IsInteractorVendor() end

--- Проверяет, будет ли предмет при перемещении из одного слота контейнера (инвентарь, переполненная сумка, банковская ячейка) в другой слот (возможно другого контейнера) объединён с предметом в целевом слоте. Предназначена для определения необходимости проверки на изменение связанности и времени существования предметов при перемещении.
---@param itemFromId ObjectId перемещаемый предмет (должен находиться в одном из контейнеров)
---@param itemToId ObjectId предмет, находящийся в слоте, куда предполагается переместить предмет itemFromId
---@return boolean
function avatar.IsItemsStackable(itemFromId, itemToId) end

--- Возвращает состояние сумки с лутом на сервере - открыта она для лута или нет.
---@return boolean
function avatar.IsLootBagOpen() end

--- Возвращает информацию о том, является ли инструментом для копирования метаитема-улучшителя.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function avatar.IsMetaEnhancerDuplicator(itemId) end

--- Возвращает true, если в данный момент бежим до точки на карте по найденному пути.
---@return boolean
function avatar.IsNavigateToPoint() end

--- Возвращает true, если получение следующего уровня невозможно для главного игрока.
---@return boolean
function avatar.IsNextLevelLocked() end

--- Является ли персонаж пассажиром, к примеру, на двухместном маунте.
---@return boolean
function avatar.IsPassangerState() end

--- Возвращает true, если активный пет главного игрока находится в состоянии боя. Иначе возвращает false.
---@return boolean
function avatar.IsPetInCombat() end

--- Доступна ли автонавигация для данного задания.
---@param questId QuestId
---@return boolean
function avatar.IsQuestAutoNavigationAllowed(questId) end

--- Проверяет завершено ли задание.
---@param questId QuestId идентификатор ресурса задания
---@return boolean
function avatar.IsQuestFinished(questId) end

--- Возвращает true, если игрок может воскреснуть в обычном мире, находясь в чистилище.
---@return boolean
function avatar.IsReadyForFinallyRespawn() end

--- Проверка состояния разговора аватара с NPC
---@return boolean
function avatar.IsTalking() end

--- Инспектируется ли цель главного игрока.
---@return boolean
function avatar.IsTargetInspected() end

--- Проверяем валидность locationId.
---@param locationId ObjectId идентификатор точки телепорта
---@return boolean
function avatar.IsTeleportLocationValid(locationId) end

--- Находится ли персонаж игрока в режиме ходьбы.
---@return boolean
function avatar.IsWalkMode() end

--- Устанавливает состояние панели действий для заданного класса и билда. Номера билдов 0-2 соответствуют 1-3 грани талантов, номера билдов 3-9 ничему не соответствуют, но хранятся на сервере и могут быть загружены / выгружены.
---@param sysClass SpellId системное имя класса
---@param buildIndex integer индекс билда от 0 до 9
---@param data string данные о раскладке полученные из SaveActionPanel. Модификация не допускается, имеется контрольная сумма.
function avatar.SaveActionPanel(sysClass, buildIndex, data) end

--- Попытка открыть сундуки. Результат операции приходит в виде события EVENT_BOX_OPERATION_RESULT.
---@param boxId ObjectId item id сундучка, сундучок должен находиться в одном из контейнеров (например в инвентаре или переполненной сумке)
---@param quantity integer|nil необязательный параметр, количество открываемых сундуков; по умолчанию 1.
function avatar.OpenBox(boxId, quantity) end

--- Положить/вынуть ингредиент в алхимический слот. После этого прийдёт EVENT_ALCHEMY_ITEM_PLACED. Если передать nil, то слот будет очищен и прийдёт сообщение.
---@param itemId ObjectId|nil идентификатор ингридиента (предмета из инвентаря). nil - очистить слот.
---@param slot number( номер барабана (слота)
function avatar.PutAlchemyItemToSlot(itemId, slot) end

--- Попытка начала разговора с собеседником (спросить список заданий, торговец ли он и т.п.).
function avatar.RequestInteractions() end

--- Запрос заданий у предмета в слоте контейнера (сумка, переполненная сумка, банковская ячейка). В ответ придет сообщение EVENT_ITEM_QUESTS_RECEIVED
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
function avatar.RequestQuestsForItem(itemId) end

--- Попытка запросить у торговца список имеющихся товаров.
function avatar.RequestVendor() end

--- Команда на оживление аватара на кладбище. После этого он не воскресает немедленно, а ожидает прибытия своей искры, находясь в чистилище.
function avatar.Respawn() end

--- Согласиться или отказаться от оживления главного инрока в ответ на EVENT_RESSURECT_REQUESTED.
---@param accept boolean true, если главный игрок согласен на оживление. Иначе false.
function avatar.ResurrectReply(accept) end

--- Попытка сдать задание юнита, который является текущей целью аватара. *Нельзя сдать задание юнита, не являющемуся текущей целью.
---@param questId QuestId
---@param rewardId ObjectId
function avatar.ReturnQuest(questId, rewardId) end

--- Запрашивает начальную реплику NPC-собеседника. В ответ прийдёт EVENT_INTERACTION_STARTED.
function avatar.ReturnToStartCue() end

--- Попытка выполнить одно из действий устройства. Список действий можно узнать через функцию  GetUsableDeviceInfo.
---@param index number( индекс действия
function avatar.RunUsableDeviceAction(index) end

--- Попытка выполнить одно из действий устройства на точку местности. Список действий можно узнать через функцию  GetUsableDeviceInfo.
---@param index integer индекс действия
---@param pos GamePosition точка применения действия
function avatar.RunUsableDeviceActionPoint(index, pos) end

--- Возвращает сериализованное состояние панели действий для заданного класса и билда. Номера билдов 0-2 соответствуют 1-3 грани талантов, номера билдов 3-9 ничему не соответствуют, но хранятся на сервере и могут быть загружены / выгружены.
---@param sysClass SpellId системное имя класса
---@param buildIndex integer индекс билда от 0 до 9
---@return table|nil
function avatar.SaveActionPanel(sysClass, buildIndex) end

--- Отвечает на реплику NPC-собеседника  avatar.GetInteractorCue(). Ответ - индекс в списке ответов  avatar.GetInteractorNextCues().
---@param index number( индекс ответа
function avatar.SelectInteractorCue(index) end

--- Попытка аватара сделать указанного юнита своей целью.
---@param unitId ObjectId
function avatar.SelectTarget(unitId) end

--- Задать номер активной специализации.
---@param index integer номер специализации аватара; доступный диапазон - от 0 до величины, на 1 меньшей результата avatar.GetBuildsCount()
function avatar.SetActiveBuild(index) end

--- Отсылает на сервер информацию, необходимую для продолжения процесса смены класса (набор замен для предметов). Должны быть указаны замены для всех предметов и самоцветов, информация о которых есть в  avatar.GetClassChangerInfo().
---@param changeList table список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен; должны быть указаны замены для всех предметов и самоцветов, иначе замена произведена не будет
function avatar.SetClassChangerInfo(changeList) end

--- Объявлет квест с заданным QuestId текущим выполняемым квестом.
---@param questId QuestId id квеста, задаваемого как текущий; если nil, то никакой квест не будет текущим
function avatar.SetCurrentQuest(questId) end

--- Попытка установить фразу для добивания.
---@param message WString фраза
function avatar.SetFatalityPhrase(message) end

--- Включает/выключает автоматическое движение вслед за объектом, являющимся целью на момент вызова.
---@param isFollow boolean если true - включить режим следования, если false - выключить
function avatar.SetFollowTarget(isFollow) end

--- Устанавливает активное заклинание для пета аватара.
---@param index integer индекс заклинания
function avatar.SetPetActiveSpell(index) end

--- Попытка изменить активный набор ритуальных вещей. Результатом успешной попытки будет событие  EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED.
---@param preset integer набор
function avatar.SetRitualActivePreset(preset) end

--- Задать номер специализации, данные о которой доступны для просмотра.
---@param index integer номер специализации аватара; доступный диапазон - от 0 до величины, на 1 меньшей результата avatar.GetBuildsCount()
function avatar.SetViewedBuild(index) end

--- Задает режим движения персонажа: шаг/бег.
---@param walk boolean задать режим ходьбы или бега
function avatar.SetWalkMode(walk) end

--- Предлагает другим игрокам группы принять указанное задание. Задание должно быть разделяемым.
---@param questId QuestId идентификатор задания
function avatar.ShareQuest(questId) end

--- Визуально показывает/убирает оружие. Циклически переключаются следующие состояния: показать ближнее оружие/показать дальнее оружие/убрать оружие.
function avatar.SheathNext() end

--- Необходимо вызывать из скрипта при открытии/закрытии диалога улучшения мета-предметов. Это необходимо для корректого отслеживания закрытия диалога по внутренним причинам ( EVENT_META_UPGRADE_BREAK).
---@param show boolean true, если начали показывать диалог
function avatar.ShowMetaUpgradeDialog(show) end

--- Попытка инспектировать игрока. Пользователь может получать экипировку инспектируемой цели.
---@param unitId ObjectId
function avatar.StartInspect(unitId) end

--- Попытка начать взаимодействовать с NPC. В случае успеха придёт EVENT_TALK_STARTED.
---@param unitId ObjectId
function avatar.StartInteract(unitId) end

--- Прекратить кастование текущего спелла (действия).
function avatar.StopCasting() end

--- Окончание взаимодействия с NPC
function avatar.StopInteract() end

--- Насильно останавливает движение аватара игрока в точку (если тот находится в соответствующем режиме).
function avatar.StopMoveToPoint() end

--- Пометить талант из базовой таблицы талантов для изучения.
---@param layer integer номер строки
---@param line integer номер столбца
function avatar.StoreBaseTalent(layer, line) end

--- Пометить для изучения веху из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function avatar.StoreFieldTalent(field, row, column) end

--- Переключает пользовательский флаг PvP главного игрока.
---@param isOn boolean true, если надо включить PvP флаг
function avatar.SwitchPvPFlag(isOn) end

--- Отправляет команду на смену игрового канала зоны. Успешный результат: перемещение аватара на выбранный канал.
---@param channelIndex integer индекс выбранного канала
function avatar.SwitchToChannel(channelIndex) end

--- Попытка выбрать своего персонажа в качестве цели. Используется дополнительная цель.
function avatar.TargetSelf() end

--- Этим методом даётся ответ на EVENT_TELEPORT_OFFER_REQUEST. Если accept == true, то главный игрок согласен на телепортацию, предложенну. одногруппником.
---@param accept boolean true, если игрок согласен на телепортацию
function avatar.TeleportOfferReply(accept) end

--- В ответ на этот запрос, мастер телепорта, с которым разговаривает главный игрок, телепортирует игрока в заданную точку. Идентификатор Точки телепортации должен быть взят из списка точек телепортации, имеющихся у мастера телепорта.
---@param locationId ObjectId идентификатор точки телепортации
function avatar.TeleportToLocation(locationId) end

--- Снимает привязку какого-либо действия к слоту экшен панели.
---@param index integer индекс слота от 0 до max
function avatar.UnBindFromActionPanel(index) end

--- Попытка снять указанный предмет.
---@param itemId ObjectId идентификатор предмета
function avatar.UnequipItem(itemId) end

--- Попытка снять указанный предмет из в указанную ячейку инвентаря.
---@param itemId ObjectId идентификатор предмета
---@param inventorySlot integer индекс ячейки в инвентаре [0..GetInventorySize() - 1]
function avatar.UnequipItemToSlot(itemId, inventorySlot) end

--- Сброс цели у аватара. Сбрасывается дополнительная цель.
function avatar.UnselectTarget() end

--- Делает попытку улучшения мета-предмета в ответ на  EVENT_META_DIALOG.
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор предмета-агента, требуемого для улучшения
---@param agentCount integer количество используемых агентов
function avatar.UpgradeMetaItem(sourceId, enhancerId, agentId, agentCount) end

--- Использовать HearthStone.
function avatar.UseHearthStone() end

--- Телепортирует игрока в заданную точку. Идентификатор точки телепортации должен быть взят из списка точек телепортации, имеющихся у аватара (см avatar.GetTeleportLocations()) или из привязки HearthStone (см avatar.GetHearthStoneLocator(), поле locationId).
---@param locationId ObjectId идентификатор точки телепортации
function avatar.UseHearthStoneToLocation(locationId) end

--- Попытка использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
function avatar.UseItem(itemId) end

--- Использовать выбранную вещь и выполнить какие-то воздействия сообразно предмету, который применяется.
---@param itemId ObjectId идентификатор предмета (должен иметь парт UseItemAndTakeActions - проверяется itemLib.IsUseItemAndTakeActions( itemId ))
function avatar.UseItemAndTakeActions(itemId) end

--- Использовать выбранную вещь на другой предмет и выполнить какие-то воздействия сообразно предмету, на который вещь применяется.
---@param sourceItemId ObjectId идентификатор предмета, который применяется на другой итем (должен иметь парт UseOnItemAndTakeActions - проверяется itemLib.IsUseOnItemAndTakeActions( itemId ))
---@param targetItemId ObjectId идентификатор предмета, на который отправляется запрос на действие и на котором будут проверяться предикаты
function avatar.UseItemOnItemAndTakeActions(sourceItemId, targetItemId) end

--- Использовать выбранную вещь на маунта и выполнить какие-то воздействия.
---@param itemId ObjectId идентификатор предмета, который применяется на маунта
---@param mountId ObjectId идентификатор маунта, на который будет применятся предмет
function avatar.UseItemOnMountAndTakeActions(itemId, mountId) end

--- Попытка использовать предмет в контейнере игрока на точку на ландшафте.
---@param itemId ObjectId идентификатор предмета
---@param position table
function avatar.UseItemOnPoint(itemId, position) end

--- Возвращает true, если можно положить предмет в основы агента мета-предметов.
---@param agentId ObjectId идентификатор улучшаемого предмета
function avatar.CanPlaceMetaUpgradeAgent(agentId) end

--- Возвращает true, если можно положить предмет в слот улучшителя мета-предметов.
---@param sourceId ObjectId|nil идентификатор улучшаемого предмета, если требуется
---@param enhancerId ObjectId идентификатор предмета-улучшителя
function avatar.CanPlaceMetaUpgradeEnhancer(sourceId, enhancerId) end

--- Возвращает true, если можно положить предмет в основы улучшителя мета-предметов.
---@param sourceId ObjectId идентификатор улучшаемого предмета
function avatar.CanPlaceMetaUpgradeSource(sourceId) end

--- Отказаться от приглашения на вступление в группу. Должно быть активное приглашение (смотри  group.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
function avatar.Decline() end

--- Выучить помеченные таланты и вехи.
function avatar.ApplyStoredTalents() end

--- Можно ли сбросить веху из поля талантов гильдии за альтвалюту.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return boolean
function avatar.CanDropTalent(field, row, column) end

--- Возвращает возможность и условия изучения таланта гильдии.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@param talentType integer|nil тип таланата, по-умолчанию ENUM_TalentType_GUILD
---@return table|nil
function avatar.CanLearnTalent(field, row, column, talentType) end

--- Сбрасывание выбранных на изучение вех.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function avatar.ClearStoredTalents(field, row, column) end

--- Cбросить веху из поля талантов гильдии за альтвалюту.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function avatar.DropTalent(field, row, column) end

--- Получить размер поля талантов.
---@return table
function avatar.GetFieldTalentTableSize() end

--- Цена забывания таланта.
---@return integer
function avatar.GetDropTalentCost() end

--- Получить информацию о поле талантов гильдии.
---@param field integer номер поля
---@return table
function avatar.GetFieldInfo(field) end

--- Возвращает количество выбранных на изучение вех.
---@return integer
function avatar.GetStoredTalentsCount() end

--- Получить информацию о таланте гильдии из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return table
function avatar.GetTalentInfo(field, row, column) end

--- Возвращает координаты всех абилок заданной группы/
---@param groupName string имя группы
---@return table
function avatar.GetTalentsByGroup(groupName) end

--- Установлен ли талант на изучение
---@param field int поле
---@param row int ряд
---@param column int колонка
---@return boolean
function avatar.IsStoredTalent(field, row, column) end

--- Пометить для изучения веху из поля талантов гильдии.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function avatar.StoreTalent(field, row, column) end

--- Включает или выключает детектор интерактивных объектов на клиенте. Это могут быть детекторы квестгиверов, торговцев и т.п.
function EnableClientDetector() end

--- Возвращает новый экземпляр ValuedObject для пассивного умения.
function GetAbilityValuedObject() end

--- Возвращает новый экземпляр ValuedObject для бафа.
function GetBuffValuedObject() end

--- Установливает для пета аватара тип поведения:
function SetPetAggroMode() end

--- Поменять умения экшен панели местами.
function SwapActionsInActionPanel() end

-- Events

--- Событие посылается, когда в книге умений появилось новое пассивное умение (абилка).
EVENT_ABILITIES_ELEMENT_ADDED = "EVENT_ABILITIES_ELEMENT_ADDED"

--- Событие посылается каждый раз, когда изменилось состояние панели действий (ActionPanel).
EVENT_ACTION_PANEL_CHANGED = "EVENT_ACTION_PANEL_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние элемента на панели действий (ActionPanel). К созданию/удалению элемента это не относится, при этом изменяется панель целиком.
EVENT_ACTION_PANEL_ELEMENT_CHANGED = "EVENT_ACTION_PANEL_ELEMENT_CHANGED"

--- Присылается, если сервер не смог осуществить какую-то операцию с другим игроком.
EVENT_ADDRESSEE_NOT_FOUND = "EVENT_ADDRESSEE_NOT_FOUND"

--- Событие посылается при изменении состояния жизни аватара.
EVENT_AVATAR_ALIVE_CHANGED = "EVENT_AVATAR_ALIVE_CHANGED"

--- Событие приходит при любом изменении состояния барьеров (паладина).
EVENT_AVATAR_BARRIERS_CHANGED = "EVENT_AVATAR_BARRIERS_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется привязанное транспортное средство (вызвал в ангаре/отозвал и т.п.).
EVENT_AVATAR_BINDED_TRANSPORT_CHANGED = "EVENT_AVATAR_BINDED_TRANSPORT_CHANGED"

--- Событие посылается в случае невозможности снять бафф с аватара с помощью avatar.RemoveBuff( buffIndex ).
EVENT_AVATAR_BUFF_REMOVING_FAILED = "EVENT_AVATAR_BUFF_REMOVING_FAILED"

--- Событие присылается, когда меняется форма класса аватара.
EVENT_AVATAR_CLASS_FORM_CHANGED = "EVENT_AVATAR_CLASS_FORM_CHANGED"

--- Событие присылается при переходе аватара в другую зону. Уведомляет о более мелких (клиентских) подзонах чем  EVENT_AVATAR_ZONE_CHANGED.
EVENT_AVATAR_CLIENT_ZONE_CHANGED = "EVENT_AVATAR_CLIENT_ZONE_CHANGED"

--- Событие посылается при создании игрока.
EVENT_AVATAR_CREATED = "EVENT_AVATAR_CREATED"

--- Событие посылается каждый раз, когда меняется количество Очков Судьбы у персонажа игрока.
EVENT_AVATAR_DESTINY_POINTS_CHANGED = "EVENT_AVATAR_DESTINY_POINTS_CHANGED"

--- Событие присылается при изменении направления аватара более чем на 3 градуса.
EVENT_AVATAR_DIR_CHANGED = "EVENT_AVATAR_DIR_CHANGED"

--- Событие посылается каждый раз, когда изменился опыт персонажа игрока.
EVENT_AVATAR_EXPERIENCE_CHANGED = "EVENT_AVATAR_EXPERIENCE_CHANGED"

--- Событие присылается, если игрок отменил выход из миссии (с помощью mission.CancelLogout()).
EVENT_AVATAR_LOGOUT_CANCELLED = "EVENT_AVATAR_LOGOUT_CANCELLED"

--- Событие присылается при переходе аватара на другую карту.
EVENT_AVATAR_MAP_CHANGED = "EVENT_AVATAR_MAP_CHANGED"

--- Событие присылается когда становится доступна информация о местонахождении аватара. Только после этого события можно пытаться вызывать функции связанные с картой.
EVENT_AVATAR_MAP_INFO_AVAILABLE = "EVENT_AVATAR_MAP_INFO_AVAILABLE"

--- Событие присылается, если изменились модификаторы карты на карте главного игрока.
EVENT_AVATAR_MAP_MODIFIERS_CHANGED = "EVENT_AVATAR_MAP_MODIFIERS_CHANGED"

--- Событие посылается каждый раз, когда изменилось количество денег у игрока.
EVENT_AVATAR_MONEY_CHANGED = "EVENT_AVATAR_MONEY_CHANGED"

--- Событие присылается при изменении координат аватара.
EVENT_AVATAR_POS_CHANGED = "EVENT_AVATAR_POS_CHANGED"

--- Событие посылается каждый раз, когда меняется доступ в классовый канал чата псиоников.
EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED = "EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED"

--- Событие посылается каждый раз, когда у псионика (основного игрока) появляется псионический контакт.
EVENT_AVATAR_PSIONIC_CONTACT_ADDED = "EVENT_AVATAR_PSIONIC_CONTACT_ADDED"

--- Событие посылается каждый раз, когда у псионика (основного игрока) меняется состояние (цель или длительность (durationMs, но не remainingMs)) определенного псионического контакта.
EVENT_AVATAR_PSIONIC_CONTACT_CHANGED = "EVENT_AVATAR_PSIONIC_CONTACT_CHANGED"

--- Событие посылается каждый раз, когда у псионика (основного игрока) исчезает псионический контакт.
EVENT_AVATAR_PSIONIC_CONTACT_REMOVED = "EVENT_AVATAR_PSIONIC_CONTACT_REMOVED"

--- Событие приходит периодически, когда псионик определяет, что около него есть вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка). Периодичность события определяется серверной механикой.
EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED = "EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED"

--- Событие посылается каждый раз, когда псионик определяет, что его поселектил вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка).
EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET = "EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET"

--- Событие посылается каждый раз, когда псионик читает мысли другого игрока или NPC. Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
EVENT_AVATAR_PSIONIC_READ_THOUGHT = "EVENT_AVATAR_PSIONIC_READ_THOUGHT"

--- Событие посылается каждый раз, когда псионик читает мысли другого игрока, но не может их понять (противоположная фракция). Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT = "EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT"

--- Событие посылается каждый раз, когда у сталкера (основного игрока) меняется что-либо в колчане.
EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED = "EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED"

--- Событие посылается при появлении барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED"

--- Событие посылается при изменении состояния барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED"

--- Событие посылается при исчезновении барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED"

--- Изменение статов аватара: базовых, брони, сопротивляемости.
EVENT_AVATAR_STATS_CHANGED = "EVENT_AVATAR_STATS_CHANGED"

--- Событие приходит при смене таргета игроком.
EVENT_AVATAR_TARGET_CHANGED = "EVENT_AVATAR_TARGET_CHANGED"

--- Событие с рекомендацией сервера об изменении цели аватара на указанную.
EVENT_AVATAR_TARGET_RECOMMENDED = "EVENT_AVATAR_TARGET_RECOMMENDED"

--- Событие посылается при изменении основной цели основной цели (это не опечатка) аватара.
EVENT_AVATAR_TARGET_TARGET_CHANGED = "EVENT_AVATAR_TARGET_TARGET_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется транспортное средство (появляется, исчезает).
EVENT_AVATAR_TRANSPORT_CHANGED = "EVENT_AVATAR_TRANSPORT_CHANGED"

--- Уведомление о получении какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
EVENT_AVATAR_UNLOCK_ADDED = "EVENT_AVATAR_UNLOCK_ADDED"

--- Уведомление о изменении состояния анлока.
EVENT_AVATAR_UNLOCK_CHANGED = "EVENT_AVATAR_UNLOCK_CHANGED"

--- Уведомление о потере какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
EVENT_AVATAR_UNLOCK_REMOVED = "EVENT_AVATAR_UNLOCK_REMOVED"

--- Уведомление об изменении состояний залоченности для аватара. Например, может измениться доступность слота для экипировки и т.д.
EVENT_AVATAR_UNLOCKS_CHANGED = "EVENT_AVATAR_UNLOCKS_CHANGED"

--- Событие присылается при смене (получении, потере) используемого устройства.
EVENT_AVATAR_USED_OBJECT_CHANGED = "EVENT_AVATAR_USED_OBJECT_CHANGED"

--- Событие посылается при изменении режима движения игрока (шагом/бегом).
EVENT_AVATAR_WALK_MODE_CHANGED = "EVENT_AVATAR_WALK_MODE_CHANGED"

--- Событие посылается каждый раз, когда у основного игрока-война (Warrior) меняется боевой дух.
EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED = "EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED"

--- Событие посылается при появлении барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED"

--- Событие посылается при изменении состояния барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED"

--- Событие посылается при исчезновении барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED"

--- Событие присылается раз в секунду после того, как если игрок пытается выйти из миссии (mission.Logout()), но находится в бою. В этом случае выход будет отложен на некоторое время.
EVENT_AVATAR_WILL_BE_REMOVED = "EVENT_AVATAR_WILL_BE_REMOVED"

--- Серверное событие о переходе персонажа в другую зону. Для более подробного уведомления (но только при наличии UI) следует использовать (клиентское):  EVENT_AVATAR_CLIENT_ZONE_CHANGED.
EVENT_AVATAR_ZONE_CHANGED = "EVENT_AVATAR_ZONE_CHANGED"

--- Событие присылается периодически, при изменении стоимости вызова искры, когда главный игрок находится в состоянии воскрешения (умер и находится на кладбище, ожидая свою искру).
EVENT_CALL_SPARK_COST_CHANGED = "EVENT_CALL_SPARK_COST_CHANGED"

--- Событие присылается, если не получилось вызвать искру главного игрока, находящегося на кладбище. Вызов искры инициирует avatar.CallSpark().
EVENT_CALL_SPARK_FAILED = "EVENT_CALL_SPARK_FAILED"

--- Событие посылается при изменении цели пушки управляемой игроком(любого орудия с активным прицелом).
EVENT_CANNON_TARGET_CHANGE = "EVENT_CANNON_TARGET_CHANGE"

--- Сообщение о невозможности полутить исчезнувший объект. Например, кто-то уже полутил сундук или моба до того, как сервер успел сообщить об этом на другой клиент.
EVENT_CANT_LOOT_DISAPPEARED_LOOT_BAG = "EVENT_CANT_LOOT_DISAPPEARED_LOOT_BAG"

--- Событие посылается при изменении состояния смены класса - когда требуется выбрать замены для вещей на соответствующие новому классу и когда такая необходимость отпадает.
EVENT_CHARACTER_CLASS_CHANGER_CHANGED = "EVENT_CHARACTER_CLASS_CHANGER_CHANGED"

--- Событие посылается когда аватар лишен права писать сообщения в чат.
EVENT_CHAT_AVATAR_MUTED = "EVENT_CHAT_AVATAR_MUTED"

--- Событие посылается для каждого нового сообщения, пришедшего в чат. Если сообщение является эхом (включено в настройках по умолчанию), то это то сообщение, которое мы изначально попытались отправить.
EVENT_CHAT_MESSAGE = "EVENT_CHAT_MESSAGE"

--- Событие, которое приходит при невозможности отослать сообщение в чат, поскольку сообщение подпадает под критерии флуда (множетво одинаковых сообщений, следующих с высокой частотой).
EVENT_CHAT_MESSAGE_IS_FLOOD = "EVENT_CHAT_MESSAGE_IS_FLOOD"

--- Событие, которое приходит при невозможности доставить сообщение в чат.
EVENT_CHAT_MESSAGE_REJECTED = "EVENT_CHAT_MESSAGE_REJECTED"

--- Событие посылается для каждого нового сообщения, пришедшего в чат. Если сообщение является эхом (включено в настройках по умолчанию), то это то сообщение, которое мы изначально попытались отправить.
EVENT_CHAT_MESSAGE_WITH_OBJECTS = "EVENT_CHAT_MESSAGE_WITH_OBJECTS"

--- Ошибка при работе с именноваными каналами.
EVENT_CHAT_NAMED_ERROR = "EVENT_CHAT_NAMED_ERROR"

--- Событие посылается для в случае отсылки личного сообщения игроку, который в данный момент находится в игре под своим альтернативным персонажем.
EVENT_CHAT_SENT_TO_ALT = "EVENT_CHAT_SENT_TO_ALT"

--- Событие о появлении предмета в слоте контейнера главного игрока по любой причине. Это может быть и появление нового предмета, и перетаскивание имеющегося в сумке и тестовый чит.
EVENT_CONTAINER_ITEM_ADDED = "EVENT_CONTAINER_ITEM_ADDED"

--- Событие об исчезновении предмета из слота контейнера главного игрока.
EVENT_CONTAINER_ITEM_REMOVED = "EVENT_CONTAINER_ITEM_REMOVED"

--- Изменился список игровых альтернативных валют, имеющихся у игрока.
EVENT_CURRENCIES_CHANGED = "EVENT_CURRENCIES_CHANGED"

--- Событие присылается при попытке что-либо приобрести при недостаточном количестве игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
EVENT_CURRENCY_NOT_ENOUGH = "EVENT_CURRENCY_NOT_ENOUGH"

--- Событие присылается при изменении количества игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
EVENT_CURRENCY_VALUE_CHANGED = "EVENT_CURRENCY_VALUE_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние умения или заклинания, не привязанного к книге заклинаний.
EVENT_DEFAULT_SPELL_CHANGED = "EVENT_DEFAULT_SPELL_CHANGED"

--- Событие, которое приходит при попытке дизассемблинга.
EVENT_DISASSEMBLING_RESULT = "EVENT_DISASSEMBLING_RESULT"

--- Присылается при изменении значения CommandPoints пета друида.
EVENT_DRUID_PET_COMMAND_POINTS_CHANGED = "EVENT_DRUID_PET_COMMAND_POINTS_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние эмоций. В данный момент оно происходит при изменении возможности запуска (emoteInfo.canRun).
EVENT_EMOTES_CHANGED = "EVENT_EMOTES_CHANGED"

--- Событие о провале попытки экипировать предмет. Приходит либо itemId либо slot.
EVENT_EQUIP_FAILED = "EVENT_EQUIP_FAILED"

--- Событие приходит при любом изменении информации о бонусе от покровителя.
EVENT_FAIRY_BONUS_CHANGED = "EVENT_FAIRY_BONUS_CHANGED"

--- Событие посылается каждый раз, когда изменяется режим следования за объектом (включился/выключился/сменился объект).
EVENT_FOLLOW_MODE_CHANGED = "EVENT_FOLLOW_MODE_CHANGED"

--- Событие приходит, если был начат крафт (форж/рефорж) итемов. Пользователю необходимо показать диалог для форжа/рефоржа.
EVENT_FORGE_CRAFT_DIALOG = "EVENT_FORGE_CRAFT_DIALOG"

--- Событие об изменении предмета (например, изменилось количество в стеке).
EVENT_GAME_ITEM_CHANGED = "EVENT_GAME_ITEM_CHANGED"

--- Событие об изменении проклятости предмета. Одновременно, приходит событие  EVENT_GAME_ITEM_CHANGED.
EVENT_GAME_ITEM_CURSED_CHANGED = "EVENT_GAME_ITEM_CURSED_CHANGED"

--- Присылается в случае некой ошибки на сервере.
EVENT_GENERAL_ERROR = "EVENT_GENERAL_ERROR"

--- По каким-то причинам вступление в группу не сработало.
EVENT_GROUP_ACCEPT_ERROR = "EVENT_GROUP_ACCEPT_ERROR"

--- Событие на появление группы. Присылается не только на действительное создание группы, но и при вхождении игрока в состав уже существующей.
EVENT_GROUP_APPEARED = "EVENT_GROUP_APPEARED"

--- Событие на изменение состава группы (включая создание и роспуск).
EVENT_GROUP_CHANGED = "EVENT_GROUP_CHANGED"

--- Прямой отказ персонажа вступить в группу.
EVENT_GROUP_DECLINE = "EVENT_GROUP_DECLINE"

--- Уведомление о невозможности пригласить персонажа в группу.
EVENT_GROUP_DECLINE_BUSY = "EVENT_GROUP_DECLINE_BUSY"

--- Уведомление о невозможности пригласить персонажа в группу по причине игнора.
EVENT_GROUP_DECLINE_IGNORED = "EVENT_GROUP_DECLINE_IGNORED"

--- Событие на исчезновение группы. Присылается не только на роспуск группы, но и при выходе игрока из состава существующей.
EVENT_GROUP_DISAPPEARED = "EVENT_GROUP_DISAPPEARED"

--- Событие о приглашении в группу.
EVENT_GROUP_INVITE = "EVENT_GROUP_INVITE"

--- Событие, которое приходит при невозможности пригласить игрока в группу.
EVENT_GROUP_INVITE_FAILED = "EVENT_GROUP_INVITE_FAILED"

--- Событие, которое приходит при неудачной попытке выгнать игрока из группы.
EVENT_GROUP_KICK_FAILED = "EVENT_GROUP_KICK_FAILED"

--- Событие приходит при появлении нового члена группы.
EVENT_GROUP_MEMBER_ADDED = "EVENT_GROUP_MEMBER_ADDED"

--- Событие на изменение состояния члена группы (онлайн-офлайн, лидер).
EVENT_GROUP_MEMBER_CHANGED = "EVENT_GROUP_MEMBER_CHANGED"

--- Событие приходит при выходе члена группы из ее состава.
EVENT_GROUP_MEMBER_REMOVED = "EVENT_GROUP_MEMBER_REMOVED"

--- Серверное событие с гильдейской банковской историей аватара. Приходит после вызова функции  guild.GetAvatarHistory().
EVENT_GUILD_AVATAR_HISTORY = "EVENT_GUILD_AVATAR_HISTORY"

--- Событие присылается, когда изменились таланты гильдии.
EVENT_GUILD_TALENTS_CHANGED = "EVENT_GUILD_TALENTS_CHANGED"

--- Событие присылается при изменении количества скрытой игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
EVENT_HIDDEN_CURRENCY_VALUE_CHANGED = "EVENT_HIDDEN_CURRENCY_VALUE_CHANGED"

--- Событие посылается при окончании инспекции объекта.
EVENT_INSPECT_FINISHED = "EVENT_INSPECT_FINISHED"

--- Событие посылается, если при осмотре главным игроком другого игрока у осматриваемого игрока изменился активный маунт.
EVENT_INSPECT_MOUNT_CHANGED = "EVENT_INSPECT_MOUNT_CHANGED"

--- Событие посылается при изменении уровня умения главного игрока осматривать других игроков.
EVENT_INSPECT_SKILL_CHANGED = "EVENT_INSPECT_SKILL_CHANGED"

--- Событие посылается при начале инспекции объекта. Объектом может быть игрок, дружественный аватару, и являющийся целью аватара. При потере цели инспекция сбрасыватся EVENT_INSPECT_FINISHED.
EVENT_INSPECT_STARTED = "EVENT_INSPECT_STARTED"

--- Событие посылается в ответ на запрос наличия доступных заданий у собеседника  avatar.RequestInteractions(). Также приходит автоматически при начале разговора.
EVENT_INTERACTION_STARTED = "EVENT_INTERACTION_STARTED"

--- Событие об изменении содержимого инвентаря главного персонажа.
EVENT_INVENTORY_CHANGED = "EVENT_INVENTORY_CHANGED"

--- Событие об изменении содержимого  "переполненной сумки" главного персонажа.
EVENT_INVENTORY_OVERFLOW_CHANGED = "EVENT_INVENTORY_OVERFLOW_CHANGED"

--- Событие, сообщающее о появлении нового слота в "переполненной сумке" главного персонажа.
EVENT_INVENTORY_OVERFLOW_SLOT_ADDED = "EVENT_INVENTORY_OVERFLOW_SLOT_ADDED"

--- Событие, сообщающее о пропажи слота в "переполненной сумке" главного персонажа.
EVENT_INVENTORY_OVERFLOW_SLOT_REMOVED = "EVENT_INVENTORY_OVERFLOW_SLOT_REMOVED"

--- Событие об изменении размера инвентаря главного персонажа.
EVENT_INVENTORY_SIZE_CHANGED = "EVENT_INVENTORY_SIZE_CHANGED"

--- Событие об изменении содержимого слота инвентаря главного персонажа.
EVENT_INVENTORY_SLOT_CHANGED = "EVENT_INVENTORY_SLOT_CHANGED"

--- Событие приходит, если была попытка использовать/надеть/снять предмет, но он не доступен для использования (персонаж мертв или предмет и так находится в процессе переодевания).
EVENT_ITEM_DISABLED = "EVENT_ITEM_DISABLED"

--- Событие возникает при успешном перемещении предмета.
EVENT_ITEM_MOVED = "EVENT_ITEM_MOVED"

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

--- Событие посылается каждый раз, когда игрок приносит чужой сундук в свою сокровищницу.
EVENT_LOOT_CHEST_CAPTURED = "EVENT_LOOT_CHEST_CAPTURED"

--- Событие посылается каждый раз, когда игрок бросает сундук на корабле.
EVENT_LOOT_CHEST_DROPPED = "EVENT_LOOT_CHEST_DROPPED"

--- Событие посылается каждый раз, когда игрок возвращает сундук в сокровищницу.
EVENT_LOOT_CHEST_RETURNED = "EVENT_LOOT_CHEST_RETURNED"

--- Событие посылается каждый раз, когда игрок поднимает сундук на корабле.
EVENT_LOOT_CHEST_TAKEN = "EVENT_LOOT_CHEST_TAKEN"

--- Событие возникает при изменение состояния каналов в текущей игровой локации.
EVENT_MAP_CHANNELS_INFO_CHANGED = "EVENT_MAP_CHANNELS_INFO_CHANGED"

--- Уведомление о невозможности зайти в полностью заполненный инстанс.
EVENT_MAP_INSTANCE_FULL = "EVENT_MAP_INSTANCE_FULL"

--- Событие присылается при окончании отсчета времени до выброса из инстанса.
EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED = "EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED"

--- Событие присылается при начале отсчета времени до выброса из инстанса.
EVENT_MAP_INSTANCE_KICK_TIMER_STARTED = "EVENT_MAP_INSTANCE_KICK_TIMER_STARTED"

--- Событие приходит, если было начато улучшение мета-предметов. Пользователю необходимо показать диалог для получения параметров для  avatar.UpgradeMetaItem().
EVENT_META_DIALOG = "EVENT_META_DIALOG"

--- Событие приходит, если необходимо закрыть диалог улучшения мета-предметов.
EVENT_META_UPGRADE_BREAK = "EVENT_META_UPGRADE_BREAK"

--- Уведомление о результатах попытки улучшения мета-предмета.
EVENT_META_UPGRADE_RESULT = "EVENT_META_UPGRADE_RESULT"

--- Событие посылается каждый раз, когда изменилось состояние движение аватара в точку (начали/закончили режим движения в точку, изменилась точка назначения).
EVENT_MOVE_BY_CLICK_CHANGED = "EVENT_MOVE_BY_CLICK_CHANGED"

--- Событие присылается при изменении модификатора зоны мутации.
EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED = "EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED"

--- Событие присылается при изменении заполненности игровой зоны мутации.
EVENT_MUTATION_ZONE_POPULATION_CHANGED = "EVENT_MUTATION_ZONE_POPULATION_CHANGED"

--- Присылается при изменении значения BloodPool некроманта.
EVENT_NECROMANCER_BLOOD_POOL_CHANGED = "EVENT_NECROMANCER_BLOOD_POOL_CHANGED"

--- Уведомление об открытии новой репутации.
EVENT_NEW_REPUTATION_APPEARED = "EVENT_NEW_REPUTATION_APPEARED"

--- Событие посылается каждый раз, когда изменилось состояние диминишинга у объекта.
EVENT_OBJECT_DIMINISHING_CHANGED = "EVENT_OBJECT_DIMINISHING_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние одной из групп диминишинга.
EVENT_OBJECT_DIMINISHING_GROUP_CHANGED = "EVENT_OBJECT_DIMINISHING_GROUP_CHANGED"

--- Событие посылается каждый раз, когда персонаж становится/перестаёт быть пассажиром, к примеру, на двухместном маунте.
EVENT_PASSANGER_STATE_CHANGED = "EVENT_PASSANGER_STATE_CHANGED"

--- Событие, которое приходит после выполнения слеш-команды (в чате) /played.
EVENT_PLAYED_COMMAND_RESPONSE = "EVENT_PLAYED_COMMAND_RESPONSE"

--- Событие посылается, когда главный игрок может пользоваться новой профессией (в данный момент, это способность носить вещи определенного класса).
EVENT_PROFICIENCY_ADDED = "EVENT_PROFICIENCY_ADDED"

--- Событие посылается, когда главный игрок больше не может пользоваться профессией (в данный момент, это способность носить вещи определенного класса).
EVENT_PROFICIENCY_REMOVED = "EVENT_PROFICIENCY_REMOVED"

--- Событие присылается, если игрок готов к окончательному воскрешению из чистилища. Искра уже пришла к нему.
EVENT_READY_FOR_FINALLY_RESPAWN = "EVENT_READY_FOR_FINALLY_RESPAWN"

--- Уведомление об удалении открытой репутации.
EVENT_REPUTATION_DISAPPEARED = "EVENT_REPUTATION_DISAPPEARED"

--- Уведомление об изменении уровня репутации.
EVENT_REPUTATION_LEVEL_CHANGED = "EVENT_REPUTATION_LEVEL_CHANGED"

--- Уведомление об изменении значения репутации.
EVENT_REPUTATION_VALUE_CHANGED = "EVENT_REPUTATION_VALUE_CHANGED"

--- Событие присылается при воскрешении главного игрока с кладбища. Воскрешение с кладбище происходит втоматически или вызовом искры.
EVENT_RESPAWN_FROM_GRAVEYARD = "EVENT_RESPAWN_FROM_GRAVEYARD"

--- Событие присылается при перемещении главного игрока на кладбище и начале ожидания возвращения своей искры. Возвращение на кладбище инициируется avatar.Respawn().
EVENT_RESPAWN_STARTED = "EVENT_RESPAWN_STARTED"

--- Этот запрос посылается, когда кто-то пытается оживить главного игрока, и игрок не успел ответить avatar.ResurrectReply( accept ).
EVENT_RESURRECT_REJECTED = "EVENT_RESURRECT_REJECTED"

--- Этот запрос посылается, когда кто-то пытается оживить главного игрока. В ответ игрок должен ответить avatar.ResurrectReply( accept ). Если игрок не успеет, то прийдёт EVENT_RESURRECT_REJECTED.
EVENT_RESURRECT_REQUESTED = "EVENT_RESURRECT_REQUESTED"

--- Сообщение приходит, когда по каким-либо причинам необходимо показать информацию по определенным предметам. В сообщеннии приходит список ValuedObject-ов - объектов, в которых содержится информация о предметах. Эти объекты можно добавлять в какой либо ValuedText.
EVENT_SHOW_ITEMS_INFO = "EVENT_SHOW_ITEMS_INFO"

--- Главный игрок изучил скилл.
EVENT_SKILL_ADDED = "EVENT_SKILL_ADDED"

--- Изменился опыт, накопленный на уровне скилла.
EVENT_SKILL_IMPROVEMENT_CHANGED = "EVENT_SKILL_IMPROVEMENT_CHANGED"

--- Главный игрок забыл скилл.
EVENT_SKILL_REMOVED = "EVENT_SKILL_REMOVED"

--- Изменился список скиллов главного героя.
EVENT_SKILLS_CHANGED = "EVENT_SKILLS_CHANGED"

--- Изменился уровень скилла главного игрока.
EVENT_SKILL_SCORE_CHANGED = "EVENT_SKILL_SCORE_CHANGED"

--- Событие, которое приходит при невозможности выполнить слеш-команду (в чате).
EVENT_SLASH_COMMAND_FAILED = "EVENT_SLASH_COMMAND_FAILED"

--- Уведомление посылается при любом изменении префикса слеш-команды, в т.ч. при установке пустого префикса после префикса "say" (команда по-умолчанию), хотя действия для последних двух случаев идентичны.
EVENT_SLASH_COMMAND_PREFIX_CHANGED = "EVENT_SLASH_COMMAND_PREFIX_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние панели действий (SpellBook).
EVENT_SPELLBOOK_CHANGED = "EVENT_SPELLBOOK_CHANGED"

--- Событие посылается, когда в книге умений (SpellBook) появилось новое умение.
EVENT_SPELLBOOK_ELEMENT_ADDED = "EVENT_SPELLBOOK_ELEMENT_ADDED"

--- Событие посылается каждый раз, когда изменилось состояние элемента (умения или заклинания) в книге умений (SpellBook). К созданию/удалению элемента это не относится, при этом изменяется книга целиком.
EVENT_SPELLBOOK_ELEMENT_CHANGED = "EVENT_SPELLBOOK_ELEMENT_CHANGED"

--- Событие присылается, когда изменились таланты.
EVENT_TALENTS_CHANGED = "EVENT_TALENTS_CHANGED"

--- Аватар начал разговор с NPC. Приходит после вызова  avatar.StartInteract().
EVENT_TALK_STARTED = "EVENT_TALK_STARTED"

--- Аватар закончил разговор с NPC
EVENT_TALK_STOPPED = "EVENT_TALK_STOPPED"

--- Появилось новое предложение в таргетных продажах.
EVENT_TARGET_SALES_ADDED = "EVENT_TARGET_SALES_ADDED"

--- Произошли какие-то изменения в таргетных продажах.
EVENT_TARGET_SALES_CHANGED = "EVENT_TARGET_SALES_CHANGED"

--- Сообщение приходит, когда одногруппник собирается телепортироваться. Ответить нужно avatar.TeleportOfferReply( accept ). На ответ отводится определённое время.
EVENT_TELEPORT_OFFER_REQUEST = "EVENT_TELEPORT_OFFER_REQUEST"

--- Событие приходит, если нельзя выучить заклинание или умения у тренера. Возвращаются коды всех найденных ошибок. См. LEARN_ERROR_....
EVENT_TRAINER_LEARN_ERROR = "EVENT_TRAINER_LEARN_ERROR"

--- Событие присылается при окончании просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор отзумился от чужого корабля). Теперь у ранее просматриваемого транспорта недоступна информация по устройствам.
EVENT_TRANSPORT_OBSERVING_FINISHED = "EVENT_TRANSPORT_OBSERVING_FINISHED"

--- Событие присылается при началe просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор назумился на другой корабль). Теперь у просматриваемого транспорт доступна информация по устройствам.
EVENT_TRANSPORT_OBSERVING_STARTED = "EVENT_TRANSPORT_OBSERVING_STARTED"

--- Событие посылается каждый раз, когда игрок пытается вернуть сундук в полную сокровищницу.
EVENT_TREASURY_FULL = "EVENT_TREASURY_FULL"

--- Событие о провале попытки снять предмет.
EVENT_UNEQUIP_FAILED = "EVENT_UNEQUIP_FAILED"

--- Событие, которое приходит при невозможности распознать слеш-команду (в чате).
EVENT_UNKNOWN_SLASH_COMMAND = "EVENT_UNKNOWN_SLASH_COMMAND"

--- Событие присылается при появлении у гдавного игрока значения геймдизайнерской переменной.
EVENT_VARIABLE_ADDED = "EVENT_VARIABLE_ADDED"

--- Событие присылается при исчезновении у главного игрока значения геймдизайнерской переменной.
EVENT_VARIABLE_REMOVED = "EVENT_VARIABLE_REMOVED"

--- Событие присылается при изменении значения геймдизайнерской переменной главного игрока.
EVENT_VARIABLE_VALUE_CHANGED = "EVENT_VARIABLE_VALUE_CHANGED"

--- Событие посылается, если не хватает места для покупки.
EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE = "EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE"

--- Событие посылается, если не хватает репутации для покупки.
EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL = "EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL"

--- Событие посылается, если для покупки не хватает очков заработанных за участие в событии.
EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT = "EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT"

--- Событие посылается, если во время покупки предмета он уже был продан кому-то другому.
EVENT_VENDOR_ITEM_ALREADY_SOLD = "EVENT_VENDOR_ITEM_ALREADY_SOLD"

--- Уведомление о невозможности продать предмет (предмет не продается).
EVENT_VENDOR_ITEM_NOT_FOR_SALE = "EVENT_VENDOR_ITEM_NOT_FOR_SALE"

--- Событие посылается в ответ на запрос наличия доступных вещей на продажу у NPC-торговца avatar.RequestVendor().
EVENT_VENDOR_LIST_UPDATED = "EVENT_VENDOR_LIST_UPDATED"

--- Событие, которое приходит после выполнения слеш-команды (в чате) /veteran.
EVENT_VETERANRANKS_COMMAND_RESPONSE = "EVENT_VETERANRANKS_COMMAND_RESPONSE"

--- Событие посылается при изменении счётчика убитых противников в PvP.
EVENT_VICTIM_TRACKER_CHANGED = "EVENT_VICTIM_TRACKER_CHANGED"

--- Событие, которое приходит при невозможности доставить сообщение целевому игроку.
EVENT_WHISPER_FAILED = "EVENT_WHISPER_FAILED"
