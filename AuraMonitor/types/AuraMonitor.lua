---@meta
---
--- Аннотации типов для AuraMonitor.
--- Подключается в .luarc.json через "workspace.library": ["./types"].
--- Используется только LuaLS (runtime не грузит этот файл — он в игру не попадает,
--- потому что не прописан в AddonDesc/ScriptFileRefs).
---

--------------------------------------------------------------------------------
-- Глобалы, которые клиент игры предоставляет самому аддону
--------------------------------------------------------------------------------

--- Главная форма аддона (корень из AddonDesc.(UIAddon).xdb > Form).
--- Клиент инжектит её как неявный глобал перед запуском скриптов аддона.
---@type FormSafe
mainForm = nil

--------------------------------------------------------------------------------
-- utils.lua
--------------------------------------------------------------------------------

--- Префикс, которым AuraMonitor подписывает все сообщения в чат.
---@type string
AURAMON_TAG = "[AuraMonitor]"

--- Отправить себе в чат (канал «Системные → Дополнения»).
--- Никогда не поднимает исключение.
---@param text string|any
function chatMsg(text) end

--- Безопасный вызов функции с отчётом об ошибке в чат.
---
--- * `pathOrFn` — строка-путь вида "lib.fn" / "lib.sub.fn"
---   (резолвится через `_G` без падения), либо готовая функция/замыкание.
--- * Возвращает `(ok, result_or_error)`.
---
---@param pathOrFn string|function
---@param ... any
---@return boolean ok
---@return any result_or_error
function tryCall(pathOrFn, ...) end

--- То же, что `tryCall`, но возвращает сразу значение (или `nil` при ошибке).
--- Удобно для сбора снапшотов: одна сломанная API-функция не валит весь дамп.
---@generic T
---@param pathOrFn string|fun(...):T
---@param ... any
---@return T|nil
function safe(pathOrFn, ...) end

--- Обернуть event-handler в try/catch. Ошибка внутри handler'а уйдёт в чат
--- как `[AuraMonitor][ERR] <ctx>: <err>`, но не уронит аддон.
---@param ctx string
---@param fn fun(params:any)
---@return fun(params:any)
function guard(ctx, fn) end

--------------------------------------------------------------------------------
-- ui.lua
--------------------------------------------------------------------------------

--- Опции для `ui.createStatusRow`.
---@class StatusRowOpts
---@field label? string   Метка строки, по умолчанию "".
---@field x? number       X-offset внутри родителя, по умолчанию 10.
---@field y? number       Y-offset внутри родителя, по умолчанию 10.
---@field width? number   Ширина, по умолчанию 200.
---@field height? number  Высота, по умолчанию 20.

--- Хендл строки-статуса, возвращаемый `ui.createStatusRow`.
---@class StatusRowHandle
---@field widget WidgetSafe  Скрытый клон шаблона (для прямого управления).
---@field label  string      Текущая метка.
---@field value  string      Текущее значение.
local StatusRowHandle = {}

---@param s string
function StatusRowHandle:setLabel(s) end

---@param s string|number
function StatusRowHandle:setValue(s) end

--- Уничтожает виджет строки (возврата в пул нет).
function StatusRowHandle:destroy() end

--- UI-фреймворк AuraMonitor: тонкая обёртка над Widget-API,
--- все методы безопасны и при ошибках сообщают в чат.
---@class UI
ui = {}

--- Найти виджет-ребёнка по имени. Возвращает `nil` с ERR в чат, если не найден.
---@param parent WidgetSafe|FormSafe
---@param name string
---@param recursive? boolean
---@return WidgetSafe|nil
function ui.bind(parent, name, recursive) end

--- Зарегистрировать обработчик клика по кнопке (reaction).
--- Reaction name должен совпадать с `<Reaction>...</Reaction>` в XDB кнопки.
--- Handler оборачивается в `guard()` — ошибки внутри не валят аддон.
---@param reactionName string
---@param handler fun(params:any)
function ui.onClick(reactionName, handler) end

--- Задать текст виджета (TextView/Button).
--- Принимает обычную строку или WString; конвертирует через `userMods.ToWString`.
---@param widget WidgetSafe
---@param text string|WString
function ui.setText(widget, text) end

--- Показать / скрыть виджет (вместе с детьми).
---@param widget WidgetSafe
---@param visible? boolean По умолчанию true.
function ui.show(widget, visible) end

--- Скрыть виджет. Алиас `ui.show(widget, false)`.
---@param widget WidgetSafe
function ui.hide(widget) end

--- Переключить видимость виджета.
---@param widget WidgetSafe
function ui.toggle(widget) end

--- Возвращает `widget:IsVisible()` (только собственный флаг, без родителей).
---@param widget WidgetSafe
---@return boolean
function ui.isVisible(widget) end

--- `widget:GetPlacementPlain()` c перехватом ошибок.
---@param widget WidgetSafe
---@return table|nil
function ui.getPlacement(widget) end

--- Изменить только позицию (`posX`, `posY`), не трогая размеры/выравнивание.
---@param widget WidgetSafe
---@param x number
---@param y number
function ui.setPos(widget, x, y) end

--- Изменить только размеры (`sizeX`, `sizeY`).
---@param widget WidgetSafe
---@param w number
---@param h number
function ui.setSize(widget, w, h) end

--- Изменить позицию + размеры одним вызовом.
---@param widget WidgetSafe
---@param x number
---@param y number
---@param w number
---@param h number
function ui.setRect(widget, x, y, w, h) end

--- Захватить WidgetDescriptor пред-объявленного виджета-шаблона и уничтожить
--- сам шаблон. После этого виджет можно клонировать через `ui.create`.
---@param templateName string
---@param parent? WidgetSafe|FormSafe По умолчанию `mainForm`.
---@return boolean success
function ui.registerTemplate(templateName, parent) end

--- Создать новый виджет из зарегистрированного шаблона, прикрепить к `parent`.
---@param templateName string
---@param parent? WidgetSafe|FormSafe По умолчанию `mainForm`.
---@return WidgetSafe|nil
function ui.create(templateName, parent) end

--- Создать «строку-статус» (label + value) из шаблона `StatusRowTemplate`.
--- Требует предварительного `ui.registerTemplate("StatusRowTemplate")`.
---@param parent WidgetSafe|FormSafe
---@param opts StatusRowOpts
---@return StatusRowHandle|nil
function ui.createStatusRow(parent, opts) end

--------------------------------------------------------------------------------
-- Кросс-модульные глобалы состояния (объявлены в ScriptAuraMonitor.lua)
--------------------------------------------------------------------------------

---@type string
AURAMON_SECTION = "AuraMonitor_lastSnapshot"

---@type TextViewSafe
wtOutput = nil

---@type string[]
outputLines = {}

---@type integer
OUTPUT_MAX_LINES = 12

---@type ButtonSafe
wtAMButton = nil

---@type WidgetSafe
wtHealthWindow = nil

---@type StatusRowHandle
hpRow = nil

--- JSON-encoder (мини).
---@class JsonLib
---@field encode fun(v:any):string
json = {}
