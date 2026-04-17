---@meta

--- CategoryChat
--- Функции Lua Api библиотеки avatar, связанные с чатом.

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

---@class chatLib
chat = {}

--- Очищает строку ввода с префиксами/слеш-командами.
function chat.ClearChatInput() end

--- Возвращает состояние строки ввода с префиксами/слеш-командами. Строка ввода получается в результате разбора исходного текста на наличие слеш-команд.
function chat.GetChatInput() end

--- Возвращает список команд, являющихся подходящими вариантами-продолжениями для переданной строки. Правила описаны на странице: [:InterfaceChat#head-cac61000afaf8de829a2e1c3c58685451ab696d1: InterfaceChat, строка ввода текста].
---@param text WString строка, для которой надо вернуть похожие команды
---@return table
function chat.GetChatInputSimilarCommands(text) end

--- Задает аргумент слеш-команды для строки ввода.
---@param arg WString аргумент команды
function chat.SetChatInputArg(arg) end

--- Меняет состояние строки ввода чата с префиксами/слеш-командами. Исходная строка разбирается на предмет наличия в ней слеш-команд, текста и информации о предметах.
---@param wtEditLine EditLineSafe строка ввода
function chat.SetChatInputData(wtEditLine) end

--- Устанавливает максимальное количество записей в истории ввода в строку чата. Начальное значение 10, предельное 100.
---@param limit integer максимальное количество записей
function chat.SetChatInputHistoryMaxSize(limit) end

--- Делает переход на шаг вперед при обзоре истории ввода и возвращает строку ввода чата в предыдущее состояние.
---@param wtEditLine EditLineSafe строка ввода
function chat.SetChatInputNextData(wtEditLine) end

--- Делает переход на шаг назад при обзоре истории ввода и возвращает строку ввода чата в предыдущее состояние.
---@param wtEditLine EditLineSafe строка ввода
function chat.SetChatInputPrevData(wtEditLine) end

--- Назначить цель слеш-команды для строки ввода(для межсервера).
---@param uniqueId UniqueId уникальный идентификатор персонажа
function chat.SetChatInputTarget(uniqueId) end

--- Меняет состояние строки ввода с префиксами/слеш-командами. Исходная строка разбирается на предмет наличия в ней слеш-команд.
---@param text WString исходная строка (чаще всего из EditLine)
---@param cursorPos integer позиция курсора
function chat.SetChatInputText(text, cursorPos) end

--- Задает тип слеш-команды (префикс) для строки ввода. Работает только для команд с префиксами. Текст слеш-команды при этом очищается.
---@param sysCmdType string тип команды (ее идентификатор)
function chat.SetChatInputType(sysCmdType) end

-- Events

--- Уведомление о невозможности отправить сообщение в чат. Сообщения нельзя отсылать чаще, чем через определенный интервал времени для предотвращения спама.
EVENT_CANT_SEND_CHAT_BY_DELAY = "EVENT_CANT_SEND_CHAT_BY_DELAY"

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

--- Текстовая эмоция (/emote) от другого игрока.
EVENT_CUSTOM_EMOTE = "EVENT_CUSTOM_EMOTE"

--- Приходит, если было прислано сообщение от гейммастеров.
EVENT_GLOBAL_NOTICE = "EVENT_GLOBAL_NOTICE"

--- Событие, которое приходит после выполнения слеш-команды (в чате) /played.
EVENT_PLAYED_COMMAND_RESPONSE = "EVENT_PLAYED_COMMAND_RESPONSE"

--- Событие, которое приходит при невозможности выполнить слеш-команду (в чате).
EVENT_SLASH_COMMAND_FAILED = "EVENT_SLASH_COMMAND_FAILED"

--- Уведомление посылается при любом изменении префикса слеш-команды, в т.ч. при установке пустого префикса после префикса "say" (команда по-умолчанию), хотя действия для последних двух случаев идентичны.
EVENT_SLASH_COMMAND_PREFIX_CHANGED = "EVENT_SLASH_COMMAND_PREFIX_CHANGED"

--- Событие, которое приходит при невозможности распознать слеш-команду (в чате).
EVENT_UNKNOWN_SLASH_COMMAND = "EVENT_UNKNOWN_SLASH_COMMAND"

--- Событие, которое приходит после выполнения слеш-команды (в чате) /veteran.
EVENT_VETERANRANKS_COMMAND_RESPONSE = "EVENT_VETERANRANKS_COMMAND_RESPONSE"

--- Событие, которое приходит при невозможности доставить сообщение целевому игроку.
EVENT_WHISPER_FAILED = "EVENT_WHISPER_FAILED"
