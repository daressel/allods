---@meta

--- CategoryLfgLib
--- События и функции Lua API, относящиеся к работе LFG(Looking for group), системе подбора групп.

--- Причина сбоя действия с LFG.
--- выбрана не подходящая персонажу роль в группе
ENUM_LfgActionFail_InvalidRole = "ENUM_LfgActionFail_InvalidRole"
--- невозможно отправиться в выбранную локацию
ENUM_LfgActionFail_InvalidDestination = "ENUM_LfgActionFail_InvalidDestination"
--- инициировать отправку в выбранную локацию может только лидер группы
ENUM_LfgActionFail_LeaderRequire = "ENUM_LfgActionFail_LeaderRequire"

--- Сложность LFG-эвента.
ENUM_LFGEventDifficulty_Easy = "ENUM_LFGEventDifficulty_Easy"
ENUM_LFGEventDifficulty_Normal = "ENUM_LFGEventDifficulty_Normal"
ENUM_LFGEventDifficulty_Hard = "ENUM_LFGEventDifficulty_Hard"

--- Роль игрока в группе при подборе участников.
ENUM_LFGRole_Tank = "ENUM_LFGRole_Tank"
ENUM_LFGRole_Healer = "ENUM_LFGRole_Healer"
ENUM_LFGRole_DamageDealer = "ENUM_LFGRole_DamageDealer"

--- Тип голосования для LFG.
ENUM_LFGVoteType_Join = "ENUM_LFGVoteType_Join"
ENUM_LFGVoteType_Invite = "ENUM_LFGVoteType_Invite"

---@class lfgLibLib
lfgLib = {}

--- Немедленно отправляет участников группы в выбранный пункт назначения. При этом в некоторые пункты(например, астральные сектора) отправка может быть инициирована только лидером группы и после утверждения отправки всеми участниками группы на совместном голосовании. В остальные пункты игрок может отправится самостоятельно, причем пункт отправки может не совпадать с целью подбора группы.
---@param destinationId LfgDestinationId идентификатор цели
function lfgLib.Depart(destinationId) end

--- Включает/выключает репликацию активностей для LFG.
---@param enable boolean true - вклчюить, false - выключить
function lfgLib.EnableReplicateDestinations(enable) end

--- Возвращает текущую цель подбора группы.
---@return LfgDestinationId|nil
function lfgLib.GetCurrentDestination() end

--- Требования на отправку в локацию.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return table|nil
function lfgLib.GetDepartRequirements(destinationId) end

--- Возвращает список категорий доступных целей для поиска группы.
---@return LFGDestinationCategoryId[]|nil
function lfgLib.GetDestinationCategories() end

--- Требования на вход в локацию.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return table|nil
function lfgLib.GetDestinationRequirements(destinationId) end

--- Получить описание награды за прохождение локации.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return table|nil
function lfgLib.GetDestinationReward(destinationId) end

--- Возвращает список доступных целей для поиска группы.
---@return LfgDestinationId[]|nil
function lfgLib.GetDestinations() end

--- Возвращает список доступных целей для поиска группы по категории.
---@return LfgDestinationId[]|nil
function lfgLib.GetDestinationsInCategory() end

--- Информация о таймерах LFG активности.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return table|nil
function lfgLib.GetDestinationTimers(destinationId) end

--- Информация о посещениях локации, относящийся к LFG.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return table|nil
function lfgLib.GetDestinationVisits(destinationId) end

--- Возвращает список доступных ролей для поиска группы.
---@return table
function lfgLib.GetRoles() end

--- Проверка доступно ли LFG игроку.
---@return boolean
function lfgLib.IsAvailable() end

--- Проверка может ли игрок сейчас отправиться в выбранную локацию (выполнены ли все предикаты на отправку в локацию).
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return boolean
function lfgLib.IsDespartAvailable(destinationId) end

--- Проверка может ли игрок сейчас отправиться в выбранную локацию.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return boolean
function lfgLib.IsDestinationAvailable(destinationId) end

--- Проверяет можно ли на локацию проходить свободно, без затрат ресурсов или альтвалюты.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return boolean
function lfgLib.IsFreePass(destinationId) end

--- Возвращает результат проверки доступности выбранной роли в поиске группы.
---@param role integer роль в группе
---@return table|nil
function lfgLib.IsRoleAvailable(role) end

--- Начать поиск группы в зависимости от выбранной цели и роли в группе.
---@param destinationId LfgDestinationId идентификатор цели
---@param roles integer[] выбранные роли для участия в группе, значения должны быть выбраны из диапазона значений ENUM_LFGRole
function lfgLib.Join(destinationId, roles) end

--- Покинуть подбор группы. Если подбор группы покидает ее лидер, всей группе будет предложено покинуть подбор вместе с ним(оставаясь в составе одной группы). При этом те кто откажется покидать подбор, останутся в нем в составе новой группы.
function lfgLib.Leave() end

--- Проголосовать отрицательно по текущему вопросу. При инициации голосования вызывается событие EVENT_LFG_VOTE.
function lfgLib.VoteNo() end

--- Проголосовать положительно по текущему вопросу. При инициации голосования вызывается событие EVENT_LFG_VOTE.
---@param roles table|nil список выбранных ролей для вступления в группу; используется в голосованиях типа ENUM_LFGVoteType_Join, ENUM_LFGVoteType_Invite
function lfgLib.VoteYes(roles) end

-- Events

--- Не удалось совершить действие связанное с LFG
EVENT_LFG_ACTION_FAIL = "EVENT_LFG_ACTION_FAIL"

--- Событие посылается при изменении возможности для игрока отправится на текущую целевую локацию, т.е. стали выполнены все предикаты для отправки в локацию, либо наоборот, какой-то из предикатов перестал выполняться.
EVENT_LFG_DEPART_AVAILABLE_CHANGED = "EVENT_LFG_DEPART_AVAILABLE_CHANGED"

--- Событие посылается при изменении доступности для игрока целевой локации, т.е. локация стала доступна, либо наоборот не доступна по условиям входа.
EVENT_LFG_DESTINATION_AVAILABLE_CHANGED = "EVENT_LFG_DESTINATION_AVAILABLE_CHANGED"

--- Событие посылается при смене цели(пункт назначения) для сбора группы.
EVENT_LFG_DESTINATION_CHANGED = "EVENT_LFG_DESTINATION_CHANGED"

--- Событие посылается при когда изменился список открытых активностей в LFG.
EVENT_LFG_DESTINATIONS_LIST_CHANGED = "EVENT_LFG_DESTINATIONS_LIST_CHANGED"

--- Посылается каждый раз, когда для какой-либо LFG-ативности меняется информация о количестве посещений за сегодняшний день аватаром.
EVENT_LFG_DESTINATION_VISITS_CHANGED = "EVENT_LFG_DESTINATION_VISITS_CHANGED"

--- Игрок запустил LFG, подал заявку на подбор группы
EVENT_LFG_JOIN = "EVENT_LFG_JOIN"

--- Игрок ушел из LFG, отказался от подбора группы.
EVENT_LFG_LEAVE = "EVENT_LFG_LEAVE"

--- Событие посылается при начале голосования.
EVENT_LFG_VOTE = "EVENT_LFG_VOTE"

--- Событие посылается при сорванном голосования.
EVENT_LFG_VOTE_TERMINATE = "EVENT_LFG_VOTE_TERMINATE"
