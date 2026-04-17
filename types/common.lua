---@meta

--- CategoryCommon
--- Функции и события Lua API библиотеки common, а также глобальные функции.

--- Перечисление состояний рекомендаций:
--- не доступна и не должна отображаться
---@type integer
GOAL_STATE_NOT_SHOWN = nil
--- доступна для выполнения
---@type integer
GOAL_STATE_ACTIVE = nil
--- выполнена
---@type integer
GOAL_STATE_COMPLETED = nil

---@class commonLib
common = {}

--- Создает и возвращает новый экземпляр ValuedObject.
---@param text WString текстовое описание, впоследствие может быть получено из ValuedObject методом GetText()
---@param table table таблица произвольного вида, содержащая элементы простых типов (boolean, number, string, WString, table); впоследствие может быть получено из ValuedObject методом GetId()
---@param handledMouseButtons nil если задана, битовая маска, задающая набор клавиш мыши, которые должны обрабатываться при одинарном клике по объекту. По умолчанию обрабатываются все клавиши
---@param handledMouseButtonsDbl nil если задана, битовая маска, задающая набор клавиш мыши, которые должны обрабатываться при двойном клике по объекту. По умолчанию обрабатываются все клавиши
---@return ValuedObject
function common.CreateValuedObject(text, table, handledMouseButtons, handledMouseButtonsDbl) end

--- Создает и возвращает новый экземпляр ValuedText.
---@return ValuedText
function common.CreateValuedText() end

--- Является обратной для  common.EnablePersonalEvent(). Подробности применения и параметры смотреть там.
---@param sysEventName string название события
---@param object ObjectId идентификатор объекта для которого отключается персональное событие
function common.DisablePersonalEvent(sysEventName, object) end

--- Включает обработку персонального события для конкретной пары (событие : объект). Применимо только к некоторым специальным событиям:
---@param sysEventName string название события
---@param object ObjectId идентификатор объекта для которого включается персональное событие
function common.EnablePersonalEvent(sysEventName, object) end

--- Задаёт отображаемость пользовательского интерфейса. Если интерфейс не отображается, то интерфейсные виджеты не показываются и не обрабатывают реакции на пользовательский ввод.
---@param enable boolean true включает отображение пользовательского интерфейса, false выключает
function common.EnableUIRender(enable) end

--- Форматирует данное вещественное значение в указанном формате. Результат возвращается в виде локализуемой строки.
---@param value float исходное вещественное значение
---@param format string строка с форматом, допустимы следующие варианты:
---@param separator string разделитель разрядов, если задан то через каждые 3 разряда до десятичной точки будут вставляться символы разделителя
---@return WString
function common.FormatFloat(value, format, separator) end

--- Форматирует данное целое значение в указанном формате. Результат возвращается в виде локализуемой строки.
---@param value integer исходное целое значение
---@param format string строка с форматом, допустимы следующие варианты:
---@param separator string разделитель разрядов, если задан то через каждые 3 разряда будут вставляться символы разделителя
---@return WString
function common.FormatInt(value, format, separator) end

--- Преобразует число в строку в заданном формате. Результат возвращается в виде локализуемой строки.
---@param value number исходное число
---@param format string|nil строка с форматом, имеет вид: "+12.3[4]A5"  [sign][width][.precision][[total]][abbreviate], где
---@return WString
function common.FormatNumber(value, format) end

--- Возвращает значение основного игрового таймера. Тикает 1 раз в кадр.
function common.GetAbsTimeMs() end

--- Возвращает подробную информацию об аддоне по системному имени аддона. Если аддон с данным системным именем н найден - вернет false
---@param addonName string действительное системное имя аддона (common.GetAddonSysName)
---@return any
function common.GetAddonInfo(addonName) end

--- Возвращает главную форму аддона.
---@return FormSafe|nil
function common.GetAddonMainForm() end

--- Получить имя аддона, в котором выполняется скрипт.
---@return string
function common.GetAddonName() end

--- Получить имя аддона, в котором выполняется скрипт.
---@return string
function common.GetAddonSysName() end

--- Выводит список целей аватара [http://intra/wiki/a1/AllodsGoalInterface AllodsGoalInterface], данные доступны только после входа в игру.
---@return table
function common.GetAllodsGoals() end

--- Выводит список целей аватаров [http://intra/wiki/a1/AllodsGoalInterface AllodsGoalInterface], данные доступны в подавляющем большинстве состояний.
---@return any
function common.GetAllodsGoalsOnLoadingScreen() end

--- Возвращает нелокализуемую строку с именем типа переданного в качестве аргумента объекта. Если объект имеет встроенный тип - результат аналогичен type( value ). Если объект принадлежит к одному из типов Lua API, результатом будет имя этого типа.
---@param value any любое значение
---@return string
function common.GetApiType(value) end

--- Возвращает текущую версию Lua API.
---@return number
function common.GetApiVersion() end

--- Возвращает состав команды проекта Аллоды Онлайн.
---@return table
function common.GetCredits() end

--- Возвращает список всех CSS-классов.
---@return table
function common.GetCSSList() end

--- Возвращает дату и время в формате LuaFullDateTime по Unix time (количеству миллисекунд, прошедших с 1-го января 1970-го года).
---@param timeMs integer Unix time (время в миллисекундах прошедшее с 1-го января 1970 года)
function common.GetDateTimeFromMs(timeMs) end

--- Возвращает пустую локализуемую строку.
---@return WString
function common.GetEmptyWString() end

--- Возврящает ограничения на длинну фразы для добивания.
---@return table|nil
function common.GetFatalityPhraseLimits() end

--- Возвращает список бонусов за платёж и информацию о их получении.
---@return table
function common.GetFirstPaymentBonusInfo() end

--- Возвращает информацию о FPS.
---@return table
function common.GetFPSData() end

--- Возвращает клиентскую дату и время в формате LuaFullDateTime.
function common.GetLocalDateTime() end

--- Возвращает клиентскую дату и время в формате Unix time.
function common.GetLocalDateTime() end

--- Возвращает текущее значение раскладки клавиатуры, в виде короткого имени локали('ru'/'en'/'de'/...)
---@return string
function common.GetLocale() end

--- Возвращает список доступных для выбора локалей(раскладок клавиатуры). Каждая локаль описана коротким именем, например "ru" или "en".
---@return string[]|nil
function common.GetLocaleList() end

--- Возвращает текущее значение локализации, заданное в global.cfg
---@return string
function common.GetLocalization() end

--- Выдает количество микросекунд с момента старта системы, для точного таймера при профилировании производительности.
---@return number
function common.GetMks() end

--- Возвращает Unix time (количество миллисекунд, прошедших с 1-го января 1970-го года), по дате и времени в формате типа LuaFullDateTime.
---@param y integer год
---@param m integer месяц (начиная с 1)
---@param d integer день
---@param h nil час (необязательный параметр, по умолчанию 0)
---@param min nil минута (необязательный параметр, по умолчанию 0)
---@param s nil секунда (необязательный параметр, по умолчанию 0)
---@param ms nil миллисекунда (необязательный параметр, по умолчанию 0)
function common.GetMsFromDateTime(y, m, d, h, min, s, ms) end

--- Выдает вещественное псевдо-случайное число в диапазоне [min..max].
---@param min float минимальное значение
---@param max float максимальное значение
---@return number
function common.GetRandFloat(min, max) end

--- Выдает целое псевдо-случайное число в диапазоне [min..max].
---@param min integer минимальное значение (включительно)
---@param max integer максимальное значение (включительно)
---@return number
function common.GetRand(min, max) end

--- Возвращает базовую информацию об бонусе комплектной экипировки.
---@param setBonusId SetBonusId(ResourceId) идентификатор бонуса комплектной экипировки
---@return table|nil
function common.GetSetBonusInfo(setBonusId) end

--- Возвращает сокращённую (по первым буквам каждого присутствующего в строке-аргументе слова) строку. Может быть полезно, к примеру, для получения сокращённого имени шарда - например, если задать "Владыки Астрала", то вернётся "ВА". Аргумент должен иметь тип WString.
---@param text WString строка
---@return WString|nil
function common.GetShortString(text) end

--- Возвращает базовую информацию об Special характеристике.
---@param specialStatId SpecialStatId(ResourceId) идентификатор Special-стата
---@return table|nil
function common.GetSpecialStatInfo(specialStatId) end

--- Возвращает информацию по аддонам, которыми можно управлять. Нельзя управлять главным аддоном или аддонами, имеющими поддержку в коде.
---@return table
function common.GetStateManagedAddons() end

--- Получить имя стейта для аддона, в котором выполняется скрипт ("SystemState", "MainMenu", "Mission" и т.п.).
---@return string
function common.GetStateName() end

--- Возвращает различные флаги, специфичные для данной конкретной локализованной версии клиента.
---@return table
function common.GetTerritoryInfo() end

--- Возвращает информацию о текстуре.
---@param textureId TextureId идентификатор ресурса текстуры
---@return table
function common.GetTextureInfo(textureId) end

--- Возвращает размер текстуры, информация берется из ресурса (поля realWidth, realHeight)
---@param textureId TextureId идентификатор ресурса текстуры
---@return table
function common.GetTextureSize(textureId) end

--- Взводит флаг hit обработчика события кадра. Функцию нельзя вызвать находясь в обработчике события кадра. Если обработчика нет, то флаг все равно будет взведен, но не будет никак использоваться.
function common.HitrFrameHandler() end

--- Проверяет что переданная строка является валидным именем для аватара.
---@param name WString проверяемое значение
---@return boolean
function common.IsAvatarNameValid(name) end

--- Получить состояние CapsLock. Для других клавиш смотри  common.IsKeyEnabled( vkCode )
---@return boolean
function common.IsCapsLockEnabled() end

--- Возвращает true, если ValuedText фактически пустой и не содержит отображаемых символов, хотя может содержать какую-то форматирующую информацию.
---@param valuedText ValuedText экземпляр ValuedText
---@return boolean
function common.IsEmptyValuedText(valuedText) end

--- Возвращает пуста ли локализуемая строка. Аргумент должен иметь тип WString.
---@param text WString локализуемая строка
---@return boolean
function common.IsEmptyWString(text) end

--- Проверяет соответствуют ли характеристики друг другу. В качестве аргументов принимает идентификаторы характеристик SpecialStatId или ENUM_InnateStats
---@param firstStatId SpecialStatId идентификатор первой характеристики
---@param secondStatId SpecialStatId идентификатор второй характеристики
---@return boolean
function common.IsEqualStats(firstStatId, secondStatId) end

--- Проверяет, содержит ли фраза для добивания запрещенные выражения. Возвращает выражения не прошедшие проверку.
---@param text WString текст на проверку
---@return table|nil
function common.IsFatalityPhraseFiltered(text) end

--- Получить состояние виртуальной клавиши.
---@param vkCode integer числовое значение виртуальной клавиши ( http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx ) в качестве глобальных переменных определены следующие:
---@return boolean
function common.IsKeyEnabled(vkCode) end

--- Возвращает true, если сейчас игрок находится на подписочном сервере. В остальных случаях (не на подписочном сервере, вообще не на сервере, не залогинился и т.п.) возвращает false.
---@return boolean
function common.IsOnPayToPlayShard() end

--- Позволяет узнать, включен или выключен звук.
---@return boolean
function common.IsSoundEnabled() end

--- Возвращает true, если вторая строка является подстрокой первой с учётом регистра.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return boolean
function common.IsSubstring(text1, text2) end

--- Возвращает true, если вторая строка является подстрокой первой без учёта регистра.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return boolean
function common.IsSubstringEx(text1, text2) end

--- Проверяет, содержатся ли в тексте запрещенные слова.
---@param text WString текст на проверку
---@return boolean
function common.IsTextFiltered(text) end

--- Позволяет узнать, включено или выключено отображение пользовательского интерфейса.
---@return boolean
function common.IsUIRenderEnabled() end

--- Проверяет что переданный аргумент является валидным текстом. Валидными считаются ValuedObject, непустой ValuedText и непустой WString.
---@param text any проверяемое значение
---@return boolean
function common.IsValidText(text) end

--- Является ли объект ValuedObject-ом.
---@param object any любое значение
---@return boolean
function common.IsValuedObject(object) end

--- Возвращает true, если переданный объект типа ValuedText.
---@param value any любое значение
---@return boolean
function common.IsValuedText(value) end

--- Проверяет что переданный аргумент является виджетом (userdata имеющая тип наследник WidgetSafe)
---@param any any проверяемое значение
---@return boolean
function common.IsWidget(any) end

--- Проверяет, является ли аргумент локализуемой строкой.
---@param value any любое значение
---@return boolean
function common.IsWString(value) end

--- Выводит список строк в консоль/чат с префиксом "script: " с уровнем ERROR. Переданные строки объединяются в одну. В качестве аргументов можно передавать как нелокализованные, так и локализованные строки.
---@param filter string фильтр логирования
---@param text01 string первый обязательный текстовый аргумент
function common.LogError(filter, text01) end

--- Выводит список строк в консоль/чат с префиксом "script: ". Переданные строки объединяются в одну. В качестве аргументов можно передавать как нелокализованные, так и локализованные строки.
---@param filter string фильтр логирования
---@param text01 string первый обязательный текстовый аргумент
function common.LogInfo(filter, text01) end

--- Выводит список строк в консоль/чат с префиксом "script: " с уровнем WARNING. Переданные строки объединяются в одну. В качестве аргументов можно передавать как нелокализованные, так и локализованные строки.
---@param filter string фильтр логирования
---@param text01 string первый обязательный текстовый аргумент
function common.LogWarning(filter, text01) end

--- Создает пользовательский снимок экрана. В ответ отправляется событие: EVENT_USER_SCREENSHOT.
---@param postpone boolean|nil если true, снимок откладывается на два кадра
function common.MakeUserScreenshot(postpone) end

--- Немедленно выходит из игры, независимо от текущего состояния. Эмулирует разрыв соединения аналогично выходу через системное меню (в оконном режиме).
function common.QuitGame() end

--- Подписывает обработчик аддона на указанное событие. На одно событие может быть несколько обработчиков. Функция-обработчик обязана соответствовать  шаблону
---@param eventFunction function функция-обработчик, должна соответствовать шаблону
---@param sysEventName string название события
---@param filter table|nil фильтр сообщения или nil (по умолчанию, без фильтрации)
---@param registerPersonal boolean|nil автоматически активировать personalEvents если это применимо (по умолчанию true).
function common.RegisterEventHandler(eventFunction, sysEventName, filter, registerPersonal) end

--- Подписывает обработчик аддона на событие кадра. У аддона может быть только один обработчик события кадра. Функция-обработчик обязана соответствовать  шаблону
---@param handlerFunction function функция-обработчик соответствующая шаблону
---@param needHit boolean требуется ли взводить флаг для вызова обработчика
function common.RegisterFrameHandler(handlerFunction, needHit) end

--- Подписывает обработчик аддона на указанную реакцию. На одну реакцию может быть подписано несколько обработчиков. Функция-обработчик принимает один параметр - таблицу.
---@param reactionFunction function функция-обработчик
---@param sysReactionName string название реакции
function common.RegisterReactionHandler(reactionFunction, sysReactionName) end

--- Посылка события с данным именем и параметрами. Если функция вызвана из встроенного аддона - событие будет отправлено только встроенным аддонам, из пользовательского - только пользовательским.
---@param eventName string идентификатор события, непустая строка
---@param eventParams table таблица с параметрами события, произвольная с учетом ограничений перечисленных выше
function common.SendEvent(eventName, eventParams) end

--- Задает текущий курсор, курсор берется по указанному имени (alias) из ресурсной системы.
---@param name string псевдоним (alias) курсора
function common.SetCursor(name) end

--- Вызывает мигание иконкой в панели задач до момента получения приложением фокуса (т.е. становления окна активным).
---@param flashCount int количество миганий (вспышек)
function common.SetIconFlash(flashCount) end

--- Устанавливает текущее значение раскладки клавиатуры.
---@param locale string короткое имя или индекс локали из списка полученного из GetLocaleList
function common.SetLocale(locale) end

--- Загружает указанный аддон. Можно загружать только не загруженные аддоны. Нельзя использовать комбинацию Unload+Load, вместо нее надлежит использовать Reload.
---@param name string имя аддона
function common.StateLoadManagedAddon(name) end

--- Перезагружает указанный аддон. Можно перезагружать только managed аддоны в состоянии LOADED.
---@param name string имя аддона
function common.StateReloadManagedAddon(name) end

--- Выгружает указанный аддон. Нельзя выгружать главный аддон или аддоны, имеющие поддержку в коде.
---@param name string имя аддона
function common.StateUnloadManagedAddon(name) end

--- Отписывает аддон от обработки события (отписывает все его обработчики).
---@param sysEventName string название события
function common.UnRegisterEvent(sysEventName) end

--- Отписывает обработчик события аддона (указанную функцию).
---@param eventHandler function функция-обработчик
---@param sysEventName string название события
---@param filter table|nil фильтр сообщения или nil (по умолчанию, без фильтрации)
---@param unregisterPersonal boolean|nil автоматически деактивировать personalEvents если это применимо (по умолчанию true).
function common.UnRegisterEventHandler(eventHandler, sysEventName, filter, unregisterPersonal) end

--- Удаляет обработчик события кадра. Если такового нет - ничего не делает.
function common.UnRegisterFrameHandler() end

--- Отписывает аддон от реакции. Все обработчики будут удалены.
---@param sysReactionName string название реакции
function common.UnRegisterReaction(sysReactionName) end

--- Отписывает обработчик аддона от указанной реакции. На одну реакцию может быть подписано несколько обработчиков.
---@param reactionFunction function функция-обработчик
---@param sysReactionName string название реакции
function common.UnRegisterReactionHandler(reactionFunction, sysReactionName) end

--- Сравнивает две локализуемые строки с учетом регистра. В случае ошибочных данных (не WString) всегда возвращает -1.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return number
function common.CompareWString(text1, text2) end

--- Сравнивает две локализуемые строки без учёта регистра. В случае ошибочных данных (не WString) всегда возвращает -1.
---@param text1 WString первый локализуемый текст
---@param text2 WString второй локализуемый текст
---@return number
function common.CompareWString(text1, text2) end

--- Экранирует текст строки от HTML-кода, алгоритм экранирования используется тот же самый что для режима isHtmlEscaping виджета  TextView.
---@param str WString исходная строка
---@return WString
function common.EscapeWString(str) end

--- Возвращает архитектуру клиента игры. Возможные значения
function GetClientArch() end

--- Возвращает параметры окна игры. См. также:  EVENT_POS_CONVERTER_CHANGED.
function GetPosConverterParams() end

--- Возвращает значение скриптовой переменной из конфигурационного файла. Поддерживаются типы: boolean, number, string. Значения задаются командой "script_var". Формат команды:
function GetScriptCfgVar() end

--- Шаблон функции, обрабатывающей зарегистрированное событие. Функции регистрируемые через  common.RegisterEventHandler обязаны соответствовать данному шаблону.
---@param eventData table поля таблицы зависят от события
function FunctionName(eventData) end

--- Шаблон функции, обрабатывающей событие кадра. Функции регистрируемые через  common.RegisterFrameHandler обязаны соответствовать данному шаблону.
---@param elapsedMs int64 Время (в миллисекундах) прошедшее с предыдущего отсчета глобального таймера (== с предыдущего кадра)
---@param timeMs int64 текущий отсчет глобального таймера
function FunctionName(elapsedMs, timeMs) end

--- Объявляет глобальную переменную и присваивает ей указанное начальное значение. Все глобальные переменные (исключая функции) перед использованием должны быть явно объявлены.
---@param name string имя регистрируемой глобальной переменной
---@param initialValue any начальное значение глобальной переменной, может быть использовано любое значение любого типа
function Global(name, initialValue) end

-- Events

--- Уведомление об изменении состояния аддона. Список возможных состояний смотри в  AddonState
EVENT_ADDON_LOAD_STATE_CHANGED = "EVENT_ADDON_LOAD_STATE_CHANGED"

--- Событие приходит при добавлении целей (смены статуса на активные)
EVENT_ALLODS_GOAL_ADDED = "EVENT_ALLODS_GOAL_ADDED"

--- Событие приходит при изменении списка текущих целей аватара. Список целей можно получить при помощи функции  common.GetAllodsGoals()
EVENT_ALLODS_GOAL_CHANGED = "EVENT_ALLODS_GOAL_CHANGED"

--- Событие приходит при завершении целей (смены статуса на завершённые)
EVENT_ALLODS_GOAL_COMPLETED = "EVENT_ALLODS_GOAL_COMPLETED"

--- Событие посылается при изменении режима полноэкранности игры.
EVENT_FULLSCREEN_CHANGED = "EVENT_FULLSCREEN_CHANGED"

--- Присылается при изменении раскладки клавиатуры.
EVENT_LOCALE_CHANGED = "EVENT_LOCALE_CHANGED"

--- Уведомление об изменении игрового окна. См. также:  common.GetPosConverterParams().
EVENT_POS_CONVERTER_CHANGED = "EVENT_POS_CONVERTER_CHANGED"

--- Уведомление о сделанном снимке экрана, удачном или неудачном.
EVENT_USER_SCREENSHOT = "EVENT_USER_SCREENSHOT"
