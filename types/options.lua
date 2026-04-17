---@meta

--- CategoryOptions
--- Игровые опции реализованы в UISystem. В логике их нет.

---@class optionsLib
options = {}

--- Принимает новые значения для опции или коллекции. После принятия новые значения опций становятся их базовыми. Также принимает результаты режима предварительного просмотра и сбрасывает этот режим.
---@param optionBaseId ObjectId идентификатор опции или коллекции
function options.Apply(optionBaseId) end

--- Сбрасывает опцию или коллекцию в их базовые значения. Также сбрасывает режим предварительного просмотра.
---@param optionBaseId ObjectId идентификатор опции или коллекции
function options.Cancel(optionBaseId) end

--- Отменяет для опции или коллекции режим предварительного просмотра.
---@param optionBaseId ObjectId идентификатор опции или коллекции
function options.CancelPreview(optionBaseId) end

--- Возвращает таблицу с идентификаторами всех блоков для данной группы опций. Блок - наименьшая коллекция опций, содержится в группе. Блоки включают в себя непосредственно опции.
---@param groupId ObjectId идентификатор группы
---@return table
function options.GetBlockIds(groupId) end

--- Возвращает информацию о данной коллекции опций (странице, группе или блоке).
---@param collectionId ObjectId идентификатор коллекции опций
---@return table
function options.GetCollectionInfo(collectionId) end

--- Возвращает таблицу с идентификаторами всех групп для данной страницы опций. Группа - промежуточная коллекция опций, содержится в странице, сама содержит блоки.
---@param pageId ObjectId идентификатор страницы
---@return table
function options.GetGroupIds(pageId) end

--- Возвращает идентификатор пользовательской опции по ее текстовому идентификатору из базы.
---@param sysCustomId string текстовый идентификатор опции
---@return ObjectId|nil
function options.GetOptionByCustomId(sysCustomId) end

--- Возвращает таблицу с идентификаторами всех опций для данного блока. Все опции организованы в блоки, которые в свою очередь организованы в группы, а группы - в страницы.
---@param blockId ObjectId идентификатор блока
---@return table
function options.GetOptionIds(blockId) end

--- Возвращает информацию о данной опции.
---@param optionId ObjectId идентификатор опции
---@return table
function options.GetOptionInfo(optionId) end

--- Возвращает таблицу с идентификаторами всех опций для данного пользовательского типа.
---@param sysCustomType string пользовательский индентификатор для типа опций
---@return table
function options.GetOptionsByCustomType(sysCustomType) end

--- Возвращает таблицу с идентификаторами всех страниц опций. Страница - самая крупная структурная единица из коллекций опций, содержит группы.
---@return table
function options.GetPageIds() end

--- Выставляет для опции или коллекции режим предарительного просмотра. Пока хотя бы для одной опции действует этот режим, настройки не будут сохраняться в конфигурационных файлах и т.п.
---@param optionBaseId ObjectId идентификатор опции или коллекции
function options.Preview(optionBaseId) end

--- Сбрасывает опцию или коллекцию в значения по умолчанию. (Новое и базовое значения устанавливаются в значение по умолчанию.) Также сбрасывает режим предварительного просмотра.
---@param optionBaseId ObjectId идентификатор опции или коллекции
function options.ResetToDefault(optionBaseId) end

--- Задает новое значение для опции. Новое значение будет использовано при выполнении команды Apply.
---@param optionId ObjectId идентификатор опции
---@param index integer новое значение для опции - для дискретного типа данных
function options.SetOptionCurrentIndex(optionId, index) end

--- Обновляет значения всех опций по актуальной информации из системы. Сбрасывает все текущие изменения. (Базовые и новые значения выставляются согласно актуальным системным данным.)
function options.Update() end

-- Events

--- Уведомление об изменении значения опций. Текущие значения больше недействительны и необходимо полное обновление. Для обновления необходимо использовать функцию  options.Update().
EVENT_OPTION_CHANGED = "EVENT_OPTION_CHANGED"
