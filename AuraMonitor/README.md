# AuraMonitor

Аддон для **Allods Online**, который отслеживает состояние персонажа:

- **Ауры / бафы / дебафы**: имя, системное имя, длительность, оставшееся время, стаки, заряды, позитив/негатив
- **Ресурсы**: HP (текущее/максимум), мана, ярость, воля, капли крови (некромант), очки команды питомца (друид)
- **Умения**: активные заклинания (`avatar.GetSpellBook`), пассивные абилки (`avatar.GetAbilities`), скиллы (`avatar.GetSkills`)
- **Инвентарь**: сумка (`ITEM_CONT_INVENTORY`) и надетое (`ITEM_CONT_EQUIPMENT`)

## Что показывает на экране

На форме в левом верхнем углу (20, 100) — текстовый виджет 600×200 px со списком последних 12 событий. Туда коротко (до 200 символов) дублируется всё, что пишется в лог. Пример строки:

```
[buff_added] {"buffId":"…","sysName":"FoodBuff","dynamic":{"remainingTime":1800000,"stacks":1}, …}
```

Полный JSON (без усечения) всегда есть в `Personal\Logs\mods.txt`.

### Почему форма сначала может быть невидимой

Форма отображается, только если у неё ненулевой размер и есть видимые дети. В этой итерации:
- `MainForm.(WidgetForm).xdb` имеет `Size=600×200`, `Pos=20,100`, `Visible=true`
- Дочерний `Output.(WidgetTextView).xdb` с `FormatFileRef → Output.txt` (UTF-16LE + BOM) и тегом `<r name="value"/>` — текст проставляется из Lua через `wtOutput:SetVal("value", userMods.ToWString(...))`
- В `Init()` вызывается `mainForm:Show(true)` и `wtOutput:Show(true)` — на всякий случай

Если правите `MainForm.(WidgetForm).xdb` и ничего не видите — проверьте размер `<Size>` в `<X>`/`<Y>`, он не должен быть 0.

## Куда льются данные

На каждое событие (и на init) аддон пишет в два места:

1. **Виджет на экране** (`Output`) — последние 12 строк, JSON усечённый до 200 символов.
2. **Чат игрока** (канал «Системные → Дополнения», локально, другим не видно) — через `userMods.SendSelfChatMessage(...)`, JSON усечённый до 120 символов.

`LogInfo` намеренно **не используется** — в этой сборке лог не пишется. Всё, что нужно отследить, идёт в чат.

При запуске в чат приходит:
```
[AuraMonitor] init start
[AuraMonitor] init done: buffs/health/mana/rage/will/blood/druid handlers registered
```
Если что-то не нашлось (`mainForm`, виджет `Output`) — сюда же прилетит `WARN`.

Пример событийной строки в чате:
```
[AuraMonitor][buff_added] {"buffId":"...","sysName":"...","dynamic":{"remainingTime":...,"stacks":...}, ...}
[AuraMonitor][health_changed] {"health":{...}}
```

Последний снапшот также кладётся в `userMods.SetAvatarConfigSection("AuraMonitor_lastSnapshot", ...)` — доступен между сессиями.

## Обработка ошибок (`utils.lua`)

Все вызовы игрового API идут через утилиты из [utils.lua](utils.lua):

- `safe("lib.Fn", args...)` — **path-форма**. Путь резолвится через `_G` пошагово; если на любом шаге встречается `nil` или не-таблица, возвращает `nil` и пишет `[AuraMonitor][ERR] lib.Fn: nil at 'lib'` в чат. Это критично: в игре часть библиотек (например, `avatarInfo`) может вообще отсутствовать как глобал — прямое `avatarInfo.Fn` падает **ещё до** `pcall`.
- `safe(fn, args...)` — **function-форма**. Передаёте готовую функцию (в т.ч. замыкание `function() return obj:method() end` для method-вызовов). Контекст в ошибке: `"<anon>"`.
- `tryCall(...)` — та же сигнатура, что `safe`, но возвращает `(ok, result_or_err)` вместо одного значения. Используется там, где важен факт успеха (регистрация хэндлеров, `SetAvatarConfigSection` и т.п.).
- `guard(ctx, fn)` — оборачивает event-handler так, чтобы ошибка внутри него ушла в чат как `[AuraMonitor][ERR] <ctx>: <err>`, но **не уронила** аддон. Все хэндлеры в main-скрипте зарегистрированы именно через guard.

Единственное, что не обёрнуто — сам `chatMsg` (раскручивать рекурсию бессмысленно: если вывод в чат сломан, сообщить о поломке всё равно некуда). Внутри него всё равно стоят `pcall` вокруг `userMods.ToWString` и `userMods.SendSelfChatMessage`.

Пример из снапшота:
```lua
bloodPool = safe("avatarInfo.GetNecromancerBloodPool"),
```
Если у класса нет `avatarInfo` или конкретного метода — одна строка `[ERR]` в чат, `bloodPool = nil`, остальная сборка снапшота продолжается.

## Деплой: symlink/junction (работаем в одном месте, под git)

Папка репо: `C:\Users\chaso\work\allods-addonds\allods\AuraMonitor`.
Папка игры: `D:\Games\GameCenter\Аллоды Онлайн\data\Mods\Addons\`.

Идея: в игре держим **ссылку**, редактируем в репо.

### Windows (без админа, рекомендуется)

NTFS junction (`mklink /J`) — не требует прав администратора, работает между дисками.

Из обычного `cmd.exe`:
```cmd
mklink /J "D:\Games\GameCenter\Аллоды Онлайн\data\Mods\Addons\AuraMonitor" "C:\Users\chaso\work\allods-addonds\allods\AuraMonitor"
```

Из Git Bash / bash-шелла на Windows (нужен экранированный вызов cmd):
```bash
cmd //c 'mklink /J "D:\Games\GameCenter\Аллоды Онлайн\data\Mods\Addons\AuraMonitor" "C:\Users\chaso\work\allods-addonds\allods\AuraMonitor"'
```

Проверка:
```bash
ls "/d/Games/GameCenter/Аллоды Онлайн/data/Mods/Addons/AuraMonitor/"
```
Должны быть те же файлы, что и в репо.

Снятие (удалит только сам линк, не содержимое):
```cmd
rmdir "D:\Games\GameCenter\Аллоды Онлайн\data\Mods\Addons\AuraMonitor"
```

> Если `mklink /J` не сработал — можно `mklink /D` (директорный симлинк), но он требует либо прав администратора, либо включённого "Developer Mode" в Windows.

### Unix / macOS (под Wine)

Если Allods запускается через Wine/Proton, игровая папка лежит внутри wineprefix, например:
`~/.wine/drive_c/Games/Allods/data/Mods/Addons/`.

Обычный симлинк:
```bash
ln -s /path/to/repo/allods-addonds/allods/AuraMonitor \
      "/path/to/wineprefix/drive_c/Games/Allods/data/Mods/Addons/AuraMonitor"
```

Снятие:
```bash
rm "/path/to/wineprefix/drive_c/Games/Allods/data/Mods/Addons/AuraMonitor"
```

## Структура

```
AuraMonitor/
├── AddonDesc.(UIAddon).xdb            — дескриптор: AutoStart=true, ScriptFileRefs: utils.lua + ui.lua + ScriptAuraMonitor.lua
├── MainForm.(WidgetForm).xdb          — корневая форма аддона, содержит всех детей
├── Output.(WidgetTextView).xdb        — лента событий (существующий)
├── Output.txt                         — формат Output (UTF-16LE + BOM)
├── AMButton.(WidgetButton).xdb        — кнопка «AM» с reaction=amButtonClick
├── AMButton.txt                       — текст кнопки «AM» (UTF-16LE + BOM)
├── AMButtonFormat.txt                 — формат состояния кнопки (UTF-16LE + BOM)
├── HealthWindow.(WidgetForm).xdb      — суб-окно с HP (скрыто до клика)
├── StatusRowTemplate.(WidgetTextView).xdb — ШАБЛОН строки-статуса (скрытый)
├── StatusRow.txt                      — формат шаблона (UTF-16LE + BOM)
├── .luarc.json                        — конфиг Lua LSP
├── utils.lua                          — chatMsg / tryCall / safe / guard (грузится 1-м)
├── ui.lua                             — фреймворк виджетов (грузится 2-м)
├── ScriptAuraMonitor.lua              — основная логика (грузится 3-м)
└── README.md                          — этот файл
```

Скрипты грузятся в порядке из `ScriptFileRefs` в `AddonDesc.(UIAddon).xdb`.

> ⚠ `Output.txt` **обязан** быть UTF-16LE с BOM, иначе клиент не прочитает формат. Создаётся из PowerShell:
> ```powershell
> [System.IO.File]::WriteAllText('Output.txt', '<html><body><format><rs class="class"><r name="value"/></rs></format></body></html>', [System.Text.Encoding]::Unicode)
> ```

## IDE / типы

`.luarc.json` подключает `../types` как Lua-библиотеку. При открытии папки в VS Code с расширением **sumneko.lua** работает автодополнение и проверка по аннотациям `---@meta` из `types/*.lua`.

Runtime выставлен в `LuaJIT` (в игре — модифицированный LuaJIT 2.1-rolling, подключены `base, table, string, math, bit, coroutine`; `io`, `os`, `require`, `dofile`, `load*` недоступны).

## Верификация

1. Создать junction/symlink (см. выше).
2. Проверить, что в игровой `…\Addons\AuraMonitor\` видны файлы репо.
3. Запустить игру, зайти персонажем.
4. Открыть `Personal\Logs\mods.txt` — должны появиться строки `[AuraMonitor] init start` и `[AuraMonitor][snapshot] {...}`.
5. Применить на себя любой баф (еда, зелье, способность) → в логе `[AuraMonitor][buff_added] {...}` с длительностью и стаками.
6. Потратить ману / получить урон → `[AuraMonitor][mana_changed]` / `[AuraMonitor][health_changed]`.

## UI-фреймворк (`ui.lua`)

Тонкая обёртка над игровым виджет-API. Прячет `GetChildChecked` / `SetPlacementPlain` / `SetVal` / `ToWString` / `RegisterReactionHandler` за унифицированными функциями, и всё через try/catch из `utils.lua`.

### Архитектурная идея (в 3-х строчках)

- **XDB = шаблоны:** типы и структура виджетов пред-объявлены в `.xdb` (кнопки, текст-вьюхи, панели, суб-формы). Чистого runtime-создания из Lua движок не даёт.
- **Lua = поведение:** находим виджеты по имени, подключаем клики, обновляем тексты и размеры.
- **`ui.*` = унификация:** единый стиль вызовов, одна точка обработки ошибок (все падения → `[AuraMonitor][ERR] …` в чат).

### Цикл добавления нового виджета

1. **XDB.** Создай файл `MyWidget.(WidgetButton).xdb` (или `WidgetTextView`, `WidgetForm`, `WidgetPanel`) в папке `AuraMonitor/`. Имя тега `<Name>` = имя, по которому будешь находить его из Lua.
2. **Формат-файл (если нужен текст).** Рядом положи `MyWidget.txt` с форматом `<html><body><format><rs class="class"><r name="value"/></rs></format></body></html>` — **обязательно UTF-16LE + BOM**:
   ```powershell
   [System.IO.File]::WriteAllText('MyWidget.txt', '<html>...<r name="value"/>...</html>', [System.Text.Encoding]::Unicode)
   ```
3. **Привязка к форме.** В `MainForm.(WidgetForm).xdb` добавь `<Item href="MyWidget.(WidgetButton).xdb" />` внутри `<Children>`.
4. **Lua.** В `ScriptAuraMonitor.lua` в `rawInit()`:
   ```lua
   local w = ui.bind(mainForm, "MyWidget")       -- найти виджет
   ui.setText(w, "Hello")                         -- текст (если текст-вью)
   ui.onClick("myReactionName", function()        -- клик (если кнопка)
       chatMsg("clicked!")
   end)
   ```
   Для кнопки в её XDB должно быть `<Reaction>myReactionName</Reaction>` (внутри `<Variants><Item>`).

### API reference

| Функция | Что делает |
| --- | --- |
| `ui.bind(parent, name, recursive?)` | Найти виджет-ребёнка. При отсутствии — `nil` + `[ERR]` в чат. |
| `ui.onClick(reactionName, handler)` | `common.RegisterReactionHandler`, handler обёрнут в `guard`. |
| `ui.setText(widget, text)` | `string` → `WString` → `SetVal("value", ws)`. |
| `ui.show(widget, visible)` | `widget:Show(bool)`. |
| `ui.hide(widget)` | Алиас `ui.show(w, false)`. |
| `ui.toggle(widget)` | Переключить видимость. |
| `ui.isVisible(widget)` | `widget:IsVisible()`. |
| `ui.getPlacement(widget)` | `widget:GetPlacementPlain()`. |
| `ui.setPos(widget, x, y)` | Изменить Pos. |
| `ui.setSize(widget, w, h)` | Изменить Size. |
| `ui.setRect(widget, x, y, w, h)` | Всё сразу. |
| `ui.registerTemplate(templateName, parent?)` | Захватить `widgetDesc` пред-объявленного скрытого виджета и уничтожить его. `parent` по умолчанию — `mainForm`. |
| `ui.create(templateName, parent?)` | Создать новый виджет из шаблона, прикрепив к `parent`. |
| `ui.createStatusRow(parent, opts)` | Готовая «строка-статус»: `label: value`. Возвращает handle с `:setLabel`, `:setValue`, `:destroy`. `opts = {label, x, y, width, height}`. |

### Переиспользуемые виджеты (один XDB → много инстансов)

Движок не даёт создать виджет «из ничего», но даёт **клонировать** пред-объявленный шаблон. Схема:

1. В XDB пред-объявляем **один** скрытый виджет-шаблон с `<Visible>false</Visible>` (пример — [StatusRowTemplate.(WidgetTextView).xdb](StatusRowTemplate.(WidgetTextView).xdb)).
2. В `Init`:
   ```lua
   ui.registerTemplate("StatusRowTemplate")
   ```
   `ui.lua` внутри вызовет `widget:GetWidgetDesc()` и `widget:DestroyWidget()` — шаблон исчезнет с экрана, но его дескриптор сохранится.
3. Создаём сколько угодно копий:
   ```lua
   local hp   = ui.createStatusRow(wtHealthWindow, { label = "HP",   y = 10 })
   local mana = ui.createStatusRow(wtHealthWindow, { label = "Mana", y = 34 })
   local rage = ui.createStatusRow(wtHealthWindow, { label = "Rage", y = 58 })
   hp:setValue("1234 / 1500")
   mana:setValue("800 / 1000")
   rage:setValue("42")
   ```
4. Удалить копию: `hp:destroy()`.

Таким образом — **да**, «полоску для маны» рядом с полоской HP можно добавить без нового XDB, переиспользуя тот же шаблон.

### Отладка

- Все ошибки валятся в чат (канал «Системные → Дополнения») с префиксом `[AuraMonitor][ERR]` и путём до упавшей API-функции или именем контекста.
- Проверка, что клик-реакция вообще регистрируется: в начале click-handler'а вставить `chatMsg("click!")` — если при клике в чате пусто, значит:
  - либо в XDB кнопки имя `<Reaction>...</Reaction>` не совпадает с тем, что передано в `ui.onClick(...)`,
  - либо кнопка перекрыта другим виджетом (`TransparentInput`/`PickChildrenOnly` у родительской формы),
  - либо формат-файл кнопки (`AMButtonFormat.txt`) не UTF-16LE + BOM — тогда кнопка рендерится пустой и её «не видно».

### Ограничения

- Любой **тип** виджета (кнопка, форма, текст-вью, панель) **должен быть в XDB**. Из чистого Lua инстанцировать неизвестный тип нельзя.
- Все `.txt`-файлы, на которые ссылаются XDB-виджеты через `TextFileRef`/`FormatFileRef`, **обязаны** быть в кодировке **UTF-16LE с BOM**. Иначе движок не прочитает, виджет будет невидим/пуст. Проверка: `od -c file.txt | head -1` должно начинаться с `377 376`.
- `ui.lua` и `utils.lua` грузятся до основного скрипта (порядок в `AddonDesc.(UIAddon).xdb`). Ломать этот порядок нельзя.

## Демо: кнопка AM + окно с HP

В форме аддона пред-объявлены три виджета — `AMButton`, `HealthWindow`, `StatusRowTemplate` (скрытый). В `rawInit` (см. [ScriptAuraMonitor.lua](ScriptAuraMonitor.lua)):

```lua
wtAMButton     = ui.bind(mainForm, "AMButton")
wtHealthWindow = ui.bind(mainForm, "HealthWindow")
ui.hide(wtHealthWindow)

ui.registerTemplate("StatusRowTemplate")
hpRow = ui.createStatusRow(wtHealthWindow, { label = "HP", y = 10 })

ui.onClick("amButtonClick", function()
    ui.toggle(wtHealthWindow)
    if ui.isVisible(wtHealthWindow) then refreshHealthText() end
end)
```

А в `rawOnHealthChanged` после логирования — `if ui.isVisible(wtHealthWindow) then refreshHealthText() end` — значение в окне обновляется в реальном времени по `EVENT_OBJECT_HEALTH_CHANGED`.

## Что дальше (вне первой итерации)

- Иконки аур, полоски HP/маны/ресурсов (реальные progress bars).
- Полноценная `advWidgetFactory` с пулом и кэшем (когда динамических виджетов станет много).
- Draggable-окно (перетаскивание HealthWindow мышью).
- Разбить `ScriptAuraMonitor.lua` на модули (`json.lua`, `snapshot.lua`, `handlers.lua`).
- Расширить TS-парсер репо (`new-doc-parser.ts`), чтобы вычитывал `mods.txt` и раскладывал события `[AuraMonitor]` в `json/auras.json`, `json/resources.json`, `json/spells.json`.
- Таргет / пет / группа.
