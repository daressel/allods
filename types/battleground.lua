---@meta

---@class battlegroundLib
battleground = {}

---@class BattlegroundGetCheckpointInfoResult
---@field name WSting локализованое имя контрольной точки
---@field textureId TextureId идентификатор текстуры иконки для обозначения контрольной точки
---@field state string состояние контрольной точки (свободна, в процессе захвата, захвачена)
---@field ownerMarkId BattlegroundMarkId или nil идентификатор команды, которой захвачена контрольная точка
---@field prevState string предыдущее состояние контрольной точки (до того, как её начал захватывать нынешняя команда-владелец)
---@field prevOwnerMarkId BattlegroundMarkId или nil идентификатор команды, которой раньше была захвачена контрольная точка (nil, если точка ранее была свободна)
---@field capturedTime number время (в миллисекундах, округляется всегда в большую сторону), оставшееся до окончания захвата контрольной точки; если контрольная в данный момент не захватывается (свободна или захват уже завершён), то nil
---@field captureDuration number длительность (в миллисекундах) захвата контрольной точки; если контрольная точка в силу каких-то обстоятельств не может захватываться, то nil
---@field gain number прогресс захвата точки
---@field defendersCount number возвращает число защищающих, если поддерживается стеллой
---@field attackersCount number возвращает число атакующих, если поддерживается стеллой
---@field oldMechanics boolean true, если используется старая механика
---@field radius number радиус точки захвата
---@field isEnable boolean активна ли точка

---Позволяет получить данные о команде, к которой принадлежит аватар, если он участвует в баттлграунде.
---@return BattlegroundMarkId|nil
function battleground.GetAvatarMark() end

---Выдаёт информацию о контрольной точке баттлграунда.
---@param checkpointId ObjectId id контрольной точки
---@return BattlegroundGetCheckpointInfoResult
function battleground.GetCheckpointInfo(checkpointId) end

---Выдаёт список контрольных точек баттлграунда (если аватар участвует в баттлграунде).
---@return table
function battleground.GetCheckpoints() end

---Выдаёт идентификатор команды указанной контрольной точки баттлграунда
---@param checkpointId ObjectId контрольная точка
---@return teamId :  BattlegroundMarkId или nil
function battleground.GetCheckpointTeam(checkpointId) end

---Спелл для выхода из боевой арены.
---@return SpellId|nil
function battleground.GetHeroesArenaQuitSpell() end

---Спелл для запуска следующего этапа сценария боевой арены.
---@return SpellId|nil
function battleground.GetHeroesArenaStartStageSpell() end

---Выдаёт прилинкованную к указанной контрольную точку баттлграунда (если аватар участвует в баттлграунде).
---@param checkpointId ObjectId контрольная точка
---@return linkedPointId : ObjectId или nil
function battleground.GetLinkedCheckpoint(checkpointId) end

---Позволяет получить данные о команде, к которой принадлежит игрок, если он участвует в баттлграунде.
---@param playerId ObjectId (not nil) -- идентификатор игрока
---@return BattlegroundMarkId|nil
function battleground.GetPlayerMark(playerId) end

---Проверить является ли ObjectId контрольной точки баттлграунда.
---@param checkpointId ObjectId контрольная точка
---@return boolean
function battleground.IsCheckpoint(checkpointId) end
