---@meta

--- CategoryVisObjectId
--- Работа с VisObjectId, AliasVisObjectId.

---@class visObjectIdLib
visObjectId = {}

--- Назначить VisObject для AEMark
---@param visObjectId VisObjectId идентификатор объекта VisObject
function visObjectId.SetAEMarkVisObj(visObjectId) end

--- Назначить свойства для AEMark типа AEMarkSector
---@param range number длина сектора, в метрах
---@param angle number угол раствора сектора, в радианах
function visObjectId.SetAESectorProps(range, angle) end

--- Назначить VisObject-ы для AEMark типа AEMarkSector
---@param fillerObjId VisObjectId|nil идентификатор объекта VisObject для заполнения сектора
---@param leftObjId VisObjectId|nil идентификатор объекта VisObject для левого края сектора
---@param rightObjId VisObjectId|nil идентификатор объекта VisObject для правого края сектора
---@param centerObjId VisObjectId|nil идентификатор объекта VisObject для середины сектора
function visObjectId.SetAESectorVisObj(fillerObjId, leftObjId, rightObjId, centerObjId) end

--- Ставит в заданную точку или убирает модель (VisObjectTemplate - в данных) маркера.
---@param markerId VisObjectId
---@param pos table|nil таблица с позицией маркера или nil, если позиция неважна (маркер удаляется), поля:
---@param posX double
---@param posY double
---@param posZ double
function visObjectId.SetMarkerObject(markerId, pos, posX, posY, posZ) end
