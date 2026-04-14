---@meta

---@class dominationLibLib
dominationLib = {}

---@class DominationLibGetObjectiveInfoResult
---@field id ObjectId идентификатор цели
---@field firstTeam ObjectId|nil[] список идентификаторов персонажей первой команды находящихся вблизи данной цели, индексация с 0
---@field secondTeam ObjectId|nil[] список идентификаторов персонажей второй команды находящихся вблизи данной цели, индексация с 0
---@field disabled boolean состояние активности цели
---@field radius number радиус окрестности в которой надо находиться для захвата цели
---@field owner Number доминирующая команда
---@field actualOwner Number команда контролирующая данную цель
---@field state Number текущее состояние цели
---@field progress number прогресс захвата цели
---@field progressToCapture number количество очков необходимых для захвата цели
---@field timeSwitched Number время последнего обновления данных
---@field timeToCapture Number прогнозируемое время захвата в текущих условиях

---Информация о состоянии боевой цели режима Domination.
---@param id ObjectId идентификатор цели
---@return DominationLibGetObjectiveInfoResult
function dominationLib.GetObjectiveInfo(id) end

---Список боевых целей в режиме Domination.
---@return ObjectId|nil[]
function dominationLib.GetObjectives() end
