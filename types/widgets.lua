---@meta

--- Widget types for Allods Online Lua API
--- Each widget class inherits from WidgetSafe (base type)

---@class WidgetSafe
local WidgetSafe = {}

--- '''Внимание! Функция создана для оптимизации widgetcore и едва-ли применима где-либо еще'''
---@return table
function WidgetSafe:GetWidgetCoreTree() end

--- Определить текущий виджет родительским (Parent) по отношению к указанному.
---@param widget WidgetSafe добавляемый виджет
function WidgetSafe:AddChild(widget) end

--- Создает новый виджет по его описателю из ресурсной системы. Владельцем (Owner) и родителем (Parent) виджета становится текущий виджет, при его уничтожении все виджеты, которыми он владеет, также будут уничтожены. Менять владельца нельзя. Изменить родителя можно, например, функцией  AddChild.
---@param widgetDesc WidgetDesc описатель дочернего виджета из ресурсной системы
---@return WidgetSafe
function WidgetSafe:CreateChildByDesc(widgetDesc) end

--- Уничтожает виджет. Нельзя уничтожать внутренние виджеты и любые FormSafe, формы создаются и уничтожаются только в cpp.
function WidgetSafe:DestroyWidget() end

--- Функция должна вызываться скриптом для безусловного прекращения drag&drop по каким-либо внешним причинам (например, при переходе в другой режим интерфейса). В момент отмены drag&drop в системе скрипт должен также позаботиться об отмене его логики и визуализации (убрать курсор, подсветку с окон и т.п.).
function WidgetSafe:DNDCancelDrag() end

--- Функция должна вызываться скриптом в ответ на событие EVENT_DND_DROP_ATTEMPT для подтверждения окончания drag&drop.
function WidgetSafe:DNDConfirmDropAttempt() end

--- Функция должна вызываться скриптом в ответ на событие EVENT_DND_PICK_ATTEMPT для подтверждения начала drag&drop для виджета, идентификатор которого передается в этом событии.
function WidgetSafe:DNDConfirmPickAttempt() end

--- Позволяет отключать drag&drop для виджета без отмены регистрации в системе. Это полезно если изменения состояния часты (отмена регистрации и повторная регистрация - дорогие операции) или если виджет не предполагается перемещать, но ему необходим DNDId (для специальной обработки, например заблокированный слот на экшн-панели должен иметь DNDId для корректной работы перетаскивания на него).
---@param isActive boolean включить (true) или выключить (false) реакцию на попытку перетаскивания
function WidgetSafe:DNDEnable(isActive) end

--- Возвращает состояние виджета в системе drag&drop. Описание всех возможных состояний смотреть в  DND_STATE_...
---@return number
function WidgetSafe:DNDGetState() end

--- Зарегистрировать виджет для drag&drop. Регистрирует указанный виджет и уникальный идентификатор для него. Правила назначения идентификаторов смотри в  общем описании DnD системы. Если нужен какой-нибудь идентификатор (без совместного использования), то генерировать его вручную не следует, надлежит использовать  DNDRegisterGeneric
---@param id integer уникальный идентификатор, связанный с виджетом wtSrc
---@param isDragOnly boolean drag&drop  включается либо только на перетаскивание, либо как на перетаскивание, так и на клик
function WidgetSafe:DNDRegister(id, isDragOnly) end

--- Отменить регистрацию виджета в системе drag&drop. Данное действие немедленно прерывает активный drag&drop виджета (если он активен). Если виджет не зарегистрирован в системе drag&drop вызывает ошибку.
function WidgetSafe:DNDUnregister() end

--- Активировать/деактивировать  контрол.
---@param enable boolean
function WidgetSafe:Enable(enable) end

--- Прерывает эффекты всех  типов
function WidgetSafe:FinishAllEffects() end

--- Прерывает эффект  типа ET_FADE
function WidgetSafe:FinishFadeEffect() end

--- Прерывает эффект  типа ET_MOVE
function WidgetSafe:FinishMoveEffect() end

--- Прерывает эффект  типа ET_RESIZE
function WidgetSafe:FinishResizeEffect() end

--- Прерывает эффект  типа ET_TEXTURE_ROTATION
function WidgetSafe:FinishRotationEffect() end

--- Возвращает массив прямоугольников описывающих реальное положение виджета (в формате rect, смотри  GetRealRect) для всех видимых детей данного виджета (рекурсивно). Родительский виджет не попадает в список и его видимость не проверяется. Дети обходятся всегда, дети детей обходятся только если clipContent == false.
function WidgetSafe:GetActiveChildrenRects() end

--- Получить оставшуюся длительность эффекта заданного типа у виджета. Если на виджете не проигрывается соответствующий эффект - вернет 0. Если функция вернула 0 это НЕ гарантирует что данного эффекта на виджете нет, возможно он есть, но его длительность истекла, при этом состояние события окончания эффекта не определено.
---@param effectType enum Тип эффекта
---@return number
function WidgetSafe:GetActiveEffectRemainingMs(effectType) end

--- Получить имя аддона, к которому относится данный виджет.
---@return string
function WidgetSafe:GetAddonName() end

--- Возвращает цвет фонового слоя контрола. Сам фоновый слой должен быть в наличии. Описание цвета смотреть:  Color.
---@return Color
function WidgetSafe:GetBackgroundColor() end

--- Возвращает текстуру для фонового слоя, в случае отсутствия текстуры, слоя и для анимированных слоев возвращает nil
---@return TextureId|nil
function WidgetSafe:GetBackgroundTexture() end

--- Получить дочерний контрол с данным именем. Проверяется, что дочерний контрол существует. Можно получить либо непосредственного ребенка, либо искать рекурсивно у вложенных контролов. Имя контрола обязано быть непустым.
---@param name string название искомого виджета
---@param recursive boolean|nil искать ли виджет не только у прямых детей, но и у вложенных. По умолчанию false
---@return WidgetSafe
function WidgetSafe:GetChildChecked(name, recursive) end

--- Получить дочерний контрол с данным именем. Если контрол не существует, то возвращается nil. Можно получить либо непосредственного ребенка, либо искать рекурсивно у вложенных контролов. Имя обязано быть непустым.
---@param name string название искомого виджета
---@param recursive boolean|nil искать ли виджет не только у прямых детей, но и у вложенных. По умолчанию false
---@return WidgetSafe|nil
function WidgetSafe:GetChildUnchecked(name, recursive) end

--- Возвращает строку содержащую отладочную информацию о виджете.
---@return string
function WidgetSafe:GetDebugInfo() end

--- Возвращает коэффициент прозрачности данного виджета.
function WidgetSafe:GetFade() end

--- Возвращает цвет переднего слоя контрола. Сам передний слой должен быть в наличии. Описание цвета смотреть:  Color.
---@return Color
function WidgetSafe:GetForegroundColor() end

--- Возвращает текстуру для переднего слоя, в случае отсутствия текстуры, слоя и для анимированных слоев возвращает nil
---@return TextureId|nil
function WidgetSafe:GetForegroundTexture() end

--- Возвращает уникальный числовой идентификатор виджета. Является номером созданного виджета. Освободившиеся значения (от удаленных виджетов) повторно не назначаются.
function WidgetSafe:GetId() end

--- Возвращает имя контрола.
---@return string
function WidgetSafe:GetName() end

--- Возвращает список именованных дочерних контролов. Возвращаются только непосредственные дети (без вложенных). (Контролы, не имеющие имени, считаются служебными и в список не попадают.)
---@return table
function WidgetSafe:GetNamedChildren() end

--- Возвращает родительский виджет для всех элементов, кроме форм. Для форм всегда возвращается nil. Если родителя нет, то возвращается nil.
---@return WidgetSafe
function WidgetSafe:GetParent() end

--- Получает статус pickChildrenOnly для виджета
---@return boolean
function WidgetSafe:GetPickChildrenOnly() end

--- Возвращает полную таблицу WidgetPlacement. Неявные параметры могут иметь произвольное значение (поведение не определено)
---@return table
function WidgetSafe:GetPlacementPlain() end

--- Возвращает текущий приоритет контрола. Контрол с большим приоритетом (среди других детей того же родителя) рисуется поверх контролов с более низким.
function WidgetSafe:GetPriority() end

--- Возвращает текущее расположение контрола в абсолютных координатах (в пикселях).
function WidgetSafe:GetRealRect() end

--- Возвращает текущий угол поворота текстур (в радианах против часовой стрелки). Имеет смысл только при наличии хотя бы одного слоя, содержащего WidgetLayerSimpleTexture.
---@return float
function WidgetSafe:GetRotation() end

--- Возвращает полную таблицу WidgetPlacement с действительными значениями всех полей (неявные параметры будут вычислены).
---@return table
function WidgetSafe:GetSmartPlacementPlain() end

--- Возвращает текущий приоритет обхода виджета. Чем меньше значение тем раньше до виджета дойдет очередь при обходе виджетов по нажатию Tab.
function WidgetSafe:GetTabOrder() end

--- Показывает, является ли виджет прозрачным для ввода.
---@return boolean
function WidgetSafe:GetTransparentInput() end

--- Возвращает описатель виджета в ресурсной системе. Работает только для виджетов, созданных на основе таких описателей (большинство виджетов именно такие, исключения будут описываться отдельно).
---@return WidgetDesc
function WidgetSafe:GetWidgetDesc() end

--- Проверяет наличие активного  эффекта у виджета
---@param effectType integer|nil тип эффекта, или nil если тип эффекта не имеет значения
function WidgetSafe:HasActiveEffects(effectType) end

--- Проверяет существование фонового слоя у виджета.
function WidgetSafe:HasBackground() end

--- Проверяет существование переднего слоя у виджета.
function WidgetSafe:HasForeground() end

--- Обрезает ли дочерние виджеты по размерам этого.
function WidgetSafe:IsClipContent() end

--- Проверяет загружены ли текстуры виджета. Если виджет невидим, то считается что он загружен. Проверяются текстуры всех layer виджета и его видимых детей (рекурсивно). Для успеха все они должны быть полностью загружены.
function WidgetSafe:IsContentLoaded() end

--- Включен ли контрол (сам).
function WidgetSafe:IsEnabled() end

--- Включен ли контрол (с учетом всей цепочки родителей).
function WidgetSafe:IsEnabledEx() end

--- Находится ли контрол в фокусе.
function WidgetSafe:IsFocused() end

--- Проверяет валиден ли указанный виджет.
---@return boolean
function WidgetSafe:IsValid() end

--- Виден ли контрол (без учёта видимости родителей).
function WidgetSafe:IsVisible() end

--- Виден ли контрол с учётом видимости всех его родителей.
function WidgetSafe:IsVisibleEx() end

--- Запускает анимацию для фонового слоя, слой должен быть WidgetLayerAnimatedTexture.
---@param repeatForever boolean повторять анимацию, false - проиграть один раз; необязательный параметр, по-умолчанию false
function WidgetSafe:PlayBackground(repeatForever) end

--- Запускает набор цепочек эффектов разных типов. В качестве аргумента принимает таблицу вида ET_* -&gt; sequenceParams.
---@param effectPack table Таблица описывающая набор цепочек эффектов. Ключом является тип эффекта ET_*, значением sequenceParams для данного эффекта.
function WidgetSafe:PlayEffectSequencePack(effectPack) end

--- Запускает эффект изменения прозрачности виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers )
function WidgetSafe:PlayFadeEffect() end

--- Запускает цепочку эффектов изменения прозрачности виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffectSequence( self, sequenceParams )
function WidgetSafe:PlayFadeEffectSequence() end

--- Запускает эффект изменения положения виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers )
function WidgetSafe:PlayMoveEffect() end

--- Запускает цепочку эффектов изменения положения виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffectSequence( self, sequenceParams )
function WidgetSafe:PlayMoveEffectSequence() end

--- Запускает эффект изменения размера виджета. Имеет  тип ET_RESIZE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers )
function WidgetSafe:PlayResizeEffect() end

--- Запускает цепочку эффектов изменения размера виджета. Имеет  тип ET_RESIZE, соответствует шаблону  PlayEffectSequence( self, sequenceParams )
function WidgetSafe:PlayResizeEffectSequence() end

--- Запускает эффект поворота текстур виджета. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false.
function WidgetSafe:PlayRotationEffect() end

--- Запускает цепочку эффектов поворота текстур виджета. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false.
function WidgetSafe:PlayRotationEffectSequence() end

--- Запускает эффект поворота текстур виджета. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false.
function WidgetSafe:PlayRotationWithChildrenEffect() end

--- Запускает цепочку эффектов поворота текстур виджета и его детей. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false.
function WidgetSafe:PlayRotationWithChildrenEffectSequence() end

--- Задает поворот текстур на всех слоях (против часовой стрелки). Поворот возможен только для слоев с WidgetLayerSimpleTexture.
---@param radians float
function WidgetSafe:Rotate(radians) end

--- Поворачивает геометрию виджета на определённый угол вокруг его центра со всеми его дочерними виджетами.
function WidgetSafe:RotateWithChildren() end

--- Задает способ наложения для фонового слоя контрола. Сам фоновый слой должен быть в наличии. Описание способа наложения смотреть:  BlendEffect.
---@param blendEffect integer способ наложения
function WidgetSafe:SetBackgroundBlendEffect(blendEffect) end

--- Задает специальный эффект для фонового слоя виджета. Сам фоновый слой должен быть в наличии. Передаются два цвета, основной и дополнительный. Описание цвета смотреть:  Color.
---@param primaryColor Color основной цвет
---@param secondaryColor Color дополнительный цвет
function WidgetSafe:SetBackgroundClearMaskEffect(primaryColor, secondaryColor) end

--- Задает цвет для фонового слоя контрола. Сам фоновый слой должен быть в наличии. Описание цвета смотреть: Color.
---@param color Color новый цвет для слоя
function WidgetSafe:SetBackgroundColor(color) end

--- Меняет текстуру для фонового слоя, слой должен быть WidgetLayerSimpleTexture.
---@param texture TextureId
function WidgetSafe:SetBackgroundTexture(texture) end

--- Обрезать ли дочерние виджеты по размерам этого.
function WidgetSafe:SetClipContent() end

--- Задает прозрачность виджета. В данный момент она не распространяется на дочерние контролы.
---@param fade float это полностью непрозрачный.
function WidgetSafe:SetFade(fade) end

--- Установить/снять фокус с контрола.
---@param focus boolean
function WidgetSafe:SetFocus(focus) end

--- Задает способ наложения для переднего слоя контрола. Сам передний слой должен быть в наличии. Описание способа наложения смотреть:  BlendEffect.
---@param blendEffect integer способ наложения
function WidgetSafe:SetForegroundBlendEffect(blendEffect) end

--- Задает специальный эффект для переднего слоя виджета. Сам передний слой должен быть в наличии. Передаются два цвета, основной и дополнительный. Описание цвета смотреть:  Color.
---@param primaryColor Color основной цвет
---@param secondaryColor Color дополнительный цвет
function WidgetSafe:SetForegroundClearMaskEffect(primaryColor, secondaryColor) end

--- Задает цвет для переднего слоя виджета. Сам передний слой должен быть в наличии. Описание цвета смотреть:  Color.
---@param color Color новый цвет для слоя
function WidgetSafe:SetForegroundColor(color) end

--- Меняет текстуру переднего слоя контрола, слой должен быть WidgetLayerSimpleTexture. Допустима пустая текстура (nil).
---@param texture TextureId
function WidgetSafe:SetForegroundTexture(texture) end

--- Меняет имя контролу.
---@param name string
function WidgetSafe:SetName(name) end

--- Задаёт режим посылки сообщений об изменении видимости контрола ( EVENT_WIDGET_SHOW_CHANGED). Требуется для оптимизации производительности, поскольку рассылка сообщений о видимости всех контролов системы без разбору требует неоправданно много ресурсов. Меняет у заданного виджета величину счётчика запросов на это сообщение (увеличивает на 1, если требуется посылка сообщений, уменьшается на 1, если от посылки сообщений отказывается). Сообщения посылаются только если значение счётчика запросов больше 0. Таким образом посылку сообщения могут определять несколько аддонов одновременно.
function WidgetSafe:SetOnShowNotification() end

--- Устанавливает статус pickChildrenOnly для виджета
---@param pickChildrenOnly boolean true, если обрабатывать мышиные реакции нужно только для детей данного виджета (игнорируя сам виджет)
function WidgetSafe:SetPickChildrenOnly(pickChildrenOnly) end

--- Задает новое расположение виджета. В качестве аргумента принимает полную или неполную таблицу WidgetPlacement.
---@param placement table таблица описывающая новое положение виджета
function WidgetSafe:SetPlacementPlain(placement) end

--- Задает приоритет контролу. Контрол с большим приоритетом (среди других детей того же родителя) рисуется поверх контролов с более низким.
---@param priority integer приоритет контрола
function WidgetSafe:SetPriority(priority) end

--- Задает новое расположение виджета. В качестве аргумента принимает полную или неполную таблицу WidgetPlacement. Возвращает полную таблицу WidgetPlacement с действительными значениями всех полей (неявные параметры будут вычислены).
---@param placement table таблица описывающая новое положение виджета
---@return table
function WidgetSafe:SetSmartPlacementPlain(placement) end

--- Устанавливает порядок обхода виджетов по нажатию клавиши Tab.
---@param tabOrder integer приоритет. По умолчанию: 0.
function WidgetSafe:SetTabOrder(tabOrder) end

--- Устанавливает, является ли виджет прозрачным для ввода.
---@param transparentInput boolean true, если виджет должен быть прозрачным для ввода
function WidgetSafe:SetTransparentInput(transparentInput) end

--- Показать/скрыть контрол и его потомков.
---@param show boolean
function WidgetSafe:Show(show) end

---@class ButtonSafe : WidgetSafe
local ButtonSafe = {}

--- Очищает все подставленные значения в ValuedText-е кнопки.
function ButtonSafe:ClearValues() end

--- Используется для работы с кнопками, имеющими несколько вариантов, например, CheckBox можно сделать как кнопку, имеющую два варианта (обычный и с галочкой).
---@return number
function ButtonSafe:GetVariant() end

--- Используется для работы с кнопками, имеющими несколько вариантов, например, CheckBox можно сделать как кнопку, имеющую два варианта (обычный и с галочкой).
---@return integer
function ButtonSafe:GetVariantCount() end

--- Задает значение для подстановки класса (из тега "rs") для данного ButtonSafe.
---@param tag string/WString тег, для которого задается значение
---@param value string/WString значение тега
function ButtonSafe:SetClassVal(tag, value) end

--- Задает значение для тега.
---@param tag string/WString
---@param value WString
function ButtonSafe:SetVal(tag, value) end

--- Используется для работы с кнопками, имеющими несколько вариантов. Устанавливает активный вариант кнопки.
---@param variant integer порядковый номер варианта кнопки, начиная с нуля
function ButtonSafe:SetVariant(variant) end

---@class DiscreteSliderSafe : WidgetSafe
local DiscreteSliderSafe = {}

--- Возвращает текущую позицию дискретного слайдера.
---@return number
function DiscreteSliderSafe:GetPos() end

--- Возвращает диапазон значений дискретного слайдера (количество разбиений).
---@return number
function DiscreteSliderSafe:GetStepsCount() end

--- Задает текущую позицию для дискретного слайдера.
---@param pos integer новая позиция, [0..GetStepsCount()]
function DiscreteSliderSafe:SetPos(pos) end

--- Задает диапазон (количество разбиений) дискретного слайдера.
---@param count integer диапазон слайдера
function DiscreteSliderSafe:SetStepsCount(count) end

---@class EditBoxSafe : EditBase
local EditBoxSafe = {}

--- Проверяет не заполнен ли EditBox текстом настолько, что он(текст) уже не умещается в EditBox'е.
function EditBoxSafe:IsOverflow() end

--- Задает максимальное количество символов для поля ввода.
---@param maxSize integer|nil новое максимальное количество символов или предельное значение, если nil
function EditBoxSafe:SetMaxSize(maxSize) end

--- Показать/скрыть скроллбар EditBox'a. Для отображения скроллбара также требуется, что бы скроллбал был прописан в ресурном файле для данного виджета(EditBox). По умолчанию скроллбар отображается.
---@param show boolean
function EditBoxSafe:ShowScrollbar(show) end

---@class EditLineSafe : EditBase
local EditLineSafe = {}

--- Удаляет символ перед курсором (как если бы нажали клавишу Backspace).
function EditLineSafe:BackspaceCharAtCursorPos() end

--- Удаляет символ после курсора (как если бы нажали клавишу Delete).
function EditLineSafe:DeleteCharAtCursorPos() end

--- Возвращает позицию курсора в EditLine.
---@return number
function EditLineSafe:GetCursorPos() end

--- Возвращает класс, задающий исходное оформление текста в EditLine (из ресурсной системы).
---@return WString
function EditLineSafe:GetInitialGlobalClass() end

--- Возвращает класс, задающий исходное оформление выделенного текста в EditLine (из ресурсной системы).
---@return WString
function EditLineSafe:GetInitialSelectionClass() end

--- Возвращает допустимое количество объектов для задания позиции курсора в EditLine. Допустимые позиции курсора лежат в диапазоне [0..GetPosObjectCount()].
---@return number
function EditLineSafe:GetPosObjectCount() end

--- Возвращает текст, содержащийся в строке ввода в виде обычной строки(не WString). Если строка ввода содержит пароль, то возвращается визуальный текст ("звездочки"). Для использования оригинального текста нужно применять специальные функции (отдельно для каждого случая, когда необходимо использовать пароль).
---@return string
function EditLineSafe:GetString() end

--- Возвращает текст, содержащийся в строке ввода. Если строка ввода содержит пароль, то возвращается визуальный текст ("звездочки"). Для использования оригинального текста нужно применять специальные функции (отдельно для каждого случая, когда необходимо использовать пароль).
---@return WString
function EditLineSafe:GetText() end

--- Вставляет текст в текущей позиции курсора EditLine.
---@param text WString
function EditLineSafe:InsertTextAtCursorPos(text) end

--- Задает позицию курсора для EditLine.
---@param index integer позиция курсора, [0..]
function EditLineSafe:SetCursorPos(index) end

--- Задает оформление для всего EditLine через список CSS-классов.
---@param classNames string[] список CSS-классов
function EditLineSafe:SetGlobalClasses(classNames) end

--- Задает максимальное количество символов для строки ввода.
---@param maxSize integer|nil новое максимальное количество символов или предельное значение, если nil
function EditLineSafe:SetMaxSize(maxSize) end

--- Задает оформление для выделенного текста в EditLine.
---@param className string имя CSS-класса
function EditLineSafe:SetSelectionClass(className) end

--- Задает текст для EditLine.
---@param text WString
function EditLineSafe:SetText(text) end

---@class FormSafe : WidgetSafe
local FormSafe = {}

--- Получить специальный кэширующий виджет аддона. Если в аддоне таковой еще не существует, то он будет создан. Подробнее о кэширующем виджете смотри  FactoryCache
---@return FactoryCacheSafe
function FormSafe:GetFactoryCache() end

---@class ScrollableContainerSafe : WidgetSafe
local ScrollableContainerSafe = {}

--- Возвращает указанный элемент
---@param pos integer
---@return WidgetSafe|nil
function ScrollableContainerSafe:At(pos) end

--- Прокручивает контейнер таким образом, чтобы указанный элемент стал видимым, по возможности полностью. Если элемент уже полностью видим, то прокрутка не производится.
---@param widget WidgetSafe показываемый элемент
function ScrollableContainerSafe:EnsureVisible(widget) end

--- Вызывает немедленную репозицию контейнера. По умолчанию репозиция выполняется 1 раз в конце кадра если была запланирована. К планированию репозиции приводит
function ScrollableContainerSafe:ForceReposition() end

--- Возвращает значение текущей прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@return number
function ScrollableContainerSafe:GetContainerOffset() end

--- Возвращает количество элементов в контейнере.
---@return number
function ScrollableContainerSafe:GetElementCount() end

--- Возвращает максимальное количество элементов в контейнере.
---@return number
function ScrollableContainerSafe:GetElementLimit() end

--- Возвращает максимальное значение на которое может быть прокручен контейнер
---@return number
function ScrollableContainerSafe:GetMaxContainerOffset() end

--- Добавляет элемент в заданную позицию контейнера.
---@param position integer позиция в которую добавляется элемент (счет начинается с нуля)
---@param widget WidgetSafe добавляемый элемент
function ScrollableContainerSafe:Insert(position, widget) end

--- Проверяет находится ли виджет в контейнере
---@param widget WidgetSafe проверяемый элемент
---@return boolean
function ScrollableContainerSafe:IsContain(widget) end

--- Проверяет, находится ли скроллер в самом конце. Если контейнер не скроллируется, то всегда true.
---@return boolean
function ScrollableContainerSafe:IsSliderMax() end

--- Проверяет, находится ли скроллер в самом начале. Если контейнер не скроллируется, то всегда true.
---@return boolean
function ScrollableContainerSafe:IsSliderMin() end

--- Удаляет из контейнера элемент из конца списка.
function ScrollableContainerSafe:PopBack() end

--- Удаляет из контейнера элемент из начала списка.
function ScrollableContainerSafe:PopFront() end

--- Добавляет в контейнер очередной элемент в конец списка.
---@param widget WidgetSafe добавляемый элемент
function ScrollableContainerSafe:PushBack(widget) end

--- Добавляет в контейнер очередной элемент в начало списка.
---@param widget WidgetSafe добавляемый элемент
function ScrollableContainerSafe:PushFront(widget) end

--- Удаление указанного элемента (по виджету). Отсутствие в контейнере данного виджета считается ошибкой.
---@param widget WidgetSafe удаляемый элемент
function ScrollableContainerSafe:Remove(widget) end

--- Удаление указаного элемента (по индексу)
---@param pos integer индекс элемента, который необходимо удалить (начинается с нуля)
function ScrollableContainerSafe:RemoveAt(pos) end

--- Удаление всех элементов из контейнера
function ScrollableContainerSafe:RemoveItems() end

--- Изменяет значение прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@param offset float величина прокрутки
function ScrollableContainerSafe:SetContainerOffset(offset) end

---@class TextContainerSafe : WidgetSafe
local TextContainerSafe = {}

--- Вызывает немедленную репозицию контейнера. По умолчанию репозиция выполняется 1 раз в конце кадра если была запланирована. К планированию репозиции приводит
function TextContainerSafe:ForceReposition() end

--- Возвращает значение текущей прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@return number
function TextContainerSafe:GetContainerOffset() end

--- Возвращает количество элементов в контейнере.
---@return number
function TextContainerSafe:GetElementCount() end

--- Возвращает максимальное количество элементов в контейнере.
---@return number
function TextContainerSafe:GetElementLimit() end

--- Возвращает максимальное значение на которое может быть прокручен контейнер
---@return number
function TextContainerSafe:GetMaxContainerOffset() end

--- Вставка в заданную позицию контейнера строки или ValuedText (зависит от входного параметра)
---@param position integer
---@param text WString
---@param valuedText ValuedText
function TextContainerSafe:InsertText(position, text, valuedText) end

--- Проверяет, находится ли скроллер в самом конце. Если контейнер не скроллируется, то всегда true.
---@return boolean
function TextContainerSafe:IsSliderMax() end

--- Проверяет, находится ли скроллер в самом начале. Если контейнер не скроллируется, то всегда true.
---@return boolean
function TextContainerSafe:IsSliderMin() end

--- Удаление элемента в конце контейнера
function TextContainerSafe:PopBack() end

--- Добавляет неформатированную строку в контейнер (порядок добавления задается в настройках контейнера)
---@param text WString
function TextContainerSafe:PushBackRawText(text) end

--- Добавляет WString / ValuedText в конец контейнера (порядок добавления задается в настройках контейнера). Для добавления WString в контейнере должны быть заданы formatFileRef и defaultTag.
---@param text WString
function TextContainerSafe:PushBackText(text) end

--- Добавляет ValuedText в контейнер (порядок добавления задается в настройках контейнера)
---@param valuedText ValuedText
function TextContainerSafe:PushBackValuedText(valuedText) end

--- Добавляет неформатированную строку в начало контейнера (само начало задается в настройках контейнера)
---@param text WString
function TextContainerSafe:PushFrontRawText(text) end

--- Добавляет WString / ValuedText в начало контейнера (порядок добавления задается в настройках контейнера). Для добавления WString в контейнере должны быть заданы formatFileRef и defaultTag.
---@param text WString
function TextContainerSafe:PushFrontText(text) end

--- Добавляет ValuedText в начало контейнера (порядок добавления задается в настройках контейнера)
---@param valuedText ValuedText
function TextContainerSafe:PushFrontValuedText(valuedText) end

--- Удаление указаного элемента
---@param pos integer индекс элемента, который необходимо удалить (начинается с нуля)
function TextContainerSafe:RemoveAt(pos) end

--- Удаление всех элементов из контейнера
function TextContainerSafe:RemoveItems() end

--- Изменяет значение прокрутки контейнера. Может использоваться для восстановления значения прокрутки контейнера после его изменения.
---@param offset float величина прокрутки
function TextContainerSafe:SetContainerOffset(offset) end

---@class TextViewSafe : WidgetSafe
local TextViewSafe = {}

--- Очищает все подставленные значения в ValuedText-е текстового контрола.
function TextViewSafe:ClearValues() end

--- Прерывает эффект  типа ET_TEXT_SCALE
function TextViewSafe:FinishTextScaleEffect() end

--- Возвращает тег по-умолчанию. Используется для удобства, если формат текста подразумевает использование только одного значения подстановки.
---@return WString
function TextViewSafe:GetDefaultTag() end

--- Возвращает границы области в которую вписан отрисованный текст. Для того что бы значение было валидно текст предварительно должен быть отрисован в предыдущем кадре.
---@return integer
function TextViewSafe:GetTextRect() end

--- Возвращает коэффициент масштабирования текста внутри текстового контрола. Если текст не масштабирован, то возвращается nil.
---@return number
function TextViewSafe:GetTextScale() end

--- Возвращает текст, находящийся в этом контроле.
---@return ValuedText
function TextViewSafe:GetValuedText() end

--- Преобразование содержимого виджета TextView в UTF-строку.
---@return WString
function TextViewSafe:GetWString() end

--- Запускает эффект масштабирования текста в TextView. Не рекомендуется оставлять масштабный коэффициент отличным от 1 на длительное время: текст может быть размытым.
function TextViewSafe:PlayTextScaleEffect() end

--- Запускает цепочку эффектов масштабирования текста в TextView. Не рекомендуется оставлять масштабный коэффициент отличным от 1 на длительное время: текст может быть размытым.
function TextViewSafe:PlayTextScaleEffectSequence() end

--- Меняет выравнивание текста по вертикали. Не рекомендуется использовать без крайней необходимости.
---@param align integer
function TextViewSafe:SetAlignY(align) end

--- Задает значение для подстановки класса (из тега "rs") для данного TextViewSafe.
---@param tag string/WString тег, для которого задается значение
---@param value string/WString значение тега
function TextViewSafe:SetClassVal(tag, value) end

--- Cтавить ли многоточие при выходе текста за правую границу. Не рекомендуется использовать без крайней необходимости.
---@param ellipsis boolean
function TextViewSafe:SetEllipsis(ellipsis) end

--- Меняет формат текста, механизм работы идентичен SetFormat
---@param format WString
function TextViewSafe:SetFormat(format) end

--- Устанавливает фиксированное расстояние между строками. Не рекомендуется использовать без крайней необходимости.
---@param spacing number
function TextViewSafe:SetLinespacing(spacing) end

--- Устанавливает контрол в многострочный режим. Не рекомендуется использовать без крайней необходимости.
---@param multiline boolean
function TextViewSafe:SetMultiline(multiline) end

--- Масштабирует текст внутри текстового контрола.
---@param scale float|nil коэффициент масштабирования текста &gt;= 0.0 или nil для возвращения текста в исходное (немасштабированное) состояние
function TextViewSafe:SetTextScale(scale) end

--- Задает значение для тега. Часто используется в паре с GetDefaultTag.
---@param tag String
---@param value String
function TextViewSafe:SetVal(tag, value) end

--- Полностью задает новый текст для данного контрола. Копируется как оформление, так и подстановочные значения.
---@param valuedText ValuedText устанавливаемый формат
function TextViewSafe:SetValuedText(valuedText) end

--- Выставляет флаг переноса текста на следующую строку. Только для многострочных контролов. Не рекомендуется использовать без крайней необходимости.
---@param wraptext boolean
function TextViewSafe:SetWrapText(wraptext) end

--- Выставляет флаг вывода на экран строки, если она пересекает границу области вывода по вертикали. Не рекомендуется использовать без крайней необходимости.
---@param show boolean
function TextViewSafe:ShowClippedLine(show) end

--- Выставляет флаг вывода на экран символа, если он пересекает границу области вывода по горизонтали. Не рекомендуется использовать без крайней необходимости.
---@param show boolean
function TextViewSafe:ShowClippedSymbol(show) end
