---@meta

--- CategoryLoto
--- Функции и события Lua Api, относящиеся к лотерее "Лото". Доступны только во время игры.

--- Состояние лотереи, розыгрыша:
ENUM_LotteryState_Prepare = "ENUM_LotteryState_Prepare"
ENUM_LotteryState_Roll = "ENUM_LotteryState_Roll"
ENUM_LotteryState_End = "ENUM_LotteryState_End"
ENUM_LotteryState_Fail = "ENUM_LotteryState_Fail"

---@class lotoLib
loto = {}

--- Возвращает информацию о победителях в лотерее "Лото".
---@return table
function loto.GetLotteryHistory() end

--- Возвращает информацию о лотерее "Лото".
---@return table
function loto.GetLotteryInfo() end

--- Запрашивает с сервера актуальный список победителей. При обычном сценарии использования не нужен.
function loto.RequestLotteryHistory() end

-- Events

--- Событие присылается, когда заканчивается лотерея "Лото".
EVENT_LOTTERY_END = "EVENT_LOTTERY_END"

--- Событие присылается, когда меняется состояние лотереи. Подробнее о состояниях: EnumLotteryState
EVENT_LOTTERY_STATE_CHANGED = "EVENT_LOTTERY_STATE_CHANGED"
