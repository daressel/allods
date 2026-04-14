---@meta

---@class Widget
---@field Name string системное название виджета
---@field Visible boolean виден ли виджет. По умолчанию true. если виджет не виден, то он недоступен и для реакций
---@field Enabled boolean доступен ли виджет и все его дочерние виджеты для реакций. Может влиять на внешний вид (виджет "засеривается"). По умолчанию true
---@field Priority integer приоритет отображения (также влияет на обработку мышиных событий) виджета в списке виджетов своего родителя. То есть с помощью этого поля можно сформировать иерархию отображения виджетов всего аддона.
---@field Placement WidgetPlacementXY описание расположение виджета.
---@field Children Widget[] дочерние виджеты. Почти каждый виджет может содержать дочерние виджеты, за исключением особых случаев типа слайдера и т.п. Дочерние виджеты отображаются поверх родителя и перехватывают реакции (если они объявлены и на них подписаны обработчики) раньше родительского виджета за исключением особых случаев, оговоренных ниже.
---@field clipContent boolean Нужно ли обрезать содержимое, включая дочерние виджеты, по границам данного. По умолчанию true
---@field textureMask UISingleTexture Текстура с альфой. Используется для задания маски, по которой будет обрезана основная текстура данного контрола и всех его детей
---@field fade number визуальная прозрачность виджета. По умолчанию 1.0f - непрозрачен.
---@field isProtected boolean Запрещать ли пользовательским аддонам операции с виджетом. По умолчанию false. См. также AttachWidget2D.
---@field TabOrder integer задаёт порядок обхода контролов по клавише Tab. По умолчанию 0(не учавствует в обходе). Для участия в обходе значение должно быть больше 0.
local Widget = {}

---@class Button : Widget
---@field TextTag string название текстового тэга в строке форматирования текущего варианта, в который будет подставляться текст из выбранного варианта при вызове  ButtonSafe:SetVariant( self, variant )
---@field Variants WidgetButtonVariant[] список вариантов кнопки, между которыми она может переключаться
---@field TextStyle WidgetTextStyle текстовый стиль кнопки
---@field useDefaultSounds boolean использовать звук клика по умолчанию. По умолчанию true
local Button = {}

---@class WidgetButtonState
local WidgetButtonState = {}

---@class WidgetButtonVariant
---@field TextFileRef TextFileRef ссылка на текстовый файл с текстом кнопки
---@field ReactionOnUp boolean если true, то реакцию о клике присылать при отпускании кнопки, иначи при нажатии. По умолчанию false
---@field LayerHighlight WidgetLayer текстура подсветки
---@field PushedOffset vec2 смещение при нажатии
---@field StateNormal WidgetButtonState обычное состояние кнопки
---@field StatePushed WidgetButtonState нажатое состояние кнопки
---@field StateHighlighted WidgetButtonState подсвеченное, но не нажатое состояние кнопки
---@field StatePushedHighlighted WidgetButtonState подсвеченное и нажатое состояние кнопки
---@field StateDisabled WidgetButtonState отключенное (запрещено нажимать) состояние кнопки
---@field soundOver WidgetSoundBase звук, воспроизводимый при наведении на кнопку
---@field soundPress WidgetSoundBase звук, воспроизводимый при нажатии на кнопку
local WidgetButtonVariant = {}

---@class Container
---@field border WidgetPanel Окно, в котором отображаются добавленные элементы. Опционально, если не задан - создастся автоматически по размеру контейнера.
---@field scrollBar WidgetGlideScrollBar Скроллбар для прокрутки содержимого. Опционально, если не задан, то контейнер нельзя прокручивать (но он может ресайзится автоматически при WIDGET_SIZING_INTERNAL)
---@field widgetsArrangement WidgetsArrangement Порядок добавления элементов. Опционально, если не задано, то WIDGETS_ARRANGEMENT_T2B.
---@field elementsInterval number Интервал между соседними элементами. Опционально, если не задано, то 0.0f
---@field elementsLimit integer Максимальное число элементов в контейнере. Опционально, если не задано (или задано <= 0), то не ограничено.
---@field elementFixedSize number Фиксированный размер элемента по оси роста контейнера (widgetsArrangement). Опционально, если задано, то контейнер использует данное значение для всех элементов, если нет - вычисляет динамически для каждого элемента. Если при заданном значении фактический размер элементов будет отличаться, то отображение будет некорректным.
local Container = {}

---@class DiscreteScrollBar
---@field slider WidgetDiscreteSlider кнопка перемещения ползунка вниз
local DiscreteScrollBar = {}

---@class DiscreteSlider
---@field stepsCount integer количество дискретных позиций. По умолчанию 0
local DiscreteSlider = {}

---@class EditBase : Widget
---@field Cursor1Layer WidgetLayer текстурный слой для показа курсора в состоянии 1
---@field Cursor2Layer WidgetLayer текстурный слой для показа курсора в состоянии 2
---@field CursorWidth integer ширина курсора. По умолчанию 2
---@field CursorChangeTimeMs integer время переключения состояний курсора в миллисекундах. По умолчанию 500
---@field maxSymbolsCount integer максимальное количество символов в строке. по умолчанию -1 - количество не ограниченно
---@field canPaste boolean если false, то в строку ввода невозможно вставить текст из буфера обмена. По умолчанию true
---@field TextStyle WidgetTextStyle формат вывода текста на экран (разрывы строк, многострочность и т.п.)
---@field globalClassName string стиль оформления основного текста
---@field selectionClassName string стиль оформления текста выделения
---@field selectionLayer WidgetLayer текстурный слой для отрисовки подложки выделения
---@field filterAlias string название фильтра, разрешающего только буквы, перечисленные в нём. Значения: "RUSSIAN", "NUMBERS", "INTEGER". См.  EditBaseTextFilter
local EditBase = {}

---@class EditBox
---@field scrollBar WidgetGlideScrollBar плавный скроллбар для скролирования теста по вертикали (не обязательный), отнимает часть внутреннего пространства виджета
local EditBox = {}

---@class EditLine
---@field isPassword boolean если true, то в строке ввода находится секретная информация и текст выводится в виде звездочек. По умолчанию false
local EditLine = {}

---@class FactoryCache
local FactoryCache = {}

---@class Form
local Form = {}

---@class GlideScrollBar
---@field slider WidgetGlideSlider кнопка перемещения ползунка вниз
local GlideScrollBar = {}

---@class GlideSlider
---@field discreteStep number шаг дискетного перемещения. По умолчанию 10
local GlideSlider = {}

---@class WidgetLayer
local WidgetLayer = {}

---@class Panel
local Panel = {}

---@class WidgetPlacementLua
local WidgetPlacementLua = {}

---@class WidgetPlacementXY
local WidgetPlacementXY = {}

---@class WidgetsArrangement
local WidgetsArrangement = {}

---@class ScrollableContainer
local ScrollableContainer = {}

---@class ScrollBar : Widget
---@field decButton WidgetButton кнопка перемещения ползунка вначало
---@field incButton WidgetButton кнопка перемещения ползунка вниз
local ScrollBar = {}

---@class ET_
local ET_ = {}

---@class FinishEffect
local FinishEffect = {}

---@class PlayEffectSequence
local PlayEffectSequence = {}

---@class PlayEffect
local PlayEffect = {}

---@class ET_
local ET_ = {}

---@class Slider : Widget
---@field sliderButton WidgetButton ползунок
---@field moveArrangement WidgetsArrangement направление перемещения
local Slider = {}

---@class TextContainer
---@field formatFileRef TextFileRef Ссылка на файл, содержащий формат добавляемых WString. Опционально, если не задана, то нельзя добавлять WString
---@field defaultTag string Название тега в форматной строке formatFileRef для добавляемого WString. Опционально, если не задано, то нельзя добавлять WString
---@field pickObjectsOnly boolean В тексте кликабельны только объекты ValuedObject, сам текст прозрачен для ввода. Опционально, по умолчанию false.
---@field rotateOnLimit boolean При добавлении текста сверх лимита (смотри  WidgetContainer->elementsLimit) автоматически удалять текст с противоположной стороны контейнера. Опционально, по умолчанию false. Если true, то нельзя добавлять текст в середину контейнера (метод  InsertText)
local TextContainer = {}

---@class WidgetTextStyle
local WidgetTextStyle = {}

---@class TextView : Widget
---@field FormatFileRef TextFileRef ссылка на текстовый файл. Если внутри файла правильно отформатированный XHTML документ, то текстовый виджет будет содержать  ValuedText, иначе простой WString
---@field TextValues WidgetTextTaggedValue[] список подстановочных значений по умолчанию. Каждый элемент имеет поля
---@field Tag string название подстановочного значение
---@field TagValueFileRef TextFileRef ссылка на текстовый файл со значением
---@field DefaultTag string тег по-умолчанию. Используется для удобства, если формат текста подразумевает использование только одного значения подстановки.
---@field TextStyle WidgetTextStyle стиль текста
---@field minWidth number минимальная ширина виджета при переразмеривании. По умолчанию 0.0f;
---@field maxWidth number максимальная ширина виджета при переразмеривании. По умолчанию 0.0f;
---@field pickObjectsOnly boolean кликабельны только объекты  ValuedObject в тексте, но не сам контрол. По умолчанию false
---@field isHtmlEscaping boolean эскейпинг вводимого через  SetVal теста. Позволяет обрабатывать ввод теста с переносами строк, предотвращает HTML-вандализм. По умолчанию false
local TextView = {}
