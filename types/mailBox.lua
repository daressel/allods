---@meta

---@class mailBoxLib
mailBox = {}

---@class MailBoxGetInfoResult
---@field totalMessages integer общее количество писем в почтовом ящике
---@field unreadMessages integer количество непрочитанных писем в почтовом ящике

---@class MailBoxGetLimitsResult
---@field maxMailItemsCount integer ограничение на максимальное число предметов в письме

---@class MailBoxGetMailsResult
---@field mailId ObjectId идентификатор письма
---@field createdAt LuaFullDateTime дата создания
---@field owneredAt LuaFullDateTime дата получения
---@field remainingTime : table таблица с информацией об оставшемся времени нахождения письма в ящике, поля:
---@field d integer дни
---@field h integer часы
---@field m integer минуты
---@field s integer секунды
---@field participantName string имя получателя или отправителя. Замечание: нужно игнорировать, если письмо системное (см. поле flags.fromSystem)
---@field flags table поля:
---@field accountShared boolean
---@field fromSystem boolean письмо от системных сервисов
---@field readByOwner boolean прочитано нынешним владельцем письма (если письмо было возвращено, то владелец и адресат разные)
---@field readByRecipient boolean прочитано адресатом письма
---@field returnAllowed boolean разрешено вернуть письмо отправителю
---@field returned boolean письмо было возвращено
---@field subject string тема письма. Замечание: нужно игнорировать, если письмо системное (см. поле flags.fromSystem)
---@field body string тело письма. Замечание: нужно игнорировать, если письмо системное (см. поле flags.fromSystem)
---@field money number денежная сумма, содержащаяся в письме
---@field items таблица предметов, ключи номерами слотов [0..], значения: ObjectId or nil - идентификатор предмета или nil, если предмет уже извлечен из письма; максимальное число слотов можно узнать из mailBox.GetLimits()
---@field systemMail table или nil nil если письмо не системное (см. поле flags.fromSystem); иначе таблица с шаблонами полей письма:
---@field body string шаблон тела письма
---@field from string шаблон тела письма
---@field subject string шаблон тела письма
---@field denyRemoveMailWithItems boolean можно ли удалять письмо с предметами
---@field sysName string системное имя шаблона (нелокализуемое)
---@field voteResource VoteId (ResourceId), идентификатор опроса, если проводится
---@field clientDataParams table или nil nil если письмо не системное (см. поле flags.fromSystem); иначе таблица с параметрами для шаблонов из systemMail, по формату аналогична полю values из EVENT_CLIENT_MESSAGE

---Принудительное закрытие (деактивация) почтового ящика.
---@return нет
function mailBox.Close() end

---Попытка извлечь предмет(ы) из письма. Для выполнения операции необходима готовность почтового ящика:  IsReady.
---@param mailId ObjectId уникальный идентификатор письма
---@param slot integer|nil индекс слота с предметом, либо nil/-1 если нужно извлечь все предметы сразу
---@return boolean
function mailBox.ExtractMailItems(mailId, slot) end

---Попытка извлечь деньги из письма. Для выполнения операции необходима готовность почтового ящика:  IsReady.
---@param mailId ObjectId уникальный идентификатор письма
---@return boolean
function mailBox.ExtractMailMoney(mailId) end

---Выдаёт общую информацию о состоянии почтового ящика, обновляется автоматически (слать запрос на сервер не нужно), при изменении приходит  EVENT_MAILBOX_CHANGED_ON_SERVER
---@return MailBoxGetInfoResult
function mailBox.GetInfo() end

---Возвращает ограничения на письма.
---@return MailBoxGetLimitsResult
function mailBox.GetLimits() end

---Выдаёт информацию о письме, предварительно полученную с сервера запросом  mailBox.RequestMail( mailId ) (закрытая ссылка) или  mailBox.RequestMails( startIndex, count ). Когда полученная таким образом информация устаревает, приходит сообщение  EVENT_MAILBOX_CHANGED_ON_SERVER и в этом случае информация должна быть запрошена с сервера заново.
---@param mailId ObjectId идентификатор письма
---@return table или nil
function mailBox.GetMail(mailId) end

---Выдаёт информацию о письмах, предварительно полученную с сервера запросом  mailBox.RequestMails( startIndex, count ). После приходе события  EVENT_MAILBOX_CHANGED_ON_SERVER будет возвращать nil до следующего запроса  mailBox.RequestMails( startIndex, count ).
---@return MailBoxGetMailsResult
function mailBox.GetMails() end

---Открыт ли почтовый ящик. Запрашивать информацию о письмах можно только для открытого почтового ящика. Для выполнения других операций требуется его готовность:  IsReady.
---@return boolean
function mailBox.IsActive() end

---Находимся ли в режиме взаимодействия с владельцем почтового ящика. Только в этом режиме можно открыть (активировать) почтовый ящик.
---@return boolean
function mailBox.IsInteracting() end

---Можно ли выполнять операции с почтовым ящиком кроме чтения писем (например, отсылать письма, извлекать деньги и т.д.). При изменении состояния этого флага приходит событие:  EVENT_MAILBOX_CHANGED. Примечание. Состояние IsReady рекомендуется проверять после выполнения каждой операции с почтовым ящиком, не дожидаясь прихода события EVENT_MAILBOX_CHANGED - для избежания лага (например, засеривать интерфейс и т.п.). Примечание: одновременно может выполняться только одна операция. Начинать следующую можно только после завершения предыдущей.
---@return boolean
function mailBox.IsReady() end

---Попытка активировать (открыть) почтовый ящик. Операции можно выполнять только с активным почтовым ящиком.
---@return нет
function mailBox.Open() end

---Запрашивает у сервера исполнение операции над заданными письмами. Удачное исполнение операции отмечается событием  EVENT_MAILBOX_CHANGED_ON_SERVER. Статус исполнения запроса (удачно или ошибка) приходит в событии  EVENT_MAILBOX_SERVER_OPERATION_RESULT. Максимально допустимое число обрабатываемых за раз писем: 20.
---@param operation number тип операции (MARKREAD, GETATTACHMENT, DELETE, GETATTACHMENT_DELETE)
---@param mailList table список (индексируется целыми числами от 0) идентификаторов писем (см. mailId в mailBox.GetMails()); максимально допустимый размер 20
---@return нет
function mailBox.RequestMailGroupOperation(operation, mailList) end

---Запрашивает у сервера заданное количество писем, располагающихся начиная с заданной позиции. Удачное получение запрошенной информации отмечается событием  EVENT_MAILBOX_CHANGED. Статус исполнения запроса (удачно или ошибка) приходит в событии  EVENT_MAILBOX_SERVER_OPERATION_RESULT. Пришедшие с сервера данные можно получить посредством  mailBox.GetMails(). После прихода сообщения  EVENT_MAILBOX_CHANGED_ON_SERVER информация, полученная по этому запросу, будет очищена и пока запрос не будет выполнен заново  mailBox.GetMails() будет возвращать nil.
---@param startIndex integer позиция, начиная с которой располагаются запрашиваемые письма (нумеруются от 0)
---@param count integer сколько всего писем запрашивается
---@return нет
function mailBox.RequestMails(startIndex, count) end

---Попытка вернуть письмо отправителю. Для выполнения операции необходима готовность почтового ящика:  IsReady.
---@param mailId ObjectId уникальный идентификатор письма
---@return boolean
function mailBox.ReturnMailToSender(mailId) end
