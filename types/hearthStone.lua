---@meta

--- CategoryHearthStone
--- События и функции Lua API, относящиеся к работе с HearthStone.

---@class hearthStoneLib
hearthStone = {}

--- Возвращает информацию о кулдауне HearthStone.
function hearthStone.GetHearthStoneCooldown() end

--- Возвращает информацию о месте в которое ведет HearthStone (карта, зона, локатор).
---@return WString
function hearthStone.GetHearthStoneLocator() end

--- Возвращает заклинание HearthStone.
---@return SpellId
function hearthStone.GetHearthStoneSpell() end

--- Возвращает информацию о наличии HearthStone у аватара.
---@return boolean
function hearthStone.HasHearthStone() end

--- Использовать HearthStone.
function hearthStone.UseHearthStone() end

--- Телепортирует игрока в заданную точку. Идентификатор точки телепортации должен быть взят из списка точек телепортации, имеющихся у аватара (см avatar.GetTeleportLocations()) или из привязки HearthStone (см avatar.GetHearthStoneLocator(), поле locationId).
---@param locationId ObjectId идентификатор точки телепортации
function hearthStone.UseHearthStoneToLocation(locationId) end

-- Events

--- Оповещение об окончании кулдауна на HearthStone.
EVENT_HEARTHSTONE_COOLDOWN_FINISHED = "EVENT_HEARTHSTONE_COOLDOWN_FINISHED"

--- Оповещение о старте кулдауна на HearthStone.
EVENT_HEARTHSTONE_COOLDOWN_STARTED = "EVENT_HEARTHSTONE_COOLDOWN_STARTED"

--- Оповещение о появлении HearthStone.
EVENT_HEARTHSTONE_CREATED = "EVENT_HEARTHSTONE_CREATED"

--- Оповещение об исчезновении HearthStone.
EVENT_HEARTHSTONE_DESTROYED = "EVENT_HEARTHSTONE_DESTROYED"

--- Оповещение об изменении локатора HearthStone.
EVENT_HEARSTONE_LOCATOR_CHANGED = "EVENT_HEARSTONE_LOCATOR_CHANGED"
