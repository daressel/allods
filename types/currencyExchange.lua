---@meta

---@class currencyExchangeLib
currencyExchange = {}

---Возвращает количество золота для покупки кристаллов в сервисе обмена валют. Курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToBuy integer количество кристаллов для покупки
---@return number
function currencyExchange.CalcBuyCost(crystalsToBuy) end

---Возвращает курс покупки кристаллов в сервисе обмена валют. Этот курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@return number
function currencyExchange.CalcBuyRate() end

---Возвращает количество золота за продажу кристаллов в сервисе обмена валют. Курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToSell integer количество кристаллов для продажи
---@return number
function currencyExchange.CalcSellCost(crystalsToSell) end

---Возвращает курс продажи кристаллов в сервисе обмена валют. Этот курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@return number
function currencyExchange.CalcSellRate() end

---Возвращает true, если можно купить crystalsToBuy количество кристаллов за moneyToSpend количество золота в сервисе обмена валют. Курс и коридор дозволенного отклонения от курса постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToBuy integer количество кристаллов для покупки
---@param moneyToSpend integer количество золота для продажи
---@return boolean
function currencyExchange.CanBuy(crystalsToBuy, moneyToSpend) end

---Возвращает true, если можно продать crystalsToSell количество кристаллов за moneyToGet количество золота в сервисе обмена валют. Курс и коридор дозволенного отклонения от курса постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToSell integer количество кристаллов для продажи
---@param moneyToGet integer количество золота для покупки
---@return boolean
function currencyExchange.CanSell(crystalsToSell, moneyToGet) end

---Возвращает true, если сервис обмена валют имеется на шарде и активен.
---@return boolean
function currencyExchange.IsServiceActive() end
