---@meta

---@class interactionLib
interaction = {}

---@class InteractionGetExchangeInvitedResult
---@field playerId ObjectId Id игрока
---@field money integer количество денег на обменном столе этого игрока
---@field primaryConfirmed boolean согласился ли игрок предварительно
---@field finalConfirmed boolean согласился ли игрок окончательно
---@field items (ObjectId(or nil))[] список идентификаторов предметов на обменном столе. Идентификаторы находятся в таблице по индексам слотов - items[slotNumber] (если в слоте n ничего нет, то items[n] == nil)

---@class InteractionGetExchangeInviterResult
---@field playerId ObjectId Id игрока
---@field money integer количество денег на обменном столе этого игрока
---@field primaryConfirmed boolean согласился ли игрок предварительно
---@field finalConfirmed boolean согласился ли игрок окончательно
---@field items (ObjectId(or nil))[] список идентификаторов предметов на обменном столе. Идентификаторы находятся в таблице по индексам слотов - items[slotNumber] (если в слоте n ничего нет, то items[n] == nil)

---Прервать торговлю с игроком.
---@return нет
function interaction.CancelExchange() end

---Возвращает информацию об игроке, принявшем приглашение на торговлю.
---@return InteractionGetExchangeInvitedResult
function interaction.GetExchangeInvited() end

---Возвращает информацию об игроке, начавшем торговлю.
---@return InteractionGetExchangeInviterResult
function interaction.GetExchangeInviter() end

---Возвращает количество слотов обменного стола при торговле с игроком.
---@return integer
function interaction.GetExchangeSlotCount() end

---Возвращает true, если главный игрок находится в состоянии торговли с другим игроком. В этом состоянии он находится сразу после приглашения в группу (сам пригласил или был приглашен) и до окончания или отмены торговли.
---@return boolean
function interaction.HasExchange() end

---Пригласить игрока к торговле (обмену вещами).
---@param invitedName string имя приглашенного игрока для обмена
---@return нет
function interaction.InviteToExchange(invitedName) end

---Возвращает true, если главный игрок является инициатором торговли с другим игроком.
---@return boolean
function interaction.IsAvatarExchangeInviter() end

---Возвращает true, если главный игрок находится в состоянии приглашения торговли с другим игроком (сам пригласил или был приглашен), и в данный момент приглашение на торговлю ещё не принято.
---@return boolean
function interaction.IsExchangeInInvitation() end

---Возвращает true, если главный игрок находится в активном состоянии торговли с другим игроком (приглашение уже было принято и торговля идет), и торговля ещё не закончена.
---@return boolean
function interaction.IsExchangeInProgress() end

---При торговле с игроком, убрать c обменного стола предмет.
---@param exchangeSlot integer номер слота обменного стола
---@return нет
function interaction.RemoveExchangeItem(exchangeSlot) end
