---@meta

---@class EditLineSafe
local EditLineSafe = {}

---Удаляет символ перед курсором (как если бы нажали клавишу Backspace). Если в EditLine был выделен фрагмент текста, то этот фрагмент будет уничтожен.
---@return отсутствует
function EditLineSafe:BackspaceCharAtCursorPos() end

---Удаляет символ после курсора (как если бы нажали клавишу Delete). Если в EditLine был выделен фрагмент текста, то этот фрагмент будет уничтожен.
---@return отсутствует
function EditLineSafe:DeleteCharAtCursorPos() end

---Возвращает позицию курсора в EditLine.
---@return integer
function EditLineSafe:GetCursorPos() end

---Возвращает класс, задающий исходное оформление текста в EditLine (из ресурсной системы).
---@return string
function EditLineSafe:GetInitialGlobalClass() end

---Возвращает класс, задающий исходное оформление выделенного текста в EditLine (из ресурсной системы).
---@return string
function EditLineSafe:GetInitialSelectionClass() end

---Возвращает допустимое количество объектов для задания позиции курсора в EditLine. Допустимые позиции курсора лежат в диапазоне [0..GetPosObjectCount()].
---@return integer
function EditLineSafe:GetPosObjectCount() end

---Возвращает текст, содержащийся в строке ввода в виде обычной строки(не WString). Если строка ввода содержит пароль, то возвращается визуальный текст ("звездочки"). Для использования оригинального текста нужно применять специальные функции (отдельно для каждого случая, когда необходимо использовать пароль).
---@return string
function EditLineSafe:GetString() end

---Возвращает текст, содержащийся в строке ввода. Если строка ввода содержит пароль, то возвращается визуальный текст ("звездочки"). Для использования оригинального текста нужно применять специальные функции (отдельно для каждого случая, когда необходимо использовать пароль).
---@return string
function EditLineSafe:GetText() end

---Вставляет текст в текущей позиции курсора EditLine. Если в EditLine был выделен фрагмент текста, то этот фрагмент будет заменён вставляемым текстом.
---@param text WString -- вставляемый текст
---@return отсутствует
function EditLineSafe:InsertTextAtCursorPos(text) end

---Задает позицию курсора для EditLine.
---@param index integer позиция курсора, [0..]
---@return нет
function EditLineSafe:SetCursorPos(index) end

---Задает оформление для всего EditLine через список CSS-классов.
---@param classNames string|WString, индексация с 1[] список CSS-классов
---@return нет
function EditLineSafe:SetGlobalClasses(classNames) end

---Задает максимальное количество символов для строки ввода.
---@param maxSize integer|nil новое максимальное количество символов или предельное значение, если nil
---@return нет
function EditLineSafe:SetMaxSize(maxSize) end

---Задает оформление для выделенного текста в EditLine.
---@param className string|string имя CSS-класса
---@return нет
function EditLineSafe:SetSelectionClass(className) end

---Задает текст для EditLine.
---@param text WString -- устанавливаемый текст
function EditLineSafe:SetText(text) end
