---@meta

--- CategoryGroup
--- События и функции Lua API, относящиеся к работе с группой (и близкие к этому).

--- Результат провальной попытки пригласить игрока в группу.
--- игрока с заданным именем не существует
ENUM_GROUP_INVITE_FAILED_NOT_EXIST = "ENUM_GROUP_INVITE_FAILED_NOT_EXIST"
--- игрока с заданным именем нет в игре
ENUM_GROUP_INVITE_FAILED_NOT_LOGGED_IN = "ENUM_GROUP_INVITE_FAILED_NOT_LOGGED_IN"
--- нельзя приглашать себя
ENUM_GROUP_INVITE_FAILED_CANT_INVITE_SELF = "ENUM_GROUP_INVITE_FAILED_CANT_INVITE_SELF"
--- нельзя приглашать игроков в полную группу
ENUM_GROUP_INVITE_FAILED_FULL_GROUP = "ENUM_GROUP_INVITE_FAILED_FULL_GROUP"
--- указанный игрок уже состоит в группе
ENUM_GROUP_INVITE_FAILED_ALREADY_IN = "ENUM_GROUP_INVITE_FAILED_ALREADY_IN"
--- запрещено приглашение на этой зоне
ENUM_GROUP_INVITE_FAILED_ZONE_NOT_ALLOWED = "ENUM_GROUP_INVITE_FAILED_ZONE_NOT_ALLOWED"
--- главный игрок состоит в группе и не лидер. Он не может приглашать в группу
ENUM_GROUP_INVITE_FAILED_NOT_LEADER = "ENUM_GROUP_INVITE_FAILED_NOT_LEADER"

--- Результат провальной попытки выгнать игрока из группы.
--- главный игрок не состоит в группе
ENUM_GROUP_KICK_FAILED_NOT_IN_GROUP = "ENUM_GROUP_KICK_FAILED_NOT_IN_GROUP"
--- указанный игрок не состоит в группе главного игрока
ENUM_GROUP_KICK_FAILED_OTHER_PLAYER_NOT_IN_GROUP = "ENUM_GROUP_KICK_FAILED_OTHER_PLAYER_NOT_IN_GROUP"
--- главный игрок не является лидером группы
ENUM_GROUP_KICK_FAILED_NOT_LEADER = "ENUM_GROUP_KICK_FAILED_NOT_LEADER"

--- Состояние члена группы:
--- игрок не находится в игре
---@type integer
GROUP_MEMBER_STATE_OFFLINE = nil
--- по игроку доступна вся информация
---@type integer
GROUP_MEMBER_STATE_NEAR = nil
--- игрок в игре, но информация по нему недоступна либо доступна только частично
---@type integer
GROUP_MEMBER_STATE_FAR = nil
--- это не игрок, а NPC-наемник
---@type integer
GROUP_MEMBER_STATE_MERC = nil
--- игрок в статусе AFK
---@type integer
GROUP_MEMBER_STATE_AFK = nil

--- Состояние готовности персонажа.
---@type integer
READY_CHECK_READY_STATE_UNKNOWN = nil
---@type integer
READY_CHECK_READY_STATE_READY = nil
---@type integer
READY_CHECK_READY_STATE_NOT_READY = nil

---@class groupLib
group = {}

--- Возвращает информацию о каналах в текущей зоне.
---@return integer
function group.GetChannelsInfo() end

--- Отправляет команду на смену игрового канала зоны. Успешный результат: перемещение аватара на выбранный канал.
---@param channelIndex integer индекс выбранного канала
function group.SwitchToChannel(channelIndex) end

--- Этим методом даётся ответ на EVENT_TELEPORT_OFFER_REQUEST. Если accept == true, то главный игрок согласен на телепортацию, предложенну. одногруппником.
---@param accept boolean true, если игрок согласен на телепортацию
function group.TeleportOfferReply(accept) end

--- Согласится на приглашение о вступлении в группу. Должно быть активное приглашение (смотри  group.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
function group.Accept() end

--- Возвращает true, если игрок может приглашать в группу других игроков.
---@return boolean
function group.CanInvite() end

--- Возвращает true, если игрок может выгонять из группы других игроков.
---@return boolean
function group.CanKick() end

--- Может ли главный игрок исключать игрока из группы. Возвращает true для лидера, при возможности голосования и т.п..
---@return boolean
function group.CanKickMember() end

--- Возвращает true, если игрок может покинуть группу других игроков.
---@return boolean
function group.CanLeave() end

--- Отказаться от приглашения на вступление в группу. Должно быть активное приглашение (смотри  group.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
function group.Decline() end

--- Информация о приглашении аватара в группу.
---@return table
function group.GetInviteInfo() end

--- Возвращает уникальный идентификатор лидера группы. Группа должна существовать.
---@return UniqueId
function group.GetLeader() end

--- Возвращает информацию о члене группы, включая главного игрока.
---@param id WString идентификатор игрока
---@return table|nil
function group.GetMemberInfo(id) end

--- Возвращает информацию о члене группы по индексу в группе [1-6]. Индекс аватара всегда 1.
---@param index number индекс игрока в группе
---@return table|nil
function group.GetMemberInfoByIndex(index) end

--- Возвращает упорядоченный список членов группы, включая главного игрока. Главный игрок всегда первый в списке (имеет индекс 1). Если группы нет, возвращается nil.
---@return table|nil
function group.GetMembers() end

--- Возвращает информацию о текущем состоянии проверки готовности группы.
---@return table|nil
function group.GetReadyCheckInfo() end

--- Попытка пригласить указанного персонажа в области видимости в свою группу.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в группу
function group.Invite(unitId) end

--- Попытка пригласить персонажа с указанным именем в свою группу.
---@param name WString имя персонажа, приглашаемого в группу
function group.InviteByName(name) end

--- Возвращает true, если группа является автоматически собранной. Такую группу нельзя распускать и из неё нельзя исключать.
---@return boolean
function group.IsAutomatic() end

--- Возвращает true, если указанный игрок или наемник-NPC в группе главного игрока.
---@param id WString имя или идентификатор юнита
---@return boolean
function group.IsCreatureInGroup(id) end

--- Находится ли аватар в какой-нибудь группе.
---@return boolean
function group.IsExist() end

--- Является ли объект лидером группы в которой состоит аватар. Если аватар не состоит в группе - всегда возвращает false, если аватар состоит в группе и аргумент не передан - проверяет является ли аватар лидером группы.
---@return boolean
function group.IsLeader() end

--- Попытка исключить игрока из группы. Исключать может только лидер.
---@param name WString имя игрока в группе
function group.KickMember(name) end

--- Попытка исключить наемника из группы. Исключать может только лидер. Наемник - это NPC, взятый лидером в группу.
---@param objectId ObjectId идентификатор наемника
function group.KickMerc(objectId) end

--- Запрос на выход из группы.
function group.Leave() end

--- Уведомление группы о своей готовности или неготовности к действиям (для текущего активного запроса).
---@param ready boolean готов ли игрок к действиям
function group.ReportReadyCheck(ready) end

--- Попытка будучи лидером группы назначить на эту роль другого персонажа из группы.
---@param uniqueId UniqueId уникальный межсерверный идентификатор игрока из группы
function group.SetLeader(uniqueId) end

--- Запрос серверу о начале проверки готовности группы.
function group.StartReadyCheck() end

-- Events

--- Сообщение приходит, когда согрупник или соотрядник главного игрока получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE = "EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE"

--- Сообщение приходит, когда согрупник или соотрядник главного игрока получает деньги.
EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE = "EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE"

--- По каким-то причинам вступление в группу не сработало.
EVENT_GROUP_ACCEPT_ERROR = "EVENT_GROUP_ACCEPT_ERROR"

--- Событие на появление группы. Присылается не только на действительное создание группы, но и при вхождении игрока в состав уже существующей.
EVENT_GROUP_APPEARED = "EVENT_GROUP_APPEARED"

--- Событие на изменение состава группы (включая создание и роспуск).
EVENT_GROUP_CHANGED = "EVENT_GROUP_CHANGED"

--- Уведомление о смене агрегатного состояния группы: группа -&gt; отряд, отряд -&gt; группа.
EVENT_GROUP_CONVERTED = "EVENT_GROUP_CONVERTED"

--- Прямой отказ персонажа вступить в группу.
EVENT_GROUP_DECLINE = "EVENT_GROUP_DECLINE"

--- Уведомление о невозможности пригласить персонажа в группу.
EVENT_GROUP_DECLINE_BUSY = "EVENT_GROUP_DECLINE_BUSY"

--- Уведомление о невозможности пригласить персонажа в группу по причине игнора.
EVENT_GROUP_DECLINE_IGNORED = "EVENT_GROUP_DECLINE_IGNORED"

--- Событие на исчезновение группы. Присылается не только на роспуск группы, но и при выходе игрока из состава существующей.
EVENT_GROUP_DISAPPEARED = "EVENT_GROUP_DISAPPEARED"

--- Событие о приглашении в группу.
EVENT_GROUP_INVITE = "EVENT_GROUP_INVITE"

--- Присылается в случае исчезновения приглашения в группу. Оно может истечь по времени, быть принято или отклонено.
EVENT_GROUP_INVITE_END = "EVENT_GROUP_INVITE_END"

--- Событие, которое приходит при невозможности пригласить игрока в группу.
EVENT_GROUP_INVITE_FAILED = "EVENT_GROUP_INVITE_FAILED"

--- Уведомление о смене качества итемов для текущей схемы дележа лута в группе.
EVENT_GROUP_ITEM_QUALITY_CHANGED = "EVENT_GROUP_ITEM_QUALITY_CHANGED"

--- Событие, которое приходит при неудачной попытке выгнать игрока из группы.
EVENT_GROUP_KICK_FAILED = "EVENT_GROUP_KICK_FAILED"

--- Уведомление о смене лидера группы главного игрока.
EVENT_GROUP_LEADER_CHANGED = "EVENT_GROUP_LEADER_CHANGED"

--- Уведомление о смене схемы дележа лута в группе.
EVENT_GROUP_LOOT_SCHEME_CHANGED = "EVENT_GROUP_LOOT_SCHEME_CHANGED"

--- Событие приходит при появлении нового члена группы.
EVENT_GROUP_MEMBER_ADDED = "EVENT_GROUP_MEMBER_ADDED"

--- Событие на изменение состояния члена группы (онлайн-офлайн, лидер).
EVENT_GROUP_MEMBER_CHANGED = "EVENT_GROUP_MEMBER_CHANGED"

--- Событие приходит при выходе члена группы из ее состава.
EVENT_GROUP_MEMBER_REMOVED = "EVENT_GROUP_MEMBER_REMOVED"

--- Событие присылается при изменение координат игрока, состоящего в группе с основным игроком.
EVENT_PARTY_MEMBER_POSITION_UPDATED = "EVENT_PARTY_MEMBER_POSITION_UPDATED"

--- Событие посылается при завершении опроса о готовности группы или рейда.
EVENT_READY_CHECK_ENDED = "EVENT_READY_CHECK_ENDED"

--- Событие посылается каждый раз, когда меняется состояние готовности игрока в группе или рейде (для текущего активного опроса). На начало и окончание опроса приходят отдельные события, данное событие в этих случаях не приходит.
EVENT_READY_CHECK_INFO_CHANGED = "EVENT_READY_CHECK_INFO_CHANGED"

--- Событие посылается при начале опроса о готовности группы или рейда.
EVENT_READY_CHECK_STARTED = "EVENT_READY_CHECK_STARTED"

--- Сообщение приходит, когда одногруппник собирается телепортироваться. Ответить нужно avatar.TeleportOfferReply( accept ). На ответ отводится определённое время.
EVENT_TELEPORT_OFFER_REQUEST = "EVENT_TELEPORT_OFFER_REQUEST"
