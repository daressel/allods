---@meta

---@class raidLib
raid = {}

---@class RaidGetMemberInfoResult
---@field id ObjectId идентификатор персонажа или nil, если его нет в игре (порвалась связь и т.п.)
---@field uniqueId UniqueId или nil nil если нет информации; иначе уникальный постоянный идентификатор персонажа (равен параметру memberId)
---@field name string имя персонажа
---@field className string системное название класса игрока (нелокализуемое)
---@field classLocalName string лорное название класса игрока (локализуемое)
---@field level integer|nil уровень игрока или nil, если он не известен в данный момент
---@field state number состояние игрока
---@field isInCombat boolean если true, то игрок в бою

---@class RaidGetMemberRightsResult
---@field key number тип права
---@field value boolean true такое право есть

---@class RaidGetMembersResult
---@field key number индекс группы в списке
---@field value table список игроков в группе:
---@field key number индекс персонажа в списке
---@field value table таблица с информацией о персонаже:
---@field id ObjectId идентификатор персонажа или nil, если его нет в игре (порвалась связь и т.п.)
---@field uniqueId UniqueId или nil nil если нет информации; иначе уникальный постоянный идентификатор персонажа
---@field name string имя персонажа
---@field className string системное название класса игрока (нелокализуемое)
---@field classLocalName string лорное название класса игрока (локализуемое)
---@field level integer|nil уровень игрока или nil, если он не известен в данный момент
---@field state number состояние игрока

---@class RaidGetReadyCheckInfoResult
---@field isInProgress boolean активен или запрос о готовности (в процессе доклада) или завершен
---@field remainingTimeMs integer оставшееся время до окончания активного запроса о готовности в миллисекундах
---@field initiatorId UniqueId уникальный идентификатор инициатора запроса
---@field members table таблица, индексированная [0..], содержащая информацию о готовности членов рейда:
---@field uniqueId UniqueId уникальный идентификатор члена рейда
---@field state number состояние готовности

---Согласиться на приглашение в рейд. Должно быть активное приглашение (смотри  raid.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
---@return нет
function raid.Accept() end

---Добавляет право члену рейда.
---@param uniqueId UniqueId идентификатор участника отряда
---@param right number добавляемое право
---@return нет
function raid.AddRight(uniqueId, right) end

---Можно ли пригласить указанного персонажа в рейд. Если рейда нет возвращает false. Если unitId не передан - проверяет можно ли в принципе пригласить кого либо в рейд.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в рейд
---@return boolean
function raid.CanInvite(unitId) end

---Можно ли выгонять из рейда.
---@return boolean
function raid.CanKick() end

---Можно ли покинуть рейд.
---@return boolean
function raid.CanLeave() end

---Назначает нового лидера рейда.
---@param uniqueId UniqueId идентификатор участника отряда, нового лидера
---@return нет
function raid.ChangeLeader(uniqueId) end

---Создает рейд. Рейд создается лидером группы.
---@return нет
function raid.Create() end

---Создает малый рейд, численностью 12 участников. Рейд создается лидером группы.
---@return нет
function raid.CreateSmall() end

---Отказаться от приглашения в рейд. Должно быть активное приглашение (смотри  raid.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
---@return нет
function raid.Decline() end

---Распускает рейд.
---@return нет
function raid.Disband() end

---Информация о приглашении аватара в рейд.
---@return таблица с полями
function raid.GetInviteInfo() end

---Возвращает уникальный идентификатор лидера рейда.
---@return UniqueId
function raid.GetLeader() end

---Возвращает уникальные идентификаторы помощников лидера рейда. Таблица может быть пустой в случае отсутствия помощников.
---@return UniqueId|nil[]
function raid.GetLeaderHelpers() end

---Возвращает уникальный идентификатор ответственного за добычу рейда. Уникальный идентификатор может быть пустым в случае отсутствия ответственного.
---@return UniqueId|nil
function raid.GetLootMaster() end

---Возвращает максимальное количество групп в рейде
---@return number
function raid.GetMaxGroupCount() end

---Возвращает информацию о члене рейда. При поиске по нику (WString) возможна коллизия на межсерверных активностях.
---@param memberId WString / UniqueId / ObjectId идентификатор персонажа
---@return RaidGetMemberInfoResult
function raid.GetMemberInfo(memberId) end

---Возвращает список прав членов рейда.
---@param uniqueId UniqueId идентификатор участника отряда
---@return RaidGetMemberRightsResult
function raid.GetMemberRights(uniqueId) end

---Возвращает упорядоченный список членов рейда. Если аватар не состоит в рейде, то вызов считается ошибкой.
---@return RaidGetMembersResult
function raid.GetMembers() end

---Возвращает информацию о текущем состоянии проверки готовности рейда.
---@return RaidGetReadyCheckInfoResult
function raid.GetReadyCheckInfo() end

---Попытка пригласить указанного персонажа в рейд.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в рейд
---@return нет
function raid.Invite(unitId) end

---Попытка пригласить указанного персонажа в рейд по его имени.
---@param name string имя персонажа, приглашаемого в рейд
---@return нет
function raid.InviteByName(name) end

---Является ли отряд автоматически собранным. Такой рейд нельзя распускать и из него нельзя исключать.
---@return boolean
function raid.IsAutomatic() end

---Находится ли аватар в каком-нибудь рейде.
---@return boolean
function raid.IsExist() end

---Является ли объект лидером рейда в котором состоит аватар. Если аватар не состоит в рейде - всегда возвращает false, если аватар состоит в рейде и аргумент не передан - проверяет является ли аватар лидером рейда. Проверка по нику (WString) неустойчива к коллизии ников на межсерверных активностях.
---@return boolean
function raid.IsLeader() end

---Перемещает члена рейда в отдельную (новую) группу.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника отряда
---@return нет
function raid.IsolateMember(uniqueId) end

---Находится ли игрок в том же рейде что и аватар.
---@param player WString / ObjectId / UniqueId имя или идентификатор игрока
---@return boolean
function raid.IsPlayerInAvatarsRaid(player) end

---Находится ли игрок в той же группе рейда, что и аватар.
---@param playerName WString / ObjectId / UniqueId имя или идентификатор игрока
---@return boolean
function raid.IsPlayerInAvatarsRaidGroup(playerName) end

---Выйти из рейда.
---@return нет
function raid.Leave() end

---Cогласиться на сохранение в карте рейдового инстанса в ответ на EVENT_RAID_SAVE_MAP_QUESTION.
---@param response boolean true, если согласны на сохранение
---@return нет
function raid.MapSaveResponse(response) end

---Ответ серверу на событие  EVENT_RAID_ENTER_VARS_MAP_WARNING
---@return нет
function raid.MapVarsSaveResponse() end

---Перемещает члена рейда в указанную группу.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника группы
---@param groupNumber integer номер новой группы (группа должна уже существовать), нумерация групп начинается с нуля.
---@return нет
function raid.MoveMemberToGroup(uniqueId, groupNumber) end

---Отнимает право у члена рейда.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника отряда
---@param right number отнимаемое право
---@return нет
function raid.RemoveRight(uniqueId, right) end

---Уведомление рейду о своей готовности или неготовности к действиям (для текущего активного запроса).
---@param ready boolean готов ли игрок к действиям
---@return нет
function raid.ReportReadyCheck(ready) end

---Запрос серверу о начале проверки готовности рейда.
---@return нет
function raid.StartReadyCheck() end

---Меняет местами двух членов отряда в разных группах.
---@param playerId1 UniqueId кросс-серверный постоянный идентификатор участника отряда
---@param playerId2 UniqueId кросс-серверный постоянный идентификатор участника отряда
---@return нет
function raid.SwapMembers(playerId1, playerId2) end
