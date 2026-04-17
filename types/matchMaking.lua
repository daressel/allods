---@meta

--- CategoryMatchMaking
--- События и функции Lua API, относящиеся к инстанс-ивентам.

--- Тип игровой механики инстанс-ивента:
--- тип неизвестен
ENUM_MatchMakingMechanicsType_UNKNOWN = "ENUM_MatchMakingMechanicsType_UNKNOWN"
--- баттлграунд
ENUM_MatchMakingMechanicsType_BATTLEGROUND = "ENUM_MatchMakingMechanicsType_BATTLEGROUND"
--- гоблинобол
ENUM_MatchMakingMechanicsType_FOOTBALL = "ENUM_MatchMakingMechanicsType_FOOTBALL"
--- летний босс
ENUM_MatchMakingMechanicsType_SUMMERBOSS = "ENUM_MatchMakingMechanicsType_SUMMERBOSS"
--- последний рубеж
ENUM_MatchMakingMechanicsType_LASTSTAND = "ENUM_MatchMakingMechanicsType_LASTSTAND"
--- захват точек
ENUM_MatchMakingMechanicsType_CAPTURE_POINTS = "ENUM_MatchMakingMechanicsType_CAPTURE_POINTS"
--- рейтинговая арена
ENUM_MatchMakingMechanicsType_RATING_ARENA = "ENUM_MatchMakingMechanicsType_RATING_ARENA"
--- юбилейный эвент
ENUM_MatchMakingMechanicsType_ANNIVERSARY_EVENT = "ENUM_MatchMakingMechanicsType_ANNIVERSARY_EVENT"
--- гладиаторская арена
ENUM_MatchMakingMechanicsType_GLADIATOR_ARENA = "ENUM_MatchMakingMechanicsType_GLADIATOR_ARENA"
--- доминион
ENUM_MatchMakingMechanicsType_DOMINATION = "ENUM_MatchMakingMechanicsType_DOMINATION"

--- Тип рейтинговой арены:
ENUM_RatingArenaType_3x3 = "ENUM_RatingArenaType_3x3"
ENUM_RatingArenaType_6x6 = "ENUM_RatingArenaType_6x6"

---@class matchMakingLib
matchMaking = {}

--- Позволяет отлучиться из инстанс-ивента отсаваясь в рейде/группе. Предварительно требуется проверить что такая возможность есть с помощью matchMaking.CanAwayBattleEvent().
function matchMaking.AwayBattleEvent() end

--- Проверяет, возможно ли отлучиться из инстанс-ивента оставаясь рейде/группе.
---@return boolean
function matchMaking.CanAwayBattleEvent() end

--- Проверяет, может ли аватар в данный момент в принципе встать в очередь на какой-нибудь инстанс-ивент.
---@param eventResourceId InstancedEventResourceId id ресурса соответствующего инстанс-ивента.
---@return boolean
function matchMaking.CanJoinInstancedEventById(eventResourceId) end

--- Проверяет, может ли аватар в данный момент в принципе встать в очередь на какой-нибудь инстанс-ивент.
---@param eventId ObjectId|nil id инстанс-ивента, если нужно проверить возможность вставания на конкретный эвент, nil для общей проверки возможности вступления
---@return boolean
function matchMaking.CanJoinInstancedEvents(eventId) end

--- Проверяет, возможно ли вернуться обратно в инстанс-ивент если аватар его покинул но остался в рейде/группе.
---@return boolean
function matchMaking.CanReturnToBattle() end

--- Определяет, может ли аватар вообще участвовать в инстанс-ивентах.
---@return boolean
function matchMaking.CanUseMatchMaking() end

--- Получить время(когда?) автоматической отправки группы в активность. Время возвращается в формате LuaFullDateTime.
---@param eventId ObjectId идентификатор активности в которую собирается группа
---@return table
function matchMaking.GetAutoDepartTime(eventId) end

--- Получить общую информацию об инстанс-ивенте, в котором участвует аватар. Не содержит информации, которая может меняться в ходе сражения, за ней обращаться к  matchMaking.GetEventProgressInfo().
---@return table|nil
function matchMaking.GetCurrentBattleInfo() end

--- Получить список категорий существующих инстанс-ивентов.
---@return InstancedEventCategoryId[]|nil
function matchMaking.GetEventCategories() end

--- Получить информацию об инстанс-ивенте с заданным id.
---@param eventId ObjectId id инстанс-ивента, о котором запрашивается информация
---@return table|nil
function matchMaking.GetEventInfo(eventId) end

--- Получить приблизительное время, оставшееся до присоединения к инстанс-ивенту с заданным id.
---@param eventId ObjectId id инстанс-ивента, о котором запрашивается информация
---@return table|nil
function matchMaking.GetEventJoinTimeEstimate(eventId) end

--- Получить информацию о достижениях участников текущего или только что закончившегося инстанс-ивента. Информация доступна автоматически сразу после завершения инстанс-ивента либо может быть получена запросом  matchMaking.ListenEventProgress() (закрытая ссылка). В обоих случаях приходит сообщение  EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED.
---@return table|nil
function matchMaking.GetEventProgressInfo() end

--- Получить описание награды за успешное завершение инстанс-ивента.
---@param eventId ObjectId id инстанс-ивента
---@return table|nil
function matchMaking.GetEventReward(eventId) end

--- Получить список id существующих инстанс-ивентов.
---@return table|nil
function matchMaking.GetEvents() end

--- Получить список id существующих инстанс-ивентов, относящихся к выбранной категории.
---@param categoryId InstancedEventCategoryId идентификатор категории
---@param type string|nil тип инстанс-ивентов, может принимать значения "pvp" - для сражений против других игроков, "pve" - для сражений против мобов, nil - все сражения
---@return table|nil
function matchMaking.GetEventsByCategory(categoryId, type) end

--- Значения ачивмента, показываемые в качестве счета, для всех команд.
---@return table
function matchMaking.GetEventScore() end

--- Требования на вход в инстанс-ивент.
---@param eventResourceId InstancedEventResourceId id ресурса соответствующего инстанс-ивента.
---@return table|nil
function matchMaking.GetJoinRequirements(eventResourceId) end

--- Получить информацию о текущих боевых ролях персонажей в группе.
---@param eventId ObjectId|nil идентификатор активности в которую собирается группа, nil - если нужно узнать роли в текущей активности, в которой находится игрок
---@return table
function matchMaking.GetMembersRoles(eventId) end

--- Получить статистику игрока по рейтинговой арене.
---@param arenaType integer тип арены
---@param unitId ObjectId идентификатор персонажа
---@return table|nil
function matchMaking.GetRatingPvPScoreByUnitId(arenaType, unitId) end

--- Получить URL на топ рейтинговой арены.
---@param arenaType integer тип арены
---@return wstring|nil
function matchMaking.GetRatingURL(arenaType) end

--- Проверка находится ли аватар в данный момент инстанс-ивенте, в который он попал через механизм матчмейкинга.
---@return boolean
function matchMaking.IsAvatarInMatchMakingEvent() end

--- Определяет, стоит ли в данный момент аватар в очереди на какие-либо инстанс-ивенты.
---@return boolean
function matchMaking.IsAvatarJoinedAnyEvent() end

--- Определяет, стоит ли в данный момент аватар в очереди на какие-либо PVE (или PVP) инстанс-ивенты.
---@return boolean
function matchMaking.IsAvatarJoinedAnySpecificEvent() end

--- Проверяет, существует ли ещё описание инстанс-ивента с указанным id.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsEventIdExist(eventId) end

--- Определяет, имеется ли в данный момент информация о существующих инстанс-ивентах.
---@return boolean
function matchMaking.IsEventListValid() end

--- Определяет, имеется ли в данный момент информация о прогрессе текущего инстанс-ивента.
---@return boolean
function matchMaking.IsEventProgressExist() end

--- Проверяет можно ли в инстанс-ивент проходить свободно, без затрат ресурсов или альтвалюты.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsFreePass(eventId) end

--- Проверяет, что данный инстанс-ивент относится к сражениям против окружения.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsPvE(eventId) end

--- Проверяет, что данный инстанс-ивент является рейдовым сражением.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsRaid(eventId) end

--- Узнать доступность получения информации о рейтингах.
---@return boolean
function matchMaking.IsRatingPvPScoreAvailable() end

--- Выйти из очереди на инстанс-ивент. Если аватар не стоит в очереди на заданный инстанс-ивент, вызов функции считается ошибкой. Для проверки можно использовать  matchMaking.GetEventInfo( eventId ) (поле isAvatarJoined).
---@param eventId ObjectId id соответствующего инстанс-ивента.
function matchMaking.LeaveInstancedEventQueue(eventId) end

--- Выйти из очереди на инстанс-ивент. Если аватар не стоит в очереди на заданный инстанс-ивент, вызов функции считается ошибкой.
---@param eventResourceId InstancedEventResourceId id ресурса соответствующего инстанс-ивента.
function matchMaking.LeaveInstancedEventQueueById(eventResourceId) end

--- Включить или выключить получение и отслеживание информации о существующих в игре инстанс-ивентах.
---@param needListen boolean true, чтобы начать отслеживание; false, чтобы закончить.
function matchMaking.ListenEvents(needListen) end

--- Позволяет вернуться обратно в инстанс-ивент если аватар его покинул но остался в рейде/группе. Предварительно требуется проверить что такая возможность есть с помощью matchMaking.CanReturnToBattle().
function matchMaking.ReturnToBattle() end

-- Events

--- Посылается каждый раз, когда для какой-либо LFG-ативности меняется информация о количестве посещений за сегодняшний день аватаром.
EVENT_LFG_DESTINATION_VISITS_CHANGED = "EVENT_LFG_DESTINATION_VISITS_CHANGED"

--- Посылается каждый раз, когда меняется время автоматической отправки группы в активность.
EVENT_MATCH_MAKING_AUTO_DEPART_TIME_CHANGED = "EVENT_MATCH_MAKING_AUTO_DEPART_TIME_CHANGED"

--- Посылается когда меняется информация о сражении, в котором аватар принимает участие.
EVENT_MATCH_MAKING_CURRENT_BATTLE_CHANGED = "EVENT_MATCH_MAKING_CURRENT_BATTLE_CHANGED"

--- Посылается каждый раз, когда в списке инстанс-ивентов появляется новый элемент. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
EVENT_MATCH_MAKING_EVENT_ADDED = "EVENT_MATCH_MAKING_EVENT_ADDED"

--- Посылается когда у аватара появляется или теряется способность участвовать в каком-либо инстанс-ивенте.
EVENT_MATCH_MAKING_EVENT_AVAILABILITY_CHANGED = "EVENT_MATCH_MAKING_EVENT_AVAILABILITY_CHANGED"

--- Посылается когда у инстанс-ивента появляется или пропадает откат бонуса
EVENT_MATCH_MAKING_EVENT_DOUBLE_BONUS_CHANGED = "EVENT_MATCH_MAKING_EVENT_DOUBLE_BONUS_CHANGED"

--- Посылается каждый раз, когда получена новая информация о прогрессе текущего инстанс-ивента (либо по завершении инстанс-ивента, либо после включения получения информации о прогрессе текущего инстанс-ивента, см. matchMaking.ListenEventProgress( needListen ) (закрытая ссылка)).
EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED"

--- Посылается при изменении статуса заверщённости текущего инстанс-ивента (предполагается, что принудительная телепортация из инстанса случится несколько позже и за это время игрок может просмотреть статистику по ивенту). Посылается только если включено слежение за прогрессом ивента (matchMaking.ListenEventProgress(true) (закрытая ссылка)), поэтому при каждом включении слежения за прогрессом (после получения сообщения EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED) текущее состояние нужно проверять дополнительно (matchMaking.GetEventProgressInfo(), поле completed).
EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED"

--- Посылается при изменении длительности текущего инстанс-ивента. Посылается только если включено слежение за прогрессом ивента (matchMaking.ListenEventProgress(true) (закрытая ссылка)), поэтому при каждом включении слежения за прогрессом (после получения сообщения EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED) текущее состояние нужно проверять дополнительно (matchMaking.GetEventProgressInfo(), поле durationMs).
EVENT_MATCH_MAKING_EVENT_PROGRESS_DURATION_CHANGED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_DURATION_CHANGED"

--- Посылается каждый раз, когда изменяется информация о достижениях одного из участников текущего инстанс-ивента (т.е. для  matchMaking.GetEventProgressInfo() меняются поля таблицы members: kills, totalDamageDone, totalHealDone).
EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBER_CHANGED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBER_CHANGED"

--- Посылается каждый раз, когда изменяется список с достижениями участников текущего инстанс-ивента (добавляются или удаляются участники).
EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBERS_CHANGED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBERS_CHANGED"

--- Посылается каждый раз, когда удаляется информация о прогрессе текущего инстанс-ивента, скорее всего в результате соответствующего вызова matchMaking.ListenEventProgress( needListen ) (закрытая ссылка).
EVENT_MATCH_MAKING_EVENT_PROGRESS_REMOVED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_REMOVED"

--- Посылается каждый раз, когда изменяется номер текущего раунда, длительности раундов или времена начала раундов (т.е. поля round, durationsByRound и startTimesByRound результата функции  matchMaking.GetEventProgressInfo())
EVENT_MATCH_MAKING_EVENT_PROGRESS_ROUNDS_CHANGED = "EVENT_MATCH_MAKING_EVENT_PROGRESS_ROUNDS_CHANGED"

--- Посылается каждый раз, когда аватар присоединяется к очереди на какой-либо инстанс-ивент.
EVENT_MATCH_MAKING_EVENT_QUEUE_ADDED = "EVENT_MATCH_MAKING_EVENT_QUEUE_ADDED"

--- Посылается каждый раз, когда аватар выходит из очереди на какой-либо инстанс-ивент.
EVENT_MATCH_MAKING_EVENT_QUEUE_REMOVED = "EVENT_MATCH_MAKING_EVENT_QUEUE_REMOVED"

--- Посылается, когда аватар удаляется сразу из всех очередей на инстанс-ивенты, в которых он находился (например в случае приглашения на инстанс-ивент).
EVENT_MATCH_MAKING_EVENT_QUEUES_REMOVED = "EVENT_MATCH_MAKING_EVENT_QUEUES_REMOVED"

--- Посылается каждый раз, когда из списка инстанс-ивентов удаляется какой-либо элемент. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
EVENT_MATCH_MAKING_EVENT_REMOVED = "EVENT_MATCH_MAKING_EVENT_REMOVED"

--- Посылается когда у аватара появляется или теряется способность участвовать в инстанс-ивентах.
EVENT_MATCH_MAKING_EVENTS_AVAILABILITY_CHANGED = "EVENT_MATCH_MAKING_EVENTS_AVAILABILITY_CHANGED"

--- Событие посылается всякий раз, когда каким-либо образом меняется информация о списке существующих в игре инстанс-ивентов (список стал доступен, список стал недоступен, добавлены или удалены элементы списка).
EVENT_MATCH_MAKING_EVENTS_CHANGED = "EVENT_MATCH_MAKING_EVENTS_CHANGED"

--- Событие посылается, когда приглашение телепортироваться на инстанс-ивент теряет силу либо из-за отказа игрока или кого-то из членов группы, в составе которой игрок стоит в очереди на инстанс-ивент, либо из-за того, что игрок или его согрупник не отреагировал на приглашение за отведённое ему время.
EVENT_MATCH_MAKING_EVENT_TELEPORT_REJECTED = "EVENT_MATCH_MAKING_EVENT_TELEPORT_REJECTED"

--- Событие посылается, когда подходит очередь игрока на участие в инстанс-ивенте. Если до истечения таймаута ответ не послан, приглашение считается отвергнутым. Ответ (принять/отказаться) посылается через  matchMaking.InstancedEventTeleportReply( accept ) (закрытая ссылка).
EVENT_MATCH_MAKING_EVENT_TELEPORT_REQUEST = "EVENT_MATCH_MAKING_EVENT_TELEPORT_REQUEST"

--- Посылается каждый раз, когда для какого-либо инстанс-ивента меняется информация о количестве посещений за сегодняшний день основным игроком.
EVENT_MATCH_MAKING_EVENT_VISITS_CHANGED = "EVENT_MATCH_MAKING_EVENT_VISITS_CHANGED"

--- Посылается каждый раз, когда каким-либо образом (добавляется-удаляется-меняется) изменяется оценка времени ожидания присоединения к какому-либо инстанс-ивенту. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
EVENT_MATCH_MAKING_JOIN_TIME_CHANGED = "EVENT_MATCH_MAKING_JOIN_TIME_CHANGED"

--- Посылается каждый раз, когда меняется роль хотя бы одного персонажа в группе.
EVENT_MATCH_MAKING_MEMBERS_ROLES_CHANGED = "EVENT_MATCH_MAKING_MEMBERS_ROLES_CHANGED"

--- Посылается каждый раз, когда изменяется иноформация о достижениях команд-участников текущего инстанс-ивента ( matchMaking.GetEventProgressInfo(), поле achievements).
EVENT_MATCH_MAKING_PROGRESS_ACHIEVEMENTS_CHANGED = "EVENT_MATCH_MAKING_PROGRESS_ACHIEVEMENTS_CHANGED"

--- Посылается, когда изменяется список ресурсов, начисленных какому-либо из участников инстанс-ивента в качестве достижений (в списке появился новый ресурс или изменилось количество какого-либо уже присутствующего в списке ресурса). Посылается не чаще 1 раза в секунду.
EVENT_MATCH_MAKING_PROGRESS_MEMBERS_ACHIEVEMENTS_CHANGED = "EVENT_MATCH_MAKING_PROGRESS_MEMBERS_ACHIEVEMENTS_CHANGED"
