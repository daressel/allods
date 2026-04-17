---@meta

--- CategoryProceduralDungeonLib
--- События и функции Lua API, относящиеся к работе процедурными данжами.

--- Текущее состояние задания процедурного данжа.
--- в процессе
ENUM_EventGoalState_Active = "ENUM_EventGoalState_Active"
--- успешно завершено
ENUM_EventGoalState_Success = "ENUM_EventGoalState_Success"
--- провалено
ENUM_EventGoalState_Failed = "ENUM_EventGoalState_Failed"

--- Тип задания процедурного данжа.
--- охота на мобов
ENUM_EventGoalType_KillMobs = "ENUM_EventGoalType_KillMobs"
--- защита/сопровождение моба
ENUM_EventGoalType_DefenceMobs = "ENUM_EventGoalType_DefenceMobs"
--- выживание
ENUM_EventGoalType_Survive = "ENUM_EventGoalType_Survive"
--- прогресс элементов
ENUM_EventGoalType_ElementProgress = "ENUM_EventGoalType_ElementProgress"

---@class proceduralDungeonLibLib
proceduralDungeonLib = {}

--- Спелл для покидания процедурного данжа.
---@return SpellId|nil
function proceduralDungeonLib.GetEscapeSpell() end

--- Возвращает информацию о задании.
---@param goalId ObjectId идентификатор задания
---@return table|nil
function proceduralDungeonLib.GetGoalInfo(goalId) end

--- Возвращает список заданий для процедурного данжа.
---@return ObjectId[]|nil
function proceduralDungeonLib.GetGoals() end

--- Возвращает список ключевых точек для выбранного задания процедурного данжа. Возвращает все точки если идентификатор задания( goalId ) не задан.
---@return table|nil
function proceduralDungeonLib.GetPoints() end

--- Спелл для запуска следующего сценария процедурного данжа.
---@return SpellId|nil
function proceduralDungeonLib.GetRunScenarioSpell() end

--- Возвращает информацию о сценарии.
---@param scenarioId ObjectId идентификатор сценария
---@return table|nil
function proceduralDungeonLib.GetScenarioInfo(scenarioId) end

--- Возвращает список сценариев для процедурного данжа.
---@return ObjectId[]|nil
function proceduralDungeonLib.GetScenarios() end

--- Спелл для завершения текущего сценария процедурного данжа.
---@return SpellId|nil
function proceduralDungeonLib.GetStopScenarioSpell() end

--- Находится ли аватар в процедурном данже.
---@return boolean
function proceduralDungeonLib.IsExist() end

-- Events

--- Игрок зашел в процедурный данж.
EVENT_AVATAR_ENTER_PROCEDURAL_DUNGEON = "EVENT_AVATAR_ENTER_PROCEDURAL_DUNGEON"

--- Игрок вышел из процедурного данжа.
EVENT_AVATAR_LEAVE_PROCEDURAL_DUNGEON = "EVENT_AVATAR_LEAVE_PROCEDURAL_DUNGEON"

--- Появилось новое задание для процедурного данжа.
EVENT_PROCEDURAL_DUNGEON_GOAL_ADDED = "EVENT_PROCEDURAL_DUNGEON_GOAL_ADDED"

--- Изменился счетчик в задании процедурного данжа.
EVENT_PROCEDURAL_DUNGEON_GOAL_COUNT_CHANGED = "EVENT_PROCEDURAL_DUNGEON_GOAL_COUNT_CHANGED"

--- Изменился список заданий для игрока в процедурном данже.
EVENT_PROCEDURAL_DUNGEON_GOALS_CHANGED = "EVENT_PROCEDURAL_DUNGEON_GOALS_CHANGED"

--- Изменилось состояние задания процедурного данжа.
EVENT_PROCEDURAL_DUNGEON_GOAL_STATE_CHANGED = "EVENT_PROCEDURAL_DUNGEON_GOAL_STATE_CHANGED"

--- Изменился список ключевых точек для игрока в процедурном данже.
EVENT_PROCEDURAL_DUNGEON_POINTS_CHANGED = "EVENT_PROCEDURAL_DUNGEON_POINTS_CHANGED"

--- Появился новый сценарий для процедурного данжа.
EVENT_PROCEDURAL_DUNGEON_SCENARIO_ADDED = "EVENT_PROCEDURAL_DUNGEON_SCENARIO_ADDED"

--- Изменилось состояние сценария процедурного данжа.
EVENT_PROCEDURAL_DUNGEON_SCENARIO_STATE_CHANGED = "EVENT_PROCEDURAL_DUNGEON_SCENARIO_STATE_CHANGED"
