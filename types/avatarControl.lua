---@meta

--- CategoryAvatarControl
--- События и функции Lua API, относящиеся к управлению персонажем игрока.

---@class avatarControlLib
avatarControl = {}

--- Возвращает информацию о режиме движения в точку для аватара игрока.
---@return table
function avatarControl.GetMoveToPointState() end

--- Включает/выключает автоматическое движение вслед за объектом, являющимся целью на момент вызова.
---@param isFollow boolean если true - включить режим следования, если false - выключить
function avatarControl.SetFollowTarget(isFollow) end

--- Насильно останавливает движение аватара игрока в точку (если тот находится в соответствующем режиме).
function avatarControl.StopMoveToPoint() end

-- Events

--- Событие посылается каждый раз, когда изменяется режим следования за объектом (включился/выключился/сменился объект).
EVENT_FOLLOW_MODE_CHANGED = "EVENT_FOLLOW_MODE_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние движение аватара в точку (начали/закончили режим движения в точку, изменилась точка назначения).
EVENT_MOVE_BY_CLICK_CHANGED = "EVENT_MOVE_BY_CLICK_CHANGED"

--- Событие посылается каждый раз, когда персонаж становится/перестаёт быть пассажиром, к примеру, на двухместном маунте.
EVENT_PASSANGER_STATE_CHANGED = "EVENT_PASSANGER_STATE_CHANGED"
