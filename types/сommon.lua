---@meta

---@class сommonLib
сommon = {}

---@class СommonGetCreditsResult
---@field officeInfo string|nil описание офиса
---@field groups GroupTable[] индексированный с 1 список таблиц, каждая из которых описывает отдельную группу разработчиков (отдел)
---@field groupHeader string описание группы
---@field groupSubHeader string|nil дополнительное описание группы
---@field items ItemTable[] индексированный с 1 список таблиц, каждая из которых описывает отдельный ресурс (разработчика, middleware)
---@field name string название
---@field type string|nil тип
---@field special string|nil вспомогательный идентификатор

---@class СommonGetTerritoryInfoResult
---@field ignoreAutoShard boolean нужно ли игнорировать автоматический выбор шарда. Если true, то список шардов обязателен для показа
---@field showZoneSelection boolean нужно ли при входе в игру использовать процедуру выбора зоны игроком
---@field showRaitingInfo boolean нужно ли показывать информацию о рейтинге игры (18+, насилие и т.п.) в главном меню игры и в стартовом экране

---Создает и возвращает новый экземпляр ValuedObject. Для него можно указать таблицу, которая будет присылаться в обработчик сообщения при клике или наведении курсора мыши на объект. Также можно переназначить клавиши мыши, которые будут вызывать сообщение о клике. Если какая-то клавиша будет отменена для обработки, то объект станет прозрачным для клика этой клавишей мыши. Замечание: поскольку ValuedObject это userdata, то Lua работает с ними по ссылке, а не по значению. См.  MOUSE_BUTTON_....
---@param text string|ValuedText текстовое описание, впоследствие может быть получено из ValuedObject методом GetText()
---@param table table таблица произвольного вида, содержащая элементы простых типов (boolean, number, string, WString, table); впоследствие может быть получено из ValuedObject методом GetId()
---@param handledMouseButtons nil|number если задана, битовая маска, задающая набор клавиш мыши, которые должны обрабатываться при одинарном клике по объекту. По умолчанию обрабатываются все клавиши
---@param handledMouseButtonsDbl nil|number если задана, битовая маска, задающая набор клавиш мыши, которые должны обрабатываться при двойном клике по объекту. По умолчанию обрабатываются все клавиши
---@return ValuedObject
function сommon.CreateValuedObject(text, table, handledMouseButtons, handledMouseButtonsDbl) end

---Создает и возвращает новый экземпляр ValuedText. Если задана таблица textValues то текст будет заполнен с помощью  SetTextValues Замечание: поскольку ValuedText это userdata, то Lua работает с ними по ссылке, а не по значению.
---@return ValuedText
function сommon.CreateValuedText() end

---Форматирует данное вещественное значение в указанном формате. Результат возвращается в виде локализуемой строки.
---@param value number исходное вещественное значение
---@param format string строка с форматом, допустимы следующие варианты:
---@param separator string разделитель разрядов, если задан то через каждые 3 разряда до десятичной точки будут вставляться символы разделителя
---@return string
function сommon.FormatFloat(value, format, separator) end

---Форматирует данное целое значение в указанном формате. Результат возвращается в виде локализуемой строки.
---@param value integer исходное целое значение
---@param format string строка с форматом, допустимы следующие варианты:
---@param separator string разделитель разрядов, если задан то через каждые 3 разряда будут вставляться символы разделителя
---@return string
function сommon.FormatInt(value, format, separator) end

---Преобразует число в строку в заданном формате. Результат возвращается в виде локализуемой строки.
---@param value number исходное число
---@param format string|nil строка с форматом, имеет вид: "+12.3[4]A5"  [sign][width][.precision][[total]][abbreviate], где
---@return string
function сommon.FormatNumber(value, format) end

---Возвращает состав команды проекта Аллоды Онлайн.
---@return СommonGetCreditsResult
function сommon.GetCredits() end

---Возвращает список всех CSS-классов.
---@return string[]
function сommon.GetCSSList() end

---Возвращает различные флаги, специфичные для данной конкретной локализованной версии клиента.
---@return СommonGetTerritoryInfoResult
function сommon.GetTerritoryInfo() end

---Проверяет что переданная строка является валидным именем для аватара.
---@param name string проверяемое значение
---@return boolean
function сommon.IsAvatarNameValid(name) end

---Возвращает true, если вторая строка является подстрокой первой с учётом регистра. DEPRECATED: Функция устарела и помечена к удалению. Используйте метод WString IsContain( other, ignoreRegistry )
---@param text1 string первый локализуемый текст
---@param text2 string второй локализуемый текст
---@return boolean
function сommon.IsSubstring(text1, text2) end

---Возвращает true, если вторая строка является подстрокой первой без учёта регистра. DEPRECATED: Функция устарела и помечена к удалению. Используйте метод WString IsContain( other, ignoreRegistry )
---@param text1 string первый локализуемый текст
---@param text2 string второй локализуемый текст
---@return boolean
function сommon.IsSubstringEx(text1, text2) end

---Проверяет что переданный аргумент является валидным текстом. Валидными считаются ValuedObject, непустой ValuedText и непустой WString.
---@param text any value проверяемое значение
---@return boolean
function сommon.IsValidText(text) end

---Проверяет что переданный аргумент является виджетом (userdata имеющая тип наследник WidgetSafe)
---@param any any value проверяемое значение
---@return boolean
function сommon.IsWidget(any) end

---Создает пользовательский снимок экрана. В ответ отправляется событие: EVENT_USER_SCREENSHOT. Если пользователь укажет postpone==true, то снимок отложится на несколько кадров, чтобы в интерфейсе произошли все изменения, инициированные из скриптов. Этот флаг потом возвращается в событии. Используется, например, для снятия скриншота без интерфейса.
---@param postpone boolean|nil если true, снимок откладывается на два кадра
---@return нет
function сommon.MakeUserScreenshot(postpone) end

---Сравнивает две локализуемые строки с учетом регистра. В случае ошибочных данных (не WString) всегда возвращает -1. DEPRECATED: Функция устарела и помечена к удалению. Используйте перегруженные операции сравнения
---@param text1 string первый локализуемый текст
---@param text2 string второй локализуемый текст
---@return integer
function сommon.CompareWString(text1, text2) end

---Сравнивает две локализуемые строки без учёта регистра. В случае ошибочных данных (не WString) всегда возвращает -1. DEPRECATED: Функция устарела и помечена к удалению. Используйте метод WString Compare( other, ignoreRegistry )
---@param text1 string первый локализуемый текст
---@param text2 string второй локализуемый текст
---@return integer
function сommon.CompareWStringEx(text1, text2) end

---Экранирует текст строки от HTML-кода, алгоритм экранирования используется тот же самый что для режима isHtmlEscaping виджета  TextView.
---@param str string исходная строка
---@return string
function сommon.EscapeWString(str) end
