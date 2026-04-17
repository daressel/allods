---@meta

--- CategoryValuedText
--- API для работы с ValuedText.

---@class valuedTextLib
valuedText = {}

--- Получить описание  GlossaryResource.
---@param glossaryId GlossaryId идентификатор ресурса глоссария
---@return ValuedText
function valuedText.GetGlossaryDescription(glossaryId) end

--- Создает и возвращает новый экземпляр ValuedObject.
---@param text WString текстовое описание, впоследствие может быть получено из ValuedObject методом GetText()
---@param table table таблица произвольного вида, содержащая элементы простых типов (boolean, number, string, WString, table); впоследствие может быть получено из ValuedObject методом GetId()
---@param handledMouseButtons nil если задана, битовая маска, задающая набор клавиш мыши, которые должны обрабатываться при одинарном клике по объекту. По умолчанию обрабатываются все клавиши
---@param handledMouseButtonsDbl nil если задана, битовая маска, задающая набор клавиш мыши, которые должны обрабатываться при двойном клике по объекту. По умолчанию обрабатываются все клавиши
---@return ValuedObject
function valuedText.CreateValuedObject(text, table, handledMouseButtons, handledMouseButtonsDbl) end

--- Создает и возвращает новый экземпляр ValuedText.
---@return ValuedText
function valuedText.CreateValuedText() end

--- Форматирует данное вещественное значение в указанном формате. Результат возвращается в виде локализуемой строки.
---@param value float исходное вещественное значение
---@param format string строка с форматом, допустимы следующие варианты:
---@param separator string разделитель разрядов, если задан то через каждые 3 разряда до десятичной точки будут вставляться символы разделителя
---@return WString
function valuedText.FormatFloat(value, format, separator) end

--- Форматирует данное целое значение в указанном формате. Результат возвращается в виде локализуемой строки.
---@param value integer исходное целое значение
---@param format string строка с форматом, допустимы следующие варианты:
---@param separator string разделитель разрядов, если задан то через каждые 3 разряда будут вставляться символы разделителя
---@return WString
function valuedText.FormatInt(value, format, separator) end

--- Преобразует число в строку в заданном формате. Результат возвращается в виде локализуемой строки.
---@param value number исходное число
---@param format string|nil строка с форматом, имеет вид: "+12.3[4]A5"  [sign][width][.precision][[total]][abbreviate], где
---@return WString
function valuedText.FormatNumber(value, format) end

--- Возвращает true, если ValuedText фактически пустой и не содержит отображаемых символов, хотя может содержать какую-то форматирующую информацию.
---@param valuedText ValuedText экземпляр ValuedText
---@return boolean
function valuedText.IsEmptyValuedText(valuedText) end

--- Является ли объект ValuedObject-ом.
---@param object any любое значение
---@return boolean
function valuedText.IsValuedObject(object) end

--- Возвращает true, если переданный объект типа ValuedText.
---@param value any любое значение
---@return boolean
function valuedText.IsValuedText(value) end

--- Возвращает новый экземпляр ValuedObject для пассивного умения.
function GetAbilityValuedObject() end

--- Возвращает новый экземпляр ValuedObject для бафа.
function GetBuffValuedObject() end

--- Возвращает новый экземпляр ValuedObject по Id предмета.
function GetValuedObject() end

--- Возвращает новый экземпляр ValuedObject по Id маунта.
function GetValuedObject() end

--- Возвращает новый экземпляр ValuedObject для заклинания.
function GetValuedObject() end

--- Возвращает новый экземпляр ValuedObject по имени игрока.
function GetPlayerValuedObject() end

--- Возвращает новый экземпляр ValuedObject по Id существа.
function GetUnitValuedObject() end

-- Events

--- Уведомление, что был кликнут ValuedObject - объект представляющий игровой объект в UI тексте.
EVENT_VALUED_OBJECT_CLICKED = "EVENT_VALUED_OBJECT_CLICKED"

--- Уведомление, что ValuedObject - объект представляющий игровой объект в UI тексте, был дважды кликнут (даблклик).
EVENT_VALUED_OBJECT_DOUBLE_CLICKED = "EVENT_VALUED_OBJECT_DOUBLE_CLICKED"

--- Уведомление, что был на ValuedObject (объект представляющий игровой объект в UI тексте) был наведён или был убран с него курсор мыши.
EVENT_VALUED_OBJECT_MOUSEOVER = "EVENT_VALUED_OBJECT_MOUSEOVER"
