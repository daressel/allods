---@meta

---@class matchMakingLib
matchMaking = {}

---@class MatchMakingGetCurrentBattleInfoResult
---@field id ObjectId|nil идентификатор инстанс-ивента; если ивенте нет в списке доступных сражений то nil
---@field name string имя инстанс-ивента
---@field description string описание инстанс-ивента
---@field isCommonShard boolean true если сражение межсерверное, иначе false
---@field isPvE boolean true если данный инстанс-ивент относится к сражениям против окружения, иначе false
---@field mechanicsType number тип игровой механики
---@field duration integer длительность ивента в миллисекундах
---@field ignoreFactions boolean ивент со смешанными фракциями(при формировании группы принадлежность к фракции игнорируется)
---@field allowQuickExit boolean позволять быстро покидать активность(кнопка в углу экрана)
---@field winCounter integer суммарное количество очков за все достижения (см. поле achievements), необходимое для победы (также см. ниже описание поля finalWeight таблицы achievements); если 0, то победа за достижения не присуждается
---@field achievements tables[] таблица со списком описаний достижений в битве (индексируется целыми числами, начиная от 0), каждый элемент - таблица с полями:
---@field sysName string или nil если есть, то нелокализуемое системное имя достижения
---@field name string имя
---@field description string описание
---@field weight integer вес очков за данное достижение в общей сумме очков за достижения (также см. выше поле winCounter) (не используется в механике)
---@field finalWeight integer используется для указания счетообразующего достижения (вес полученных очков за достижение, чаще всего 1, если ачивка счетообразующая)
---@field value integer величина, по достижении которой сражение считается выигранным даже если общая сумма очков за все достижения не достигла winCounter (не играет роли, если winCounter равен 0)
---@field showInTable boolean если true, то показывать достижение в таблице с результатами

---@class MatchMakingGetEventInfoResult
---@field id ObjectId id инстанс-ивента
---@field name ValuedText|string преобразованное имя инстанс-ивента
---@field rawName string|nil необработанное название инстанс-ивента взятое из ресурса; nil если совпадает с name
---@field description ValuedText|string описание с подставленными текущими значениями параметров
---@field resourceId ResourceId идентификатор ресурса инстанс-ивента
---@field category ResourceId идентификатор ресурса категории инстанс-ивента
---@field isAvailable boolean доступен ли инстанс-ивент аватару
---@field allowQuickExit boolean позволять быстро покидать активность(кнопка в углу экрана)
---@field sysCause string строковый код ошибки.
---@field hasDoubleBonus boolean наличие бонуса за прохождение
---@field ignoreFactions boolean ивент со смешанными фракциями(при формировании группы принадлежность к фракции игнорируется)
---@field leaderDepartOnly boolean если true, то инициировать отправку в активность может только лидер группы
---@field soloMode boolean если true, ивент доступен только для одного игрока
---@field requiredItem ItemId|nil ресурс необходимый для отправки
---@field requiredCurrency CurrencyId|nil альтвалюта необходимая для отправки
---@field isHighPriority boolean если true, то это приоритетный эвент. Он должен быть выше остальных в списке.
---@field mechanicsType number тип игровой механики
---@field maxVisitsPerDay integer максимальное кол-во посещений ивента в день; 0 - без ограничений
---@field maxVisitsPerWeek integer максимальное кол-во посещений ивента в неделю; 0 - без ограничений
---@field exclusive boolean если true, то запрещено становиться одновременно в очередь к этому и любому другому эвенту
---@field leaderOnly boolean если true, то за выход\постановку в очередь отвечает только лидер группы (соло аватар считается сам себе лидером)
---@field ticket ItemId или nil nil если нет информации, иначе ResourceId предмета, являющегося билетом на эвент; при постановке в очередь проверяется наличие такого предмета у игрока, предмет забирается перед телепортацией на эвент
---@field activeEventJoinPeriod integer возможность присоединения к арене новых игроков в течении определённого периода времени после старта ивента. Если значение меньше 0 - можно присоединяться всегда, равно 0 - присоединяться нельзя вообще, иначе - период в течение которого возможно присоединение
---@field todayVisits integer|nil если есть, то сколько посещений совершил главный игрок сегодня; если нет, то информация отсутствует
---@field weeklyVisits integer|nil если есть, то сколько посещений совершил главный игрок за текущую неделю; если нет, то информация отсутствует
---@field duration integer длительность ивента в миллисекундах
---@field minAvatarLevel integer минимальный уровень, необходимый для участия в ивенте
---@field canJoinActiveEvent boolean можно ли присоединяться к ивенту после его начала
---@field isAvatarJoined boolean стоит ли аватар в очереди на этот инстанс-ивент
---@field eventType tables[] таблица с описанием типа инстанс-ивента.
---@field startTime tables[] таблица с описанием типа и времени старта
---@field startTimes table или nil если ошибка, то nil; иначе список (индексируется от 0) таблиц с описанием типа и времени старта (описание полей см. ниже)
---@field inviteTimeout integer задержка при телепорте на арену (мс)
---@field difficulty string|nil сложность эвента текстом
---@field difficultyMode Number сложность эвента индексом
---@field sysDifficultyMode String сложность эвента строкой

---@class MatchMakingGetEventJoinTimeEstimateResult
---@field time integer приблизительное время ожидания в минутах, оставшееся до присоединения к инстанс-ивенту с заданным eventId

---@class MatchMakingGetEventProgressInfoResult
---@field completed boolean завершился ли ивент
---@field durationMs integer фактическая длительность завершившегося инстанс-ивента (в миллисекундах), если ивент ещё не завершён, то 0
---@field elapsedMs integer время с начала инстанс-ивента в миллисекундах
---@field round integer номер текущего раунда (начинается с нуля)
---@field durationsByRound table ключи - номера раундов, значения - длительность раундов
---@field startTimesByRound table ключи - номера раундов, значения - время старта раундов
---@field winnerBattlegroundMarkId BattlegroundMarkId|nil BattlegrounMarkId победившей команды в случае группового инстанс-ивента, nil в случае одиночного или ещё не завершённого
---@field winnerFactionId FactionId FactionId победившей фракции в случае группового инстанс-ивента, nil в случае одиночного или ещё не завершённого
---@field members tables|nil[] индексированная с нуля таблица с описаниями достижений отдельных участников инстанс-ивента, nil если механика данного инстанс-ивента подразумевает сокрытие участников; в каждом поле содержится таблица с описанием достижений участника инстанс-ивента, формат поля:
---@field name string ник игрока
---@field shardName string название шарда игрока
---@field id ObjectId|nil идентификатор аватара(если доступен)
---@field factionId FactionId фракция игрока
---@field present boolean флаг наличия игрока на инстанс-ивенте (игрок может покинуть ивент до его окончания, в этом случае значение флага будет false)
---@field achievements tables[] индексированная с нуля таблица с достижениями данного участника; в каждом поле содержится таблица с описанием достижения. ВАЖНО: набор полей может меняться в процессе сражения. Формат поля:
---@field sysName string или nil если есть, то нелокализуемое системное имя достижения
---@field name string имя
---@field description string описание
---@field value integer количество
---@field raceClass table LuaRaceClassInfoPart таблица с описанием расы/класса персонажа, см. описание по ссылке ниже
---@field battlegroundMarkId BattlegroundMarkId или nil идентификатор команды, к которой принадлежит участник (используется для баттлграунда)

---@class MatchMakingGetEventRewardResult
---@field money integer сумма в награду
---@field experience integer опыт в награду
---@field loyalty integer получаемая верность гильдии
---@field authority integer получаемое влияние в гильдии
---@field mandatoryItems ObjectId[] список идентификаторов наградных предметов. которые известны
---@field mandatoryItemsCount integer количество наградных предметов (может быть больше, чем mandatoryItems, если некоторые награды не известны)
---@field alternativeItems ObjectId[] список идентификаторов альтернативных наградных предметов
---@field reputations table[] индексированный с 0 список значений репутационных наград для разных фракций. Поля каждого пункта:
---@field faction string имя фракции
---@field value integer на сколько повысится репутация
---@field currencies table[] индексированный с 0 список наград альтернативной валютой. Поля каждого пункта:
---@field currencyId СurrencyId имя альтернативной валюты
---@field value integer величина награды
---@field unlocks UnlockId[] индексированный с 1 список идентификаторов возможностей (анлоков), даваемых в награду

---@class MatchMakingGetEventScoreResult
---@field teamMarkId BattlegroundMarkId или nil nil если нет информации, иначе id команды, достижения которой содержаться в этой таблице (см. также описание winnerBattlegroundMarkId)
---@field teamAchievements tables или nil[] nil если нет информации, иначе список (индексированная с нуля таблица) достижений данной команды, формат полей элементов списка:
---@field sysName string или nil если есть, то нелокализуемое системное имя достижения
---@field name string имя
---@field description string описание
---@field amount integer количество

---@class MatchMakingGetJoinRequirementsResult
---@field requirements RequirementsTable список условий

---@class MatchMakingGetMembersRolesResult
---@field id ObjectId|nil идентификатор аватара если доступен
---@field role number роль в группе

---@class MatchMakingGetRatingPvPScoreByUnitIdResult
---@field currentSeason table данные по текущему сезону, таблица с полями:
---@field over_game integer всего игр
---@field wins integer побед из них
---@field score integer счет
---@field top integer место в рейтинге
---@field timeSpentMs Number затраченное время
---@field difficulty table|nil сложность
---@field name string название
---@field lastSeason table|nil данные по прошлому сезону, таблица аналогичная currentSeason

---Позволяет отлучиться из инстанс-ивента отсаваясь в рейде/группе. Предварительно требуется проверить что такая возможность есть с помощью matchMaking.CanAwayBattleEvent().
---@return нет
function matchMaking.AwayBattleEvent() end

---Проверяет, возможно ли отлучиться из инстанс-ивента оставаясь рейде/группе.
---@return boolean
function matchMaking.CanAwayBattleEvent() end

---Проверяет, может ли аватар в данный момент в принципе встать в очередь на какой-нибудь инстанс-ивент.
---@param eventResourceId InstancedEventResourceId id ресурса соответствующего инстанс-ивента.
---@return boolean
function matchMaking.CanJoinInstancedEventById(eventResourceId) end

---Проверяет, может ли аватар в данный момент в принципе встать в очередь на какой-нибудь инстанс-ивент.
---@param eventId ObjectId|nil id инстанс-ивента, если нужно проверить возможность вставания на конкретный эвент, nil для общей проверки возможности вступления
---@return boolean
function matchMaking.CanJoinInstancedEvents(eventId) end

---Проверяет, возможно ли вернуться обратно в инстанс-ивент если аватар его покинул но остался в рейде/группе.
---@return boolean
function matchMaking.CanReturnToBattle() end

---Определяет, может ли аватар вообще участвовать в инстанс-ивентах.
---@return boolean
function matchMaking.CanUseMatchMaking() end

---Получить время(когда?) автоматической отправки группы в активность. Время возвращается в формате LuaFullDateTime.
---@param eventId ObjectId идентификатор активности в которую собирается группа
---@return table|nil
function matchMaking.GetAutoDepartTime(eventId) end

---Получить общую информацию об инстанс-ивенте, в котором участвует аватар. Не содержит информации, которая может меняться в ходе сражения, за ней обращаться к  matchMaking.GetEventProgressInfo().
---@return MatchMakingGetCurrentBattleInfoResult
function matchMaking.GetCurrentBattleInfo() end

---Получить список категорий существующих инстанс-ивентов.
---@return InstancedEventCategoryId|nil[]
function matchMaking.GetEventCategories() end

---Получить информацию об инстанс-ивенте с заданным id.
---@param eventId ObjectId id инстанс-ивента, о котором запрашивается информация
---@return MatchMakingGetEventInfoResult
function matchMaking.GetEventInfo(eventId) end

---Получить приблизительное время, оставшееся до присоединения к инстанс-ивенту с заданным id.
---@param eventId ObjectId id инстанс-ивента, о котором запрашивается информация
---@return MatchMakingGetEventJoinTimeEstimateResult
function matchMaking.GetEventJoinTimeEstimate(eventId) end

---Получить информацию о достижениях участников текущего или только что закончившегося инстанс-ивента. Информация доступна автоматически сразу после завершения инстанс-ивента либо может быть получена запросом  matchMaking.ListenEventProgress() (закрытая ссылка). В обоих случаях приходит сообщение  EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED.
---@return MatchMakingGetEventProgressInfoResult
function matchMaking.GetEventProgressInfo() end

---Получить описание награды за успешное завершение инстанс-ивента.
---@param eventId ObjectId id инстанс-ивента
---@return MatchMakingGetEventRewardResult
function matchMaking.GetEventReward(eventId) end

---Получить список id существующих инстанс-ивентов.
---@return table|nil
function matchMaking.GetEvents() end

---Получить список id существующих инстанс-ивентов, относящихся к выбранной категории.
---@param categoryId InstancedEventCategoryId идентификатор категории
---@param type string|nil тип инстанс-ивентов, может принимать значения "pvp" - для сражений против других игроков, "pve" - для сражений против мобов, nil - все сражения
---@return table id ObjectId|nil
function matchMaking.GetEventsByCategory(categoryId, type) end

---Значения ачивмента, показываемые в качестве счета, для всех команд.
---@return MatchMakingGetEventScoreResult
function matchMaking.GetEventScore() end

---Требования на вход в инстанс-ивент.
---@param eventResourceId InstancedEventResourceId id ресурса соответствующего инстанс-ивента.
---@return MatchMakingGetJoinRequirementsResult
function matchMaking.GetJoinRequirements(eventResourceId) end

---Получить информацию о текущих боевых ролях персонажей в группе.
---@param eventId ObjectId|nil идентификатор активности в которую собирается группа, nil - если нужно узнать роли в текущей активности, в которой находится игрок
---@return MatchMakingGetMembersRolesResult
function matchMaking.GetMembersRoles(eventId) end

---Получить статистику игрока по рейтинговой арене. ВНИМАНИЕ! В некоторых MM активностях данная функция недоступна. Проверить доступность можно функцией  matchMaking.IsRatingPvPScoreAvailable()
---@param arenaType Number тип арены
---@param unitId ObjectId идентификатор персонажа
---@return MatchMakingGetRatingPvPScoreByUnitIdResult
function matchMaking.GetRatingPvPScoreByUnitId(arenaType, unitId) end

---Получить URL на топ рейтинговой арены.
---@param arenaType Number тип арены
---@return string|nil
function matchMaking.GetRatingURL(arenaType) end

---Проверка находится ли аватар в данный момент инстанс-ивенте, в который он попал через механизм матчмейкинга.
---@return boolean
function matchMaking.IsAvatarInMatchMakingEvent() end

---Определяет, стоит ли в данный момент аватар в очереди на какие-либо инстанс-ивенты.
---@return boolean
function matchMaking.IsAvatarJoinedAnyEvent() end

---Определяет, стоит ли в данный момент аватар в очереди на какие-либо PVE (или PVP) инстанс-ивенты.
---@return boolean
function matchMaking.IsAvatarJoinedAnySpecificEvent() end

---Проверяет, существует ли ещё описание инстанс-ивента с указанным id.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsEventIdExist(eventId) end

---Определяет, имеется ли в данный момент информация о существующих инстанс-ивентах.
---@return boolean
function matchMaking.IsEventListValid() end

---Определяет, имеется ли в данный момент информация о прогрессе текущего инстанс-ивента.
---@return boolean
function matchMaking.IsEventProgressExist() end

---Проверяет можно ли в инстанс-ивент проходить свободно, без затрат ресурсов или альтвалюты.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsFreePass(eventId) end

---Проверяет, что данный инстанс-ивент относится к сражениям против окружения.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsPvE(eventId) end

---Проверяет, что данный инстанс-ивент является рейдовым сражением.
---@param eventId ObjectId id инстанс-ивента
---@return boolean
function matchMaking.IsRaid(eventId) end

---Узнать доступность получения информации о рейтингах.
---@return boolean
function matchMaking.IsRatingPvPScoreAvailable() end

---Выйти из очереди на инстанс-ивент. Если аватар не стоит в очереди на заданный инстанс-ивент, вызов функции считается ошибкой. Для проверки можно использовать  matchMaking.GetEventInfo( eventId ) (поле isAvatarJoined).
---@param eventId ObjectId id соответствующего инстанс-ивента.
---@return нет
function matchMaking.LeaveInstancedEventQueue(eventId) end

---Выйти из очереди на инстанс-ивент. Если аватар не стоит в очереди на заданный инстанс-ивент, вызов функции считается ошибкой.
---@param eventResourceId InstancedEventResourceId id ресурса соответствующего инстанс-ивента.
---@return нет
function matchMaking.LeaveInstancedEventQueueById(eventResourceId) end

---Включить или выключить получение и отслеживание информации о существующих в игре инстанс-ивентах.
---@param needListen boolean true, чтобы начать отслеживание; false, чтобы закончить.
---@return нет
function matchMaking.ListenEvents(needListen) end

---Позволяет вернуться обратно в инстанс-ивент если аватар его покинул но остался в рейде/группе. Предварительно требуется проверить что такая возможность есть с помощью matchMaking.CanReturnToBattle().
---@return нет
function matchMaking.ReturnToBattle() end
