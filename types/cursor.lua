---@meta

--- CategoryCursor
--- События и функции Lua API, относящиеся к работе с курсорами.

---@class cursorLib
cursor = {}

--- Задает текущий курсор, курсор берется по указанному имени (alias) из ресурсной системы.
---@param name string псевдоним (alias) курсора
function cursor.SetCursor(name) end

-- Events

--- Событие присылается при изменении объекта под курсором.
EVENT_INGAME_UNDER_CURSOR_CHANGED = "EVENT_INGAME_UNDER_CURSOR_CHANGED"
