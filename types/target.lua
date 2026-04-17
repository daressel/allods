---@meta

--- CategoryTarget
--- События и функции Lua Api, относящиеся к работе с целями.

---@class targetLib
target = {}

--- Возвращает информацию о цели аватара. Для аватара возвращается дополнительная цель.
---@return ObjectId
function target.GetTarget() end

--- Проверка, находиться ли выбранный юнит в радиусе "meleeRange"
---@return boolean
function target.IsTargetInMeleeRange() end

--- Попытка аватара сделать указанного юнита своей целью.
---@param unitId ObjectId
function target.SelectTarget(unitId) end

--- Попытка выбрать своего персонажа в качестве цели. Используется дополнительная цель.
function target.TargetSelf() end

--- Сброс цели у аватара. Сбрасывается дополнительная цель.
function target.UnselectTarget() end

--- Возвращает информацию об основной цели юнита.
---@param unitId ObjectId идентификатор юнита
---@return ObjectId
function target.GetPrimaryTarget(unitId) end

--- Возвращает информацию о цели юнита (только если юнит - аватар или сам является целью аватара). Используется дополнительная цель для аватара и основная - для всех остальных юнитов.
---@param unitId ObjectId идентификатор юнита
---@return ObjectId
function target.GetTarget(unitId) end

-- Events

--- Событие посылается при изменении состояния жизни аватара.
EVENT_AVATAR_ALIVE_CHANGED = "EVENT_AVATAR_ALIVE_CHANGED"

--- Событие посылается при появлении барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED"

--- Событие посылается при изменении состояния барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED"

--- Событие посылается при исчезновении барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED"

--- Событие с рекомендацией сервера об изменении цели аватара на указанную.
EVENT_AVATAR_TARGET_RECOMMENDED = "EVENT_AVATAR_TARGET_RECOMMENDED"

--- Событие посылается при изменении основной цели основной цели (это не опечатка) аватара.
EVENT_AVATAR_TARGET_TARGET_CHANGED = "EVENT_AVATAR_TARGET_TARGET_CHANGED"

--- Событие посылается при появлении барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED"

--- Событие посылается при изменении состояния барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED"

--- Событие посылается при исчезновении барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED"
