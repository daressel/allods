---@meta

--- CategoryRune
--- Функции и события Lua API, относящиеся к работе с рунами.

--- Текстовый enum для представления результата операции с руной.
ENUM_RuneOperationResult_SlotNumberOutOfBounds = "ENUM_RuneOperationResult_SlotNumberOutOfBounds"
ENUM_RuneOperationResult_SlotIsEmpty = "ENUM_RuneOperationResult_SlotIsEmpty"
ENUM_RuneOperationResult_ItemIsNotExtractor = "ENUM_RuneOperationResult_ItemIsNotExtractor"
ENUM_RuneOperationResult_ItemHasNoRune = "ENUM_RuneOperationResult_ItemHasNoRune"
ENUM_RuneOperationResult_WrongInstrumentLevel = "ENUM_RuneOperationResult_WrongInstrumentLevel"
ENUM_RuneOperationResult_NoFreeSpace = "ENUM_RuneOperationResult_NoFreeSpace"
ENUM_RuneOperationResult_SecondRuneNotFound = "ENUM_RuneOperationResult_SecondRuneNotFound"
ENUM_RuneOperationResult_ItemIsNotCombiner = "ENUM_RuneOperationResult_ItemIsNotCombiner"
ENUM_RuneOperationResult_ItemIsNotRune = "ENUM_RuneOperationResult_ItemIsNotRune"
ENUM_RuneOperationResult_ItemAlreadyHasRune = "ENUM_RuneOperationResult_ItemAlreadyHasRune"
ENUM_RuneOperationResult_CannotInsertIntoThis = "ENUM_RuneOperationResult_CannotInsertIntoThis"
ENUM_RuneOperationResult_NoHigherLevelRune = "ENUM_RuneOperationResult_NoHigherLevelRune"
ENUM_RuneOperationResult_OperationFailed = "ENUM_RuneOperationResult_OperationFailed"
ENUM_RuneOperationResult_NotEnoughRunes = "ENUM_RuneOperationResult_NotEnoughRunes"
ENUM_RuneOperationResult_OperationSuccess = "ENUM_RuneOperationResult_OperationSuccess"

---@class runeLib
rune = {}

--- Попытка соединить одинаковые руны и получить руны на уровень выше.
---@param runeId ObjectId идентификатор руны в контейнере
---@param instrumentId ObjectId идентификатор инструмента в контейнере
---@param crystalCrumbBonus integer бонус в оплате кристаллической крошкой
---@param count integer требуемой количество новых рун
function rune.Combine(runeId, instrumentId, crystalCrumbBonus, count) end

--- Сколько стоит попытка соединить одинаковые руны.
---@param runeId ObjectId идентификатор руны в контейнере
---@param crystalCrumbBonus integer бонус в оплате кристаллической крошкой
---@param count integer требуемое количество новых рун
---@return table
function rune.GetCombinePrice(runeId, crystalCrumbBonus, count) end

--- Информация общего характера, неспецифичная для аватара и не меняющаяся со временем.
---@return table
function rune.GetCommonInfo() end

--- Возвращает таблицу с информацией о слоте одежды под руну.
---@param dressSlot integer номер слота
---@return table|nil
function rune.GetSlotInfo(dressSlot) end

-- Events

--- Уведомление о результате взаимодействия с руной.
EVENT_RUNE_OPERATION_RESULT = "EVENT_RUNE_OPERATION_RESULT"
