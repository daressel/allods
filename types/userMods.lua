---@meta

--- CategoryUserMods
--- События и функции Lua API, относящиеся к специальной поддержке пользовательских дополнений.

--- Возможные статусы состояния аддона.
--- исполнение кода аддона не вызывает ошибок
ENUM_ADDON_HEALTH_STATUS_GOOD = "ENUM_ADDON_HEALTH_STATUS_GOOD"
--- исполнение кода аддона вызывает умеренное количество ошибок
ENUM_ADDON_HEALTH_STATUS_AVERAGE = "ENUM_ADDON_HEALTH_STATUS_AVERAGE"
--- исполнение кода аддона вызывает чрезмерное количество ошибок
ENUM_ADDON_HEALTH_STATUS_BAD = "ENUM_ADDON_HEALTH_STATUS_BAD"

---@class userModsLib
userMods = {}

--- Возвращает переданный ValuedText в виде строки - развернутого html представления этого текста.
---@param valuedText ValuedText переданный объект
---@param oneLine boolean|nil Если true \ nil то вывод будет в 1 строку, если false то вывод будет в виде форматированного html с отступами и переносами строк.
---@return string
function userMods.FromValuedText(valuedText, oneLine) end

--- Возвращает обычную строку по исходной локализуемой.
---@param localizedText WString исходный локализуемый текст
---@return string
function userMods.FromWString(localizedText) end

--- Возвращает уникальный приватный строковый идентификатор аккаунта игрока. Представляет собой строку длинной 32 символа, состоящую из символов шестнадцатеричной системы исчисления, записанных в верхнем регистре.
---@return string
function userMods.GetAccountUniqueId() end

--- Возвращает таблицу с секцией для текущего персонажа игрока из локального пользовательского конфига или nil, если секция не найдена. Секции предназначены исключительно для сохранения настроек пользовательских дополнений. Они независимы с секциями для оригинальных интерфейсов игры.
---@param sysName string название секции
---@return table|nil
function userMods.GetAvatarConfigSection(sysName) end

--- Возвращает lua стектрейс.
---@return table
function userMods.GetCallStack() end

--- Возвращает таблицу с секцией из локального пользовательского конфига или nil, если секция не найдена. Секции предназначены исключительно для сохранения настроек пользовательских дополнений. Они независимы с секциями для оригинальных интерфейсов игры.
---@param sysName string название секции
---@return table|nil
function userMods.GetGlobalConfigSection(sysName) end

--- Возвращает постоянный уникальный строковый идентификатор произвольного ресурса. Представляет собой строку длинной 32 символа, состоящую из символов шестнадцатеричной системы исчисления, записанных в верхнем регистре.
---@return string
function userMods.GetResourcePersistentId() end

--- Посылка события с данным именем и параметрами пользовательскому дополнению.
---@param eventName string идентификатор события
---@param eventParams table таблица с параметрами события, у каждого события свой набор параметров
function userMods.SendEvent(eventName, eventParams) end

--- Выводит сообщение в чат в каналы группы Системные -&gt; Дополнения. Сообщение не пересылается другим игрокам.
---@param message WString текст сообщения
---@param messageLevel string|nil имя канала, по умолчанию message
function userMods.SendSelfChatMessage(message, messageLevel) end

--- Сохраняет/удаляет таблицу с секцией для текущего персонажа игрока в локальном пользовательском конфиге. Секции предназначены исключительно для сохранения настроек пользовательских дополнений. Они независимы с секциями для оригинальных интерфейсов игры.
---@param sysName string название секции
---@param section table|nil таблица с данными секции, nil - для удаления секции
function userMods.SetAvatarConfigSection(sysName, section) end

--- Сохраняет/удаляет таблицу с секцией в локальном пользовательском конфиге для приложения. Секции предназначены исключительно для сохранения настроек пользовательских дополнений. Они независимы с секциями для оригинальных интерфейсов игры.
---@param sysName string название секции
---@param section table|nil таблица с данными секции, nil - для удаления секции
function userMods.SetGlobalConfigSection(sysName, section) end

--- Возвращает локализуемую строку по обычной.
---@param sysText string исходная строка
---@return WString
function userMods.ToWString(sysText) end

-- Events

--- Событие присылается при изменении показателей состояния аддона. Основным показателем состояния является '''статус состояния аддона''' - количество ассертов возбуждаемых исполнением кода скрипта аддона. В зависимости от количества и частоты возбуждаемых ассертов статус состояния может принимать значения в диапазоне  ENUM_ADDON_HEALTH_STATUS_...
EVENT_ADDON_HEALTH_CHANGED = "EVENT_ADDON_HEALTH_CHANGED"

--- Событие присылается когда система фиксирует критически большое ухудшение производительность клиента из-за конкретного аддона.
EVENT_ADDON_REDUCE_PERFOMANCE = "EVENT_ADDON_REDUCE_PERFOMANCE"
