---@meta

---@class ScrollableContainerSafe
local ScrollableContainerSafe = {}

---Возвращает указанный элемент
---@param pos number
---@return WidgetSafe|nil -
function ScrollableContainerSafe:At(pos) end

---Прокручивает контейнер таким образом, чтобы указанный элемент стал видимым, по возможности полностью. Если элемент уже полностью видим, то прокрутка не производится.
---@param widget WidgetSafe показываемый элемент
---@return нет
function ScrollableContainerSafe:EnsureVisible(widget) end

---Вызывает немедленную репозицию контейнера. По умолчанию репозиция выполняется 1 раз в конце кадра если была запланирована. К планированию репозиции приводит
---@return Нет
function ScrollableContainerSafe:ForceReposition() end

---Возвращает значение текущей прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@return number
function ScrollableContainerSafe:GetContainerOffset() end

---Возвращает количество элементов в контейнере.
---@return integer
function ScrollableContainerSafe:GetElementCount() end

---Возвращает максимальное количество элементов в контейнере.
---@return integer
function ScrollableContainerSafe:GetElementLimit() end

---Возвращает максимальное значение на которое может быть прокручен контейнер
---@return number
function ScrollableContainerSafe:GetMaxContainerOffset() end

---Добавляет элемент в заданную позицию контейнера. Функция вернет ошибку если выполняется любое из нижележащих условий
---@param position integer позиция в которую добавляется элемент (счет начинается с нуля)
---@param widget WidgetSafe добавляемый элемент
---@return нет
function ScrollableContainerSafe:Insert(position, widget) end

---Проверяет находится ли виджет в контейнере
---@param widget WidgetSafe проверяемый элемент
---@return boolean
function ScrollableContainerSafe:IsContain(widget) end

---Проверяет, находится ли скроллер в самом конце. Если контейнер не скроллируется, то всегда true.
---@return boolean
function ScrollableContainerSafe:IsSliderMax() end

---Проверяет, находится ли скроллер в самом начале. Если контейнер не скроллируется, то всегда true.
---@return boolean
function ScrollableContainerSafe:IsSliderMin() end

---Удаляет из контейнера элемент из конца списка. ВАЖНО: Удаляется именно элемент контейнера, но не его WidgetSafe. Он будет возвращен владельцу (будет неявно вызван Owner:AddChild( widget ) )
---@return нет
function ScrollableContainerSafe:PopBack() end

---Удаляет из контейнера элемент из начала списка. ВАЖНО: Удаляется именно элемент контейнера, но не его WidgetSafe. Он будет возвращен владельцу (будет неявно вызван Owner:AddChild( widget ) )
---@return нет
function ScrollableContainerSafe:PopFront() end

---Добавляет в контейнер очередной элемент в конец списка. Замечание: порядок отображения задается в настройках контейнера, поэтому визуально последний элемент может быть и в начале. Функция вернет ошибку если выполняется любое из нижележащих условий
---@param widget WidgetSafe добавляемый элемент
---@return нет
function ScrollableContainerSafe:PushBack(widget) end

---Добавляет в контейнер очередной элемент в начало списка. Замечание: порядок отображения задается в настройках контейнера, поэтому визуально первый элемент может быть и в конце. Функция вернет ошибку если выполняется любое из нижележащих условий
---@param widget WidgetSafe добавляемый элемент
---@return нет
function ScrollableContainerSafe:PushFront(widget) end

---Удаление указанного элемента (по виджету). Отсутствие в контейнере данного виджета считается ошибкой. ВАЖНО: Удаляется именно элемент контейнера, но не его WidgetSafe. Он будет возвращен владельцу (будет неявно вызван Owner:AddChild( widget ) )
---@param widget WidgetSafe удаляемый элемент
---@return нет
function ScrollableContainerSafe:Remove(widget) end

---Удаление указаного элемента (по индексу) ВАЖНО: Удаляется именно элемент контейнера, но не его WidgetSafe. Он будет возвращен владельцу (будет неявно вызван Owner:AddChild( widget ) )
---@param pos integer индекс элемента, который необходимо удалить (начинается с нуля)
---@return нет
function ScrollableContainerSafe:RemoveAt(pos) end

---Удаление всех элементов из контейнера ВАЖНО: Удаляются именно элементы контейнера, но не их WidgetSafe. Они будут возвращены владельцам (будет неявно вызван Owner:AddChild( widget ) )
function ScrollableContainerSafe:RemoveItems() end

---Изменяет значение прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@param offset number величина прокрутки
---@return нет
function ScrollableContainerSafe:SetContainerOffset(offset) end
