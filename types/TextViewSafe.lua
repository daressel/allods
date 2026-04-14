---@meta

---@class TextViewSafe
local TextViewSafe = {}

---@class TextViewSafeGetTextRectResult
---@field posY integer позиция по вертикали
---@field sizeX integer ширина
---@field sizeY integer высота

---Очищает все подставленные значения в ValuedText-е текстового контрола.
function TextViewSafe:ClearValues() end

---Прерывает эффект  типа ET_TEXT_SCALE Соответствует шаблону  FinishEffect( self, finalPosition, sendEvent )
function TextViewSafe:FinishTextScaleEffect() end

---Возвращает тег по-умолчанию. Используется для удобства, если формат текста подразумевает использование только одного значения подстановки.
---@return string
function TextViewSafe:GetDefaultTag() end

---Возвращает границы области в которую вписан отрисованный текст. Для того что бы значение было валидно текст предварительно должен быть отрисован в предыдущем кадре.
---@return TextViewSafeGetTextRectResult
function TextViewSafe:GetTextRect() end

---Возвращает коэффициент масштабирования текста внутри текстового контрола. Если текст не масштабирован, то возвращается nil. Замечание. Масштабированные тексты могут "размыливаться".
---@return number|nil
function TextViewSafe:GetTextScale() end

---Возвращает текст, находящийся в этом контроле.
---@return ValuedText
function TextViewSafe:GetValuedText() end

---Преобразование содержимого виджета TextView в UTF-строку.
---@return string
function TextViewSafe:GetWString() end

---Запускает эффект масштабирования текста в TextView. Не рекомендуется оставлять масштабный коэффициент отличным от 1 на длительное время: текст может быть размытым. Поддерживается только строго центрированный текст (выравнивание: alignx="center", aligny="middle"). Имеет  тип ET_TEXT_SCALE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers ) Типы start / finish: number (float) [> 0] - коэффициент масштабирования текста
function TextViewSafe:PlayTextScaleEffect() end

---Запускает цепочку эффектов масштабирования текста в TextView. Не рекомендуется оставлять масштабный коэффициент отличным от 1 на длительное время: текст может быть размытым. Поддерживается только строго центрированный текст (выравнивание: alignx="center", aligny="middle"). Имеет  тип ET_TEXT_SCALE, соответствует шаблону  PlayEffectSequence( self, sequenceParams ) Типы start / finish: number (float) [> 0] - коэффициент масштабирования текста
function TextViewSafe:PlayTextScaleEffectSequence() end

---Меняет выравнивание текста по вертикали. Не рекомендуется использовать без крайней необходимости. Для работы с текстовыми полями. TextView.
---@param align number
function TextViewSafe:SetFormat(align) end

---Задает значение для подстановки класса (из тега "rs") для данного TextViewSafe. Замечание: в текущей реализации нет проверки, что данное значение не будет использоваться для подстановки значений (в теге "r").
---@param tag string/WString тег, для которого задается значение
---@param value string/WString значение тега
function TextViewSafe:SetClassVal(tag, value) end

---Cтавить ли многоточие при выходе текста за правую границу. Не рекомендуется использовать без крайней необходимости.
---@param ellipsis boolean -- Если true, то ставить многоточие при выходе текста за правую границу
function TextViewSafe:SetEllipsis(ellipsis) end

---Меняет формат текста, механизм работы идентичен SetFormat '''Изменение формата не рекомендуется''' '''Если вам потребовалась эта API, то скорее всего что-то пошло не так'''
---@param format WString или String -- устанавливаемый формат
function TextViewSafe:SetFormat(format) end

---Устанавливает фиксированное расстояние между строками. Не рекомендуется использовать без крайней необходимости.
---@param spacing number -- фиксированное расстояние между строками. Если 0, то подбирать размер каждой строки автоматически.
function TextViewSafe:SetLinespacing(spacing) end

---Устанавливает контрол в многострочный режим. Не рекомендуется использовать без крайней необходимости.
---@param multiline boolean -- Если true, то выводить многострочный текст
function TextViewSafe:SetMultiline(multiline) end

---Масштабирует текст внутри текстового контрола. Поддерживается только строго центрированный текст (выравнивание: alignx="center", aligny="middle"). Рекомендуется использовать исключительно для динамических эффектов из-за "размыливания" текста.
---@param scale number|nil коэффициент масштабирования текста >= 0.0 или nil для возвращения текста в исходное (немасштабированное) состояние
function TextViewSafe:SetTextScale(scale) end

---Задает значение для тега. Часто используется в паре с GetDefaultTag.
---@param tag String / WString -- текстовый tag, для которого задается значение
---@param value String / WString / ValuedText / ValuedObject -- устанавливаемое значение
function TextViewSafe:SetVal(tag, value) end

---Полностью задает новый текст для данного контрола. Копируется как оформление, так и подстановочные значения.
---@param valuedText ValuedText устанавливаемый формат
function TextViewSafe:SetValuedText(valuedText) end

---Выставляет флаг переноса текста на следующую строку. Только для многострочных контролов. Не рекомендуется использовать без крайней необходимости.
---@param wraptext boolean -- Если true, то переносить текст на следующую строку
function TextViewSafe:SetWrapText(wraptext) end

---Выставляет флаг вывода на экран строки, если она пересекает границу области вывода по вертикали. Не рекомендуется использовать без крайней необходимости.
---@param show boolean -- Если true, то показывать строку
function TextViewSafe:ShowClippedLine(show) end

---Выставляет флаг вывода на экран символа, если он пересекает границу области вывода по горизонтали. Не рекомендуется использовать без крайней необходимости.
---@param show boolean -- Если true, то показывать символ
function TextViewSafe:ShowClippedSymbol(show) end
