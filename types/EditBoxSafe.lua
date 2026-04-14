---@meta

---@class EditBoxSafe
local EditBoxSafe = {}

---Проверяет не заполнен ли EditBox текстом настолько, что он(текст) уже не умещается в EditBox'е.
function EditBoxSafe:IsOverflow() end

---Задает максимальное количество символов для поля ввода.
---@param maxSize integer|nil новое максимальное количество символов или предельное значение, если nil
---@return нет
function EditBoxSafe:SetMaxSize(maxSize) end

---Показать/скрыть скроллбар EditBox'a. Для отображения скроллбара также требуется, что бы скроллбал был прописан в ресурном файле для данного виджета(EditBox). По умолчанию скроллбар отображается.
---@param show boolean -- устанавливаемое значение
function EditBoxSafe:ShowScrollbar(show) end
