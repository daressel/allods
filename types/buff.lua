---@meta

--- CategoryBuff
--- События и функции Lua API, относящиеся к буфам.

--- Интерфейсный приоритет бафа. Гарантируется строгий порядок (можно сравнивать как числа), больше - выше приоритет.
ENUM_UIBuffPriority_Medium = "ENUM_UIBuffPriority_Medium"
ENUM_UIBuffPriority_High = "ENUM_UIBuffPriority_High"

---@class buffLib
buff = {}

--- Возвращает информацию о бафах гилдии игрока.
---@return table
function buff.GetBuffs() end

--- Выполняет поиск инстансов баффа с данным sysName на объекте с идентификатором objectId. Возвращает id первого найденного инстанса (порядок обхода не определен) или nil если таковых не нашлось.
---@param objectId ObjectId идентификатор объекта на котором ищем бафф
---@param sysName string внутреннее имя баффа (соответствующее поле в базе для баффа - "sysUIScriptName")
---@return objectId|nil
function buff.GetBuffBySysName(objectId, sysName) end

--- Возвращает информацию о количестве буфов, висящих на данном объекте. Дебуфы тоже считаются буфами.
---@param Id ObjectId
---@return number
function buff.GetBuffCount(Id) end

--- Возвращает динамические параметры баффа: его длительность, оставшееся время действия и количество стаков.
---@param Id ObjectId идентификатор экземпляра бафа
function buff.GetBuffDynamicInfo(Id) end

--- Возвращает информацию о бафе. В качестве аргумента может принимать как id экземпляра бафа, так и ресурса (BuffId) бафа.
---@param Id ObjectId Идентификатор экземпляра (должен быть валидным) или ресурса буфа
---@param includeResourceInfo boolean|nil Включать ли информацию о ресурсе бафа при получении информации о экземпляре бафа. По умолчанию true
function buff.GetBuffInfo(Id, includeResourceInfo) end

--- Возвращает список идентификаторов экземпляров бафов, висящих на данном объекте, и соответствующих критерию поиска.
---@param objectId ObjectId идентификатор объекта.
---@param key BuffId Критерий поиска бафов. Можно искать по ресурсу, по системному имени или по интерфейсному приоритету.
---@return table
function buff.GetBuffInstances(objectId, key) end

--- Возвращает список ресурсов бафов по рангам.
---@param buffId BuffId идентификатор ресурса бафа.
---@return table
function buff.GetBuffRanks(buffId) end

--- Возвращает список валидных экземпляров бафов висящих на данном объекте.
---@param objectId ObjectId ид объекта на котором ищем бафы. Объект должен существовать и иметь бафф-менеджер.
---@param ignoreInvisible boolean|nil игнорировать бафы с needVisualize == false. По умолчанию false.
---@return table
function buff.GetBuffs(objectId, ignoreInvisible) end

--- Возвращает таблицу hash_map&lt;buffId, buffInfo&gt;. Ключи - идентификаторы экземпляров бафа, значения - таблицы информации о бафах. Формат таблиц идентичен  object.GetBuffInfo
---@param data 2
---@param includeResourceInfo boolean|nil Включать ли информацию о ресурсе бафа при получении информации о экземпляре бафа. По умолчанию true
---@param ignoreInvisible boolean|nil игнорировать бафы с needVisualize == false. По умолчанию false.
---@return table
function buff.GetBuffsInfo(data, includeResourceInfo, ignoreInvisible) end

--- Возвращает информацию о буфах с заданными параметрами на данном объекте.
---@param objectId ObjectId идентификатор юнита
---@param isPositive boolean true если бафф положительный, false если отрицательный (дебафф)
---@param isNeedVisualize boolean true если бафф отображаемый, false если скрытый
---@return table
function buff.GetBuffsWithProperties(objectId, isPositive, isNeedVisualize) end

--- Возвращает системное имя для указанного баффа.
---@param Id ObjectId идентификатор или объекта или ресурса баффа
---@return string|nil
function buff.GetBuffSysName(Id) end

--- Возвращает информацию о бафе для отображения в тултипе. Является усеченной версией информации о бафе, но добавлено описание бафа. В качестве аргумента может принимать как id экземпляра бафа, так и ресурса (BuffId) бафа.
---@param Id ObjectId Идентификатор экземпляра (должен быть валидным) или ресурса буфа
function buff.GetBuffTooltipInfo(Id) end

--- Возвращает информацию о диминишинге(сопротивлении контролю) объекта.
---@param objectId ObjectId идентификатор объекта
---@return table
function buff.GetDiminishingState(objectId) end

--- Проверяет может ли интерактивный объект иметь бафы. Если аргумент не является id интерактивного объекта - вернет false (без ошибки).
---@param id any произвольное значение
---@return boolean
function buff.HasBuffManager(id) end

--- Возвращает true, если аргумент является id валидного (на момент вызова функции) экземпляра бафа. Гарантируется что если бафф валиден, то он останется валидным до конца обработки текущего события в lua.
---@param id any произвольное значение
---@return boolean
function buff.IsValidBuff(id) end

--- Снимает позитивный бафф с объекта, если этот бафф можно снять (прописано в его свойствах). Также бафф можно снять только с персонажа главного игрока, его питомца и его корабля.
---@param buffId ObjectId иденетификатор баффа
function buff.RemoveBuff(buffId) end

-- Events

--- Событие посылается в случае невозможности снять бафф с аватара с помощью avatar.RemoveBuff( buffIndex ).
EVENT_AVATAR_BUFF_REMOVING_FAILED = "EVENT_AVATAR_BUFF_REMOVING_FAILED"

--- Событие посылается каждый раз, когда у гилдии появляется новый баф. Если апдейтится старый, то ничего не приходит.
EVENT_GUILD_BUFF_ADDED = "EVENT_GUILD_BUFF_ADDED"

--- Событие посылается каждый раз, когда у гилдии игрока меняется набор бафов.
EVENT_GUILD_BUFFS_CHANGED = "EVENT_GUILD_BUFFS_CHANGED"

--- Событие посылается каждый раз, когда у объекта появляется новый баф. Если обновляются параметры существующего, то приходит  EVENT_OBJECT_BUFF_CHANGED.
EVENT_OBJECT_BUFF_ADDED = "EVENT_OBJECT_BUFF_ADDED"

--- Событие посылается каждый раз, когда у объекта изменяются свойства существующего бафа, а именно:
EVENT_OBJECT_BUFF_CHANGED = "EVENT_OBJECT_BUFF_CHANGED"

--- Событие посылается каждый раз, когда у объекта появляется новый бафф для которого требуется визуализация прогресса (бафф имеет группу castbar).
EVENT_OBJECT_BUFF_PROGRESS_ADDED = "EVENT_OBJECT_BUFF_PROGRESS_ADDED"

--- Событие посылается каждый раз, когда у объекта изменяются свойства бафа для которого требуется визуализация прогресса (бафф имеет группу castbar).
EVENT_OBJECT_BUFF_PROGRESS_CHANGED = "EVENT_OBJECT_BUFF_PROGRESS_CHANGED"

--- Событие посылается каждый раз, когда у объекта пропадает бафф для которого требуется визуализация прогресса (бафф имеет группу castbar).
EVENT_OBJECT_BUFF_PROGRESS_REMOVED = "EVENT_OBJECT_BUFF_PROGRESS_REMOVED"

--- Событие посылается каждый раз, когда у объекта пропадает баф.
EVENT_OBJECT_BUFF_REMOVED = "EVENT_OBJECT_BUFF_REMOVED"

--- Событие посылается не чаще одного раза в кадр, если в данном кадре у объекта изменился набор буфов. Подразумевается именно добавление или удаление бафов, но не изменение свойств существующих.
EVENT_OBJECT_BUFFS_CHANGED = "EVENT_OBJECT_BUFFS_CHANGED"

--- Событие посылается не чаще одного раза в кадр, если в данном кадре у какого-либо из объектов вокруг игрока меняется информация о каком либо буфе.
EVENT_OBJECT_BUFFS_ELEMENT_CHANGED = "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние диминишинга у объекта.
EVENT_OBJECT_DIMINISHING_CHANGED = "EVENT_OBJECT_DIMINISHING_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние одной из групп диминишинга.
EVENT_OBJECT_DIMINISHING_GROUP_CHANGED = "EVENT_OBJECT_DIMINISHING_GROUP_CHANGED"
