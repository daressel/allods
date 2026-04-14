---@meta

---@class RelatedTexturesLua
local RelatedTexturesLua = {}

---Возвращает список всех текстур в текстовой группе
---@return strings[]
function RelatedTexturesLua:GetList() end

---Возвращает одну из текстур группы по ее идентификатору.
---@param sysName string идентификатор текстуры
---@return TextureId|nil
function RelatedTexturesLua:RelatedTexturesLua: GetTexture(sysName) end

---Проверяет, существует ли текстура с данным идентификатором в группе.
---@param sysName string идентификатор текстуры
---@return boolean
function RelatedTexturesLua:RelatedTexturesLua: HasTexture(sysName) end
