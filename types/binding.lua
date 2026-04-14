---@meta

---@class bindingLib
binding = {}

---@class BindingGetBindResult
---@field sysName string служебное название (идентификатор) бинда (то же самое, что и sysBindName)
---@field name string локализованное название бинда
---@field keys table список комбинаций клавиш бинда, индексация [0..],

---@class BindingGetRebindConflictResult
---@field isConflict boolean обнаружен ли конфликт
---@field sysSection string секция конфликта (если есть)
---@field sysBind string бинд конфликта (если есть)

---@class BindingGetSectionResult
---@field sysName string служебное название (идентификатор) секции (то же самое, что и sysSectionName)
---@field name string локализованное название секции
---@field bindNames table таблица со списком биндов, индексация [0..],

---Принимает новые клавиатурные настройки. (Поскольку механизм работает с авто-превью, то это сказывается только на работе функции  binding.Cancel.)
---@return нет
function binding.Apply() end

---Применяет распознанную горячую клавишу к текущей пользовательской конфигурации.
---@return нет
function binding.ApplyRebind() end

---Отменяет новые клавиатурные настройки. (Результат возвращается к предыдущему состоянию: либо начальному, либо по-умолчанию, либо состоянию, зафиксированному функцией  binding.Apply.)
---@return нет
function binding.Cancel() end

---Отменяет режим UI распознавания горячей клавиши (включая уже распознанное значение).
---@return нет
function binding.CancelRebind() end

---Возвращает информацию о пользовательском бинде.
---@param sysSectionName string идентификатор секции
---@param sysBindName string идентификатор бинда
---@return BindingGetBindResult
function binding.GetBind(sysSectionName, sysBindName) end

---Возвращает информацию о конфликте горячих клавиш. Выдается первый встреченный конфликт. Конфликты ищутся только среди пользовательских настроек. Конфликт сообщается только в том случае, если есть распознанная, но еще не примененная горячая клавиша (binding.HasRebind() == true).
---@return BindingGetRebindConflictResult
function binding.GetRebindConflict() end

---Если есть распознанная горячая клавиша, то возвращает ее системное имя.
---@return string
function binding.GetRebindKey() end

---Возвращает информацию о секции с пользовательскими биндами.
---@param sysSectionName string идентификатор секции
---@return BindingGetSectionResult
function binding.GetSection(sysSectionName) end

---Возвращает таблицу с идентификаторами всех секций, предназначеннных для изменения игроком.
---@return таблица с идентификаторами секций, индексация [0..]
function binding.GetSections() end

---Возвращает true, если есть распознанная горячая клавиша.
---@return boolean
function binding.HasRebind() end

---Возвращает true, если UI находится в режиме распознавания горячих клавиш.
---@return boolean
function binding.IsWaitingRebind() end

---Удаляет горячую клавишу из пользовательских настроек.
---@param sysSectionName string идентификатор секции
---@param sysBindName string идентификатор бинда (реакции)
---@param index integer индекс горячей клавиши для данного бинда
---@return нет
function binding.RemoveBind(sysSectionName, sysBindName, index) end

---Выставляет клавиатурные настройки в значения по умолчанию (из базы).
---@return нет
function binding.ResetToDefault() end

---Включает режим распознавания горячих клавиш. После удачного распознавания можно применить бинд к текущей конфигурации. Ограничения. Сторонним аддонам запрещено использовать данную функцию пока персонаж игрока находится в бою.
---@param sysSectionName string идентификатор секции
---@param sysBindName string идентификатор бинда (реакции)
---@param index integer индекс горячей клавиши
---@return нет
function binding.StartRebind(sysSectionName, sysBindName, index) end
