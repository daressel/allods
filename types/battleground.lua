---@meta

--- CategoryBattleground
--- События и функции Lua API, относящиеся к баттлграунду.

--- Состояние контрольной точки баттлграунда.
--- точка свободна
ENUM_RecapturablePlayerSpawnPlaceState_Free = "ENUM_RecapturablePlayerSpawnPlaceState_Free"
--- точка в процессе захвата
ENUM_RecapturablePlayerSpawnPlaceState_UnderAssault = "ENUM_RecapturablePlayerSpawnPlaceState_UnderAssault"
--- захват точки приостановлен
ENUM_RecapturablePlayerSpawnPlaceState_AssaultFrozen = "ENUM_RecapturablePlayerSpawnPlaceState_AssaultFrozen"
--- точка захвачена
ENUM_RecapturablePlayerSpawnPlaceState_Captured = "ENUM_RecapturablePlayerSpawnPlaceState_Captured"
ENUM_RecapturablePlayerSpawnPlaceState_Void = "ENUM_RecapturablePlayerSpawnPlaceState_Void"
--- точка свободна
ENUM_RecapturablePlayerSpawnPlaceState_Free = "ENUM_RecapturablePlayerSpawnPlaceState_Free"
--- точка в процессе захвата
ENUM_RecapturablePlayerSpawnPlaceState_UnderAssault = "ENUM_RecapturablePlayerSpawnPlaceState_UnderAssault"
--- захват точки приостановлен
ENUM_RecapturablePlayerSpawnPlaceState_AssaultFrozen = "ENUM_RecapturablePlayerSpawnPlaceState_AssaultFrozen"
--- точка захвачена
ENUM_RecapturablePlayerSpawnPlaceState_Captured = "ENUM_RecapturablePlayerSpawnPlaceState_Captured"
ENUM_RecapturablePlayerSpawnPlaceState_Void = "ENUM_RecapturablePlayerSpawnPlaceState_Void"

---@class battlegroundLib
battleground = {}

--- Позволяет получить данные о команде, к которой принадлежит аватар, если он участвует в баттлграунде.
---@return BattlegroundMarkId|nil
function battleground.GetAvatarMark() end

--- Выдаёт информацию о контрольной точке баттлграунда.
---@param checkpointId ObjectId id контрольной точки
---@return table
function battleground.GetCheckpointInfo(checkpointId) end

--- Выдаёт список контрольных точек баттлграунда (если аватар участвует в баттлграунде).
---@return table
function battleground.GetCheckpoints() end

--- Выдаёт идентификатор команды указанной контрольной точки баттлграунда
---@param checkpointId ObjectId контрольная точка
---@return BattlegroundMarkId
function battleground.GetCheckpointTeam(checkpointId) end

--- Спелл для выхода из боевой арены.
---@return SpellId|nil
function battleground.GetHeroesArenaQuitSpell() end

--- Спелл для запуска следующего этапа сценария боевой арены.
---@return SpellId|nil
function battleground.GetHeroesArenaStartStageSpell() end

--- Выдаёт прилинкованную к указанной контрольную точку баттлграунда (если аватар участвует в баттлграунде).
---@param checkpointId ObjectId контрольная точка
---@return ObjectId
function battleground.GetLinkedCheckpoint(checkpointId) end

--- Позволяет получить данные о команде, к которой принадлежит игрок, если он участвует в баттлграунде.
---@param playerId ObjectId
---@return BattlegroundMarkId|nil
function battleground.GetPlayerMark(playerId) end

--- Проверить является ли ObjectId контрольной точки баттлграунда.
---@param checkpointId ObjectId контрольная точка
---@return boolean
function battleground.IsCheckpoint(checkpointId) end

-- Events

--- Посылается каждый раз, когда появляется информация о новой контрольной точке баттлграунда.
EVENT_BATTLEGROUND_CHECKPOINT_ADDED = "EVENT_BATTLEGROUND_CHECKPOINT_ADDED"

--- Посылается каждый раз, когда информация о контрольной точке баттлграунда становится недоступной (контрольная точка по каким-либо причинам удаляется).
EVENT_BATTLEGROUND_CHECKPOINT_REMOVED = "EVENT_BATTLEGROUND_CHECKPOINT_REMOVED"

--- Посылается каждый раз, когда изменяется информация о контрольных точках баттлграунда (добавляются-удаляются, меняется состояние и т.п.).
EVENT_BATTLEGROUND_CHECKPOINTS_CHANGED = "EVENT_BATTLEGROUND_CHECKPOINTS_CHANGED"

--- Посылается каждый раз, когда меняется состояние контрольной точки баттлграунда.
EVENT_BATTLEGROUND_CHECKPOINT_STATE_CHANGED = "EVENT_BATTLEGROUND_CHECKPOINT_STATE_CHANGED"
