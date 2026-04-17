# Widgets — введение для фронтендера

Это практический гайд по системе виджетов Allods Online. Написан специально для человека, который верстал на HTML/CSS и React — все специфические термины объясняются через аналогии.

Все примеры ссылаются на файлы этого аддона, их можно потрогать руками.

---

## 1. Ментальная модель: чем это НЕ похоже на HTML

| HTML/React | Allods |
|---|---|
| JSX-компонент | **XDB-файл** — XML-описание виджета. Полностью декларативный, Lua внутри писать нельзя. |
| DOM-элемент | **Widget** — объект в памяти, который создаётся из XDB при загрузке аддона. |
| `ref` / `querySelector` | **`mainForm:GetChildChecked("name")`** или наш `ui.bind(mainForm, "name")`. |
| React state → render | Нет реактивности. Lua **явно** меняет текст/позицию/видимость через методы виджета. |
| `onClick={…}` | **`<Reaction>my_click</Reaction>`** в XDB + `common.RegisterReactionHandler(fn, "my_click")` в Lua. |
| `<img src="bg.png">` как стиль | `<BackLayer href="…SomeLayer.xdb">` — ссылка на отдельный XDB-слой, который ссылается на `.tga` |
| CSS-класс | Стиль описывается прямо в XDB (`TextStyle`, `StateNormal/StatePushed/…`) или наследуется через `<Prototype>` (аналог extends). |

**Самое важное правило:** типы виджетов нельзя создать «из чистого Lua». Всё, что хочешь видеть на экране — кнопку, текст, панель — должно быть заранее описано в `.xdb` файлах. Lua может только:
- найти виджет по имени,
- клонировать виджет, заранее описанный в XDB, через `ui.create`,
- менять его свойства (текст, позиция, размер, видимость),
- подписаться на клики.

---

## 2. Типы виджетов (палитра «элементов»)

Лежат в `allods-docs/Docs/ModdingDocuments/LuaApi/Widget*.html` — вот сводка:

| Тип | Аналог в HTML | Когда использовать |
|---|---|---|
| `WidgetForm` | `<body>` / корень страницы | Корень аддона. Один на аддон, задаётся в `AddonDesc.(UIAddon).xdb > Form`. Сам ничего не рисует. |
| `WidgetPanel` | `<div>` | Универсальный контейнер. Может иметь фон (`BackLayer`). Для «окон», «панелей», «рамок». |
| `WidgetTextView` | `<p>`, `<span>` | Показать текст. Размер часто `WIDGET_SIZING_INTERNAL` = `max-content`. |
| `WidgetButton` | `<button>` | Кнопка. Требует либо `<Prototype>` (готовый скин), либо inline-слои для Normal/Pushed/Disabled/Highlighted. |
| `WidgetEditLine` | `<input type="text">` | Однострочный ввод. |
| `WidgetEditBox` | `<textarea>` | Многострочный ввод. |
| `WidgetSlider` / `WidgetDiscreteSlider` | `<input type="range">` | Ползунок. |
| `WidgetScrollBar` / `WidgetGlideScrollBar` | `::-webkit-scrollbar` | Скроллбар. |
| `WidgetScrollableContainer` | `<div style="overflow:auto">` | Контейнер со скроллом. |
| `WidgetContainer` / `WidgetTextContainer` | `<ul>` / `<article>` | Коллекции виджетов. |
| `WidgetLayer*` (SimpleTexture/TiledTexture) | `background-image` | Не виджет, а СЛОЙ. Нельзя положить в `<Children>`, только в `<BackLayer>`/`<FrontLayer>`. |

---

## 3. Анатомия XDB-файла

Разбор [Widgets/AMButton/AMButton.(WidgetButton).xdb](Widgets/AMButton/AMButton.(WidgetButton).xdb):

```xml
<?xml version="1.0" encoding="UTF-8" ?>     <!-- заголовок XML -->
<WidgetButton>                               <!-- корневой тег = тип виджета -->
    <Name>AMButton</Name>                    <!-- id="AMButton" — по этому имени ищем из Lua -->
    <Priority>10000</Priority>               <!-- z-index, чем больше — тем выше -->
    <Header>
        <Prototype href="/Mods/SampleCommon/Button/ButtonRegular.Prototype.(WidgetButton).xdb#xpointer(/WidgetButton)" />
                                             <!-- наследование скина от готового prototype, как CSS extends -->
    </Header>
    <Placement> ... </Placement>             <!-- раскладка (см. раздел 4) -->
    <Visible>true</Visible>                  <!-- display: block / none -->
    <Enabled>true</Enabled>                  <!-- disabled="false" -->
    <Variants>                               <!-- для WidgetButton: описания состояний -->
        <Item>
            <TextFileRef href="AMButton.txt" />   <!-- текст кнопки в txt (UTF-16LE+BOM) -->
            <Reaction>amButtonClick</Reaction>    <!-- onClick-event-name -->
            <ReactionOnUp>true</ReactionOnUp>     <!-- срабатывать на отпускание, а не на нажатие -->
        </Item>
    </Variants>
</WidgetButton>
```

Стандартные поля, которые могут быть у любого виджета:

| Поле | Что значит (по аналогии) |
|---|---|
| `<Name>` | `id="…"` — по этому имени виджет находится из Lua. |
| `<Priority>` | `z-index`. Чем выше, тем выше отрисовывается. |
| `<Visible>` | `display: block` / `none`. |
| `<Enabled>` | `disabled="false"` — если `false`, виджет не реагирует на ввод. |
| `<TransparentInput>` | Пропускать клики насквозь к тому, что под ним. `true` = как `pointer-events: none`. |
| `<PickChildrenOnly>` | Сам контейнер не кликабелен, только его дети. `true` — частый выбор для форм-обёрток. |
| `<Children>` | `{children}` в React. Список `<Item href="…"/>` с ссылками на XDB детей. |
| `<BackLayer href="…" />` | `background-image`. Ссылка на слой-текстуру (Layer*.xdb). |
| `<FrontLayer href="…" />` | Слой поверх содержимого (редко, для оверлеев). |
| `<Placement>` | Позиция и размер. Это отдельная тема (раздел 4). |

---

## 4. `<Placement>` — позиционирование

Это самая неочевидная часть движка. В CSS вы бы написали:
```css
.box { position: absolute; top: 20px; left: 20px; width: 200px; height: 100px; }
```

В Allods аналога `width/height` нет в привычном виде. Вместо этого **X и Y считаются независимо**, и у каждой оси своя логика: «к какому краю привязываемся, каким способом считаем размер, с какими отступами».

### Структура `<Placement>`

```xml
<Placement>
    <QuantumScale>false</QuantumScale>    <!-- дискретное масштабирование (для шрифтов), обычно false -->
    <X>
        <Align>WIDGET_ALIGN_LOW</Align>     <!-- к какому краю прижимаемся по X -->
        <Sizing>WIDGET_SIZING_DEFAULT</Sizing> <!-- как считается размер -->
        <Pos>20</Pos>                        <!-- отступ от меньшего края -->
        <HighPos>0</HighPos>                 <!-- отступ от большего края -->
        <Size>600</Size>                     <!-- ширина -->
    </X>
    <Y>
        <Align>WIDGET_ALIGN_LOW</Align>
        <Sizing>WIDGET_SIZING_DEFAULT</Sizing>
        <Pos>100</Pos>
        <HighPos>0</HighPos>
        <Size>260</Size>
    </Y>
</Placement>
```

### `Align` — к какому краю родителя прижимаемся

| Значение | Что делает | CSS-аналог |
|---|---|---|
| `WIDGET_ALIGN_LOW` | Прижимает к **меньшему** краю (top / left). `Pos` = отступ. | `top: <Pos>px` |
| `WIDGET_ALIGN_HIGH` | Прижимает к **большему** краю (bottom / right). `HighPos` = отступ. | `bottom: <HighPos>px` |
| `WIDGET_ALIGN_CENTER` | Центрирует. `Pos` = смещение от центра. | `margin: auto` со сдвигом |
| `WIDGET_ALIGN_BOTH` | Растягивает на весь родитель. `Pos` = отступ от меньшего, `HighPos` = от большего. `Size` **игнорируется**. | `top: Pos; bottom: HighPos; left: …; right: …` |
| `WIDGET_ALIGN_LOW_ABS` | Координаты в пикселях экрана, а не родителя. | `position: fixed` |

### `Sizing` — как считается размер

| Значение | Что делает | CSS-аналог |
|---|---|---|
| `WIDGET_SIZING_DEFAULT` | Фиксированный `Size` в пикселях. | `width: 200px` |
| `WIDGET_SIZING_INTERNAL` | Размер по содержимому (для TextView). | `width: max-content` |
| `WIDGET_SIZING_CHILDREN` | Размер по детям из массива `SizingWidgets`. | `width: fit-content` |

### «Невидимые поля»

Это важно и неочевидно (цитата из `allods-docs/Docs/ModdingDocuments/LuaApi/WidgetPlacementLua.html`):

- При `ALIGN_BOTH` / `SIZING_INTERNAL` / `SIZING_CHILDREN` — `Size*` игнорируется.
- При `ALIGN_LOW` / `ALIGN_LOW_ABS` / `ALIGN_CENTER` — `HighPos` игнорируется.
- При `ALIGN_HIGH` — `Pos` игнорируется.

Если написали `Align=LOW` + `HighPos=20` и ничего не меняется — вот почему.

### Рецепты (копипаста)

**Коробка 200×100 в левом верхнем углу с отступом 20:**
```xml
<X><Align>WIDGET_ALIGN_LOW</Align><Pos>20</Pos><Size>200</Size></X>
<Y><Align>WIDGET_ALIGN_LOW</Align><Pos>20</Pos><Size>100</Size></Y>
```

**Растянуть на весь родитель (фон-плашка):**
```xml
<X><Align>WIDGET_ALIGN_BOTH</Align><Pos>0</Pos><HighPos>0</HighPos></X>
<Y><Align>WIDGET_ALIGN_BOTH</Align><Pos>0</Pos><HighPos>0</HighPos></Y>
```
Так сделан [Widgets/HealthWindow/HealthWindowBg.(WidgetPanel).xdb](Widgets/HealthWindow/HealthWindowBg.(WidgetPanel).xdb).

**Кнопка справа сверху с отступом 10:**
```xml
<X><Align>WIDGET_ALIGN_HIGH</Align><HighPos>10</HighPos><Size>60</Size></X>
<Y><Align>WIDGET_ALIGN_LOW</Align><Pos>10</Pos><Size>26</Size></Y>
```

**Текст, размер которого сам подстраивается под содержимое:**
```xml
<X><Align>WIDGET_ALIGN_LOW</Align><Sizing>WIDGET_SIZING_INTERNAL</Sizing><Pos>0</Pos></X>
<Y><Align>WIDGET_ALIGN_LOW</Align><Sizing>WIDGET_SIZING_INTERNAL</Sizing><Pos>0</Pos></Y>
```

### Примеры из нашего проекта

- [Widgets/MainForm.(WidgetForm).xdb](Widgets/MainForm.(WidgetForm).xdb) — `LOW/LOW` с `Pos=20,100` и `Size=600,260`: прямоугольник 600×260 с отступом 20 слева и 100 сверху.
- [Widgets/AMButton/AMButton.(WidgetButton).xdb](Widgets/AMButton/AMButton.(WidgetButton).xdb) — `LOW/LOW` с `Pos=0,0` `Size=60,26`: прямо в начале MainForm.
- [Widgets/HealthWindow/HealthWindowBg.(WidgetPanel).xdb](Widgets/HealthWindow/HealthWindowBg.(WidgetPanel).xdb) — `BOTH/BOTH` с нулевыми отступами: тянется на всё родительское окно.

---

## 5. Менять позицию/размер из Lua

Статика в XDB, динамика в Lua.

### API

```lua
local p = widget:GetPlacementPlain()  -- таблица-снимок текущего placement
-- p = { posX, posY, sizeX, sizeY, alignX, alignY, highPosX, highPosY, sizingX, sizingY, QuantumScale }

p.posX = p.posX + 100                  -- сдвинуть на 100 пикселей вправо
p.sizeY = 80                           -- задать высоту

widget:SetPlacementPlain(p)            -- применить
```

Из [BuildManagerButton.lua:6-12](./%20BuildManagerButton%20example) (рабочий аддон):
```lua
function setPlacement(widget, place)
    local p = widget:GetPlacementPlain()
    for k, v in pairs(place) do
        p[k] = place[k] or v
    end
    widget:SetPlacementPlain(p)
end
```

### Наши обёртки в `ui.lua`

Чтобы не писать `Get/Set` руками:

```lua
ui.setPos(widget, x, y)           -- сдвиг (поменять posX/posY)
ui.setSize(widget, w, h)          -- размеры
ui.setRect(widget, x, y, w, h)    -- всё сразу
```

Все три уже работают с try/catch: если виджет `nil` или что-то упало, в чат прилетит `[AuraMonitor][ERR] ui.setPos: widget is nil`, но аддон не рухнет.

---

## 6. Стили и текстуры

### Где «CSS» в Allods

1. **Цвета / размер шрифта / выравнивание текста** — в `.txt`-файле формата, на который ссылается `<FormatFileRef>`. Это HTML-подобная разметка.
2. **Фоны виджетов** — через `<BackLayer>` / `<FrontLayer>` → `WidgetLayer*.xdb` → `UITexture` → `.tga`.
3. **Общий вид кнопки (все 4 состояния: Normal/Pushed/Disabled/Highlighted)** — обычно через `<Prototype>`, наследуя готовый скин.

### Формат `.txt` (важно: UTF-16LE + BOM!)

Пример для обычного текста (наш [Widgets/Output/Output.txt](Widgets/Output/Output.txt)):
```html
<html><body><format><rs class="class"><r name="value"/></rs></format></body></html>
```
`<r name="value"/>` — плейсхолдер. Из Lua в него кладут строку через `widget:SetVal("value", userMods.ToWString("…"))`.

Более «стилизованный» пример (из `SampleZoneAnnounce/Announce.txt`):
```html
<header color="0xFFCC1111" fontsize="36" alignx="center" shadow="1">
    <rs class="class"><r name="value"/></rs>
</header>
```

**Подсказка про UTF-16LE:** редактировать удобно из PowerShell одной командой:
```powershell
[System.IO.File]::WriteAllText(
    'Widgets/Output/Output.txt',
    '<html><body><format><rs class="class"><r name="value"/></rs></format></body></html>',
    [System.Text.Encoding]::Unicode
)
```
Проверка: `od -c file.txt | head -1` должна начинаться с `377 376` — это BOM `0xFF 0xFE`. Обычный UTF-8 игра **не читает**. Поля остаются пустыми, виджет выглядит невидимым.

Полный список тегов и атрибутов — `allods-docs/Docs/ModdingDocuments/LuaApi/WidgetTextStyle.html`.

### `<BackLayer>` → текстура

Цепочка файлов (для справки, обычно не надо её создавать — берём готовое):
```
my.tga
  → my.(UITexture).bin + my.(UITexture).xdb      (генерирует UITextureConvertEditor.exe)
  → my.(UISingleTexture).xdb                     (описатель 1 текстуры)
  → my.(WidgetLayerSimpleTexture).xdb             (слой, на который ссылается BackLayer)
```

**Лучший способ — использовать готовое из `/Mods/SampleCommon/`**, оно уже есть в игре. Пример — фон нашего окна:
```xml
<BackLayer href="/Mods/SampleCommon/Button/ButtonRegularNormal.(WidgetLayerTiledTexture).xdb#xpointer(/WidgetLayerTiledTexture)" />
```
Это тайловая текстура кнопки, но мы её используем как фон плашки — визуально нейтральная серая рамка.

Другие готовые текстуры в SampleCommon: `Button/ButtonRegular{Normal,Pushed,Disabled,Highlighted}`, `Elements/Corks/EmptyLayer`.

### Кнопка со стандартным скином — через `<Prototype>`

```xml
<WidgetButton>
    <Name>AMButton</Name>
    <Header>
        <Prototype href="/Mods/SampleCommon/Button/ButtonRegular.Prototype.(WidgetButton).xdb#xpointer(/WidgetButton)" />
    </Header>
    ...
</WidgetButton>
```

Prototype — как `extends` в CSS/OOP. Кнопка получает все 4 состояния, подсветку при наведении, нажатую геометрию, формат текста (`<r name="button_label"/>` — именно этот тег использует ButtonRegular-формат).

**Прямо сейчас в игре уже есть**:
- `/Mods/SampleCommon/Button/ButtonRegular.Prototype.(WidgetButton).xdb` — обычная кнопка.

Без `<Prototype>` и без явного inline описания всех state-слоёв — **кнопка невидима** (пустой клик-ректангл).

---

## 7. Клики — «onClick» по-Allodsovски

### XDB-сторона

У `WidgetButton` внутри `<Variants><Item>` пишется имя реакции:
```xml
<Variants>
    <Item>
        <TextFileRef href="AMButton.txt" />
        <Reaction>amButtonClick</Reaction>   <!-- это строковый ID события -->
        <ReactionOnUp>true</ReactionOnUp>    <!-- срабатывать при отпускании, как onclick в браузере -->
    </Item>
</Variants>
```

Имя reaction — произвольная строка. Конвенция: `addonName_something`, чтобы не столкнуться с другими аддонами.

### Lua-сторона

Через raw API:
```lua
local function onClick(params)
    chatMsg("clicked!")
end
common.RegisterReactionHandler(onClick, "amButtonClick")
```

Через нашу обёртку [Scripts/ui.lua](Scripts/ui.lua):
```lua
ui.onClick("amButtonClick", function(params)
    chatMsg("clicked!")
end)
```

Преимущества `ui.onClick`:
- обёрнуто в `guard` — ошибка внутри handler'а не роняет аддон, а уходит в чат;
- контекст ошибки включает имя reaction, легче искать.

### Параметры `params`

В params приходит таблица с информацией о событии. Содержимое зависит от reaction. Для клика — обычно идентификатор виджета (`params.wtReactor`). Универсальный подход: если нужны данные «какой именно элемент кликнули», **лучше передавать их через замыкание**, а не через `params`.

### Пример: кнопка «удалить строку» в таблице

```lua
-- Допустим, есть список строк, у каждой строки — своя кнопка удаления
for i, row in ipairs(rows) do
    local rowWidget = ui.create("RowTemplate", listContainer)
    local deleteBtn = ui.bind(rowWidget, "DeleteButton", true)

    -- Уникальное имя reaction на каждую кнопку
    local reactionName = "delete_row_" .. i

    -- XDB кнопки должен иметь <Reaction>delete_row_1</Reaction> и т.п. —
    -- в реальности это решается другим способом (один reaction на все, но через params.wtReactor),
    -- но ЭТО — простейшая иллюстрация идеи «замыкание захватило i».
    ui.onClick(reactionName, function()
        deleteRow(i)   -- i взято из замыкания
    end)
end
```

В реальности, когда строк много, используют **один** reaction на все одинаковые кнопки и отличают их через `params.wtReactor` или дополнительную таблицу `handler = fn` на каждый widget. Это продвинутый паттерн, в рамках этого гайда его опущу.

### Другие типы событий виджетов

- **Изменение видимости** — `EVENT_WIDGET_SHOW_CHANGED` (событие, не reaction). Пример: `allods-docs/Docs/ModdingDocuments/LuaApi/EventWidgetShowChanged.html`.
- **Drag & Drop** — `EVENT_WIDGET_DND_*` события + явная настройка `<Drag>` в XDB. См. `EventWidgetDND*.html`.
- **Анимации** — `widget:PlayFadeEffect`, `PlayEffect` (см. `WidgetsEffects*`).

---

## 8. Композиция — как React-компоненты

### Вложенность через `<Children>`

В XDB:
```xml
<WidgetPanel>
    <Name>Parent</Name>
    <Children>
        <Item href="Child1.(WidgetTextView).xdb" />
        <Item href="subfolder/Child2.(WidgetButton).xdb" />
    </Children>
</WidgetPanel>
```

**Правила href:**
- Относительный (`Child1.xdb`, `sub/foo.xdb`) — относительно **текущего XDB-файла**. Пример: [Widgets/MainForm.(WidgetForm).xdb](Widgets/MainForm.(WidgetForm).xdb) ссылается на `AMButton/AMButton.(WidgetButton).xdb`.
- Абсолютный (`/Mods/SampleCommon/...`) — относительно корня `data/Mods/`.
- `#xpointer(/WidgetButton)` — XPath-селектор корневого элемента внутри XDB. Обычно безопасно добавлять, иногда без него ссылка на prototype не работает.

Дети **рисуются внутри родителя**, их `Placement` — относительно него. То есть `Pos=10` в ребёнке значит «10 пикселей от края родителя», а не от экрана.

### Пример из проекта

Иерархия:
```
MainForm (Widgets/MainForm.(WidgetForm).xdb)
├── Output (TextView)                        — лента событий
├── AMButton (Button)                         — кнопка открытия окна
├── HealthWindow (Panel)                      — суб-окно
│   └── HealthWindowBg (Panel)                — декоративный фон, ALIGN_BOTH
│   └── ... (StatusRow-строки, создаются из Lua)
└── StatusRowTemplate (TextView, скрытый)    — шаблон для клонирования
```

Видно, что `MainForm` — это просто контейнер (без фона), а «видимое окно» — `HealthWindow` с дочерним `HealthWindowBg`, который добавляет визуал.

### Переиспользуемые виджеты: шаблоны + клонирование

В React вы пишете компонент `<Row />` и рендерите его N раз в цикле. В Allods эквивалент такой:

1. Описать один **скрытый** виджет в XDB — это будет «шаблон».
2. В Lua захватить его descriptor и уничтожить оригинал: `ui.registerTemplate("RowTemplate")`.
3. Создавать копии сколько нужно: `local inst = ui.create("RowTemplate", parent)`.

Наш пример — [Widgets/StatusRow/StatusRowTemplate.(WidgetTextView).xdb](Widgets/StatusRow/StatusRowTemplate.(WidgetTextView).xdb) с `<Visible>false</Visible>`. В [Scripts/ScriptAuraMonitor.lua](Scripts/ScriptAuraMonitor.lua):

```lua
ui.registerTemplate("StatusRowTemplate")

-- Любое количество копий, на любой форме:
hpRow   = ui.createStatusRow(wtHealthWindow, { label = "HP",   y = 10 })
manaRow = ui.createStatusRow(wtHealthWindow, { label = "Mana", y = 34 })
rageRow = ui.createStatusRow(wtHealthWindow, { label = "Rage", y = 58 })

hpRow:setValue("1234 / 1500")
manaRow:setValue("800 / 1000")
rageRow:setValue("42")
```

**Это единственный способ делать «повторяющиеся элементы»** в Allods: иконки аур, строки таблицы, элементы списка, инвентарные слоты.

---

## 9. Рецепты (копипаста)

### Добавить кнопку на форму

**1)** `Widgets/MyButton/MyButton.(WidgetButton).xdb`:
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<WidgetButton>
    <Name>MyButton</Name>
    <Priority>100</Priority>
    <Header>
        <Prototype href="/Mods/SampleCommon/Button/ButtonRegular.Prototype.(WidgetButton).xdb#xpointer(/WidgetButton)" />
    </Header>
    <Placement>
        <X><Align>WIDGET_ALIGN_LOW</Align><Pos>0</Pos><Size>100</Size></X>
        <Y><Align>WIDGET_ALIGN_LOW</Align><Pos>0</Pos><Size>26</Size></Y>
    </Placement>
    <Visible>true</Visible>
    <Variants>
        <Item>
            <TextFileRef href="MyButton.txt" />
            <Reaction>myButton_click</Reaction>
            <ReactionOnUp>true</ReactionOnUp>
        </Item>
    </Variants>
</WidgetButton>
```

**2)** `Widgets/MyButton/MyButton.txt` (UTF-16LE + BOM, PowerShell):
```powershell
[System.IO.File]::WriteAllText('Widgets/MyButton/MyButton.txt', 'Click me', [System.Text.Encoding]::Unicode)
```

**3)** В `Widgets/MainForm.(WidgetForm).xdb > <Children>`:
```xml
<Item href="MyButton/MyButton.(WidgetButton).xdb#xpointer(/WidgetButton)" />
```

**4)** В `Scripts/ScriptAuraMonitor.lua > Init`:
```lua
ui.onClick("myButton_click", function()
    chatMsg("My button clicked!")
end)
```

### Прогресс-бар HP

Описываем в XDB `WidgetPanel` с `BackLayer` = цветная текстура, и из Lua меняем `sizeX`:
```lua
local maxW = 200
local pct  = currentHp / maxHp      -- 0..1
ui.setSize(wtHpBar, maxW * pct, 20)
```

### Модальное окно

`WidgetPanel` с высоким `<Priority>` (например, 10000) и `<TransparentInput>false</TransparentInput>`, `<PickChildrenOnly>false</PickChildrenOnly>` — клики по фону окна не проходят под него, а ловятся окном.

### Табличка из N строк

```lua
ui.registerTemplate("RowTemplate")   -- один раз в Init
for i, data in ipairs(items) do
    local row = ui.createStatusRow(tableContainer, {
        label = data.name,
        y     = (i - 1) * 24
    })
    row:setValue(data.value)
end
```

### Перетаскивание окна мышкой

В рабочем аддоне `TargeterZ` лежит готовая либа [LibDnD.lua](LibDnD.lua). Подключается одной строкой, оборачивает любой WidgetPanel в draggable. Если понадобится — берёшь её оттуда (`D:\Games\GameCenter\Аллоды Онлайн\data\Mods\Addons\TargeterZ\Scripts\LibDnD.lua`).

---

## 10. Частые ошибки

| Симптом | Причина | Как фиксить |
|---|---|---|
| Виджет не виден | `<Visible>false</Visible>` или `Size=0` | Проверить placement и Visible. |
| Кнопка = пустой ректангл | Нет `<Prototype>` и state-слоёв | Добавить `<Header><Prototype href="…" /></Header>`. |
| Кнопка не кликается | Reaction name в XDB и Lua разные | Сверить с точностью до регистра. |
| Клик не доходит | Родительская форма перекрывает: `TransparentInput=true + PickChildrenOnly=false` | У формы-контейнера поставить `TransparentInput=false, PickChildrenOnly=true`. |
| `ui.bind(parent, "X")` возвращает nil | Виджет не в `<Children>` родителя, имя не совпадает, или он глубже 1 уровня | Проверить `<Name>`, передать `recursive=true` третьим аргументом. |
| Текст не рендерится, виджет пустой | `.txt`-файл не UTF-16LE с BOM | Перегенерировать через PowerShell `[System.Text.Encoding]::Unicode`. |
| «widget is nil» в Lua | `ui.bind` не нашёл виджет | Читать предыдущую строку в чате — там уже есть `[ERR] ui.bind('…'): not found`. |
| Вложенная `<WidgetForm>` не находится | Движок не поддерживает form-in-form | Переделать в `<WidgetPanel>`. |
| Пакетные правки не подхватываются | Junction не обновил; иногда нужен рестарт игры | `/reload ui` в чате, иначе перезапуск. |

---

## 11. Куда копать дальше

### Официальная документация (локальная)

В `allods-docs/Docs/ModdingDocuments/LuaApi/`:

- **Общее устройство:** [Widget.html](../allods-docs/Docs/ModdingDocuments/LuaApi/Widget.html), [WidgetsArrangement.html](../allods-docs/Docs/ModdingDocuments/LuaApi/WidgetsArrangement.html).
- **Типы виджетов:** `WidgetForm.html`, `WidgetPanel.html`, `WidgetButton.html`, `WidgetTextView.html`, `WidgetEditLine.html`, `WidgetContainer.html`, `WidgetScrollableContainer.html`, `WidgetSlider.html` и т.д.
- **Placement:** [WidgetPlacementXY.html](../allods-docs/Docs/ModdingDocuments/LuaApi/WidgetPlacementXY.html), [WidgetPlacementLua.html](../allods-docs/Docs/ModdingDocuments/LuaApi/WidgetPlacementLua.html).
- **Текст/стиль:** `WidgetTextStyle.html`, `TypeValuedText.html`.
- **Слои/текстуры:** `WidgetLayer.html`, `WidgetLayerSimpleTexture.html`, `WidgetLayerTiledTexture.html`.
- **Методы:** `FunctionWidget*.html` — каждый метод API документирован отдельной страницей.

### Официальные примеры аддонов

В `allods-docs/SampleAddons/`:

- [SampleInit](../allods-docs/SampleAddons/SampleInit/) — минимальный аддон «hello world».
- [SampleEventRegistration](../allods-docs/SampleAddons/SampleEventRegistration/) — подписка на игровые события (`EVENT_SECOND_TIMER` и т.п.).
- [SampleReactionHandler](../allods-docs/SampleAddons/SampleReactionHandler/) — **канонический пример кнопка + reaction** (то, что мы используем).
- [SampleZoneAnnounce](../allods-docs/SampleAddons/SampleZoneAnnounce/) — `TextView` с форматированным текстом, анимация fade.

### Рабочие сторонние аддоны (в `data/Mods/Addons/`)

- **BuildManagerButton** — мини-пример: одна кнопка, reaction, перемещение в другой контекст (`stateMainForm:GetChildChecked(...):AddChild(mainForm)`).
- **TargeterZ** — сложный аддон: своя либа для drag-n-drop (`Scripts/LibDnD.lua`), `widgetGroups` в AddonDesc для шаблонов, многоязычные тексты.
- **RaidBuffsZ** — паттерн `<widgetGroups>` с `Templates.(UIRelatedWidgets).xdb` — альтернативный (более продвинутый) способ описания шаблонов, чем наш «скрытый ребёнок mainForm».
- **NewTarget3D** — пример `WidgetPanel` с кастомной текстурой (`SampleDefault.(WidgetLayerSimpleTexture).xdb`).

### Наш код

- [Scripts/ui.lua](Scripts/ui.lua) — все обёртки с комментариями.
- [Scripts/utils.lua](Scripts/utils.lua) — `chatMsg`, `tryCall`, `safe`, `guard`.
- [types/AuraMonitor.lua](types/AuraMonitor.lua) — `@class UI` и все аннотации; hover-подсказки в IDE.
- [README.md](README.md) — общее устройство проекта, деплой через junction, типы.
