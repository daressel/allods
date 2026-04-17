---@meta

--- CategoryRaid
--- События и функции Lua API, относящиеся к работе с рейдами (и близкие к этому).

--- Причина невыполнения действия с рейдом. Текстовый енум, провверяется на билдере. Префикс для проверки "ENUM_RAID_FAILED".
ENUM_RAID_FAILED_NOT_ENOUGH_RIGHTS = "ENUM_RAID_FAILED_NOT_ENOUGH_RIGHTS"
ENUM_RAID_FAILED_PLAYER_IS_NOT_IN_RAID = "ENUM_RAID_FAILED_PLAYER_IS_NOT_IN_RAID"
ENUM_RAID_FAILED_PLAYER_ALREADY_IN_RAID = "ENUM_RAID_FAILED_PLAYER_ALREADY_IN_RAID"
ENUM_RAID_FAILED_LEADER_CANT_LEAVE = "ENUM_RAID_FAILED_LEADER_CANT_LEAVE"
ENUM_RAID_FAILED_ZONE_NOT_ALLOWED = "ENUM_RAID_FAILED_ZONE_NOT_ALLOWED"
ENUM_RAID_FAILED_ALREADY_FULL = "ENUM_RAID_FAILED_ALREADY_FULL"

--- Права члена рейда:
--- игрок является помощником лидера
---@type integer
RAID_MEMBER_RIGHT_LEADER_HELPER = nil
--- игрок является лут-мастером
---@type integer
RAID_MEMBER_RIGHT_LOOT_MASTER = nil

--- Состояние члена рейда:
--- игрок не находится в игре
---@type integer
RAID_MEMBER_STATE_OFFLINE = nil
--- по игроку доступна вся информация
---@type integer
RAID_MEMBER_STATE_NEAR = nil
--- игрок в игре, но информация по нему недоступна либо доступна только частично
---@type integer
RAID_MEMBER_STATE_FAR = nil
--- игрок в статусе AFK
---@type integer
RAID_MEMBER_STATE_AFK = nil

--- Состояние готовности персонажа.
---@type integer
READY_CHECK_READY_STATE_UNKNOWN = nil
---@type integer
READY_CHECK_READY_STATE_READY = nil
---@type integer
READY_CHECK_READY_STATE_NOT_READY = nil

---@class raidLib
raid = {}

--- Согласиться на приглашение в рейд. Должно быть активное приглашение (смотри  raid.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
function raid.Accept() end

--- Добавляет право члену рейда.
---@param uniqueId UniqueId идентификатор участника отряда
---@param right integer добавляемое право
function raid.AddRight(uniqueId, right) end

--- Можно ли пригласить указанного персонажа в рейд. Если рейда нет возвращает false. Если unitId не передан - проверяет можно ли в принципе пригласить кого либо в рейд.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в рейд
---@return boolean
function raid.CanInvite(unitId) end

--- Можно ли выгонять из рейда.
---@return boolean
function raid.CanKick() end

--- Можно ли покинуть рейд.
---@return boolean
function raid.CanLeave() end

--- Назначает нового лидера рейда.
---@param uniqueId UniqueId идентификатор участника отряда, нового лидера
function raid.ChangeLeader(uniqueId) end

--- Создает рейд. Рейд создается лидером группы.
function raid.Create() end

--- Создает малый рейд, численностью 12 участников. Рейд создается лидером группы.
function raid.CreateSmall() end

--- Отказаться от приглашения в рейд. Должно быть активное приглашение (смотри  raid.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
function raid.Decline() end

--- Распускает рейд.
function raid.Disband() end

--- Информация о приглашении аватара в рейд.
---@return table
function raid.GetInviteInfo() end

--- Возвращает уникальный идентификатор лидера рейда.
---@return UniqueId
function raid.GetLeader() end

--- Возвращает уникальные идентификаторы помощников лидера рейда. Таблица может быть пустой в случае отсутствия помощников.
---@return UniqueId[]|nil
function raid.GetLeaderHelpers() end

--- Возвращает уникальный идентификатор ответственного за добычу рейда. Уникальный идентификатор может быть пустым в случае отсутствия ответственного.
---@return UniqueId|nil
function raid.GetLootMaster() end

--- Возвращает максимальное количество групп в рейде
---@return number
function raid.GetMaxGroupCount() end

--- Возвращает информацию о члене рейда.
---@param memberId WString идентификатор персонажа
---@return -
function raid.GetMemberInfo(memberId) end

--- Возвращает список прав членов рейда.
---@param uniqueId UniqueId идентификатор участника отряда
---@return список
function raid.GetMemberRights(uniqueId) end

--- Возвращает упорядоченный список членов рейда. Если аватар не состоит в рейде, то вызов считается ошибкой.
---@return список
function raid.GetMembers() end

--- Возвращает информацию о текущем состоянии проверки готовности рейда.
---@return table|nil
function raid.GetReadyCheckInfo() end

--- Попытка пригласить указанного персонажа в рейд.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в рейд
function raid.Invite(unitId) end

--- Попытка пригласить указанного персонажа в рейд по его имени.
---@param name WString имя персонажа, приглашаемого в рейд
function raid.InviteByName(name) end

--- Является ли отряд автоматически собранным. Такой рейд нельзя распускать и из него нельзя исключать.
---@return boolean
function raid.IsAutomatic() end

--- Находится ли аватар в каком-нибудь рейде.
---@return boolean
function raid.IsExist() end

--- Является ли объект лидером рейда в котором состоит аватар. Если аватар не состоит в рейде - всегда возвращает false, если аватар состоит в рейде и аргумент не передан - проверяет является ли аватар лидером рейда.
---@return boolean
function raid.IsLeader() end

--- Перемещает члена рейда в отдельную (новую) группу.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника отряда
function raid.IsolateMember(uniqueId) end

--- Находится ли игрок в том же рейде что и аватар.
---@param player WString имя или идентификатор игрока
---@return boolean
function raid.IsPlayerInAvatarsRaid(player) end

--- Находится ли игрок в той же группе рейда, что и аватар.
---@param playerName WString имя или идентификатор игрока
---@return boolean
function raid.IsPlayerInAvatarsRaidGroup(playerName) end

--- Попытка исключить игрока из рейда.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника отряда
function raid.Kick(uniqueId) end

--- Выйти из рейда.
function raid.Leave() end

--- Cогласиться на сохранение в карте рейдового инстанса в ответ на EVENT_RAID_SAVE_MAP_QUESTION.
---@param response boolean true, если согласны на сохранение
function raid.MapSaveResponse(response) end

--- Ответ серверу на событие  EVENT_RAID_ENTER_VARS_MAP_WARNING
function raid.MapVarsSaveResponse() end

--- Перемещает члена рейда в указанную группу.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника группы
---@param groupNumber integer номер новой группы (группа должна уже существовать), нумерация групп начинается с нуля.
function raid.MoveMemberToGroup(uniqueId, groupNumber) end

--- Отнимает право у члена рейда.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника отряда
---@param right integer отнимаемое право
function raid.RemoveRight(uniqueId, right) end

--- Уведомление рейду о своей готовности или неготовности к действиям (для текущего активного запроса).
---@param ready boolean готов ли игрок к действиям
function raid.ReportReadyCheck(ready) end

--- Запрос серверу о начале проверки готовности рейда.
function raid.StartReadyCheck() end

--- Меняет местами двух членов отряда в разных группах.
---@param playerId1 UniqueId кросс-серверный постоянный идентификатор участника отряда
---@param playerId2 UniqueId кросс-серверный постоянный идентификатор участника отряда
function raid.SwapMembers(playerId1, playerId2) end

-- Events

--- Присылается в случае неудачной попытки приглашения в рейд (игрок уже в рейде).
EVENT_RAID_ALREADY_IN = "EVENT_RAID_ALREADY_IN"

--- Событие на появление рейда. Присылается не только на действительное создание рейда, но и при вхождении игрока в состав уже существующего.
EVENT_RAID_APPEARED = "EVENT_RAID_APPEARED"

--- Присылается в случае невозможности вступить в рейд (после вызова raid.Accept()).
EVENT_RAID_CANT_ACCEPT = "EVENT_RAID_CANT_ACCEPT"

--- Присылается в случае невозможности попасть на локацию, так как игрок не вступил в рейд.
EVENT_RAID_CANT_ENTER_MAP = "EVENT_RAID_CANT_ENTER_MAP"

--- Событие на изменение состава рейда (включая создание и роспуск).
EVENT_RAID_CHANGED = "EVENT_RAID_CHANGED"

--- Присылается в случае неудачной попытки приглашения в рейд.
EVENT_RAID_DECLINE = "EVENT_RAID_DECLINE"

--- Присылается в случае неудачной попытки приглашения в рейд (игрок занят).
EVENT_RAID_DECLINE_BUSY = "EVENT_RAID_DECLINE_BUSY"

--- Уведомление о невозможности приглашения в рейд по причине игнора.
EVENT_RAID_DECLINE_IGNORED = "EVENT_RAID_DECLINE_IGNORED"

--- Событие на исчезновение рейда. Присылается не только на роспуск рейда, но и при выходе игрока из состава существующего.
EVENT_RAID_DISAPPEARED = "EVENT_RAID_DISAPPEARED"

--- Присылается при попытке войти в инст, когда в инст не пустят.
EVENT_RAID_ENTER_VARS_MAP_UNAVALIABLE = "EVENT_RAID_ENTER_VARS_MAP_UNAVALIABLE"

--- Присылается при попытке войти в инст, когда прогресс инста не соответствует прогрессу сохранения.
EVENT_RAID_ENTER_VARS_MAP_WARNING = "EVENT_RAID_ENTER_VARS_MAP_WARNING"

--- Присылается в случае невозможности выполнить указанную операцию с рейдом.
EVENT_RAID_FAILED = "EVENT_RAID_FAILED"

--- Присылается в случае получения приглашения в рейд.
EVENT_RAID_INVITE = "EVENT_RAID_INVITE"

--- Присылается в случае исчезновения приглашения в рейд. Оно может истечь по времени, быть принято или отклонено.
EVENT_RAID_INVITE_END = "EVENT_RAID_INVITE_END"

--- Присылается в случае изменения лидера рейда.
EVENT_RAID_LEADER_CHANGED = "EVENT_RAID_LEADER_CHANGED"

--- Присылается в случае изменения помощника лидера рейда.
EVENT_RAID_LEADER_HELPER_CHANGED = "EVENT_RAID_LEADER_HELPER_CHANGED"

--- Присылается в случае изменения ответственного за лут рейда.
EVENT_RAID_LOOT_MASTER_CHANGED = "EVENT_RAID_LOOT_MASTER_CHANGED"

--- Присылается в случае появления игрока в отряде.
EVENT_RAID_MEMBER_ADDED = "EVENT_RAID_MEMBER_ADDED"

--- Присылается в случае изменения один или более параметров члена рейда
EVENT_RAID_MEMBER_CHANGED = "EVENT_RAID_MEMBER_CHANGED"

--- Событие присылается при изменение координат игрока, состоящего в отряде с основным игроком.
EVENT_RAID_MEMBER_POSITION_UPDATED = "EVENT_RAID_MEMBER_POSITION_UPDATED"

--- Присылается в случае удаления или ухода игрока из отряда.
EVENT_RAID_MEMBER_REMOVED = "EVENT_RAID_MEMBER_REMOVED"

--- Предложение о сохранении в этой карте. Присылается в случае захода в существующий рейдовый инстанс.
EVENT_RAID_SAVE_MAP_QUESTION = "EVENT_RAID_SAVE_MAP_QUESTION"

--- Событие посылается при завершении опроса о готовности группы или рейда.
EVENT_READY_CHECK_ENDED = "EVENT_READY_CHECK_ENDED"

--- Событие посылается каждый раз, когда меняется состояние готовности игрока в группе или рейде (для текущего активного опроса). На начало и окончание опроса приходят отдельные события, данное событие в этих случаях не приходит.
EVENT_READY_CHECK_INFO_CHANGED = "EVENT_READY_CHECK_INFO_CHANGED"

--- Событие посылается при начале опроса о готовности группы или рейда.
EVENT_READY_CHECK_STARTED = "EVENT_READY_CHECK_STARTED"
