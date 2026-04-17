---@meta

--- CategorySoulProgressLib
--- События и функции Lua API, относящиеся к талантам души.

---@class soulProgressLibLib
soulProgressLib = {}

--- Текущее количество опыта души.
---@return number
function soulProgressLib.GetCurrentExperience() end

--- Расчитывает количество опыта для достижения заданного уровень души.
---@return number
function soulProgressLib.GetExperienceBySoulLevel() end

--- Общая информация о талантах
---@return table
function soulProgressLib.GetInfo() end

--- Максимальный уровень души
---@return number|nil
function soulProgressLib.GetMaxLevel() end

--- Рассчитывает количество опыта, которое будет потрачено на сброс талантов.
---@return number
function soulProgressLib.GetRerollPrice() end

--- Возвращает активированные таланты души.
---@return table
function soulProgressLib.GetSelectedTalents() end

--- Расчитывает уровень души от значения опыта.
---@return number
function soulProgressLib.GetSoulLevelForExperience() end

--- Возвращает дерево тантов души.
---@return table
function soulProgressLib.GetTalentGraph() end

--- Подсказка по прокачке души, с указанием активностей и награды.
---@return ValuedText|nil
function soulProgressLib.GetTipProgressGain() end

--- Сбросывает таланты души.
function soulProgressLib.RerollSoulTalents() end

--- Выбрать таланты души.
function soulProgressLib.SelectSoulTalents() end

-- Events

--- Уведомление о смене гемов в дереве талантов души.
EVENT_INVENTORY_GEMS_CHANGED = "EVENT_INVENTORY_GEMS_CHANGED"

--- Уведомление о добалении слота для гемов в дереве талантов души.
EVENT_INVENTORY_GEMS_SLOT_ADDED = "EVENT_INVENTORY_GEMS_SLOT_ADDED"

--- Уведомление о удалении слота для гемов в дереве талантов души.
EVENT_INVENTORY_GEMS_SLOT_REMOVED = "EVENT_INVENTORY_GEMS_SLOT_REMOVED"

--- Уведомление об изменении накопленного количества опыта души.
EVENT_SOUL_PROGRESS_EXPERIENCE_CHANGED = "EVENT_SOUL_PROGRESS_EXPERIENCE_CHANGED"

--- Уведомление о смене активных талантов души.
EVENT_SOUL_PROGRESS_TALENTS_CHANGED = "EVENT_SOUL_PROGRESS_TALENTS_CHANGED"
