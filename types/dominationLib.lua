---@meta

--- CategoryDominationLib
--- Методы и события, относящиеся к pvp-режиму Domination.

--- Константы команд в режиме Domination.
ENUM_DominationFightTeam_First = "ENUM_DominationFightTeam_First"
ENUM_DominationFightTeam_Second = "ENUM_DominationFightTeam_Second"
ENUM_DominationFightTeam_Null = "ENUM_DominationFightTeam_Null"

---@class dominationLibLib
dominationLib = {}

--- Информация о состоянии боевой цели режима Domination.
---@param id ObjectId идентификатор цели
---@return table|nil
function dominationLib.GetObjectiveInfo(id) end

--- Список боевых целей в режиме Domination.
---@return ObjectId[]|nil
function dominationLib.GetObjectives() end

-- Events

--- Уведомление об появлении нового цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_ADDED = "EVENT_DOMINATION_OBJECTIVE_ADDED"

--- Уведомление об изменении состояния активности цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_DISABLED = "EVENT_DOMINATION_OBJECTIVE_DISABLED"

--- Уведомление об изменении владельца цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_OWNER_CHANGED = "EVENT_DOMINATION_OBJECTIVE_OWNER_CHANGED"

--- Уведомление об изменении прогресса захвата цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_PROGRESS_CHANGED = "EVENT_DOMINATION_OBJECTIVE_PROGRESS_CHANGED"

--- Уведомление об изменении количества очков необходимых для захвата цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_PROGRESS_TO_CAPTURE_CHANGED = "EVENT_DOMINATION_OBJECTIVE_PROGRESS_TO_CAPTURE_CHANGED"

--- Уведомление об изменении радиуса захвата цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_RADIUS_CHANGED = "EVENT_DOMINATION_OBJECTIVE_RADIUS_CHANGED"

--- Уведомление об удалении нового цели в режиме Domination. Информацию по удаленной цели функцией dominationsLib.GetObjectiveInfo( id ) получить невозможно.
EVENT_DOMINATION_OBJECTIVE_REMOVED = "EVENT_DOMINATION_OBJECTIVE_REMOVED"

--- Уведомление об изменении состояния цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_STATE_CHANGED = "EVENT_DOMINATION_OBJECTIVE_STATE_CHANGED"

--- Уведомление об изменении списока персонажей одной из команд находящихся вблизи данной цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_TEAM_CHANGED = "EVENT_DOMINATION_OBJECTIVE_TEAM_CHANGED"

--- Уведомление об изменении даты предыдущего захвата цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_TIME_SWITCHED_CHANGED = "EVENT_DOMINATION_OBJECTIVE_TIME_SWITCHED_CHANGED"

--- Уведомление об изменении прогнозируемого времени захвата цели в режиме Domination.
EVENT_DOMINATION_OBJECTIVE_TIME_TO_CAPTURE_CHANGED = "EVENT_DOMINATION_OBJECTIVE_TIME_TO_CAPTURE_CHANGED"
