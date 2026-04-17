---@meta

--- CategoryWorldSecret
--- Функции и события Lua API библиотеки avatar для работы с тайнами мира.

---@class worldSecretLib
worldSecret = {}

--- Возвращает список описаний компонент тайны мира.
---@param objectId ObjectId идентификатор тайны мира
---@return table
function worldSecret.GetSecretComponents(objectId) end

--- Возвращает описание тайны мира.
---@param objectId ObjectId идентификатор тайны мира
---@return table|nil
function worldSecret.GetSecretInfo(objectId) end

--- Возвращает список идентификаторов всех тайн мира, которые уже доступны или будут доступны когда-то аватару.
---@return table
function worldSecret.GetSecrets() end

--- Возвращает список идентификаторов тайн мира, которые может завершить этот объект. В списке только тайны мира, открытые игроком. То есть объект может быть object.HasWorldSecret(objectId), но иметь пустой список тайн, если ни одна тайна ещё не была открыта (начата для исследования) игроком.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return table
function worldSecret.GetWorldSecrets(objectId) end

--- Возвращает true, если интерактивный объект может завершить (и выдать награду) какую-либо тайну мира. Иначе false.
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function worldSecret.HasWorldSecret(id) end

-- Events

--- Оповещение о раскрытии всех компонент тайны мира. Теперь главное задание тайны мира можно сдать.
EVENT_SECRET_CLOSED = "EVENT_SECRET_CLOSED"

--- Оповещение о завершении компоненты тайны мира. Сдан завершающий квест по этой компоненте.
EVENT_SECRET_COMPONENT_CLOSED = "EVENT_SECRET_COMPONENT_CLOSED"

--- Оповещение о завершении тайны мира. Задание сдано, награда получена.
EVENT_SECRET_FINISHED = "EVENT_SECRET_FINISHED"

--- Оповещение о изменении статуса тайны мира, которую может принять интерактивный объект. Происходит, если интерактивный объект есть в реплике и изменился статус (не сделан/сделана/сдана) какой-то тайны мира. В этом случае, например, можно поменять знак над головой этого объекта.
EVENT_SECRET_FINISHER_STATUS_CHANGED = "EVENT_SECRET_FINISHER_STATUS_CHANGED"

--- Оповещение об открытии новой тайны мира.
EVENT_SECRET_OPENED = "EVENT_SECRET_OPENED"

--- Оповещение об изменении тайн мира. Например при изменении фракции.
EVENT_SECRETS_CHANGED = "EVENT_SECRETS_CHANGED"
