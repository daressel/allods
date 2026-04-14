---@meta

---@class метод доступен у всех типов виджетов (WidgetSafe)
local метод доступен у всех типов виджетов (WidgetSafe) = {}

---Получает статус pickChildrenOnly для виджета PickChildrenOnly - Обрабатывать мышиные реакции только для детей этого виджета, игнорируя сам виджет
---@return boolean
function метод доступен у всех типов виджетов (WidgetSafe):GetPickChildrenOnly() end

---Показывает, является ли виджет прозрачным для ввода.
---@return boolean
function метод доступен у всех типов виджетов (WidgetSafe):GetTransparentInput() end

---Возвращает описатель виджета в ресурсной системе. Работает только для виджетов, созданных на основе таких описателей (большинство виджетов именно такие, исключения будут описываться отдельно). Функция вернет ошибку если выполняется любое из нижележащих условий
---@return WidgetDesc
function метод доступен у всех типов виджетов (WidgetSafe):GetWidgetDesc() end

---Устанавливает статус pickChildrenOnly для виджета PickChildrenOnly - Обрабатывать мышиные реакции только для детей этого виджета, игнорируя сам виджет
---@param pickChildrenOnly boolean true, если обрабатывать мышиные реакции нужно только для детей данного виджета (игнорируя сам виджет)
---@return Нет
function метод доступен у всех типов виджетов (WidgetSafe):SetPickChildrenOnly(pickChildrenOnly) end

---Устанавливает, является ли виджет прозрачным для ввода.
---@param transparentInput boolean true, если виджет должен быть прозрачным для ввода
---@return Нет
function метод доступен у всех типов виджетов (WidgetSafe):SetTransparentInput(transparentInput) end
