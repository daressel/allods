---@meta

---@class rulesLib
rules = {}

---@class RulesBillingInfoGetBonusInfoResult
---@field name string название
---@field description string текстовое описание
---@field currency String валюта ItemMall-а
---@field limitTotal integer верхний предел бонуса (см. также isSinglePayment)
---@field bonusPercent number бонусный процент
---@field isSinglePayment boolean если true, то бонус прекращает действие после первого же платежа, не дожидаясь достижения limitTotal
---@field limitUnused number ещё неиспользованный остаток бонуса; nil если информации нет (см. также rules.BillingInfoUpdate())
---@field loyalPart integer часть бонуса от лояльности
---@field updateTime table или nil nil если нет информации; иначе время последнего изменения информации, таблица с полями:
---@field year integer год
---@field month number месяц (1-12, начиная с января)
---@field day integer день месяца
---@field wday integer день недели (1-7, начиная с воскресенья)
---@field hour integer час
---@field minute integer минута
---@field second integer секунда
---@field msec integer миллисекунда
---@field removeTime table или nil nil если нет информации; иначе время, когда бонус прекратит действие; формат аналогичен формату updateTime
---@field image TextureId текстура с иконкой

---@class RulesGetEventCounterResult
---@field value integer текущее значение счётчика
---@field limit integer максимальное значение счётчика

---@class RulesGetEventInfoResult
---@field id ObjectId идентификатор описания правил эвента
---@field resourceId RuleId уникальный идентификатор ресурса евента
---@field name string название эвента
---@field description string текстовое описание эвента
---@field sysName string нелокализуемый строковый идентификатор для опознания избранных эвентов скриптами UI
---@field sysDebugName string|nil уникальный строковый идентификатор события для дебага (путь к файлу ресурса)
---@field isActive boolean активно ли событие
---@field rating integer рейтинг эвента
---@field level integer рекомендуемый уровень игроков
---@field zonesMapId ObjectId|nil если указано, то идентификатор интерфейсной карты, на которой произходит эвент
---@field factionId FactionId|nil если указано, то FactionId игроков, участвующих в эвенте.
---@field reward table если указано, то таблица с описанием награды, получаемой игроками, участвующими в эвенте. Формат полей таблицы, как в avatar.GetQuestReward( questId )
---@field types table таблица принадлежности эвента какому либо специальному типу. Элементы таблицы с индексами типа события (RULE_TYPE_...) содержат true, остальные не заполнены
---@field location QuestLocation|nil если задана, то точка начала эвента

---@class RulesGetNotificationInfoResult
---@field type number тип нотификации, от которого зависит изображение на HUD-е и действие по клику мышью
---@field sysType string системное название типа нотификации
---@field text string|nil кастомный текст, выводимый поверх изображения
---@field image TextureId|nil идентификатор кастомной текстуры для изображения нотификации

---@class RulesGetWishmasterResult
---@field name string название Волшебной Лампы
---@field description string текстовое описание Волшебной Лампы
---@field paymentMultiplier number модификатор цены кристаллов
---@field bonusPaymentLimit integer ограничение бонуса в кристаллах
---@field image TextureId текстура с иконкой Волшебной Лампы

---@class RulesGetWishmasterMultiplyingInfosResult
---@field name string название Волшебной лампы
---@field description string текстовое описание Волшебной лампы
---@field isPreviousStepSuccess boolean было ли предыдущее уведомление успешным, если его не было, всегда true
---@field currentBonusValue number текущий бонус (величина увеличения платежа)
---@field stepsLeft integer сколько еще попыток увеличения бонуса осталось
---@field stepMultiplier number если остались попытки увеличения бонуса, то величина увеличения в случае успеха
---@field resourceId WishmasterResourceId идентификатор Волшебной лампы
---@field image TextureId текстура с иконкой Волшебной лампы

---Получить список бонусов, имеющихся в данный момент у аккаунта.
---@return nil|table
function rules.BillingInfoGetBonuses() end

---Получить описание бонуса.
---@return RulesBillingInfoGetBonusInfoResult
function rules.BillingInfoGetBonusInfo() end

---Запросить обновление информации о бонусах, имеющихся в данный момент у аккаунта. Большая часть информации о бонусах обновляется автоматически, однако неиспользованный остаток обновляется только по запросу. В ответ на запрос приходит EVENT_BILLINGINFO_BONUS_STATUS_CHANGED.
---@return нет
function rules.BillingInfoUpdate() end

---Получить id игрового эвента по его RuleId.
---@param ruleId RuleId идентификатор рула (ресурс эвента)
---@param getHidden boolean|nil передавать идентификаторы скрытых эвентов, по умолчанию false
---@return ObjectId или nil
function rules.GetEventByRuleId(ruleId, getHidden) end

---Получить id игрового эвента по его sysName (см. поле sysName у  rules.GetEventInfo( eventRuleId )).
---@param sysName string нелокализуемый строковый идентификатор
---@param getHidden boolean|nil передавать идентификаторы скрытых эвентов, по умолчанию false
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return ObjectId или nil
function rules.GetEventBySysName(sysName, getHidden, eventRuleId) end

---Возвращает значения счётчика игрового эвента. Для обычных эвентов максимальное значение счётчика равно 0. Текущее значение счётчика может быть больше, чем максимальное значение.
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return RulesGetEventCounterResult
function rules.GetEventCounter(eventRuleId) end

---Получить описание правил игрового эвента.
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return RulesGetEventInfoResult
function rules.GetEventInfo(eventRuleId) end

---Получить список идентификаторов игровых эвентов. Может вернуть пустой список, если он еще не получен с сервера. При первом получении и обновлениях будет приходить  EVENT_MISSION_RULES_CHANGED.
---@param getHidden boolean|nil возвращать скрытые эвенты, по умолчанию false
---@return ObjectId[]
function rules.GetEvents(getHidden) end

---Получить описание времени срабатывания правил игрового эвента. TODO: нужно переделать время/дату на использование локализуемого формата (из Windiws) и локального времени игрока.
---@param eventRuleId ObjectId идентификатор правил эвента
---@return tables[]
function rules.GetEventTimeIntervals(eventRuleId) end

---Получить описание правил игрового эвента. См.  ENUM_RuleNotificationType_....
---@param eventRuleId ObjectId идентификатор описания правил эвента
---@return RulesGetNotificationInfoResult
function rules.GetNotificationInfo(eventRuleId) end

---Получить описание Волшебной Лампы.
---@return RulesGetWishmasterResult
function rules.GetWishmaster() end

---Возвращает информацию по последним уведомлениям о Волшебной лампе.
---@return RulesGetWishmasterMultiplyingInfosResult
function rules.GetWishmasterMultiplyingInfos() end

---Получить список идентификаторов интерфейсных карт, которые доступны в календаре.
---@return table|ObjectId
function rules.GetZonesMaps() end

---Попытка увеличить бонус для Волшебной лампы.
---@param resourceId WishmasterResourceId идентификатор Волшебной лампы
---@return нет
function rules.WishmasterRollMultiplying(resourceId) end
