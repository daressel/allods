---@meta

--- CategoryWheelOfLoot
--- Методы и события, относящиеся к разролу

---@class wheelOfLootLib
wheelOfLoot = {}

--- Возвращает данные запрашиваемого колеса лута
---@param id integer идентификатор колеса лута
---@return table
function wheelOfLoot.GetInfo(id) end

--- Возвращает список идентификаторов колёс лута для разрола.
---@return table
function wheelOfLoot.GetList() end

--- Делает запрос итемов указанного колеса. В ответ на него приходит событие EVENT_WHEELOFLOOT_ITEMS.
---@param id integer идентификатор колеса лута
function wheelOfLoot.RequestItems(id) end

-- Events

--- Добавилось новое колесо лута
EVENT_WHEELOFLOOT_ADDED = "EVENT_WHEELOFLOOT_ADDED"

--- Изменилось колесо лута
EVENT_WHEELOFLOOT_CHANGED = "EVENT_WHEELOFLOOT_CHANGED"

--- Пришёл ответ на запрос предметов колеса лута.
EVENT_WHEELOFLOOT_ITEMS = "EVENT_WHEELOFLOOT_ITEMS"

--- Удалилось колесо лута
EVENT_WHEELOFLOOT_REMOVED = "EVENT_WHEELOFLOOT_REMOVED"
