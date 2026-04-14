---@meta

---@class WString.
local WString. = {}

---Проверяет является ли строка пустой.
---@return boolean
function WString.:IsEmpty() end

---Конвертирует строку в аббревиатуру (сумма первых букв каждого слова).
---@return string
function WString.:ToAbbr() end

---Конвертирует строку в нижний регистр.
---@return string
function WString.:ToLower() end

---Конвертирует строку в верхний регистр.
---@return string
function WString.:ToUpper() end

---Обрезает строку добавляя многоточие в конце результирующей строки
---@param maxOverallLen integer максимальная длина результирующей строки (включая добавляемые точки)
---@param trailingDotsCount integer|nil количество точек, добавляемых в конец результирующей строки в случае, если длина str превышает maxOverallLen, по умолчанию 3
---@param needTrim boolean|nil произвести операцию trim (удалить пробелы и табуляции с обоих концов строки) после обрезания str и до добавления точек, по умолчанию true
---@return string
function WString.:Truncate(maxOverallLen, trailingDotsCount, needTrim) end
