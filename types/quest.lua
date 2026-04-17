---@meta

--- CategoryQuest
--- События и функции Lua API, относящиеся к квестам.

--- Категория квеста:
--- обычный
ENUM_QuestCategory_Common = "ENUM_QuestCategory_Common"
--- для компендиума
ENUM_QuestCategory_Compendium = "ENUM_QuestCategory_Compendium"

--- Список констант режима поиска квеста, который будет рекомендован игроку для выполнения.
--- искать в пределах зоны, в которой находится аватар
---@type integer
QUEST_FIND_NEXT_QUEST_MODE_ZONE = nil
--- искать во всём игровом мире
---@type integer
QUEST_FIND_NEXT_QUEST_MODE_ALL = nil

--- Енум типа квеста.
--- Квест - задание
---@type integer
QUEST_TYPE_SOLO = nil
--- Групповой - миссия
---@type integer
QUEST_TYPE_PARTY = nil
--- В рейд инстанс - кампания
---@type integer
QUEST_TYPE_RAID = nil
--- В мини рейд инстанс - кампания
---@type integer
QUEST_TYPE_MINI_RAID = nil

---@class questLib
quest = {}

--- Попытка получить задание у NPC, который является текущей целью аватара. *Нельзя получить задание у NPC, не являющегося текущей целью. Вызывать можно только после  FunctionAvatarRequestInteractions*
---@param questId QuestId
function quest.AcceptQuest(questId) end

--- Согласие принять разделяемое задание от другого игрока.
---@param shareId ObjectId уникальный идентификатор предложения
function quest.AcceptShareQuest(shareId) end

--- Отказ принять разделяемое задание от другого игрока.
---@param shareId ObjectId уникальный идентификатор предложения
function quest.DeclineShareQuest(shareId) end

--- Попытка выкинуть задание из журнала заданий аватара.
---@param questId QuestId
function quest.DiscardQuest(questId) end

--- Посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест из линейки квестов этапа тайны мира.
---@param secretId QuestId id основного квеста тайны мира
---@param componentIndex num порядковый номер интересующей компоненты (берется из avatar.GetSecretComponents( secretId ))
---@return QuestId|nil
function quest.FindCurrentSecretComponentQuest(secretId, componentIndex) end

--- Если список текущих заданий пуст, посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест.
---@param mode integer где искать следующий квест (зона, в которой находится аватар или весь игровой мир)
function quest.FindNextQuest(mode) end

--- Посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест из линейки квестов этапа тайны мира.
---@param secretId QuestId id основного квеста тайны мира
---@param componentIndex num порядковый номер интересующей компоненты (берется из avatar.GetSecretComponents( secretId ))
function quest.FindNextSecretComponentQuest(secretId, componentIndex) end

--- Попытка получить у предмета в инвентаре список заданий, которые он может выдать персонажу.
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
---@return table
function quest.GetAvailableItemQuests(itemId) end

--- Попытка получить у собеседника список заданий, которые он может выдать персонажу.
---@return table
function quest.GetAvailableQuests() end

--- Возвращает id квеста, объявленного как текущий.
---@return QuestId
function quest.GetCurrentQuest() end

--- Получить список заданий, находящихся в данный момент в журнале заданий аватара.
---@return table
function quest.GetQuestBook() end

--- Получить список заданий, выполненных аватаром.
---@return table
function quest.GetQuestHistory() end

--- Возвращает идентификатор текстуры изображения, которое относится к тексту описания задания.
---@param questId QuestId идентификатор ресурса задания
---@return TextureId|nil
function quest.GetQuestImage(questId) end

--- Получить описание задания.
---@param questId QuestId идентификатор задания.
---@return table
function quest.GetQuestInfo(questId) end

--- Получить информацию об одной цели какого-либо задания игрока.
---@param objectiveId ObjectId идентификатор цели задания
function quest.GetQuestObjectiveInfo(objectiveId) end

--- Получить информацию о состоянии конкретного задания, находящегося в журнале заданий аватара.
---@param questId QuestId идентификатор квеста
function quest.GetQuestProgress(questId) end

--- Получить описание награды за выполнение задания.
---@param questId QuestId
---@return table|nil
function quest.GetQuestReward(questId) end

--- Возвращает список приглашений от игроков, которые делятся своими заданиями.
---@return table
function quest.GetQuestShareInvitations() end

--- Возвращает максимально допустимое количество заданий.
---@return number
function quest.GetQuestsLimit() end

--- Попытка получить у NPC-собеседника список заданий, которые NPC может принять.
---@return table
function quest.GetReturnableQuests() end

--- Доступна ли автонавигация для данного задания.
---@param questId QuestId
---@return boolean
function quest.IsQuestAutoNavigationAllowed(questId) end

--- Проверяет завершено ли задание.
---@param questId QuestId идентификатор ресурса задания
---@return boolean
function quest.IsQuestFinished(questId) end

--- Попытка начала разговора с собеседником (спросить список заданий, торговец ли он и т.п.).
function quest.RequestInteractions() end

--- Запрос заданий у предмета в слоте контейнера (сумка, переполненная сумка, банковская ячейка). В ответ придет сообщение EVENT_ITEM_QUESTS_RECEIVED
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
function quest.RequestQuestsForItem(itemId) end

--- Попытка сдать задание юнита, который является текущей целью аватара. *Нельзя сдать задание юнита, не являющемуся текущей целью.
---@param questId QuestId
---@param rewardId ObjectId
function quest.ReturnQuest(questId, rewardId) end

--- Объявлет квест с заданным QuestId текущим выполняемым квестом.
---@param questId QuestId id квеста, задаваемого как текущий; если nil, то никакой квест не будет текущим
function quest.SetCurrentQuest(questId) end

--- Предлагает другим игрокам группы принять указанное задание. Задание должно быть разделяемым.
---@param questId QuestId идентификатор задания
function quest.ShareQuest(questId) end

--- Возвращает геодату, необходимую для проецирования реальных координат точки возвращения задания в координаты текстуры интерфейсной карты.
---@param questId QuestId
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return table
function quest.GetQuestGeodata(questId, zonesMapId) end

--- Возвращает таблицу геодат, необходимых для проецирования реальных координат точек заданной цели задания в координаты заданной текстуры интерфейсной карты.
---@param objectiveId QuestId
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return Geodata[]|nil
function quest.GetQuestObjectiveGeodata(objectiveId, zonesMapId) end

--- Возвращает информацию о неважных заданиях, относящихся к интерфейсной карте, но не участвующих в прогрессе.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table|nil
function quest.GetZonesMapLowQuests(zonesMapId) end

--- Возвращает информацию о заданиях, относящихся к интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table|nil
function quest.GetZonesMapQuests(zonesMapId) end

--- Возвращает true, если финализирующее задание интерфейсной карты выполнено. Финализирующее задание - это такое задание, выполнение которой достаточно для утверждения, что прогресс зоны выполнен.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function quest.IsFinalQuestCompleted(zonesMapId) end

--- Возвращает список целей заданий игрока, которые связаны с указанным устройством.
---@param deviceId ObjectId
---@return nil
function quest.GetRelatedQuestObjectives(deviceId) end

--- Получить списки квестов, имеющие отношение к interactive object, по которым можно вычислить quest mark для этого объекта.
---@param objectId ObjectId идентификатор объекта
---@return table
function quest.GetInteractorQuests(objectId) end

--- Возвращает список целей заданий игрока, которые связаны с указанным мобом.
---@param unitId ObjectId
---@return nil
function quest.GetRelatedQuestObjectives(unitId) end

-- Events

--- Событие посылается каждый раз, когда сменяется текущий квест. Например когда текущим назначается другой квест или когда текущий квест завершается или сбрасывается.
EVENT_CURRENT_QUEST_CHANGED = "EVENT_CURRENT_QUEST_CHANGED"

--- Событие посылается в ответ на запрос наличия доступных заданий у собеседника  avatar.RequestInteractions(). Также приходит автоматически при начале разговора.
EVENT_INTERACTION_STARTED = "EVENT_INTERACTION_STARTED"

--- Событие посылается , когда игрок запросил avatar.RequestQuestsForItem( itemId ).
EVENT_ITEM_QUESTS_RECEIVED = "EVENT_ITEM_QUESTS_RECEIVED"

--- Событие посылается при удалении задания сервером из журнала заданий (например, при отсутствии условий выполнения задания).
EVENT_QUEST_ABANDONED = "EVENT_QUEST_ABANDONED"

--- Событие посылается при невозможности взять квест.
EVENT_QUEST_ACCEPT_ERROR = "EVENT_QUEST_ACCEPT_ERROR"

--- Событие посылается каждый раз, когда меняется книга заданий.
EVENT_QUEST_BOOK_CHANGED = "EVENT_QUEST_BOOK_CHANGED"

--- Событие приходит при изменении лимитов журнала заданий: изменении максимально допустимого количества обычных и ежедневных заданий.
EVENT_QUEST_BOOK_LIMITS_CHANGED = "EVENT_QUEST_BOOK_LIMITS_CHANGED"

--- Событие посылается каждый раз, когда игрок попытался сдать уже выполненное задание квестгиверу, и сервер подтвердил, что задание выполнено и сдано (принято ютом).
EVENT_QUEST_COMPLETED = "EVENT_QUEST_COMPLETED"

--- Событие посылается каждый раз, когда игрок удаляет задание из журнала задний (отказывается от выполнения этого задания).
EVENT_QUEST_DISCARDED = "EVENT_QUEST_DISCARDED"

--- Событие посылается при провале квеста.
EVENT_QUEST_FAILED = "EVENT_QUEST_FAILED"

--- Событие посылается, когда с сервера приходит ответ на запрошенную игроком подсказку "какой следующий квест делать" (вызовом avatar.FindNextQuest( mode )).
EVENT_QUEST_FIND_NEXT_RESULT = "EVENT_QUEST_FIND_NEXT_RESULT"

--- Событие посылается при отказе сервера принять задание из-за нехватки места в инвентаре.
EVENT_QUEST_FINISH_FAILED_NO_SPACE = "EVENT_QUEST_FINISH_FAILED_NO_SPACE"

--- Оповещение о смене маркера у объекта-квестодателя. Объект может быть NPC или устройством.
EVENT_QUEST_MARK_UPDATED = "EVENT_QUEST_MARK_UPDATED"

--- Событие посылается каждый раз, когда произошло изменение состояния одного из подзаданий квеста.
EVENT_QUEST_OBJECTIVE_UPDATED = "EVENT_QUEST_OBJECTIVE_UPDATED"

--- Событие посылается при окончании квеста, когда он становится готов к сдаче, или наоборот.
EVENT_QUEST_READY_TO_RETURN_CHANGED = "EVENT_QUEST_READY_TO_RETURN_CHANGED"

--- Событие посылается каждый раз, когда игрок получил и принял задание.
EVENT_QUEST_RECEIVED = "EVENT_QUEST_RECEIVED"

--- Событие посылается каждый раз, когда произошло обновление наград за выполнение задания. Награды при этом могут не измениться.
EVENT_QUEST_REWARD_UPDATED = "EVENT_QUEST_REWARD_UPDATED"

--- Событие посылается, когда другой игрок хочет поделиться своим квестом с группой.
EVENT_QUEST_SHARE_INVITATION = "EVENT_QUEST_SHARE_INVITATION"

--- Событие посылается в результате предложения задания от другого игрока.
EVENT_QUEST_SHARE_INVITATION_RESULT = "EVENT_QUEST_SHARE_INVITATION_RESULT"

--- Событие посылается в случае отмены предложения задания от другого игрока из-за таймаута.
EVENT_QUEST_SHARE_INVITATION_TIMEOUT = "EVENT_QUEST_SHARE_INVITATION_TIMEOUT"

--- Событие посылается при отказе сервера начать задание из-за нехватки места в списке квестов (уже взято максимальное количество квестов).
EVENT_QUEST_START_FAILED_LOG_FULL = "EVENT_QUEST_START_FAILED_LOG_FULL"

--- Событие посылается при отказе сервера начать задание из-за нехватки места в инвентаре.
EVENT_QUEST_START_FAILED_NO_SPACE = "EVENT_QUEST_START_FAILED_NO_SPACE"

--- Событие посылается если время квестового таймера истекло.
EVENT_QUEST_TIMER_FINISHED = "EVENT_QUEST_TIMER_FINISHED"

--- Событие посылается если был запущен квестовый таймер или изменилась его продолжительность.
EVENT_QUEST_TIMER_UPDATED = "EVENT_QUEST_TIMER_UPDATED"

--- Событие посылается каждый раз, когда произошло изменение в списке целей задания.
EVENT_QUEST_UPDATED = "EVENT_QUEST_UPDATED"
