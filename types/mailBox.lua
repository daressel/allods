---@meta

--- CategoryMailBox
--- Функции Lua API библиотеки mailBox. Библиотека предназначена для работы с внутриигровым почтовым ящиком.

--- Текстовый енум. Префикс для автоматической проверки "ENUM_CreateMailResult".
ENUM_CreateMailResult_Succeeded = "ENUM_CreateMailResult_Succeeded"
ENUM_CreateMailResult_InvalidMoneyAmount = "ENUM_CreateMailResult_InvalidMoneyAmount"
ENUM_CreateMailResult_TooManyItemsAttached = "ENUM_CreateMailResult_TooManyItemsAttached"
ENUM_CreateMailResult_UnknownReceiver = "ENUM_CreateMailResult_UnknownReceiver"
ENUM_CreateMailResult_AbonentsCannotParticipateByMail = "ENUM_CreateMailResult_AbonentsCannotParticipateByMail"
ENUM_CreateMailResult_InternalSystemError = "ENUM_CreateMailResult_InternalSystemError"
ENUM_CreateMailResult_NotEnoughMoney = "ENUM_CreateMailResult_NotEnoughMoney"
ENUM_CreateMailResult_NotEnoughItems = "ENUM_CreateMailResult_NotEnoughItems"
ENUM_CreateMailResult_NotEnoughMoneyAndItems = "ENUM_CreateMailResult_NotEnoughMoneyAndItems"
ENUM_CreateMailResult_NotTalkingToMailBox = "ENUM_CreateMailResult_NotTalkingToMailBox"
ENUM_CreateMailResult_NoSubject = "ENUM_CreateMailResult_NoSubject"
ENUM_CreateMailResult_ItemBound = "ENUM_CreateMailResult_ItemBound"

--- Текстовый енум. Префикс для автоматической проверки "ENUM_MailServiceReply"
ENUM_MailServiceReply_Succeeded = "ENUM_MailServiceReply_Succeeded"
ENUM_MailServiceReply_InternalSystemError = "ENUM_MailServiceReply_InternalSystemError"
ENUM_MailServiceReply_AvatarNotRecognized = "ENUM_MailServiceReply_AvatarNotRecognized"
ENUM_MailServiceReply_MailNotFound = "ENUM_MailServiceReply_MailNotFound"
ENUM_MailServiceReply_CannotReturnMail = "ENUM_MailServiceReply_CannotReturnMail"
ENUM_MailServiceReply_MailItemNotFound = "ENUM_MailServiceReply_MailItemNotFound"
ENUM_MailServiceReply_BagFull = "ENUM_MailServiceReply_BagFull"
ENUM_MailServiceReply_NotReadByOwner = "ENUM_MailServiceReply_NotReadByOwner"
ENUM_MailServiceReply_NotTalkingToMailBox = "ENUM_MailServiceReply_NotTalkingToMailBox"
ENUM_MailServiceReply_NoMoneyInMail = "ENUM_MailServiceReply_NoMoneyInMail"
ENUM_MailServiceReply_MailItemRemoved = "ENUM_MailServiceReply_MailItemRemoved"
ENUM_MailServiceReply_CannotRemoveMail = "ENUM_MailServiceReply_CannotRemoveMail"
ENUM_MailServiceReply_MoneyOverflow = "ENUM_MailServiceReply_MoneyOverflow"
ENUM_MailServiceReply_OwnershipLimitExceeded = "ENUM_MailServiceReply_OwnershipLimitExceeded"

---@class mailBoxLib
mailBox = {}

--- Принудительное закрытие (деактивация) почтового ящика.
function mailBox.Close() end

--- Попытка извлечь предмет(ы) из письма.
---@param mailId ObjectId уникальный идентификатор письма
---@param slot integer|nil индекс слота с предметом, либо nil/-1 если нужно извлечь все предметы сразу
---@return boolean
function mailBox.ExtractMailItems(mailId, slot) end

--- Попытка извлечь деньги из письма.
---@param mailId ObjectId уникальный идентификатор письма
---@return boolean
function mailBox.ExtractMailMoney(mailId) end

--- Выдаёт общую информацию о состоянии почтового ящика, обновляется автоматически (слать запрос на сервер не нужно), при изменении приходит  EVENT_MAILBOX_CHANGED_ON_SERVER
---@return table
function mailBox.GetInfo() end

--- Возвращает ограничения на письма.
---@return table
function mailBox.GetLimits() end

--- Выдаёт информацию о письме, предварительно полученную с сервера запросом  mailBox.RequestMail( mailId ) (закрытая ссылка) или  mailBox.RequestMails( startIndex, count ). Когда полученная таким образом информация устаревает, приходит сообщение  EVENT_MAILBOX_CHANGED_ON_SERVER и в этом случае информация должна быть запрошена с сервера заново.
---@param mailId ObjectId идентификатор письма
---@return table
function mailBox.GetMail(mailId) end

--- Выдаёт информацию о письмах, предварительно полученную с сервера запросом  mailBox.RequestMails( startIndex, count ). После приходе события  EVENT_MAILBOX_CHANGED_ON_SERVER будет возвращать nil до следующего запроса  mailBox.RequestMails( startIndex, count ).
---@return table
function mailBox.GetMails() end

--- Открыт ли почтовый ящик. Запрашивать информацию о письмах можно только для открытого почтового ящика. Для выполнения других операций требуется его готовность:  IsReady.
---@return boolean
function mailBox.IsActive() end

--- Находимся ли в режиме взаимодействия с владельцем почтового ящика. Только в этом режиме можно открыть (активировать) почтовый ящик.
---@return boolean
function mailBox.IsInteracting() end

--- Можно ли выполнять операции с почтовым ящиком кроме чтения писем (например, отсылать письма, извлекать деньги и т.д.). При изменении состояния этого флага приходит событие:  EVENT_MAILBOX_CHANGED.
---@return boolean
function mailBox.IsReady() end

--- Попытка активировать (открыть) почтовый ящик. Операции можно выполнять только с активным почтовым ящиком.
function mailBox.Open() end

--- Запрашивает у сервера исполнение операции над заданными письмами. Удачное исполнение операции отмечается событием  EVENT_MAILBOX_CHANGED_ON_SERVER. Статус исполнения запроса (удачно или ошибка) приходит в событии  EVENT_MAILBOX_SERVER_OPERATION_RESULT. Максимально допустимое число обрабатываемых за раз писем: 20.
---@param operation integer тип операции (MARKREAD, GETATTACHMENT, DELETE, GETATTACHMENT_DELETE)
---@param mailList table список (индексируется целыми числами от 0) идентификаторов писем (см. mailId в mailBox.GetMails()); максимально допустимый размер 20
function mailBox.RequestMailGroupOperation(operation, mailList) end

--- Запрашивает у сервера заданное количество писем, располагающихся начиная с заданной позиции. Удачное получение запрошенной информации отмечается событием  EVENT_MAILBOX_CHANGED. Статус исполнения запроса (удачно или ошибка) приходит в событии  EVENT_MAILBOX_SERVER_OPERATION_RESULT. Пришедшие с сервера данные можно получить посредством  mailBox.GetMails(). После прихода сообщения  EVENT_MAILBOX_CHANGED_ON_SERVER информация, полученная по этому запросу, будет очищена и пока запрос не будет выполнен заново  mailBox.GetMails() будет возвращать nil.
---@param startIndex integer позиция, начиная с которой располагаются запрашиваемые письма (нумеруются от 0)
---@param count integer сколько всего писем запрашивается
function mailBox.RequestMails(startIndex, count) end

--- Попытка вернуть письмо отправителю.
---@param mailId ObjectId уникальный идентификатор письма
---@return boolean
function mailBox.ReturnMailToSender(mailId) end

-- Events

--- Событие приходит при открытии (активации) почтового ящика.
EVENT_MAILBOX_ACTIVATED = "EVENT_MAILBOX_ACTIVATED"

--- Уведомление об изменении состояния почтового ящика. Например, при изменении статуса готовности или списка писем в нем.
EVENT_MAILBOX_CHANGED = "EVENT_MAILBOX_CHANGED"

--- Уведомление об изменении состояния почтового ящика на сервере. Означает, что данные на клиенте устарели и должны быть обновлены (см.  mailBox.RequestMails( startIndex, count ) и  mailBox.RequestMailInfo( mailId ) (закрытая ссылка)), до обновления функции  mailBox.GetMails() и  mailBox.GetMail( mailId ) будут возвращать nil.
EVENT_MAILBOX_CHANGED_ON_SERVER = "EVENT_MAILBOX_CHANGED_ON_SERVER"

--- Событие приходит при закрытии (деактивации) почтового ящика.
EVENT_MAILBOX_CLOSED = "EVENT_MAILBOX_CLOSED"

--- Событие приходит при попадании письма в почтовый ящик.
EVENT_MAILBOX_NEW_MAIL_ARRIVED = "EVENT_MAILBOX_NEW_MAIL_ARRIVED"

--- Уведомление о непрочитанных письмах. Присылается при входе в игру и при добавлении новых непрочитанных писем.
EVENT_MAILBOX_NEW_UNREAD_MESSAGE = "EVENT_MAILBOX_NEW_UNREAD_MESSAGE"

--- Уведомление о статусе исполнения команды, касающейся почтового ящика на сервере. Содержит в себе код ошибки или удачного завершения. Использовать только для сообщений об ошибках, для других целей есть  EVENT_MAILBOX_CHANGED_ON_SERVER.
EVENT_MAILBOX_SERVER_OPERATION_RESULT = "EVENT_MAILBOX_SERVER_OPERATION_RESULT"

--- Событие с результатом создания письма.
EVENT_MAIL_CREATE_RESULT = "EVENT_MAIL_CREATE_RESULT"

--- Событие с результатом попытки удаления письма.
EVENT_MAIL_DELETE_RESULT = "EVENT_MAIL_DELETE_RESULT"

--- Событие с результатом извлечения предметов из письма.
EVENT_MAIL_EXTRACT_ITEMS_RESULT = "EVENT_MAIL_EXTRACT_ITEMS_RESULT"

--- Событие с результатом извлечения денег из письма.
EVENT_MAIL_EXTRACT_MONEY_RESULT = "EVENT_MAIL_EXTRACT_MONEY_RESULT"

--- Событие с результатом попытки возврата письма отправителю.
EVENT_MAIL_RETURN_RESULT = "EVENT_MAIL_RETURN_RESULT"

--- Уведомление об изменении содержимого писем. В частности, при получении недостающей информации с сервера. Присылается список всех измененных за кадр писем (cобытие приходит не чаще раза за кадр).
EVENT_MAILS_CHANGED = "EVENT_MAILS_CHANGED"
