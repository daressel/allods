---@meta

--- CategoryOrder
--- Функции и события Lua Api, относящиеся к Ордену.

---@class orderLib
order = {}

--- Проверяет доступно ли аватару голосование за бонус.
---@return boolean
function order.CanVote() end

--- Возвращает список достижений по идентификатору события.
---@return table|nil
function order.GetAchievements() end

--- Возвращает информацию о сражениях относящихся к ордену.
---@return table|nil
function order.GetBattleEvents() end

--- Количество дней до того момента когда бонусы станут доступны для повторного выбора в голосовании.
---@return number
function order.GetBonusDuration() end

--- Возвращает список бонусов для голосования.
---@return table|nil
function order.GetBonusVoitingList() end

--- Возвращает информацию об ордене.
---@return number|nil
function order.GetMainPlayerOrder() end

--- Возвращает вес голоса аватара для голосования за бонусы в ордене.
---@return number|nil
function order.GetMainPlayerVoteWeight() end

--- Возвращает максимальное количество бонусов, за которые можно проголосовать.
---@return number|nil
function order.GetMaxAvatarVotesCount() end

--- Возвращает идентификатор бонуса от ордена.
---@return OrderBonusId
function order.GetOrderBonus() end

--- Возвращает информацию про бонус с идентификатором OrderBonusId.
---@return table|nil
function order.GetOrderBonusInfo() end

--- Возвращает информацию об ордене.
---@param orderNumber number порядковый номер ордена
---@return table|nil
function order.GetOrderInfo(orderNumber) end

--- Возвращает список орденов.
---@return table|nil
function order.GetOrdersList() end

--- Возвращает динамическую информацию об ордене.
---@return table|nil
function order.GetOrderStats() end

--- Возвращает список разделов по престижу ордена.
---@return table|nil
function order.GetPrestigeSections() end

--- Возвращает описание лидера прошлого сезона по классу.
---@return table|nil
function order.GetPreviousAchievementTop() end

--- Возвращает список разделов по рейтингам ордена.
---@return table|nil
function order.GetRatingSections() end

--- Возвращает дату начала сезона.
---@return table|nil
function order.GetSeasonStartDate() end

--- Возвращает список ежедневных бонусов ордена.
function order.GetVotedBonuses() end

--- Проверяет доступность вступления в орден.
---@return boolean
function order.IsOrderAvailable() end

--- Покинуть текущий орден.
function order.LeaveOrder() end

--- Отправить запрос информации об ордене.
function order.RequestOrderInfo() end

--- Запрос достижений по престижу.
function order.RequestPrestigeAchivements() end

--- Запрос достижений по рейтингу
function order.RequestRatingAchivements() end

--- Отправить голоса за бонусы.
function order.SendBonusVotes() end

--- Выбрать орден
---@param orderNumber number порядковый номер игрока
function order.SetMainPlayerOrder(orderNumber) end

-- Events

--- Присылается при обновлении информации о доступности орденов для вступления.
EVENT_AVAILABLE_ORDERS_CHANGED = "EVENT_AVAILABLE_ORDERS_CHANGED"

--- Присылается при изменении значение достижений.
EVENT_ORDER_ACHIEVEMENTS_CHANGED = "EVENT_ORDER_ACHIEVEMENTS_CHANGED"

--- Присылается при изменении возможности голосования.
EVENT_ORDER_CAN_VOTE_CHANGED = "EVENT_ORDER_CAN_VOTE_CHANGED"

--- Присылается, когда у аватара появляется или пропал орден.
EVENT_ORDER_CHANGED = "EVENT_ORDER_CHANGED"

--- Присылается при изменении информации об ордене.
EVENT_ORDER_INFO_CHANGED = "EVENT_ORDER_INFO_CHANGED"

--- Присылается в ответ на голосование за бонусы.
EVENT_ORDER_VOTE_ANSWER = "EVENT_ORDER_VOTE_ANSWER"
