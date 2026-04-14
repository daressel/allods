---@meta

---@class RelatedTextsLua
local RelatedTextsLua = {}

---Возвращает список всех тестов в текстовой группе
---@return strings[]
function RelatedTextsLua:GetList() end

---Возвращает один из текстов группы по его идентификатору.
---@param sysName string идентификатор текста
---@return string|nil
function RelatedTextsLua:GetText(sysName) end

---Проверяет, существует ли текст с данным идентификатором в группе.
---@param sysName string идентификатор текста
---@return boolean
function RelatedTextsLua:HasText(sysName) end
