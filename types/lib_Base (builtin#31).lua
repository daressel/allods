---@meta

---@class lib_Base (builtin#31)Lib
lib_Base (builtin#31) = {}

---Возвращает строку с именем типа переданного в качестве аргумента объекта. Если объект имеет встроенный тип - результат аналогичен type( value ). Если объект принадлежит к одному из типов Lua API, результатом будет имя этого типа.
---@param value any type любое значение
---@return string
function lib_Base (builtin#31).apitype(value) end
