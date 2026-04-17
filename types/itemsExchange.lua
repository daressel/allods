---@meta

--- CategoryItemsExchange
--- События и функции Lua Api, относящиеся к торговле между двумя игроками.

--- Текстовый енум. Проверяется на билдере. Префикс для проверки: "ENUM_ExchangeResult".
ENUM_MsgStartExchangeResultResult_SUCCESS = "ENUM_MsgStartExchangeResultResult_SUCCESS"
ENUM_MsgStartExchangeResultResult_ERROR = "ENUM_MsgStartExchangeResultResult_ERROR"
ENUM_MsgStartExchangeResultResult_INVITEDAVATARISBUSY = "ENUM_MsgStartExchangeResultResult_INVITEDAVATARISBUSY"
ENUM_MsgStartExchangeResultResult_INVITERAVATARISBUSY = "ENUM_MsgStartExchangeResultResult_INVITERAVATARISBUSY"
ENUM_MsgStartExchangeResultResult_INVITEDAVATARNOTFOUND = "ENUM_MsgStartExchangeResultResult_INVITEDAVATARNOTFOUND"
ENUM_MsgStartExchangeResultResult_TOOFAR = "ENUM_MsgStartExchangeResultResult_TOOFAR"
ENUM_MsgStartExchangeResultResult_INVITEDAVATARISDEAD = "ENUM_MsgStartExchangeResultResult_INVITEDAVATARISDEAD"
ENUM_MsgStartExchangeResultResult_INVITERAVATARISDEAD = "ENUM_MsgStartExchangeResultResult_INVITERAVATARISDEAD"
ENUM_MsgStartExchangeResultResult_YOUAREINVISIBLE = "ENUM_MsgStartExchangeResultResult_YOUAREINVISIBLE"
ENUM_MsgExchangeErrorErrorType_MONEYNOTENOUGH = "ENUM_MsgExchangeErrorErrorType_MONEYNOTENOUGH"
ENUM_MsgExchangeErrorErrorType_PRIMARYCONFIRMATIONREQUIRED = "ENUM_MsgExchangeErrorErrorType_PRIMARYCONFIRMATIONREQUIRED"
ENUM_MsgExchangeErrorErrorType_ITEMNOTFOUND = "ENUM_MsgExchangeErrorErrorType_ITEMNOTFOUND"
ENUM_MsgExchangeErrorErrorType_SLOTISUSED = "ENUM_MsgExchangeErrorErrorType_SLOTISUSED"
ENUM_MsgExchangeErrorErrorType_ITEMISUSED = "ENUM_MsgExchangeErrorErrorType_ITEMISUSED"
ENUM_MsgExchangeErrorErrorType_ITEMISBOUND = "ENUM_MsgExchangeErrorErrorType_ITEMISBOUND"

---@class itemsExchangeLib
itemsExchange = {}

--- Прервать торговлю с игроком.
function itemsExchange.CancelExchange() end

--- Возвращает информацию об игроке, принявшем приглашение на торговлю.
---@return table|nil
function itemsExchange.GetExchangeInvited() end

--- Возвращает информацию об игроке, начавшем торговлю.
---@return table|nil
function itemsExchange.GetExchangeInviter() end

--- Возвращает количество слотов обменного стола при торговле с игроком.
---@return number
function itemsExchange.GetExchangeSlotCount() end

--- Возвращает true, если главный игрок находится в состоянии торговли с другим игроком. В этом состоянии он находится сразу после приглашения в группу (сам пригласил или был приглашен) и до окончания или отмены торговли.
---@return boolean
function itemsExchange.HasExchange() end

--- Пригласить игрока к торговле (обмену вещами).
---@param invitedName WString имя приглашенного игрока для обмена
function itemsExchange.InviteToExchange(invitedName) end

--- Возвращает true, если главный игрок является инициатором торговли с другим игроком.
---@return boolean
function itemsExchange.IsAvatarExchangeInviter() end

--- Возвращает true, если главный игрок находится в состоянии приглашения торговли с другим игроком (сам пригласил или был приглашен), и в данный момент приглашение на торговлю ещё не принято.
---@return boolean
function itemsExchange.IsExchangeInInvitation() end

--- Возвращает true, если главный игрок находится в активном состоянии торговли с другим игроком (приглашение уже было принято и торговля идет), и торговля ещё не закончена.
---@return boolean
function itemsExchange.IsExchangeInProgress() end

--- При торговле с игроком, убрать c обменного стола предмет.
---@param exchangeSlot integer номер слота обменного стола
function itemsExchange.RemoveExchangeItem(exchangeSlot) end

-- Events

--- Уведомление о невозможности торговли по причине игнора.
EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED = "EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED"

--- Во время торговли с другим игроком произошла ошибка.
EVENT_ITEMS_EXCHANGE_ERROR = "EVENT_ITEMS_EXCHANGE_ERROR"

--- Торговля между игроками завершена.
EVENT_ITEMS_EXCHANGE_FINISHED = "EVENT_ITEMS_EXCHANGE_FINISHED"

--- Главному игроку предложено поторговать с другим игроком.
EVENT_ITEMS_EXCHANGE_INVITED = "EVENT_ITEMS_EXCHANGE_INVITED"

--- Событие приходит, если какой либо из участников торговли между окончательно согласился с условиями обмена или отказался от своего окончательного согласия.
EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED"

--- Событие приходит, если какой либо из участников торговли между игроками поменял предметы на столе обмена.
EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED"

--- Событие приходит, если какой либо из участников торговли между игроками изменил сумму денег на игровом столе.
EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED"

--- Событие приходит, если какой либо из участников торговли между предварительно согласился с условиями обмена или отказался от своего предварительного согласия.
EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED"

--- Главный игрок не может положить предмет на обменный стол, так как слот уже занят.
EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY = "EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY"

--- Главным игроком инициирована торговля между игроками.
EVENT_ITEMS_EXCHANGE_STARTED = "EVENT_ITEMS_EXCHANGE_STARTED"

--- Изменилось состояние торговли между игроками. Состояний может быть несколько:
EVENT_ITEMS_EXCHANGE_STATE_CHANGED = "EVENT_ITEMS_EXCHANGE_STATE_CHANGED"
