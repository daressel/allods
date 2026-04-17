---@meta

--- CategoryRitual
--- События и функции Lua API, относящиеся к ритуалу.

--- Тип контейнера с предметами экипированными на персонаже игрока.
--- первичный набор экипировки
---@type integer
DUMMY_TYPE_PRIMARY = nil
--- вторичный набор экипировки (первый набор экипировки для "драконьего облика")
---@type integer
DUMMY_TYPE_SECONDARY = nil
--- третичный набор экипировки (второй набор экипировки для "драконьего облика")
---@type integer
DUMMY_TYPE_TERTIARY = nil
--- четвертичный набор экипировки (третий набор экипировки для "драконьего облика")
---@type integer
DUMMY_TYPE_QUATERNARY = nil

---@class ritualLib
ritual = {}

--- Позволяет узнать текущий активный набор ритуальных вещей.
---@return number
function ritual.GetRitualActivePreset() end

--- Попытка изменить активный набор ритуальных вещей. Результатом успешной попытки будет событие  EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED.
---@param preset integer набор
function ritual.SetRitualActivePreset(preset) end

--- Позволяет узнать текущий активный набор ритуальных вещей.
---@param unitId ObjectId идентификатор игрока
---@return number
function ritual.GetRitualActivePreset(unitId) end

--- Возвращает true, если главный или инспектируемый игрок уже может находится в состоянии ритуала (надевать ритуальные вещи, видеть их контейнер).
---@param unitId ObjectId идентификатор игрока
---@return boolean
function ritual.IsRitualEnabled(unitId) end

-- Events

--- Событие посылается, когда поменялся текущий активный набор ритуальных вещей  enum DUMMY_TYPE.
EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED = "EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED"

--- Событие посылается, когда главному или инспектируемому игроку становятся доступны ритуальные вещи (контейнер, действия и т.п.).
EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED = "EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED"
