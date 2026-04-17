---@meta

--- CategoryCurrencyExchange
--- События и функции Lua API, относящиеся к сервису обмена валют.

---@class currencyExchangeLib
currencyExchange = {}

--- Возвращает количество золота для покупки кристаллов в сервисе обмена валют. Курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToBuy integer количество кристаллов для покупки
---@return number
function currencyExchange.CalcBuyCost(crystalsToBuy) end

--- Возвращает курс покупки кристаллов в сервисе обмена валют. Этот курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@return number
function currencyExchange.CalcBuyRate() end

--- Возвращает количество золота за продажу кристаллов в сервисе обмена валют. Курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToSell integer количество кристаллов для продажи
---@return number
function currencyExchange.CalcSellCost(crystalsToSell) end

--- Возвращает курс продажи кристаллов в сервисе обмена валют. Этот курс постоянно изменяется в зависимости от резерва кристаллов и золота.
---@return number
function currencyExchange.CalcSellRate() end

--- Возвращает true, если можно купить crystalsToBuy количество кристаллов за moneyToSpend количество золота в сервисе обмена валют. Курс и коридор дозволенного отклонения от курса постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToBuy integer количество кристаллов для покупки
---@param moneyToSpend integer количество золота для продажи
---@return boolean
function currencyExchange.CanBuy(crystalsToBuy, moneyToSpend) end

--- Возвращает true, если можно продать crystalsToSell количество кристаллов за moneyToGet количество золота в сервисе обмена валют. Курс и коридор дозволенного отклонения от курса постоянно изменяется в зависимости от резерва кристаллов и золота.
---@param crystalsToSell integer количество кристаллов для продажи
---@param moneyToGet integer количество золота для покупки
---@return boolean
function currencyExchange.CanSell(crystalsToSell, moneyToGet) end

--- Возвращает true, если сервис обмена валют имеется на шарде и активен.
---@return boolean
function currencyExchange.IsServiceActive() end

-- Events

--- Присылается, если закончился процесс обмена валют. Нужно скрыть интерфейс обмена.
EVENT_CURRENCY_EXCHANGE_FINISHED = "EVENT_CURRENCY_EXCHANGE_FINISHED"

--- Присылается, если изменились параметры сервиса обмена валют.
EVENT_CURRENCY_EXCHANGE_INFO_CHANGED = "EVENT_CURRENCY_EXCHANGE_INFO_CHANGED"

--- Присылается, если начался процесс обмена валют. Нужно показать интерфейс обмена.
EVENT_CURRENCY_EXCHANGE_STARTED = "EVENT_CURRENCY_EXCHANGE_STARTED"
