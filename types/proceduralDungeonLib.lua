---@meta

---@class proceduralDungeonLibLib
proceduralDungeonLib = {}

---@class ProceduralDungeonLibGetGoalInfoResult
---@field goalId ObjectId идентификатор задания
---@field scenarioId ObjectId идентификатор сценария; позволяет определить принадлежность голов одному и тому же сценарию
---@field objective string суть задания
---@field description string описание задание
---@field hasTimer boolean есть ли таймер у задания
---@field duration Number продолжительность задания в мс
---@field startTime LuaFullDateTime дата начала задания
---@field state Number текущее состояние задания
---@field type Number|nil тип задания; nil если неизвестный тип
---@field count integer|nil текущее количество убитых квестовых мобов / элементов
---@field total integer|nil целевое количество убитых квестовых мобов / элементов
---@field isEscort boolean|nil если true цель - сопровождать моба, если false - защищать моба.

---@class ProceduralDungeonLibGetScenarioInfoResult
---@field scenarioId ObjectId идентификатор сценария
---@field state Number текущее состояние сценария
---@field name string название сценария
---@field description string описание сценария
---@field goals table[1,..] of ObjectId список идентификаторов заданий относящихся к данному сценарию

---Спелл для покидания процедурного данжа.
---@return SpellId|nil
function proceduralDungeonLib.GetEscapeSpell() end

---Возвращает информацию о задании.
---@param goalId ObjectId идентификатор задания
---@return ProceduralDungeonLibGetGoalInfoResult
function proceduralDungeonLib.GetGoalInfo(goalId) end

---Возвращает список заданий для процедурного данжа.
---@return ObjectId|nil[]
function proceduralDungeonLib.GetGoals() end

---Возвращает список ключевых точек для выбранного задания процедурного данжа. Возвращает все точки если идентификатор задания( goalId ) не задан.
---@return table|nil
function proceduralDungeonLib.GetPoints() end

---Спелл для запуска следующего сценария процедурного данжа.
---@return SpellId|nil
function proceduralDungeonLib.GetRunScenarioSpell() end

---Возвращает информацию о сценарии.
---@param scenarioId ObjectId идентификатор сценария
---@return ProceduralDungeonLibGetScenarioInfoResult
function proceduralDungeonLib.GetScenarioInfo(scenarioId) end

---Возвращает список сценариев для процедурного данжа.
---@return ObjectId|nil[]
function proceduralDungeonLib.GetScenarios() end

---Спелл для завершения текущего сценария процедурного данжа.
---@return SpellId|nil
function proceduralDungeonLib.GetStopScenarioSpell() end

---Находится ли аватар в процедурном данже.
---@return boolean
function proceduralDungeonLib.IsExist() end
