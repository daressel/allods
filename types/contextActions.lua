---@meta

--- CategoryContextActions
--- Методы и события для работы с контекстными действиями на клиентской стороне.

---@class contextActionsLib
contextActions = {}

--- Вернуть информацию о кулдауне контекстного действия.
---@param id ObjectId идентификатор контекстного действия
---@return table|nil
function contextActions.GetContextActionCooldown(id) end

--- Вернуть информацию о контекстном действии. Контекстное действие может находится в списке контекстных действий аватара, но в то же время быть недоступным (например цель не в зоне действия или не в той полусфере игрока). Поле enabled принимает значение true, если действие доступно и false, если не доступно. В случае изменения поля, на клиент приходит  EVENT_CONTEXT_ACTIONS_CHANGED.
---@param id ObjectId идентификатор контекстного действия
---@return nil
function contextActions.GetContextActionInfo(id) end

--- Вернуть информацию о контекстном действии. Контекстное действие может находится в списке контекстных действий аватара, но в то же время быть недоступным (например цель не в зоне действия или не в той полусфере игрока). Поле enabled принимает значение true, если действие доступно и false, если не доступно. В случае изменения поля, на клиент приходит  EVENT_CONTEXT_ACTIONS_CHANGED.
---@param id ObjectId идентификатор контекстного действия
---@return table|nil
function contextActions.GetContextActionShortInfo(id) end

--- Возвращает текущий список контекстных действий ездового животного главного игрока.
---@return nil
function contextActions.GetActiveContextActions() end

-- Events

--- Событие присылается, если необходимо начать отслеживание точки применения контекстного дейтсвия.
EVENT_CONTEXT_ACTION_POINT_STARTED = "EVENT_CONTEXT_ACTION_POINT_STARTED"

--- Событие присылается при изменении контекстных действий. Мог измениться список контекстных действий или флаг  enabled какого-либо контекстного действия.
EVENT_CONTEXT_ACTIONS_CHANGED = "EVENT_CONTEXT_ACTIONS_CHANGED"
