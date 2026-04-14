---@meta

---@class mwarLib
mwar = {}

---@class MwarGetCommonInfoResult
---@field serviceResourceIncreaseMax integer максимальное значение увеличения эффективности при создании обслуживающего ресурса ("Могущество").
---@field serviceResourceIncomeIncrease number шаг увеличения эффективности при создании обслуживающего ресурса.
---@field serviceResourceExchangeCost integer стоимость покупки (в меди) одной единицы обслуживающего ресурса.
---@field serviceResourceCostIncrease number увеличение стоимости покупки с каждым увеличением эффективности (множитель).
---@field serviceResource CurrencyId или nil обслуживающий ресурс гильдии игрока ("Могущество")
---@field regionProgressIncome number
---@field pvpResource CurrencyId или nil PvP-ресурс гильдии игрока ("Слава")
---@field pveResource CurrencyId или nil PvE-ресурс гильдии игрока ("Престиж")
---@field mapProgressCounterCap integer Максимальное значение прогресса карты Доминион
---@field serviceResourceExchangeFactor number курс обмена PvP- и PvE-ресурсов на обслуживающий ресурс
---@field minResourceEffectivnessFactor number коэффициент уменьшения эффективность покупки обслуживающего ресурса, при большой разнице между PvP- и PvE-ресурсами
---@field maxInitialAttackSectorsCount integer максимально количество секторов, которое можно атаковать изначально
---@field championFightsTimes table или nil список возможных времён начала сражений за сектора (см. mwar.SetSectorBattleTime( sectorId )), индексированная целыми числами (начиная от 0) таблица, формат элементов:
---@field entries table или nil список времён начала раундов сражения, значения - TimeTableId

---@class MwarGetCommonMatchMakingInfoResult
---@field raidEventResource InstancedEventResourceId идентификатор ресурса рейдового сражения
---@field groupEventResource InstancedEventResourceId идентификатор ресурса группового сражения

---@class MwarGetGuildHistoryResult
---@field combats table список таблиц с полями:
---@field time LuaFullDateTime время сражения
---@field winnerId ObjectId id выигравшей гильдии
---@field winnerScore integer счет выигравшей стороны при завершении сражения
---@field winLeadName string имя лидера выигравшей стороны
---@field loserId ObjectId id проигравшей гильдии
---@field loserScore integer счет побежденной стороны при завершении сражения
---@field lossLeadName string имя лидера побежденной стороны
---@field isRatingBattle boolean признак рейтингового боя

---@class MwarGetGuildInfoResult
---@field guildId ObjectId идентификатор гильдии
---@field guildName string имя гильдии
---@field rating integer рейтинг гильдии в Доминионе
---@field symbolics table описание символики гильдии; поля такие же, как у mwar.GetGuildSymbolics( guildId )

---@class MwarGetLadderInfoResult
---@field auction table таблица с полями:
---@field stakeAllowed boolean можно ставить и переставлять ставки
---@field recentStakeBeatingAllowed boolean можно переставлять недавние ставки
---@field targetsToStakes table список таблиц, каждая описывает отдельную ставку и имеет поля:
---@field key ObjectId идентификатор гильдии, на которую делают ставку
---@field value table таблица с полями:
---@field stakeOwner ObjectId идентификатор гильдии, делающей ставку
---@field stakeValue integer размер ставки в валюте, CurrencyId которой можно получить из mwar.GetCommonInfo() (поле guildAuctionCurrency)
---@field targetGuild ObjectId id гильдии, на атаку которой сделана ставка
---@field time LuaFullDateTime время, когда была сделана ставка
---@field targetToResult table список таблиц, каждая описывает результаты грабежа и имеет поля:
---@field key ObjectId идентификатор ограбленной гильдии
---@field value table таблица PillageDescriptor с полями:
---@field staker ObjectId идентификатор гильдии - грабителя
---@field target ObjectId идентификатор гильдии - цели грабежа
---@field targetPart float какая часть из пула грабежа достается цели грабежа
---@field guilds table список идентификаторов гильдий (ObjectId)

---@class MwarGetQueueInfoResult
---@field event InstancedEventResourceId идентификатор инстанс-ивента
---@field isRaid boolean true, если сражение рейдовое; иначе false
---@field targetGuildId ObjectId или nil если сражение групповое, то nil, если рейдовое, то идентификатор гильдии, на которую будет нападение
---@field targetGuildName WString или nil- если сражение групповое, то nil, если рейдовое, то имя гильдии, на которую будет нападение

---@class MwarGetRatingProgressInfoResult
---@field key BattlegroundMarkId идентификатор команды
---@field value table таблица с полями:
---@field guildId ObjectId идентификатор гильдии
---@field isRaid boolean true если бой рейдовый; иначе false
---@field leaderRating number

---Выдаёт ряд общих параметров механики Доминион.
---@return MwarGetCommonInfoResult
function mwar.GetCommonInfo() end

---Выдаёт ряд общих параметров матчмейкинга для Доминиона.
---@return MwarGetCommonMatchMakingInfoResult
function mwar.GetCommonMatchMakingInfo() end

---Список времён старта события
---@param eventResourceId InstancedEventResourceId Id события
---@return TimeEntry[]
function mwar.GetEventStartTimeEntries(eventResourceId) end

---Информация об истории недавних сражений. Становится доступной только после применения mwar.ReplicateLadder( isReplicate ). При изменении (начале или прекращении трансляции, или обновлении данных) приходит событие  EVENT_MWAR_LADDER_CHANGED.
---@return MwarGetGuildHistoryResult
function mwar.GetGuildHistory() end

---Информация о гильдии, участвующей в Доминионе. При изменении приходит событие  EVENT_MWAR_LADDER_CHANGED
---@param guildId ObjectId идентификатор гильдии, можно получить из mwar.GetLadderInfo().guilds
---@return MwarGetGuildInfoResult
function mwar.GetGuildInfo(guildId) end

---Информация о Доминионе. Становится доступной только после применения mwar.ReplicateLadder( isReplicate ). При изменении (начале или прекращении трансляции, или обновлении данных) приходит событие  EVENT_MWAR_LADDER_CHANGED.
---@return MwarGetLadderInfoResult
function mwar.GetLadderInfo() end

---Информация о сражении Доминиона, в очереди на которое стоит аватар. При изменении этой информации приходит событие  EVENT_MWAR_QUEUE_CHANGED.
---@return MwarGetQueueInfoResult
function mwar.GetQueueInfo() end

---Информация о сторонах, принимающих участие в сражении Доминиона. Доступна только во время сражения. При изменении (появление или удаление, или обновление данных) приходит событие  EVENT_MWAR_RATING_PROGRESS_CHANGED. Информацию о гильдиях по их id можно получать из  mwar.GetLadderInfo().
---@return MwarGetRatingProgressInfoResult
function mwar.GetRatingProgressInfo() end

---Вступить рейдом в сражение Доминиона.
---@param targetGuildId ObjectId идентификатор гильдии, с которой будет сражение
---@return нет
function mwar.JoinRequestRaid(targetGuildId) end

---Запрашивает у сервера трансляцию (или прекращение трансляции) информации о рейтинге гильдий для Доминиона. При начале или прекращении трансляции приходит событие  EVENT_MWAR_LADDER_CHANGED. Получить информацию можно посредством  mwar.GetLadderInfo().
---@param isReplicate boolean если true, то начать трансляцию; если false - прекратить
---@return нет
function mwar.ReplicateLadder(isReplicate) end

---Сделать ставку в аукционе Доминиона.
---@param targetGuildId ObjectId идентификатор гильдии, на которую делается ставка
---@return нет
function mwar.Stake(targetGuildId) end
