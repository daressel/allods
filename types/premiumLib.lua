---@meta

--- CategoryPremiumLib
--- Методы и события для работы с премиумом.

---@class premiumLibLib
premiumLib = {}

--- Информация о бонусных ступенях премиума.
---@return table|nil
function premiumLib.GetBonusInfo() end

--- Общая информация о премиуме.
---@return table
function premiumLib.GetInfo() end

--- Номер следующей стадии премиума.
---@return number
function premiumLib.GetNextStage() end

--- Информация о стадии премиума.
---@param stage integer стадия премиума
---@return table|nil
function premiumLib.GetStageInfo(stage) end

-- Events

--- Событие присылается при изменении бонусной стадии премиума.
EVENT_PREMIUM_BONUS_STAGE_CHANGED = "EVENT_PREMIUM_BONUS_STAGE_CHANGED"

--- Событие присылается при изменении состояния премиума premiumLib.GetInfo().
EVENT_PREMIUM_CHANGED = "EVENT_PREMIUM_CHANGED"

--- Событие присылается при изменении стадии премиума.
EVENT_PREMIUM_STAGE_CHANGED = "EVENT_PREMIUM_STAGE_CHANGED"
