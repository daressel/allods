---@meta

---@class WString
local WString = {}

---Комплексно сравнить два WString. Возвращает полный результат сравнения, имеет опцию игнорирования регистра. Если полный результат сравнения и сравнение без учета регистра не требуется - следует использовать перегруженные операции сравнения.
---@param other WString строка с которой будет проведено сравнение
---@param ignoreRegistry boolean|nil игнорировать регистр при сравнении, по умолчанию false
---@return integer|nil
function WString:Compare(other, ignoreRegistry) end

---Возвращает true, если part является подстрокой self
---@param part string строка проверяемая на вхождение
---@param ignoreRegistry boolean|nil игнорировать регистр, по умолчанию false
---@return boolean|nil
function WString:IsContain(part, ignoreRegistry) end

---Конвертирует строку в целое число, если парсинг не удался возвращает nil.
---@return integer|nil
function WString:ToInt() end
