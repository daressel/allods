---@meta

---@class optionsLib
options = {}

---@class OptionsGetCollectionInfoResult
---@field isEnabled boolean можно ли менять коллекцию и ее элементы
---@field isNeedPreview boolean нужно ли использовать режим предварительного просмотра
---@field isPreview boolean находится ли какой-нибудь элемент коллекции в режиме предварительного просмотра
---@field sysCustomType string уникальный идентификатор коллекции для возможной специальной обработки
---@field name string название коллекции
---@field description string описание/тултип/комментарий и т.п. коллекции

---@class OptionsGetOptionInfoResult
---@field name string название для значения
---@field description string описание для значения
---@field stringValue string текстовое значение, если используются символьные константы
---@field floatValue number реальная величина, используемая для данного значения (индекса)

---Принимает новые значения для опции или коллекции. После принятия новые значения опций становятся их базовыми. Также принимает результаты режима предварительного просмотра и сбрасывает этот режим.
---@param optionBaseId ObjectId идентификатор опции или коллекции
---@return нет
function options.Apply(optionBaseId) end

---Сбрасывает опцию или коллекцию в их базовые значения. Также сбрасывает режим предварительного просмотра.
---@param optionBaseId ObjectId идентификатор опции или коллекции
---@return нет
function options.Cancel(optionBaseId) end

---Отменяет для опции или коллекции режим предварительного просмотра.
---@param optionBaseId ObjectId идентификатор опции или коллекции
---@return нет
function options.CancelPreview(optionBaseId) end

---Возвращает таблицу с идентификаторами всех блоков для данной группы опций. Блок - наименьшая коллекция опций, содержится в группе. Блоки включают в себя непосредственно опции.
---@param groupId ObjectId идентификатор группы
---@return таблица с идентификаторами блоков, индексация [0..]
function options.GetBlockIds(groupId) end

---Возвращает информацию о данной коллекции опций (странице, группе или блоке).
---@param collectionId ObjectId идентификатор коллекции опций
---@return OptionsGetCollectionInfoResult
function options.GetCollectionInfo(collectionId) end

---Возвращает таблицу с идентификаторами всех групп для данной страницы опций. Группа - промежуточная коллекция опций, содержится в странице, сама содержит блоки.
---@param pageId ObjectId идентификатор страницы
---@return таблица с идентификаторами групп, индексация [0..]
function options.GetGroupIds(pageId) end

---Возвращает идентификатор пользовательской опции по ее текстовому идентификатору из базы.
---@param sysCustomId string текстовый идентификатор опции
---@return ObjectId|nil
function options.GetOptionByCustomId(sysCustomId) end

---Возвращает таблицу с идентификаторами всех опций для данного блока. Все опции организованы в блоки, которые в свою очередь организованы в группы, а группы - в страницы.
---@param blockId ObjectId идентификатор блока
---@return таблица с идентификаторами опций, индексация [0..]
function options.GetOptionIds(blockId) end

---Возвращает информацию о данной опции.
---@param optionId ObjectId идентификатор опции
---@return OptionsGetOptionInfoResult
function options.GetOptionInfo(optionId) end

---Возвращает таблицу с идентификаторами всех опций для данного пользовательского типа.
---@param sysCustomType string пользовательский индентификатор для типа опций
---@return таблица с идентификаторами опций, индексация [0..], тип значений: ObjectId
function options.GetOptionsByCustomType(sysCustomType) end

---Возвращает таблицу с идентификаторами всех страниц опций. Страница - самая крупная структурная единица из коллекций опций, содержит группы.
---@return таблица с идентификаторами страниц, индексация [0..]
function options.GetPageIds() end

---Выставляет для опции или коллекции режим предарительного просмотра. Пока хотя бы для одной опции действует этот режим, настройки не будут сохраняться в конфигурационных файлах и т.п.
---@param optionBaseId ObjectId идентификатор опции или коллекции
---@return нет
function options.Preview(optionBaseId) end

---Сбрасывает опцию или коллекцию в значения по умолчанию. (Новое и базовое значения устанавливаются в значение по умолчанию.) Также сбрасывает режим предварительного просмотра.
---@param optionBaseId ObjectId идентификатор опции или коллекции
---@return нет
function options.ResetToDefault(optionBaseId) end

---Задает новое значение для опции. Новое значение будет использовано при выполнении команды Apply.
---@param optionId ObjectId идентификатор опции
---@param index integer новое значение для опции - для дискретного типа данных
---@return нет
function options.SetOptionCurrentIndex(optionId, index) end

---Обновляет значения всех опций по актуальной информации из системы. Сбрасывает все текущие изменения. (Базовые и новые значения выставляются согласно актуальным системным данным.)
---@return нет
function options.Update() end
