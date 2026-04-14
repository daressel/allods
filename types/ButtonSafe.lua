---@meta

---@class ButtonSafe
local ButtonSafe = {}

---Очищает все подставленные значения в ValuedText-е кнопки.
function ButtonSafe:ClearValues() end

---Используется для работы с кнопками, имеющими несколько вариантов, например, CheckBox можно сделать как кнопку, имеющую два варианта (обычный и с галочкой). Для работы с кнопками. Widgets, Buttons.
---@return integer
function ButtonSafe:GetVariant() end

---Используется для работы с кнопками, имеющими несколько вариантов, например, CheckBox можно сделать как кнопку, имеющую два варианта (обычный и с галочкой).
---@return results: number (int)
function ButtonSafe:GetVariantCount() end

---Задает значение для подстановки класса (из тега "rs") для данного ButtonSafe. Замечание: в текущей реализации нет проверки, что данное значение не будет использоваться для подстановки значений (в теге "r").
---@param tag string/WString тег, для которого задается значение
---@param value string/WString значение тега
function ButtonSafe:SetClassVal(tag, value) end

---Задает значение для тега.
---@param tag string/WString -- текстовый tag, для которого задается значение
---@param value WString -- устанавливаемое значение
function ButtonSafe:SetVal(tag, value) end

---Используется для работы с кнопками, имеющими несколько вариантов. Устанавливает активный вариант кнопки.
---@param variant integer порядковый номер варианта кнопки, начиная с нуля
function ButtonSafe:SetVariant(variant) end
