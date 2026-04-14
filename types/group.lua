---@meta

---@class groupLib
group = {}

---@class GroupGetMemberInfoResult
---@field name string имя персонажа
---@field state number состояние персонажа
---@field isInCombat boolean если true, то игрок в бою
---@field id ObjectId идентификатор персонажа или nil, если его нет поблизости (порвалась связь, в другой зоне и т.д.)
---@field uniqueId UniqueId постоянный идентификатор персонажа (есть всегда, не изменяется при релогине)
---@field level integer|nil уровень игрока или nil, если он не известен в данный момент
---@field className string|nil системное название класса игрока (нелокализуемое)
---@field classLocalName WString или nil лорное название класса игрока (локализуемое)

---@class GroupGetMembersResult
---@field key number индекс персонажа в списке, персонаж главного игрока всегда имеет индекс 1
---@field value table таблица с информацией о персонаже из группы:
---@field name string имя персонажа
---@field state number состояние персонажа
---@field isInCombat boolean если true, то игрок в бою
---@field id ObjectId идентификатор персонажа или nil, если его нет поблизости (порвалась связь, в другой зоне и т.д.)
---@field uniqueId UniqueId или nil постоянный идентификатор персонажа (у аватара есть всегда и не изменяется при релогине, у моба-наёмника отсутствует)
---@field level integer|nil уровень игрока или nil, если он не известен в данный момент
---@field className string|nil системное название класса игрока (нелокализуемое)
---@field classLocalName WString или nil лорное название класса игрока (локализуемое)

---@class GroupGetReadyCheckInfoResult
---@field isInProgress boolean активен или запрос о готовности (в процессе доклада) или завершен
---@field remainingTimeMs integer оставшееся время до окончания активного запроса о готовности в миллисекундах
---@field initiatorId UniqueId уникальный идентификатор инициатора запроса
---@field members table таблица, индексированная [0..], содержащая информацию о готовности членов группы:
---@field uniqueId UniqueId уникальный идентификатор члена группы
---@field state number состояние готовности

---Согласится на приглашение о вступлении в группу. Должно быть активное приглашение (смотри  group.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
---@return нет
function group.Accept() end

---Возвращает true, если игрок может приглашать в группу других игроков.
---@return boolean
function group.CanInvite() end

---Возвращает true, если игрок может выгонять из группы других игроков.
---@return boolean
function group.CanKick() end

---Может ли главный игрок исключать игрока из группы. Возвращает true для лидера, при возможности голосования и т.п..
---@return boolean
function group.CanKickMember() end

---Возвращает true, если игрок может покинуть группу других игроков.
---@return boolean
function group.CanLeave() end

---Отказаться от приглашения на вступление в группу. Должно быть активное приглашение (смотри  group.GetInviteInfo()). Вызов функции в отсутствии приглашения считается ошибкой.
---@return нет
function group.Decline() end

---Информация о приглашении аватара в группу.
---@return таблица с полями
function group.GetInviteInfo() end

---Возвращает уникальный идентификатор лидера группы. Группа должна существовать.
---@return UniqueId
function group.GetLeader() end

---Возвращает информацию о члене группы, включая главного игрока. При поиске по нику (WString) возможна коллизия на межсерверных активностях.
---@param id WString / UniqueId / ObjectId идентификатор игрока
---@return GroupGetMemberInfoResult
function group.GetMemberInfo(id) end

---Возвращает информацию о члене группы по индексу в группе [1-6]. Индекс аватара всегда 1. Возвращаемое значение - аналогично  group.GetMemberInfo
---@param index number индекс игрока в группе
---@return table|nil
function group.GetMemberInfoByIndex(index) end

---Возвращает упорядоченный список членов группы, включая главного игрока. Главный игрок всегда первый в списке (имеет индекс 1). Если группы нет, возвращается nil.
---@return GroupGetMembersResult
function group.GetMembers() end

---Возвращает информацию о текущем состоянии проверки готовности группы.
---@return GroupGetReadyCheckInfoResult
function group.GetReadyCheckInfo() end

---Попытка пригласить указанного персонажа в области видимости в свою группу.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в группу
---@return нет
function group.Invite(unitId) end

---Попытка пригласить персонажа с указанным именем в свою группу.
---@param name string имя персонажа, приглашаемого в группу
---@return нет
function group.InviteByName(name) end

---Возвращает true, если группа является автоматически собранной. Такую группу нельзя распускать и из неё нельзя исключать.
---@return boolean
function group.IsAutomatic() end

---Возвращает true, если указанный игрок или наемник-NPC в группе главного игрока.
---@param id WString / ObjectId / UniqueId имя или идентификатор юнита
---@return boolean
function group.IsCreatureInGroup(id) end

---Находится ли аватар в какой-нибудь группе.
---@return boolean
function group.IsExist() end

---Является ли объект лидером группы в которой состоит аватар. Если аватар не состоит в группе - всегда возвращает false, если аватар состоит в группе и аргумент не передан - проверяет является ли аватар лидером группы. Проверка по нику (WString) неустойчива к коллизии ников на межсерверных активностях.
---@return boolean
function group.IsLeader() end

---Попытка исключить игрока из группы. Исключать может только лидер.
---@param name string имя игрока в группе
---@return нет
function group.KickMember(name) end

---Попытка исключить наемника из группы. Исключать может только лидер. Наемник - это NPC, взятый лидером в группу.
---@param objectId ObjectId идентификатор наемника
---@return нет
function group.KickMerc(objectId) end

---Запрос на выход из группы.
---@return нет
function group.Leave() end

---Уведомление группы о своей готовности или неготовности к действиям (для текущего активного запроса).
---@param ready boolean готов ли игрок к действиям
---@return нет
function group.ReportReadyCheck(ready) end

---Попытка будучи лидером группы назначить на эту роль другого персонажа из группы.
---@param uniqueId UniqueId уникальный межсерверный идентификатор игрока из группы
---@return нет
function group.SetLeader(uniqueId) end

---Запрос серверу о начале проверки готовности группы.
---@return нет
function group.StartReadyCheck() end
