---@meta

--- CategoryRules
--- События и функции Lua API, относящиеся к внутриигровым событиям - эвентам и правилам, описываюх их.

--- Удачно ли выполнен запрос  rules.BillingInfoUpdate() или по какой причине неудача.
ENUM_MsgGetBonusListResultResult_Success = "ENUM_MsgGetBonusListResultResult_Success"
ENUM_MsgGetBonusListResultResult_InternalError = "ENUM_MsgGetBonusListResultResult_InternalError"
ENUM_MsgGetBonusListResultResult_BillingUnavailable = "ENUM_MsgGetBonusListResultResult_BillingUnavailable"

--- Тип нотификации на HUD-e об внутриигровом эвенте:
--- Просто какое-то событие в календаре
ENUM_RuleNotificationType_Default = "ENUM_RuleNotificationType_Default"
--- Шкатулка
ENUM_RuleNotificationType_Box = "ENUM_RuleNotificationType_Box"
--- Ларец
ENUM_RuleNotificationType_Chest = "ENUM_RuleNotificationType_Chest"
--- Распродажа кристаллов
ENUM_RuleNotificationType_CrystalSale = "ENUM_RuleNotificationType_CrystalSale"
--- Изменение цены на товары в ИМ
ENUM_RuleNotificationType_PriceChanging = "ENUM_RuleNotificationType_PriceChanging"
--- Новый ассортимент в ИМ
ENUM_RuleNotificationType_New = "ENUM_RuleNotificationType_New"
ENUM_RuleNotificationType_Default = "ENUM_RuleNotificationType_Default"
ENUM_RuleNotificationType_Box = "ENUM_RuleNotificationType_Box"
ENUM_RuleNotificationType_Chest = "ENUM_RuleNotificationType_Chest"
ENUM_RuleNotificationType_CrystalSale = "ENUM_RuleNotificationType_CrystalSale"
ENUM_RuleNotificationType_PriceChanging = "ENUM_RuleNotificationType_PriceChanging"
ENUM_RuleNotificationType_New = "ENUM_RuleNotificationType_New"

--- Тип внутриигрового эвента:
--- рекламная акция и т.п.
---@type integer
RULE_TYPE_ACTION = nil
--- праздники
---@type integer
RULE_TYPE_HOLYDAY = nil
--- одиночные
---@type integer
RULE_TYPE_SINGLE = nil
--- групповые
---@type integer
RULE_TYPE_GROUP = nil
--- гильдейские
---@type integer
RULE_TYPE_GUILD = nil

---@class rulesLib
rules = {}

--- Получить список бонусов, имеющихся в данный момент у аккаунта.
---@return nil
function rules.BillingInfoGetBonuses() end

--- Получить описание бонуса.
---@return table
function rules.BillingInfoGetBonusInfo() end

--- Запросить обновление информации о бонусах, имеющихся в данный момент у аккаунта. Большая часть информации о бонусах обновляется автоматически, однако неиспользованный остаток обновляется только по запросу. В ответ на запрос приходит EVENT_BILLINGINFO_BONUS_STATUS_CHANGED.
function rules.BillingInfoUpdate() end

--- Получить id игрового эвента по его RuleId.
---@param ruleId RuleId идентификатор рула (ресурс эвента)
---@param getHidden boolean|nil передавать идентификаторы скрытых эвентов, по умолчанию false
---@return ObjectId
function rules.GetEventByRuleId(ruleId, getHidden) end

--- Получить id игрового эвента по его sysName (см. поле sysName у  rules.GetEventInfo( eventRuleId )).
---@param sysName string нелокализуемый строковый идентификатор
---@param getHidden boolean|nil передавать идентификаторы скрытых эвентов, по умолчанию false
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return ObjectId
function rules.GetEventBySysName(sysName, getHidden, eventRuleId) end

--- Возвращает значения счётчика игрового эвента.
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return table|nil
function rules.GetEventCounter(eventRuleId) end

--- Получить описание правил игрового эвента.
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return table|nil
function rules.GetEventInfo(eventRuleId) end

--- Получить список идентификаторов игровых эвентов. Может вернуть пустой список, если он еще не получен с сервера. При первом получении и обновлениях будет приходить  EVENT_MISSION_RULES_CHANGED.
---@param getHidden boolean|nil возвращать скрытые эвенты, по умолчанию false
---@return table
function rules.GetEvents(getHidden) end

--- Получить описание времени срабатывания правил игрового эвента.
---@param eventRuleId ObjectId идентификатор правил эвента
---@return table
function rules.GetEventTimeIntervals(eventRuleId) end

--- Получить описание правил игрового эвента.
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return table|nil
function rules.GetNotificationInfo(eventRuleId) end

--- Получить описание Волшебной Лампы.
---@return nil
function rules.GetWishmaster() end

--- Возвращает информацию по последним уведомлениям о Волшебной лампе.
---@return table
function rules.GetWishmasterMultiplyingInfos() end

--- Получить список идентификаторов интерфейсных карт, которые доступны в календаре.
---@return table
function rules.GetZonesMaps() end

--- Попытка увеличить бонус для Волшебной лампы.
---@param resourceId WishmasterResourceId идентификатор Волшебной лампы
function rules.WishmasterRollMultiplying(resourceId) end

-- Events

--- Уведомление о том, что изменилась, добавлена или удалена информация о бонусе (та её часть, которая не требует  rules.BillingInfoUpdate()).
EVENT_BILLINGINFO_BONUS_CHANGED = "EVENT_BILLINGINFO_BONUS_CHANGED"

--- Уведомление о том, что пришёл ответ на запрос об обновлении информации о бонусах (см. rules.BillingInfoUpdate()).
EVENT_BILLINGINFO_BONUS_STATUS_CHANGED = "EVENT_BILLINGINFO_BONUS_STATUS_CHANGED"

--- Уведомление об появлении игрового события.
EVENT_MISSION_RULE_ADDED = "EVENT_MISSION_RULE_ADDED"

--- Уведомление об изменении игрового события.
EVENT_MISSION_RULE_CHANGED = "EVENT_MISSION_RULE_CHANGED"

--- Уведомление об изменении счётчика игрового события.
EVENT_MISSION_RULE_COUNTER_CHANGED = "EVENT_MISSION_RULE_COUNTER_CHANGED"

--- Уведомление об ичезновении игрового события.
EVENT_MISSION_RULE_REMOVED = "EVENT_MISSION_RULE_REMOVED"

--- Уведомление об изменении информации об игровых событиях.
EVENT_MISSION_RULES_CHANGED = "EVENT_MISSION_RULES_CHANGED"

--- Уведомление об открытии страницы с полным текстом новости в окне нотификации новостей.
EVENT_NEWS_POST_LOADED = "EVENT_NEWS_POST_LOADED"

--- Уведомление о выборе новости в окне нотификации новостей (для перехода на соответствующее событие во внутриигровом календаре).
EVENT_NEWS_POST_SELECTED = "EVENT_NEWS_POST_SELECTED"

--- Уведомление об изменении информации о Волшебной лампе.
EVENT_WISHMASTER_CHANGED = "EVENT_WISHMASTER_CHANGED"

--- Уведомление о результатах и возможностях улучшения Волшебной лампы.
EVENT_WISHMASTER_MULTIPLYING = "EVENT_WISHMASTER_MULTIPLYING"
