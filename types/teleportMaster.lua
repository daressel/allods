---@meta

--- CategoryTeleportMaster
--- События и функции Lua Api, относящиеся к мастеру телепорта и телепортации.

---@class teleportMasterLib
teleportMaster = {}

--- Возвращает идентификатор точки телепортации, в которой находится мастер телепорта, с которым сейчас разговаривает главный игрок.
---@return ObjectId|nil
function teleportMaster.GetInteractorCurrentLocation() end

--- Возвращает список точек телепортации мастера телепорта, с которым сейчас разговаривает главный игрок.
---@return table
function teleportMaster.GetInteractorTeleportLocations() end

--- Возвращает информацию о точке телепортации. Информацию можно получить для имеющихся точек телепортации главного игрока, а также точек телепортации мастера телепорта, с которым разговаривает главный игрок, включая точку, в которой стоит мастер.
---@param locationId ObjectId идентификатор точки телепорта
---@return table|nil
function teleportMaster.GetTeleportLocationInfo(locationId) end

--- Возвращает список известных главному игроку точек телепортации от мастеров телепортов.
---@return table
function teleportMaster.GetTeleportLocations() end

--- Проверяем валидность locationId.
---@param locationId ObjectId идентификатор точки телепорта
---@return boolean
function teleportMaster.IsTeleportLocationValid(locationId) end

--- В ответ на этот запрос, мастер телепорта, с которым разговаривает главный игрок, телепортирует игрока в заданную точку. Идентификатор Точки телепортации должен быть взят из списка точек телепортации, имеющихся у мастера телепорта.
---@param locationId ObjectId идентификатор точки телепортации
function teleportMaster.TeleportToLocation(locationId) end
