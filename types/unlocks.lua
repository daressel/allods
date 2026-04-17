---@meta

--- CategoryUnlocks
--- События и функции Lua API, относящиеся к возможностям (анлокам (закрытая ссылка)) игрока

---@class unlocksLib
unlocks = {}

--- Возвращает список категорий постоянных возможностей (анлоков), имеющихся у аватара.
---@return table
function unlocks.GetInfiniteUnlockCategories() end

--- Возвращает список имеющихся у главного игрока идентификаторов возможностей (анлоков) с неограниченным сроком жизни.
---@return table
function unlocks.GetInfiniteUnlocks() end

--- Возвращает список идентификаторов постоянных возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return table
function unlocks.GetInfiniteUnlocksInCategory(unlockCategoryId) end

--- Возвращает список категорий временных возможностей (анлоков), имеющихся у аватара.
---@return table
function unlocks.GetTemporaryUnlockCategories() end

--- Возвращает список имеющихся у главного игрока идентификаторов возможностей (анлоков) с ограниченным сроком жизни.
---@return table
function unlocks.GetTemporaryUnlocks() end

--- Возвращает список идентификаторов временных возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return table
function unlocks.GetTemporaryUnlocksInCategory(unlockCategoryId) end

--- Возвращает список категорий возможностей (анлоков), имеющихся у аватара.
---@return table
function unlocks.GetUnlockCategories() end

--- Возвращает описание возможности (анлока), имеющейся у аватара .
---@param unlockId ObjectId(Number) идентификатор возможности (анлока)
---@return table
function unlocks.GetUnlockInfo(unlockId) end

--- Возвращает список идентификаторов всех возможностей (анлоков), имеющихся у главного игрока.
---@return table
function unlocks.GetUnlocks() end

--- Возвращает список идентификаторов возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return table
function unlocks.GetUnlocksInCategory(unlockCategoryId) end

--- Возвращает true, если у аватара имеется соответствующий анлок. Иначе false.
---@param unlockId UnlockId(ResourceId) идентификатор возможности (анлока)
---@return boolean
function unlocks.HasUnlock(unlockId) end

-- Events

--- Уведомление о получении какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
EVENT_AVATAR_UNLOCK_ADDED = "EVENT_AVATAR_UNLOCK_ADDED"

--- Уведомление о изменении состояния анлока.
EVENT_AVATAR_UNLOCK_CHANGED = "EVENT_AVATAR_UNLOCK_CHANGED"

--- Уведомление о потере какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
EVENT_AVATAR_UNLOCK_REMOVED = "EVENT_AVATAR_UNLOCK_REMOVED"

--- Уведомление об изменении состояний залоченности для аватара. Например, может измениться доступность слота для экипировки и т.д.
EVENT_AVATAR_UNLOCKS_CHANGED = "EVENT_AVATAR_UNLOCKS_CHANGED"
