---@meta

---@class premiumLibLib
premiumLib = {}

---@class PremiumLibGetBonusInfoResult
---@field bonus integer число бонусных ступеней
---@field removeTime table срок истечения действия ступеней

---@class PremiumLibGetInfoResult
---@field stageNumber integer стадия
---@field bonusStageNumber integer бонусные ступени
---@field totalStages integer общее количество возможных ступеней
---@field stageProgress Number прогресс стадии
---@field sumToNextStage Number сумма до следующей стадии
---@field totalProgress Number общий прогресс
---@field totalSum Number общая сумма

---@class PremiumLibGetStageInfoResult
---@field description string описание
---@field buffs BuffId|nil[] список эффектов, nil если пустой, индексация с 1

---Информация о бонусных ступенях премиума.
---@return PremiumLibGetBonusInfoResult
function premiumLib.GetBonusInfo() end

---Общая информация о премиуме.
---@return PremiumLibGetInfoResult
function premiumLib.GetInfo() end

---Номер следующей стадии премиума.
---@return integer|nil
function premiumLib.GetNextStage() end

---Информация о стадии премиума.
---@param stage integer стадия премиума
---@return PremiumLibGetStageInfoResult
function premiumLib.GetStageInfo(stage) end
