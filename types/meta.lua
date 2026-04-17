---@meta

--- CategoryMeta
--- События и функции Lua API, относящиеся к мета-предметам (улучшаемым).

--- Что улучшается при срабатывании шанса особо улучшить метапредмет:
--- улучшается качество метапредмета
---@type integer
META_UPGRADE_QUALITY = nil
--- улучшается уровень метапредмета
---@type integer
META_UPGRADE_LEVEL = nil
--- заменяется исходный предмет на новый
---@type integer
META_UPGRADE_ITEM = nil

--- Текстовый и числовой енум. Префикс для автоматической проверки - "ENUM_UpgradeChanceBehavior".
--- моментальное улучшение
ENUM_UpgradeChanceBehavior_MaximizeImprovement = "ENUM_UpgradeChanceBehavior_MaximizeImprovement"
--- удвоение величины улучшения
ENUM_UpgradeChanceBehavior_DoubleImprovement = "ENUM_UpgradeChanceBehavior_DoubleImprovement"
ENUM_UpgradeChanceBehavior_MaximizeImprovement = "ENUM_UpgradeChanceBehavior_MaximizeImprovement"
ENUM_UpgradeChanceBehavior_DoubleImprovement = "ENUM_UpgradeChanceBehavior_DoubleImprovement"

---@class metaLib
meta = {}

--- Конвертировать метаитем-улучшитель в обычный предмет применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-конвертором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
function meta.ConvertMetaEnhancer(itemId, instrumentId) end

--- Копировать метаитем-улучшитель применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-дубликатором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
function meta.DuplicateMetaEnhancerItem(itemId, instrumentId) end

--- Возвращает стоимость улучшения мета-предмета в меди.
---@param sourceId ObjectId идентификатор предмета который улучшаем
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор агента улучшения
---@return number
function meta.GetMetaUpgradeCost(sourceId, enhancerId, agentId) end

--- Возвращает предсказание по улучшению мета-предмета.
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор предмета-агента, требуемого для улучшения
---@param agentCount integer количество используемых агентов
---@return table|nil
function meta.GetMetaUpgradeResults(sourceId, enhancerId, agentId, agentCount) end

--- Возвращает информацию о том, является ли инструментом для копирования метаитема-улучшителя.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function meta.IsMetaEnhancerDuplicator(itemId) end

--- Необходимо вызывать из скрипта при открытии/закрытии диалога улучшения мета-предметов. Это необходимо для корректого отслеживания закрытия диалога по внутренним причинам ( EVENT_META_UPGRADE_BREAK).
---@param show boolean true, если начали показывать диалог
function meta.ShowMetaUpgradeDialog(show) end

--- Делает попытку улучшения мета-предмета в ответ на  EVENT_META_DIALOG.
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор предмета-агента, требуемого для улучшения
---@param agentCount integer количество используемых агентов
function meta.UpgradeMetaItem(sourceId, enhancerId, agentId, agentCount) end

--- Возвращает true, если можно положить предмет в основы агента мета-предметов.
---@param agentId ObjectId идентификатор улучшаемого предмета
function meta.CanPlaceMetaUpgradeAgent(agentId) end

--- Возвращает true, если можно положить предмет в слот улучшителя мета-предметов.
---@param sourceId ObjectId|nil идентификатор улучшаемого предмета, если требуется
---@param enhancerId ObjectId идентификатор предмета-улучшителя
function meta.CanPlaceMetaUpgradeEnhancer(sourceId, enhancerId) end

--- Возвращает true, если можно положить предмет в основы улучшителя мета-предметов.
---@param sourceId ObjectId идентификатор улучшаемого предмета
function meta.CanPlaceMetaUpgradeSource(sourceId) end

--- Возвращает таблицу с информацией о мета-свойствах предмета.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function meta.GetMetaInfo(itemId) end

--- Возвращает список отдельных целей заданий, для которых нужен этот предмет.
---@param itemId ObjectId идентификатор предмета
---@return nil
function meta.GetRelatedQuestObjectives(itemId) end

--- Возвращает индексированный с 0 список идентификаторов предметов, которые может улучшить этот улучшитель. В случае ошибки возвращает nil.
---@param itemId ObjectId идентификатор предмета
---@return ObjectId[]|nil
function meta.GetUniversalMetaEnchancerItems(itemId) end

-- Events

--- Событие приходит, если был начат крафт (форж/рефорж) итемов. Пользователю необходимо показать диалог для форжа/рефоржа.
EVENT_FORGE_CRAFT_DIALOG = "EVENT_FORGE_CRAFT_DIALOG"

--- Событие приходит, если было начато улучшение мета-предметов. Пользователю необходимо показать диалог для получения параметров для  avatar.UpgradeMetaItem().
EVENT_META_DIALOG = "EVENT_META_DIALOG"

--- Событие приходит, если необходимо закрыть диалог улучшения мета-предметов.
EVENT_META_UPGRADE_BREAK = "EVENT_META_UPGRADE_BREAK"

--- Уведомление о результатах попытки улучшения мета-предмета.
EVENT_META_UPGRADE_RESULT = "EVENT_META_UPGRADE_RESULT"
