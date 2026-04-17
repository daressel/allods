---@meta

--- CategoryInspect
--- События и функции Lua API, относящиеся к инспектированию другого игрока.

---@class inspectLib
inspect = {}

--- Закончить инспектирование цели главного игрока.
function inspect.EndInspect() end

--- Возвращает информацию об умении игрока просматривать вещи другого игрока и текущих просматриваемых объектах.
---@return table
function inspect.GetInspectInfo() end

--- Проверка доступности функции инспектирования игрока.
---@return boolean
function inspect.IsInspectAllowed() end

--- Инспектируется ли цель главного игрока.
---@return boolean
function inspect.IsTargetInspected() end

--- Попытка инспектировать игрока. Пользователь может получать экипировку инспектируемой цели.
---@param unitId ObjectId
function inspect.StartInspect(unitId) end

-- Events

--- Событие посылается при окончании инспекции объекта.
EVENT_INSPECT_FINISHED = "EVENT_INSPECT_FINISHED"

--- Событие посылается, если при осмотре главным игроком другого игрока у осматриваемого игрока изменился активный маунт.
EVENT_INSPECT_MOUNT_CHANGED = "EVENT_INSPECT_MOUNT_CHANGED"

--- Событие посылается при изменении уровня умения главного игрока осматривать других игроков.
EVENT_INSPECT_SKILL_CHANGED = "EVENT_INSPECT_SKILL_CHANGED"

--- Событие посылается при начале инспекции объекта. Объектом может быть игрок, дружественный аватару, и являющийся целью аватара. При потере цели инспекция сбрасыватся EVENT_INSPECT_FINISHED.
EVENT_INSPECT_STARTED = "EVENT_INSPECT_STARTED"

--- Событие об изменении экипировки юнита (главный игрок или игрок, инспектируемый главным).
EVENT_UNIT_EQUIPMENT_CHANGED = "EVENT_UNIT_EQUIPMENT_CHANGED"
