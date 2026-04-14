---@meta

---@class RelatedSoundsLua
local RelatedSoundsLua = {}

---Возвращает список всех звуков в звуковой группе
---@return strings[]
function RelatedSoundsLua:GetList() end

---Возвращает один из звуков группы по его идентификатору.
---@param sysName string идентификатор звука
---@return Sound2DId|nil
function RelatedSoundsLua:GetSound(sysName) end

---Проверяет, существует ли звук с данным идентификатором в группе.
---@param sysName string идентификатор звука
---@return boolean
function RelatedSoundsLua:HasSound(sysName) end
