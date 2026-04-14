---@meta

---@class orderLib
order = {}

---@class OrderGetAchievementsResult
---@field mainPlayerAchievement number достижение аватара по этой теме
---@field position number позиция аватара
---@field name string имя аватара
---@field guildName string название гильдии
---@field shardName string название шарда
---@field achievement number количество очков
---@field raceClass table LuaRaceClassInfoPart|nil раса-класс персонажа
---@field isMainPlayer boolean наш аватар

---@class OrderGetBattleEventsResult
---@field trainingEvent ObjectId|nil тренировочное сражение
---@field ratingEvent ObjectId|nil рейтинговое сражение

---@class OrderGetBonusVoitingListResult
---@field id OrderBonusId идентификитор бонуса
---@field name string название бонуса
---@field description string описание бонуса
---@field image TextureId текстура с иконкой предмета
---@field voteCount number количество голосов
---@field disabled boolean признак доступности для голосования

---@class OrderGetOrderBonusInfoResult
---@field id OrderBonusId идентификитор бонуса
---@field name string название бонуса
---@field description string|nil описание бонуса
---@field image TextureId иконка бонуса

---@class OrderGetOrderInfoResult
---@field image TextureId текстура с иконкой предмета
---@field description string|nil описание ордена
---@field name string имя ордена в игре
---@field isAvailable boolean true, если орден доступен для вступления
---@field sysName string sysname ордена

---@class OrderGetOrderStatsResult
---@field orderScore number очки
---@field orderTopPosition number позиция в ТОПе

---@class OrderGetPrestigeSectionsResult
---@field name string название раздела
---@field raitingEventId ObjectId идентификатор события престижа

---@class OrderGetPreviousAchievementTopResult
---@field name string имя аватара
---@field achievement number количество очков

---@class OrderGetRatingSectionsResult
---@field name string название раздела
---@field raitingEventId ObjectId идентификатор события рейтинга

---@class OrderGetSeasonStartDateResult
---@field d number день начала сезона
---@field m number месяц начала сезона
---@field month number номер месяца, уменьшенный на 1.
---@field y год начала сезона
---@field sysMonth ENUM системный ENUM месяца

---Проверяет доступно ли аватару голосование за бонус.
---@return boolean
function order.CanVote() end

---Возвращает список достижений по идентификатору события. Для запроса данных с сервера необходимо использовать:
---@return OrderGetAchievementsResult
function order.GetAchievements() end

---Возвращает информацию о сражениях относящихся к ордену.
---@return OrderGetBattleEventsResult
function order.GetBattleEvents() end

---Количество дней до того момента когда бонусы станут доступны для повторного выбора в голосовании.
---@return number
function order.GetBonusDuration() end

---Возвращает список бонусов для голосования. Значения кэшированные. Для обновления требуется вызов FunctionOrderRequestOrderInfo.
---@return OrderGetBonusVoitingListResult
function order.GetBonusVoitingList() end

---Возвращает информацию об ордене.
---@return number|nil
function order.GetMainPlayerOrder() end

---Возвращает вес голоса аватара для голосования за бонусы в ордене.
---@return number|nil
function order.GetMainPlayerVoteWeight() end

---Возвращает максимальное количество бонусов, за которые можно проголосовать.
---@return number|nil
function order.GetMaxAvatarVotesCount() end

---Возвращает идентификатор бонуса от ордена. Значения кэшированные. Для обновления требуется вызов FunctionOrderRequestOrderInfo.
---@return OrderBonusId
function order.GetOrderBonus() end

---Возвращает информацию про бонус с идентификатором OrderBonusId.
---@return OrderGetOrderBonusInfoResult
function order.GetOrderBonusInfo() end

---Возвращает информацию об ордене.
---@param orderNumber number порядковый номер ордена
---@return OrderGetOrderInfoResult
function order.GetOrderInfo(orderNumber) end

---Возвращает список орденов.
---@return table|nil
function order.GetOrdersList() end

---Возвращает динамическую информацию об ордене.
---@return OrderGetOrderStatsResult
function order.GetOrderStats() end

---Возвращает список разделов по престижу ордена.
---@return OrderGetPrestigeSectionsResult
function order.GetPrestigeSections() end

---Возвращает описание лидера прошлого сезона по классу. Для запроса данных с сервера необходимо использовать:
---@return OrderGetPreviousAchievementTopResult
function order.GetPreviousAchievementTop() end

---Возвращает список разделов по рейтингам ордена.
---@return OrderGetRatingSectionsResult
function order.GetRatingSections() end

---Возвращает дату начала сезона.
---@return OrderGetSeasonStartDateResult
function order.GetSeasonStartDate() end

---Возвращает список ежедневных бонусов ордена. Значения кэшированные. Для обновления требуется вызов FunctionOrderRequestOrderInfo.
function order.GetVotedBonuses() end

---Проверяет доступность вступления в орден.
---@return boolean
function order.IsOrderAvailable() end

---Покинуть текущий орден.
---@return нет
function order.LeaveOrder() end

---Отправить запрос информации об ордене. Такую как: бонусы, голоса, очки, позиция. Об изменениях сообщает событие EventOrderInfoChanged.
---@return нет
function order.RequestOrderInfo() end

---Запрос достижений по престижу. Об изменении можно узнать из EventOrderAchievementsChanged.
---@return нет
function order.RequestPrestigeAchivements() end

---Запрос достижений по рейтингу Об изменении можно узнать из EventOrderAchievementsChanged.
---@return нет
function order.RequestRatingAchivements() end

---Отправить голоса за бонусы. Результат голосования приходит в EventOrderVoteAnswer.
---@return нет
function order.SendBonusVotes() end

---Выбрать орден
---@param orderNumber number порядковый номер игрока
---@return нет
function order.SetMainPlayerOrder(orderNumber) end
