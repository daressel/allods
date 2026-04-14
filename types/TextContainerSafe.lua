---@meta

---@class TextContainerSafe
local TextContainerSafe = {}

---Вызывает немедленную репозицию контейнера. По умолчанию репозиция выполняется 1 раз в конце кадра если была запланирована. К планированию репозиции приводит
---@return Нет
function TextContainerSafe:ForceReposition() end

---Возвращает значение текущей прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@return number
function TextContainerSafe:GetContainerOffset() end

---Возвращает количество элементов в контейнере.
---@return integer
function TextContainerSafe:GetElementCount() end

---Возвращает максимальное количество элементов в контейнере.
---@return integer
function TextContainerSafe:GetElementLimit() end

---Возвращает максимальное значение на которое может быть прокручен контейнер
---@return number
function TextContainerSafe:GetMaxContainerOffset() end

---Вставка в заданную позицию контейнера строки или ValuedText (зависит от входного параметра)
---@param position Number
---@param text WString -- добавляемый текст
---@param valuedText ValuedText -- добавляемый текст
function TextContainerSafe:InsertText(position, text, valuedText) end

---Проверяет, находится ли скроллер в самом конце. Если контейнер не скроллируется, то всегда true.
---@return boolean
function TextContainerSafe:IsSliderMax() end

---Проверяет, находится ли скроллер в самом начале. Если контейнер не скроллируется, то всегда true.
---@return boolean
function TextContainerSafe:IsSliderMin() end

---Удаление элемента в конце контейнера
function TextContainerSafe:PopBack() end

---Добавляет неформатированную строку в контейнер (порядок добавления задается в настройках контейнера) DEPRECATED: Метод устарел и помечен к удалению. Используйте метод PushBackText( text )
---@param text WString -- добавляемый текст
function TextContainerSafe:PushBackRawText(text) end

---Добавляет WString / ValuedText в конец контейнера (порядок добавления задается в настройках контейнера). Для добавления WString в контейнере должны быть заданы formatFileRef и defaultTag.
---@param text string|ValuedText -- добавляемый текст
function TextContainerSafe:PushBackText(text) end

---Добавляет ValuedText в контейнер (порядок добавления задается в настройках контейнера) DEPRECATED: Метод устарел и помечен к удалению. Используйте метод PushBackText( text )
---@param valuedText ValuedText -- добавляемый текст
function TextContainerSafe:PushBackValuedText(valuedText) end

---Добавляет неформатированную строку в начало контейнера (само начало задается в настройках контейнера) DEPRECATED: Метод устарел и помечен к удалению. Используйте метод PushFrontText( text )
---@param text WString -- добавляемый текст
function TextContainerSafe:PushFrontRawText(text) end

---Добавляет WString / ValuedText в начало контейнера (порядок добавления задается в настройках контейнера). Для добавления WString в контейнере должны быть заданы formatFileRef и defaultTag.
---@param text string|ValuedText -- добавляемый текст
function TextContainerSafe:PushFrontText(text) end

---Добавляет ValuedText в начало контейнера (порядок добавления задается в настройках контейнера) DEPRECATED: Метод устарел и помечен к удалению. Используйте метод PushFrontText( text )
---@param valuedText ValuedText -- добавляемый текст
function TextContainerSafe:PushFrontValuedText(valuedText) end

---Удаление указаного элемента
---@param pos integer индекс элемента, который необходимо удалить (начинается с нуля)
---@return нет
function TextContainerSafe:RemoveAt(pos) end

---Удаление всех элементов из контейнера
function TextContainerSafe:RemoveItems() end

---Изменяет значение прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@param offset number величина прокрутки
---@return нет
function TextContainerSafe:SetContainerOffset(offset) end
