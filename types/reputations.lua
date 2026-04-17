---@meta

--- CategoryReputations
--- События и функции Lua API, относящиеся к работе с репутациями (и близкие к этому).

--- Числовой енум для представления уровня репутации.
---@type integer
REPUTATION_LEVEL_HOSTILITY = nil
---@type integer
REPUTATION_LEVEL_ENEMY = nil
---@type integer
REPUTATION_LEVEL_UNFRIENDLY = nil
---@type integer
REPUTATION_LEVEL_NEUTRAL = nil
---@type integer
REPUTATION_LEVEL_KINDLY = nil
---@type integer
REPUTATION_LEVEL_FRIENDLY = nil
---@type integer
REPUTATION_LEVEL_CONFIDENTIAL = nil

---@class reputationsLib
reputations = {}

--- Получить у аватара информацию о репутации с фракцией.
---@param factionId FactionId фракция
---@return table
function reputations.GetReputationInfo(factionId) end

--- Получить у аватара список открытых репутаций.
---@return table
function reputations.GetReputationsList() end

--- Получить значение репутации соответствующее уровню репутации.
---@param reputationLevel integer уровень репутации
---@return number
function reputations.GetReputationValue(reputationLevel) end

--- Получить информацию об уровне репутации с мобом.
---@param mobId ObjectId идентификатор моба
---@return integer
function reputations.GetReputationLevel(mobId) end

-- Events

--- Уведомление об открытии новой репутации.
EVENT_NEW_REPUTATION_APPEARED = "EVENT_NEW_REPUTATION_APPEARED"

--- Уведомление об удалении открытой репутации.
EVENT_REPUTATION_DISAPPEARED = "EVENT_REPUTATION_DISAPPEARED"

--- Уведомление об изменении уровня репутации.
EVENT_REPUTATION_LEVEL_CHANGED = "EVENT_REPUTATION_LEVEL_CHANGED"

--- Уведомление об изменении значения репутации.
EVENT_REPUTATION_VALUE_CHANGED = "EVENT_REPUTATION_VALUE_CHANGED"
