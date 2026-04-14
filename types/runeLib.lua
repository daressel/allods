---@meta

---@class runeLibLib
runeLib = {}

---@class RuneLibGetCombinePriceResult
---@field goldDust integer количество золотой пыли
---@field crystalCrumb integer количество кристаллической крошки

---@class RuneLibGetCommonInfoResult
---@field goldDust ObjectId идентификатор предмета-образца золотой пыли
---@field crystalCrumb ObjectId идентификатор предмета-образца кристаллической крошки

---@class RuneLibGetSlotInfoResult
---@field dressSlot number номер слота
---@field requiredLevel integer уровень игрока, с которого руна в этом слоте начнёт работать
---@field isOffensive boolean этот слот для атакующей руны

---Попытка соединить одинаковые руны и получить руны на уровень выше. crystalCrumbBonus - бонус в оплате кристаллической крошкой (от -7 до +7): 0 - дефолтная цена, 1 - +10% в крошке, -1 - -10% в крошке.
---@param runeId ObjectId идентификатор руны в контейнере
---@param instrumentId ObjectId идентификатор инструмента в контейнере
---@param crystalCrumbBonus integer бонус в оплате кристаллической крошкой
---@param count integer требуемой количество новых рун
---@return нет
function runeLib.Combine(runeId, instrumentId, crystalCrumbBonus, count) end

---Сколько стоит попытка соединить одинаковые руны. crystalCrumbBonus - бонус в оплате кристаллической крошкой (от -7 до +7): 0 - дефолтная цена, 1 - +10% в крошке, -1 - -10% в крошке.
---@param runeId ObjectId идентификатор руны в контейнере
---@param crystalCrumbBonus integer бонус в оплате кристаллической крошкой
---@param count integer требуемое количество новых рун
---@return RuneLibGetCombinePriceResult
function runeLib.GetCombinePrice(runeId, crystalCrumbBonus, count) end

---Информация общего характера, неспецифичная для аватара и не меняющаяся со временем.
---@return RuneLibGetCommonInfoResult
function runeLib.GetCommonInfo() end

---Возвращает таблицу с информацией о слоте одежды под руну. См. также:  DRESS_SLOT_...
---@param dressSlot number номер слота
---@return RuneLibGetSlotInfoResult
function runeLib.GetSlotInfo(dressSlot) end
