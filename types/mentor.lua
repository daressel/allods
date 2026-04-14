---@meta

---@class mentorLib
mentor = {}

---Возвращает список учеников ментора.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
function mentor.GetApprentices(mentorPlayerId) end

---Возвращает информацию о кулдаунах на запрет каких-либо действий в менторстве. Для каждого запрета возвращается количество миллисекунд, которые остались до окончания запрета на это действие. Если запрета нет, то для данного действия возвращается 0.
---@param mentorRefuseRemainingMs integer сколько миллисекунд осталось до окончания запрета на отказ от ментора
---@param apprenticeRefuseRemainingMs integer на отказ от ученика
---@param mentorFlagRemainingMs integer на сброс флага ментора
---@param apprenticeFlagRemainingMs integer на сброс флага ученика
function mentor.GetCooldownsInfo(mentorRefuseRemainingMs, apprenticeRefuseRemainingMs, mentorFlagRemainingMs, apprenticeFlagRemainingMs) end

---Возвращает информацию о активности главного игрока, связанной с менторством. Идентификатор описателя субъекта менторских взаимоотношений определяет этого субъекта. Им может быть как ментор, так и ученик. См.  mentor.GetPlayerInfo( mentorPlayerId ).
---@param apprenticeMentorId ObjectId идентификатор субъекта менторских взаимоотношений главного игрока, у которого главный игрок состоит учеником
---@param mentorId ObjectId идентификатор субъекта менторских взаимоотношений, которым является сам главный игрок будучи ментором
---@param avatarApprenticeId ObjectId идентификатор субъекта менторских взаимоотношений, которым является сам главный игрок будучи учеником какого-то ментора
---@param apprenticeFlag boolean true, если главный игрок выставил флаг, что он хочет быть учеником
---@param mentorFlag boolean true, если главный игрок выставил флаг, что он хочет быть ментором
---@param canBeMentor boolean true, если главный игрок может быть ментором
---@param canBeApprentice boolean true, если главный игрок может быть учеником
function mentor.GetManagerInfo(apprenticeMentorId, mentorId, avatarApprenticeId, apprenticeFlag, mentorFlag, canBeMentor, canBeApprentice) end

---Возвращает сообщение ментора, которое ментор может показывать своим ученикам.
---@param mentorId ObjectId идентификатор ментора
---@return string
function mentor.GetMessage(mentorId) end

---Возвращает подробное описание игрока - субъекта менторских взаимоотношений. См. LuaRaceClassInfoPart, LuaSexInfoPart, LuaFullDateTime.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
---@param id ObjectId идентификатор субъекта менторских взаимоотношений
---@param isOnline boolean true, если этот субъект в онлайне
---@param playerId ObjectId|nil идентификатор игрока (интерактивного объекта), если он в онлайне. nil - если в оффлайне или вне репликации
---@param mentorId ObjectId|nil идентификатор субъекта менторских взаимоотношений ментора, у которого данный субъект в учениках. Если nil, то субъект - ментор
---@param canRefuse boolean может ли главный игрок выгнать этого субъекта из своих учеников (просто проверяет, что это ученик главного игрока)
---@param offlineInfo table всегда доступная, оффлайновая информация о субъекте
---@param name string имя
---@param guild string|nil гильдия игрока, если есть
---@param level integer уровень
---@param zoneId ObjectId|nil идентификатор интерфейсной карты, если она доступна для этого игрока
---@param raceClass table|nil раса-класс персонажа
---@param sex table|nil описание пола персонажа
---@param startTime table|nil- если не произошло ошибки, то таблица описывающая начало учителства/ученичества
---@param lastOnlineTime table|nil если не произошло ошибки, то таблица описывающая время последнего онлайна
function mentor.GetPlayerInfo(mentorPlayerId, id, isOnline, playerId, mentorId, canRefuse, offlineInfo, name, guild, level, zoneId, raceClass, sex, startTime, lastOnlineTime) end

---Возвращает подробное описание наград, которые дает (будет периодически давать) или уже дал ученик - субъект менторских взаимоотношений.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
---@param moneyPercent integer сколько процентов заработаных денег ментор дополнительно получает от ученика
---@param realMoney integer сколько процентов заработаных денег ментор уже получил от ученика
---@param items table[] индексированная с 0 таблица описаний предметов, определенный процент которых получает ментор
---@param itemId ObjectId идентификатор предмета
---@param percent integer сколько процентов таких предметов получает ментор при получении предметов учеником
---@param realCount integer сколько таких предметов уже получил ментор при получении предметов учеником
function mentor.GetPlayerReward(mentorPlayerId, moneyPercent, realMoney, items, itemId, percent, realCount) end

---Возвращает предсказанние о кулдаунах на запрет каких-либо действий в менторстве. Для каждого запрета возвращается количество миллисекунд от начала действия до окончания запрета на это действие. Если запрета не будет, то для данного действия возвращается 0.
---@param mentorRefuseRemainingMs integer сколько миллисекунд будет длиться запрет на отказ от ментора
---@param apprenticeRefuseRemainingMs integer на отказ от ученика
---@param mentorFlagRemainingMs integer на сброс флага ментора
---@param apprenticeFlagRemainingMs integer на сброс флага ученика
function mentor.GetPredictedCooldownsInfo(mentorRefuseRemainingMs, apprenticeRefuseRemainingMs, mentorFlagRemainingMs, apprenticeFlagRemainingMs) end

---Делает попытку выгнать ученика главного игрока.
---@param mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений
function mentor.RefuseApprentice(mentorPlayerId) end

---Главный игрок делает попытку отказаться от своего ментора.
function mentor.RefuseMentor() end

---Поднимает у главного игрока флаг желания стать учеником.
---@param flag boolen желаемое значение флага
function mentor.SetApprenticeFlag(flag) end

---Поднимает у главного игрока флаг желания стать ментором.
---@param flag boolen желаемое значение флага
function mentor.SetMentorFlag(flag) end

---Изменяет сообщение ментора, которое ментор может показывать своим ученикам. Сработает если главный игрок - ментор.
---@param message string текстовое сообщение
---@return нет
function mentor.SetMessage(message) end
