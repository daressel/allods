---@meta

---@class RelatedWidgetsLua
local RelatedWidgetsLua = {}

---Возвращает список всех имен шаблонов виджетов в группе
---@return strings[]
function RelatedWidgetsLua:GetList() end

---Возвращает шаблон виджета по идентификатору.
---@param sysName string идентификатор шаблона виджета
---@return WidgetDesc|nil
function RelatedWidgetsLua:RelatedWidgetsLua: GetWidget(sysName) end

---Проверяет, существует ли в группе шаблон виджета с данным идентификатором.
---@param sysName string идентификатор шаблона виджета
---@return boolean
function RelatedWidgetsLua:HasWidget(sysName) end
