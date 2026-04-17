---@meta

--- CategoryCurrency
--- События и функции Lua API, относящиеся к альтернативным игровым валютам.

--- Место хранения альтернативной валюты:
--- у главного игрока
ENUM_CURRENCY_STORAGE_AVATAR = "ENUM_CURRENCY_STORAGE_AVATAR"
--- в гильдии
ENUM_CURRENCY_STORAGE_GUILD = "ENUM_CURRENCY_STORAGE_GUILD"
--- в душе (доступна для всех ремортов главного игрока)
ENUM_CURRENCY_STORAGE_SOUL = "ENUM_CURRENCY_STORAGE_SOUL"

--- Режимы отображения валюты:
--- всегда отображается(по умолчанию)
ENUM_CURRENCY_VISUALIZE_MODE_SHOW = "ENUM_CURRENCY_VISUALIZE_MODE_SHOW"
--- всегда скрывается(обработка валюты не будет передаваться в скрипты)
ENUM_CURRENCY_VISUALIZE_MODE_HIDE = "ENUM_CURRENCY_VISUALIZE_MODE_HIDE"
--- отображением рулят скрипты
ENUM_CURRENCY_VISUALIZE_MODE_CUSTOM = "ENUM_CURRENCY_VISUALIZE_MODE_CUSTOM"

---@class currencyLib
currency = {}

--- Возвращает информацию о валютах главного игрока, содержащихся в одной категории валют.
---@param categoryId CurrencyCategoryId категория валюты
---@return table
function currency.GetCategoryCurrencies(categoryId) end

--- В игре встречаются альтернативные валюты. Этот метод возвращает информацию об этой валюте и её количество у игрока.
---@return table
function currency.GetCurrencies() end

--- Возвращает информацию о категориях валют, имеющихся у главного игрока.
---@return table
function currency.GetCurrencyCategories() end

--- Возвращает описание альтернативной валюты.
---@return ValuedText|nil
function currency.GetCurrencyDescription() end

--- Возвращает информацию об альтернативной валюте по её внутриигровому имени.
---@param sysName string|nil внутриигровое имя альтернативной валюты.
---@return CurrencyId|nil
function currency.GetCurrencyId(sysName) end

--- В игре встречаются альтернативные валюты. Этот метод возвращает её количество у игрока.
---@param currencyId CurrencyId|nil идентификатор ресурса альтернативной валюты.
---@return table|nil
function currency.GetCurrencyValue(currencyId) end

--- Возвращает информацию об альтернативной валюте талантов маунта.
---@return CurrencyId|nil
function currency.GetTalentCurrency() end

-- Events

--- Изменился список игровых альтернативных валют, имеющихся у игрока.
EVENT_CURRENCIES_CHANGED = "EVENT_CURRENCIES_CHANGED"

--- Событие присылается при попытке что-либо приобрести при недостаточном количестве игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
EVENT_CURRENCY_NOT_ENOUGH = "EVENT_CURRENCY_NOT_ENOUGH"

--- Событие присылается при изменении количества игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
EVENT_CURRENCY_VALUE_CHANGED = "EVENT_CURRENCY_VALUE_CHANGED"

--- Событие присылается при изменении количества скрытой игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
EVENT_HIDDEN_CURRENCY_VALUE_CHANGED = "EVENT_HIDDEN_CURRENCY_VALUE_CHANGED"
