---@meta

--- CategoryMentor
--- События и методы для работы с системой менторства (учитель-ученик).

---@class mentorLib
mentor = {}

--- Возвращает список учеников ментора.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
function mentor.GetApprentices(mentorPlayerId) end

--- Возвращает информацию о кулдаунах на запрет каких-либо действий в менторстве. Для каждого запрета возвращается количество миллисекунд, которые остались до окончания запрета на это действие. Если запрета нет, то для данного действия возвращается 0.
function mentor.GetCooldownsInfo() end

--- Возвращает информацию о активности главного игрока, связанной с менторством.
function mentor.GetManagerInfo() end

--- Возвращает сообщение ментора, которое ментор может показывать своим ученикам.
---@param mentorId ObjectId идентификатор ментора
---@return WString
function mentor.GetMessage(mentorId) end

--- Возвращает подробное описание игрока - субъекта менторских взаимоотношений.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
function mentor.GetPlayerInfo(mentorPlayerId) end

--- Возвращает подробное описание наград, которые дает (будет периодически давать) или уже дал ученик - субъект менторских взаимоотношений.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
function mentor.GetPlayerReward(mentorPlayerId) end

--- Возвращает предсказанние о кулдаунах на запрет каких-либо действий в менторстве. Для каждого запрета возвращается количество миллисекунд от начала действия до окончания запрета на это действие. Если запрета не будет, то для данного действия возвращается 0.
function mentor.GetPredictedCooldownsInfo() end

--- Делает попытку выгнать ученика главного игрока.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
function mentor.RefuseApprentice(mentorPlayerId) end

--- Главный игрок делает попытку отказаться от своего ментора.
function mentor.RefuseMentor() end

--- Поднимает у главного игрока флаг желания стать учеником.
---@param flag boolen желаемое значение флага
function mentor.SetApprenticeFlag(flag) end

--- Поднимает у главного игрока флаг желания стать ментором.
---@param flag boolen желаемое значение флага
function mentor.SetMentorFlag(flag) end

--- Изменяет сообщение ментора, которое ментор может показывать своим ученикам. Сработает если главный игрок - ментор.
---@param message WString текстовое сообщение
function mentor.SetMessage(message) end

-- Events

--- Уведомление об изменении метора главного игрока, у которого главный игрок состоит в учениках.
EVENT_APPRENTICE_MENTOR_CHANGED = "EVENT_APPRENTICE_MENTOR_CHANGED"

--- Уведомление о появлении у ментора нового ученика.
EVENT_MENTOR_APPRENTICE_ADDED = "EVENT_MENTOR_APPRENTICE_ADDED"

--- Уведомление об исчезновении ученика у ментора.
EVENT_MENTOR_APPRENTICE_REMOVED = "EVENT_MENTOR_APPRENTICE_REMOVED"

--- Сообщение приходит, если у субъекта менторских взаимоотношений изменилась награда, полученная с ученика.
EVENT_MENTOR_APPRENTICE_REWARD_CHANGED = "EVENT_MENTOR_APPRENTICE_REWARD_CHANGED"

--- Уведомление об изменении метора, которым является главный игрок.
EVENT_MENTOR_CHANGED = "EVENT_MENTOR_CHANGED"

--- Уведомление об изменении какого-то кулдауна менторской системы.
EVENT_MENTOR_COOLDOWNS_CHANGED = "EVENT_MENTOR_COOLDOWNS_CHANGED"

--- Уведомление об изменении общей информации о менторстве (флаги возможности/желания стать ментором/учеником).
EVENT_MENTOR_DATA_CHANGED = "EVENT_MENTOR_DATA_CHANGED"

--- Сообщение приходит, если у ментора поменялась общая информация (изменился субъект менторских взаимоотношений и надо обновить его поля).
EVENT_MENTOR_INFO_CHANGED = "EVENT_MENTOR_INFO_CHANGED"

--- Уведомление об изменении сообщения ментора.
EVENT_MENTOR_MESSAGE_CHANGED = "EVENT_MENTOR_MESSAGE_CHANGED"

--- Сообщение приходит, если у субъекта менторских взаимоотношений изменились какие-то поля.
EVENT_MENTOR_PLAYER_INFO_CHANGED = "EVENT_MENTOR_PLAYER_INFO_CHANGED"
