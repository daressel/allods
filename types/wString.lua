---@meta

--- CategoryWString
--- API для работы с WString

---@class wStringLib
wString = {}

--- Возвращает пустую локализуемую строку.
---@return WString
function wString.GetEmptyWString() end

--- Возвращает сокращённую (по первым буквам каждого присутствующего в строке-аргументе слова) строку. Может быть полезно, к примеру, для получения сокращённого имени шарда - например, если задать "Владыки Астрала", то вернётся "ВА". Аргумент должен иметь тип WString.
---@param text WString строка
---@return WString|nil
function wString.GetShortString(text) end

--- Возвращает пуста ли локализуемая строка. Аргумент должен иметь тип WString.
---@param text WString локализуемая строка
---@return boolean
function wString.IsEmptyWString(text) end

--- Возвращает true, если вторая строка является подстрокой первой с учётом регистра.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return boolean
function wString.IsSubstring(text1, text2) end

--- Возвращает true, если вторая строка является подстрокой первой без учёта регистра.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return boolean
function wString.IsSubstringEx(text1, text2) end

--- Проверяет, является ли аргумент локализуемой строкой.
---@param value any любое значение
---@return boolean
function wString.IsWString(value) end

--- Сравнивает две локализуемые строки с учетом регистра. В случае ошибочных данных (не WString) всегда возвращает -1.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return number
function wString.CompareWString(text1, text2) end

--- Сравнивает две локализуемые строки без учёта регистра. В случае ошибочных данных (не WString) всегда возвращает -1.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return number
function wString.CompareWString(text1, text2) end

--- Экранирует текст строки от HTML-кода, алгоритм экранирования используется тот же самый что для режима isHtmlEscaping виджета  TextView.
---@param str WString исходная строка
---@return WString
function wString.EscapeWString(str) end

--- Возвращает обычную строку по исходной локализуемой.
---@param localizedText WString исходный локализуемый текст
---@return string
function wString.FromWString(localizedText) end

--- Возвращает локализуемую строку по обычной.
---@param sysText string исходная строка
---@return WString
function wString.ToWString(sysText) end
