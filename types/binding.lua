---@meta

--- CategoryBinding
--- Функции и события Lua API библиотеки binding - работа с горячими клавишами. Предназначены для реализации работы в опциях с горячими клавишами, однако, работают по независимому, собственному механизму в виду значительной уникальной функциональности.

---@class bindingLib
binding = {}

--- Принимает новые клавиатурные настройки. (Поскольку механизм работает с авто-превью, то это сказывается только на работе функции  binding.Cancel.)
function binding.Apply() end

--- Применяет распознанную горячую клавишу к текущей пользовательской конфигурации.
function binding.ApplyRebind() end

--- Отменяет новые клавиатурные настройки. (Результат возвращается к предыдущему состоянию: либо начальному, либо по-умолчанию, либо состоянию, зафиксированному функцией  binding.Apply.)
function binding.Cancel() end

--- Отменяет режим UI распознавания горячей клавиши (включая уже распознанное значение).
function binding.CancelRebind() end

--- Возвращает информацию о пользовательском бинде.
---@param sysSectionName string идентификатор секции
---@param sysBindName string идентификатор бинда
---@return table
function binding.GetBind(sysSectionName, sysBindName) end

--- Возвращает информацию о конфликте горячих клавиш. Выдается первый встреченный конфликт. Конфликты ищутся только среди пользовательских настроек. Конфликт сообщается только в том случае, если есть распознанная, но еще не примененная горячая клавиша (binding.HasRebind() == true).
---@return table
function binding.GetRebindConflict() end

--- Если есть распознанная горячая клавиша, то возвращает ее системное имя.
---@return string
function binding.GetRebindKey() end

--- Возвращает информацию о секции с пользовательскими биндами.
---@param sysSectionName string идентификатор секции
---@return table
function binding.GetSection(sysSectionName) end

--- Возвращает таблицу с идентификаторами всех секций, предназначеннных для изменения игроком.
---@return table
function binding.GetSections() end

--- Возвращает true, если есть распознанная горячая клавиша.
---@return boolean
function binding.HasRebind() end

--- Возвращает true, если UI находится в режиме распознавания горячих клавиш.
---@return boolean
function binding.IsWaitingRebind() end

--- Удаляет горячую клавишу из пользовательских настроек.
---@param sysSectionName string идентификатор секции
---@param sysBindName string идентификатор бинда (реакции)
---@param index integer индекс горячей клавиши для данного бинда
function binding.RemoveBind(sysSectionName, sysBindName, index) end

--- Выставляет клавиатурные настройки в значения по умолчанию (из базы).
function binding.ResetToDefault() end

--- Включает режим распознавания горячих клавиш. После удачного распознавания можно применить бинд к текущей конфигурации.
---@param sysSectionName string идентификатор секции
---@param sysBindName string идентификатор бинда (реакции)
---@param index integer индекс горячей клавиши
function binding.StartRebind(sysSectionName, sysBindName, index) end

-- Events

--- Событие вызывается при изменении состояния пользовательского биндинга клавиш (при работе через библиотеку binding).
EVENT_BINDING_CHANGED = "EVENT_BINDING_CHANGED"
