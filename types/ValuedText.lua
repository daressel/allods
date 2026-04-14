---@meta

---@class ValuedText
local ValuedText = {}

---Очищает все подставленные значения для данного ValuedText.
function ValuedText:ClearValues() end

---Создает копию для данного ValuedText.
function ValuedText:CreateCopy() end

---Проверяет наличие в тексте объектов (тег <o>)
---@return boolean
function ValuedText:HasObjects() end

---Проверяет является ли текст пустым. Важно! Проверяется наличие отображаемых символов, текст содержащий только теги форматирования считается пустым. Примечание: на сложных текстах данная функция работает существенно быстрее чем #text == 0
---@return boolean
function ValuedText:IsEmpty() end

---Задает значение для подстановки класса (из тега "rs") для данного ValuedText.
---@param key string/WString тег, для которого устанавливается значение
---@param value string/WString устанавливаемое значение
function ValuedText:SetClassVal(key, value) end

---Меняет формат текста для данного ValuedText. '''Изменение формата непустого ValuedText не рекомендуется''' '''Если вам потребовалась эта API, то скорее всего что-то пошло не так'''
---@param format string/WString устанавливаемый формат
function ValuedText:SetFormat(format) end

---Задает неформатированный текст для данного ValuedText. Текст будет выводиться как есть, без попытки парсинга. '''Изменение формата непустого ValuedText не рекомендуется''' '''Если вам потребовалась эта API, то скорее всего что-то пошло не так'''
---@param text string/WString устанавливаемый текст
function ValuedText:SetPlainText(text) end

---Изменяет значения атрибутов у тега(ов) в ValuedText Выбор изменяемого тега
function ValuedText:SetTagAttributes() end

---Заполняет ValuedText переданными в textValues значениями. В первую очередь в textValues ищется поле format:
---@param textValues table таблица подставляемых значений
---@return нет
function ValuedText:SetTextValues(textValues) end

---Задает подстановочное значение для данного ValuedText. Дополнительные подробности:  LuaApiDetails (закрытая ссылка)
---@param key string/WString тег, для которого устанавливается значение
---@param value string/WString/ValuedObject/ValuedText устанавливаемое значение
function ValuedText:SetVal(key, value) end

---Преобразует ValuedText в WString. Сохраняет только видимые символы, вся информация о тегах форматирования будет утеряна.
---@return string
function ValuedText:ToWString() end
