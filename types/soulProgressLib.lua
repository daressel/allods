---@meta

---@class soulProgressLibLib
soulProgressLib = {}

---@class SoulProgressLibGetInfoResult
---@field talentCurrency CurrencyId|nil идентификатор ресурса альтернативной валюты количества доступных вех для изучения.
---@field minSoulExpLevel integer минимальный уровень на котором становится доступен soulProgress

---@class SoulProgressLibGetTalentGraphResult
---@field edges table список ребер, каждая ячейка таблица полями
---@field firstNodeId integer идентификатор первого узла ребра
---@field secondNodeId integer идентификатор второго узла ребра
---@field nodes table список узлов, каждая ячейка таблица полями
---@field id integer идентификатор узла
---@field start boolean true если это стартовый узел
---@field x integer координата по горизонтали
---@field y integer координата по вертикали
---@field socket SocketId|nil гнездо для гема
---@field quality Number качество
---@field version integer версия дерева

---Текущее количество опыта души.
---@return Number
function soulProgressLib.GetCurrentExperience() end

---Расчитывает количество опыта для достижения заданного уровень души.
---@return Number
function soulProgressLib.GetExperienceBySoulLevel() end

---Общая информация о талантах
---@return SoulProgressLibGetInfoResult
function soulProgressLib.GetInfo() end

---Максимальный уровень души
---@return number|nil
function soulProgressLib.GetMaxLevel() end

---Рассчитывает количество опыта, которое будет потрачено на сброс талантов.
---@return Number
function soulProgressLib.GetRerollPrice() end

---Возвращает активированные таланты души.
---@return number[]
function soulProgressLib.GetSelectedTalents() end

---Расчитывает уровень души от значения опыта.
---@return integer
function soulProgressLib.GetSoulLevelForExperience() end

---Возвращает дерево тантов души.
---@return SoulProgressLibGetTalentGraphResult
function soulProgressLib.GetTalentGraph() end

---Подсказка по прокачке души, с указанием активностей и награды.
---@return ValuedText|nil
function soulProgressLib.GetTipProgressGain() end

---Сбросывает таланты души.
---@return нет
function soulProgressLib.RerollSoulTalents() end

---Выбрать таланты души.
---@return нет
function soulProgressLib.SelectSoulTalents() end
