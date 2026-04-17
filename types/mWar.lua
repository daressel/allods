---@meta

--- CategoryMWar
--- События и функции Lua API, относящиеся к Доминиону (войне между гильдиями за территории).

---@class mWarLib
mWar = {}

--- Возвращает информацию об астральном секторе по его идентификатору.
---@param astralSectorId AstralSectorId идентификатор сектора
---@return table|nil
function mWar.GetSectorInfoById(astralSectorId) end

--- Выдаёт ряд общих параметров механики Доминион.
---@return table
function mWar.GetCommonInfo() end

--- Выдаёт ряд общих параметров матчмейкинга для Доминиона.
---@return table
function mWar.GetCommonMatchMakingInfo() end

--- Список времён старта события
---@param eventResourceId InstancedEventResourceId Id события
---@return table
function mWar.GetEventStartTimeEntries(eventResourceId) end

--- Информация об истории недавних сражений. Становится доступной только после применения mwar.ReplicateLadder( isReplicate ). При изменении (начале или прекращении трансляции, или обновлении данных) приходит событие  EVENT_MWAR_LADDER_CHANGED.
---@return table|nil
function mWar.GetGuildHistory() end

--- Информация о гильдии, участвующей в Доминионе. При изменении приходит событие  EVENT_MWAR_LADDER_CHANGED
---@param guildId ObjectId идентификатор гильдии, можно получить из mwar.GetLadderInfo().guilds
---@return table
function mWar.GetGuildInfo(guildId) end

--- Информация о Доминионе. Становится доступной только после применения mwar.ReplicateLadder( isReplicate ). При изменении (начале или прекращении трансляции, или обновлении данных) приходит событие  EVENT_MWAR_LADDER_CHANGED.
---@return table
function mWar.GetLadderInfo() end

--- Информация о сражении Доминиона, в очереди на которое стоит аватар. При изменении этой информации приходит событие  EVENT_MWAR_QUEUE_CHANGED.
---@return table
function mWar.GetQueueInfo() end

--- Информация о сторонах, принимающих участие в сражении Доминиона. Доступна только во время сражения. При изменении (появление или удаление, или обновление данных) приходит событие  EVENT_MWAR_RATING_PROGRESS_CHANGED. Информацию о гильдиях по их id можно получать из  mwar.GetLadderInfo().
---@return table
function mWar.GetRatingProgressInfo() end

--- Вступить рейдом в сражение Доминиона.
---@param targetGuildId ObjectId идентификатор гильдии, с которой будет сражение
function mWar.JoinRequestRaid(targetGuildId) end

--- Запрашивает у сервера трансляцию (или прекращение трансляции) информации о рейтинге гильдий для Доминиона. При начале или прекращении трансляции приходит событие  EVENT_MWAR_LADDER_CHANGED. Получить информацию можно посредством  mwar.GetLadderInfo().
---@param isReplicate boolean если true, то начать трансляцию; если false - прекратить
function mWar.ReplicateLadder(isReplicate) end

--- Сделать ставку в аукционе Доминиона.
---@param targetGuildId ObjectId идентификатор гильдии, на которую делается ставка
function mWar.Stake(targetGuildId) end

-- Events

--- Событие посылается, когда изменяется информация о стоимости постановки флагов атаки на сектор.
EVENT_MWAR_FLAG_COSTS_CHANGED = "EVENT_MWAR_FLAG_COSTS_CHANGED"

--- Событие приходит, когда изменяется информация о рейтинге гильдий для Доминиона (начала транслироваться на клиент или перестала транслироваться на клиент, или обновилась).
EVENT_MWAR_LADDER_CHANGED = "EVENT_MWAR_LADDER_CHANGED"

--- Посылается, когда меняется информация о том, в очереди на какое сражение Доминиона стоит аватар.
EVENT_MWAR_QUEUE_CHANGED = "EVENT_MWAR_QUEUE_CHANGED"

--- Событие приходит, когда изменяется информация о сторонах сражения Доминиона (начала транслироваться на клиент или перестала транслироваться на клиент, или обновилась во время работающей трансляции).
EVENT_MWAR_RATING_PROGRESS_CHANGED = "EVENT_MWAR_RATING_PROGRESS_CHANGED"
