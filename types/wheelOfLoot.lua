---@meta

---@class wheelOfLootLib
wheelOfLoot = {}

---@class WheelOfLootGetInfoResult
---@field sysName string служебное название
---@field lifeTime number локальное время в ms, когда колесо автоматически разролится
---@field price integer текущая цена разрола
---@field rollsCount integer текущее количество разролов
---@field maxRollsCount integer максимальное количество разролов
---@field itemPriceId ObjectId id предмет, который тратится на разрол
---@field wheelId number идентификатор колеса лута
---@field isLoginEvent boolean true если это колеса лута логин-ивента
---@field isManual boolean true если награду можно выбирать

---Возвращает данные запрашиваемого колеса лута
---@param id number идентификатор колеса лута
---@return WheelOfLootGetInfoResult
function wheelOfLoot.GetInfo(id) end

---Возвращает список идентификаторов колёс лута для разрола.
---@return number[]
function wheelOfLoot.GetList() end

---Делает запрос итемов указанного колеса. В ответ на него приходит событие EVENT_WHEELOFLOOT_ITEMS.
---@param id number идентификатор колеса лута
---@return нет
function wheelOfLoot.RequestItems(id) end
