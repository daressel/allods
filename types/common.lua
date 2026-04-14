---@meta

---@class commonLib
common = {}

---@class CommonGetAddonInfoResult
---@field state AddonState Текущий статус аддона
---@field rawSysName string имя аддона в ресурсе
---@field sysName string системное название аддона
---@field userAddon boolean является ли аддон пользовательским
---@field managed boolean является ли аддон управляемым (для пользовательских всегда true)
---@field autoStart boolean аддон запускается автоматически (для пользовательских всегда false)
---@field useCommonScripts boolean аддон использует CoreScripts
---@field name string локализованное название аддона
---@field description string локализованное описание аддона
---@field license string текст лицензии аддона
---@field sourceUrl string ссылка на источник происхождения аддона
---@field supportUrl string ссылка на техподдержку аддона
---@field author string автор аддона
---@field version string версия аддона
---@field apiVersion integer версия API аддона
---@field buildTime integer время сборки аддона

---@class CommonGetAllodsGoalsResult
---@field goalId ObjectId GoalId
---@field state integer состояние цели ( 1 - активна, 2 - выполнена )
---@field locator table или nil если нет локатор для автобега:
---@field zoneId ObjectId идентификатор интерфейсной карты
---@field position GamePosition координаты точки
---@field stages table или nil если нет список, начинающийся с 0, с информацией о подцелях аватара:
---@field goalId ObjectId GoalId
---@field state integer состояние цели ( 1 - активна, 2 - выполнена )
---@field locator table или nil если нет локатор для автобега:
---@field zoneId ObjectId идентификатор интерфейсной карты
---@field position GamePosition координаты точки

---@class CommonGetAllodsGoalsOnLoadingScreenResult
---@field avatarName string имя аватара
---@field avatarId integer серверный идентификатор аватара (идентификатор текущего аватара можно получить через common.GetAvatarServerId() )
---@field goals table список, начинающийся с 0, с информацией о целях аватара:
---@field goalId ObjectId GoalId
---@field state integer состояние цели ( 1 - активна, 2 - выполнена )
---@field stages table или nil если нет список, начинающийся с 0, с информацией о подцелях аватара:
---@field goalId ObjectId GoalId
---@field state integer состояние цели ( 1 - активна, 2 - выполнена )

---@class CommonGetFatalityPhraseLimitsResult
---@field minLength number минимальная длинна
---@field maxLength number максимальная длинна

---@class CommonGetFirstPaymentBonusInfoResult
---@field min integer минимальная сумма платежа для получения бонуса
---@field bonus integer бонус в премиальных кристаллах
---@field background TextureId идентификатор текстуры для подложки
---@field items ItemId[] список бонусных предметов (Индексация с 1)

---@class CommonGetFPSDataResult
---@field min float минимальный FPS за расчетный период (100 кадров)
---@field max float максимальный FPS за расчетный период (100 кадров)
---@field avg float средний FPS за расчетный период (100 кадров)
---@field instant float мгновенный FPS на основе времени предыдущего кадра

---@class CommonGetSetBonusInfoResult
---@field name string название сетового бонуса
---@field description ValuedText описание сетового бонуса
---@field loreDescription string художественное описание сетового бонуса
---@field sourceDescription GlossaryId идентификатор ресурса для описания источника получения

---@class CommonGetSpecialStatInfoResult
---@field name string название Special-стата
---@field tooltipName string упрощенное название Special-стата
---@field shortDescription string упрощенное описание Special-стата
---@field type number класс характеристика

---@class CommonGetStateManagedAddonsResult
---@field name string имя аддона
---@field state int текущий статус аддона

---@class CommonIsFatalityPhraseFilteredResult
---@field filtered boolean имеет ли переданный текст запрещенные выражения
---@field reason string|nil[] список выражений не прошедших проверку

---@class CommonRegisterReactionHandlerResult
---@field params table параметры реакции

---Создает и возвращает объект, работающий с двухмерным звуком. Звук создается для определенного слота. Новый звук для уже имеющегося слота заменяет предыдущий. Звуки для разных слотов взаимодействуют по общим правилам. Звук продолжается некоторое время после завершения текущего состояния. Доступны слоты 0 - 20. Уточнение. Необходимо в первую очередь для музыки главного меню, чтобы она продолжала играть во время показа экрана загрузки и плавно выключалась после начала игры. '''Внимание''' По-умолчанию звук не играет - чтобы он играл нужно вызвать функцию  sound:Play() (закрытая ссылка) '''Внимание''' В режиме без звука возвращает nil
---@param soundId Sound2DId Id требуемого звука
---@param slot integer индекс слота под звук [0, 20]
---@return Sound2DLua|nil
function common.CreateProlongedStateSound(soundId, slot) end

---Создает и возвращает объект, работающий с двухмерным звуком. '''Внимание''' По-умолчанию звук не играет - чтобы он играл нужно вызвать функцию  sound:Play() (закрытая ссылка) '''Внимание''' В режиме без звука возвращает nil
---@param soundId Sound2DId Id требуемого звука
---@return Sound2DLua|nil
function common.CreateSound(soundId) end

---Является обратной для  common.EnablePersonalEvent(). Подробности применения и параметры смотреть там.
---@param sysEventName string название события
---@param object ObjectId идентификатор объекта для которого отключается персональное событие
---@return нет
function common.DisablePersonalEvent(sysEventName, object) end

---Включает обработку персонального события для конкретной пары (событие : объект). Применимо только к некоторым специальным событиям:
---@param sysEventName string название события
---@param object ObjectId идентификатор объекта для которого включается персональное событие
---@return нет
function common.EnablePersonalEvent(sysEventName, object) end

---Задаёт отображаемость пользовательского интерфейса. Если интерфейс не отображается, то интерфейсные виджеты не показываются и не обрабатывают реакции на пользовательский ввод.
---@param enable boolean true включает отображение пользовательского интерфейса, false выключает
---@return нет
function common.EnableUIRender(enable) end

---Возвращает значение основного игрового таймера. Тикает 1 раз в кадр. Именно это время используется (и передается) в отсчетах  EVENT_SECOND_TIMER и в  FrameHandler
function common.GetAbsTimeMs() end

---Возвращает подробную информацию об аддоне по системному имени аддона. Если аддон с данным системным именем н найден - вернет false
---@param addonName string действительное системное имя аддона (common.GetAddonSysName)
---@return CommonGetAddonInfoResult
function common.GetAddonInfo(addonName) end

---Возвращает главную форму аддона.
---@param sysAddonName string имя аддона
---@return FormSafe|false|nil
function common.GetAddonMainForm(sysAddonName) end

---Получить имя аддона, в котором выполняется скрипт. Внимание! Для пользовательских аддонов вернет имя из ресурса. Это имя НЕ является действительным с точки зрения клиента. Для получения действительного имени аддона используйте  common.GetAddonSysName()
---@return string -
function common.GetAddonName() end

---Возвращает группу связанных с аддоном звуковых ресурсов. Группа представляет собой userdata (RelatedSoundsLua). '''Внимание''' В режиме без звука возвращает nil
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedSoundsLua|nil
function common.GetAddonRelatedSoundGroup(sysGroup, optional) end

---Возвращает группу связанных с аддоном текстовых ресурсов. Группа представляет собой userdata (RelatedTextsLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedTextsLua|nil
function common.GetAddonRelatedTextGroup(sysGroup, optional) end

---Возвращает группу связанных с аддоном текстурных ресурсов. Группа представляет собой userdata (RelatedTexturesLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedTexturesLua|nil
function common.GetAddonRelatedTextureGroup(sysGroup, optional) end

---Возвращает группу связанных с аддоном шаблонов виджетов. Группа представляет собой userdata (RelatedWidgetsLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedWidgetsLua|nil
function common.GetAddonRelatedWidgetGroup(sysGroup, optional) end

---Получить имя аддона, в котором выполняется скрипт. Является действительным именем аддона используемым клиентом во всех связанных функциях событиях. Для системных аддонов задается в ресурсе аддона, для пользовательских вычисляется как "UserAddon/" + FOLDER_NAME.
---@return string -
function common.GetAddonSysName() end

---Выводит список целей аватара [http://intra/wiki/a1/AllodsGoalInterface AllodsGoalInterface], данные доступны только после входа в игру.
---@return CommonGetAllodsGoalsResult
function common.GetAllodsGoals() end

---Выводит список целей аватаров [http://intra/wiki/a1/AllodsGoalInterface AllodsGoalInterface], данные доступны в подавляющем большинстве состояний.
---@return CommonGetAllodsGoalsOnLoadingScreenResult
function common.GetAllodsGoalsOnLoadingScreen() end

---Возвращает нелокализуемую строку с именем типа переданного в качестве аргумента объекта. Если объект имеет встроенный тип - результат аналогичен type( value ). Если объект принадлежит к одному из типов Lua API, результатом будет имя этого типа. DEPRECATED: Функция устарела и помечена к удалению, следует использовать apitype
---@param value any type любое значение
---@return string
function common.GetApiType(value) end

---Возвращает текущую версию Lua API. Формат - число вида MM0mmfff где
---@return integer
function common.GetApiVersion() end

---Возвращает архитектуру клиента игры. Возможные значения
function common.GetClientArch() end

---Возвращает дату и время в формате LuaFullDateTime по Unix time (количеству миллисекунд, прошедших с 1-го января 1970-го года).
---@param timeMs integer Unix time (время в миллисекундах прошедшее с 1-го января 1970 года)
function common.GetDateTimeFromMs(timeMs) end

---Возвращает пустую локализуемую строку.
---@return string
function common.GetEmptyWString() end

---Возврящает ограничения на длинну фразы для добивания.
---@return CommonGetFatalityPhraseLimitsResult
function common.GetFatalityPhraseLimits() end

---Возвращает список бонусов за платёж и информацию о их получении.
---@return CommonGetFirstPaymentBonusInfoResult
function common.GetFirstPaymentBonusInfo() end

---Возвращает информацию о FPS.
---@return CommonGetFPSDataResult
function common.GetFPSData() end

---Возвращает клиентскую дату и время в формате LuaFullDateTime.
function common.GetLocalDateTime() end

---Возвращает клиентскую дату и время в формате Unix time.
function common.GetLocalDateTimeMs() end

---Возвращает текущее значение раскладки клавиатуры, в виде короткого имени локали('ru'/'en'/'de'/...)
---@return string
function common.GetLocale() end

---Возвращает список доступных для выбора локалей(раскладок клавиатуры). Каждая локаль описана коротким именем, например "ru" или "en".
---@return string|nil[]
function common.GetLocaleList() end

---Возвращает текущее значение локализации, заданное в global.cfg
---@return string
function common.GetLocalization() end

---Выдает количество микросекунд с момента старта системы, для точного таймера при профилировании производительности. Важно! Категорически НЕ рекомендуется использовать для измерения длинных временных интервалов или в целях отличных от отладки.
---@return number
function common.GetMks() end

---Возвращает Unix time (количество миллисекунд, прошедших с 1-го января 1970-го года), по дате и времени в формате типа LuaFullDateTime.
---@param y integer год
---@param m integer месяц (начиная с 1)
---@param d integer день
---@param h nil|integer час (необязательный параметр, по умолчанию 0)
---@param min nil|integer минута (необязательный параметр, по умолчанию 0)
---@param s nil|integer секунда (необязательный параметр, по умолчанию 0)
---@param ms nil|integer миллисекунда (необязательный параметр, по умолчанию 0)
---@param timeMs integer Unix time (время в миллисекундах прошедшее с 1-го января 1970 года)
function common.GetMsFromDateTime(y, m, d, h, min, s, ms, timeMs) end

---Возвращает параметры окна игры. См. также:  EVENT_POS_CONVERTER_CHANGED. Существует две системы координат экрана игры - виртуальная и реальная. Обе начинают отсчёт с нуля, от верхнего-левого угла клиентской области окна (а в полноэкранном режиме - экрана), обе используются для указания местоположений и размеров виджетов. Виртуальные единицы существуют специально для позиционирования виджетов, поэтому, они используются наиболее часто - по ним позиционируются виджеты, позиционируемые по WIDGET_ALIGN_LOW, WIDGET_ALIGN_HIGH, WIDGET_ALIGN_CENTER, WIDGET_ALIGN_BOTH. Реальные (абсолютные) единицы используются крайне редко, только для тех виджетов, которые позиционируются по WIDGET_ALIGN_LOW_ABS. Текущий виртуальный размер окна - по одной из осей равен базовому размеру окна, а по другой варьируется, в зависимости от пропорций окна (или экрана). Например, если пропорции окна шире чем 16:9, то виртуальная высота будет равна референсной, а ширина будет рассчитана относительно высоты и будет больше референсной. И наоборот, если пропорции окна уже 16:9, то виртуальная ширина будет равна референсной, а виртуальная высота будет рассчитана относительно ширины, и будет превышать референсную. Виртуальный размер экрана никогда не может быть меньше референсного. Реальный размер окна - размер в реальных пикселях операционной системы. Референсный размер окна - задается в настройках игры (Масштаб интерфейса) и хранится в global.cfg
function common.GetPosConverterParams() end

---Выдает вещественное псевдо-случайное число в диапазоне [min..max]. Дополнительные подробности:  LuaApiDetails (закрытая ссылка)
---@param min number минимальное значение
---@param max number максимальное значение
---@return number
function common.GetRandFloat(min, max) end

---Выдает целое псевдо-случайное число в диапазоне [min..max]. Дополнительные подробности:  LuaApiDetails (закрытая ссылка)
---@param min integer минимальное значение (включительно)
---@param max integer максимальное значение (включительно)
---@return integer
function common.GetRandInt(min, max) end

---Возвращает значение скриптовой переменной из конфигурационного файла. Поддерживаются типы: boolean, number, string. Значения задаются командой "script_var". Формат команды:
function common.GetScriptCfgVar() end

---Возвращает базовую информацию об бонусе комплектной экипировки.
---@param setBonusId SetBonusId идентификатор бонуса комплектной экипировки
---@return CommonGetSetBonusInfoResult
function common.GetSetBonusInfo(setBonusId) end

---Возвращает сокращённую (по первым буквам каждого присутствующего в строке-аргументе слова) строку. Может быть полезно, к примеру, для получения сокращённого имени шарда - например, если задать "Владыки Астрала", то вернётся "ВА". Аргумент должен иметь тип WString. DEPRECATED: Функция устарела и помечена к удалению. Используйте метод WString ToAbbr()
---@param text string строка
---@return shortText: WString|nil
function common.GetShortString(text) end

---Возвращает базовую информацию об Special характеристике.
---@param specialStatId SpecialStatId идентификатор Special-стата
---@return CommonGetSpecialStatInfoResult
function common.GetSpecialStatInfo(specialStatId) end

---Возвращает информацию по аддонам, которыми можно управлять. Нельзя управлять главным аддоном или аддонами, имеющими поддержку в коде. Список возможных состояний аддона смотри в  ADDON_STATE_*
---@return CommonGetStateManagedAddonsResult
function common.GetStateManagedAddons() end

---Получить имя стейта для аддона, в котором выполняется скрипт ("SystemState", "MainMenu", "Mission" и т.п.).
---@return string -
function common.GetStateName() end

---Возвращает группу связанных с состоянием звуковых ресурсов. Группа представляет собой userdata (RelatedSoundsLua). '''Внимание''' В режиме без звука возвращает nil
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedSoundsLua|nil
function common.GetStateRelatedSoundGroup(sysGroup, optional) end

---Возвращает группу связанных с состоянием текстовых ресурсов. Группа представляет собой userdata (RelatedTextsLua).
---@param sysGroup string|nil идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedTextsLua|nil
function common.GetStateRelatedTextGroup(sysGroup, optional) end

---Возвращает группу связанных с состоянием текстурных ресурсов. Группа представляет собой userdata (RelatedTexturesLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedTexturesLua|nil
function common.GetStateRelatedTextureGroup(sysGroup, optional) end

---Возвращает группу связанных со стейтом шаблонов виджетов. Группа представляет собой userdata (RelatedWidgetsLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedWidgetsLua|nil
function common.GetStateRelatedWidgetGroup(sysGroup, optional) end

---Возвращает информацию о текстуре.
---@param textureId TextureId идентификатор ресурса текстуры
---@return Таблица с полями:
function common.GetTextureInfo(textureId) end

---Возвращает размер текстуры, информация берется из ресурса (поля realWidth, realHeight)
---@param textureId TextureId идентификатор ресурса текстуры
---@return Таблица с полями:
function common.GetTextureSize(textureId) end

---Взводит флаг hit обработчика события кадра. Функцию нельзя вызвать находясь в обработчике события кадра. Если обработчика нет, то флаг все равно будет взведен, но не будет никак использоваться. Подробнее про обработчик события кадра смотри  common.RegisterFrameHandler.
---@return нет
function common.HitFrameHandler() end

---Получить состояние CapsLock. Для других клавиш смотри  common.IsKeyEnabled( vkCode )
---@return boolean
function common.IsCapsLockEnabled() end

---Возвращает true, если ValuedText фактически пустой и не содержит отображаемых символов, хотя может содержать какую-то форматирующую информацию. DEPRECATED: Функция устарела и помечена к удалению. Используйте метод ValuedText IsEmpty()
---@param valuedText ValuedText экземпляр ValuedText
---@return boolean
function common.IsEmptyValuedText(valuedText) end

---Возвращает пуста ли локализуемая строка. Аргумент должен иметь тип WString. DEPRECATED: Функция устарела и помечена к удалению. Используйте метод WString IsEmpty()
---@param text string локализуемая строка
---@return boolean
function common.IsEmptyWString(text) end

---Проверяет соответствуют ли характеристики друг другу. В качестве аргументов принимает идентификаторы характеристик SpecialStatId или ENUM_InnateStats
---@param firstStatId SpecialStatId|ENUM_InnateStats идентификатор первой характеристики
---@param secondStatId SpecialStatId|ENUM_InnateStats идентификатор второй характеристики
---@return boolean
function common.IsEqualStats(firstStatId, secondStatId) end

---Проверяет, содержит ли фраза для добивания запрещенные выражения. Возвращает выражения не прошедшие проверку.
---@param text string текст на проверку
---@return CommonIsFatalityPhraseFilteredResult
function common.IsFatalityPhraseFiltered(text) end

---Получить состояние виртуальной клавиши. См. подробнее в [http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx MSDN Virtual-Key Codes].
---@param vkCode integer числовое значение виртуальной клавиши ( http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx ) в качестве глобальных переменных определены следующие:
---@return boolean
function common.IsKeyEnabled(vkCode) end

---Возвращает true, если сейчас игрок находится на подписочном сервере. В остальных случаях (не на подписочном сервере, вообще не на сервере, не залогинился и т.п.) возвращает false.
---@return boolean
function common.IsOnPayToPlayShard() end

---Позволяет узнать, включен или выключен звук. Примечание: Состояние является константным в рамках одного запуска игры Примечание: При отключенном звуке API связанные со звуком (кроме данной) могут иметь неожиданное поведение (возврат nil без выполнения действий), их вызов не рекомендуется.
---@return boolean
function common.IsSoundEnabled() end

---Проверяет, содержатся ли в тексте запрещенные слова.
---@param text string текст на проверку
---@return boolean
function common.IsTextFiltered(text) end

---Позволяет узнать, включено или выключено отображение пользовательского интерфейса.
---@return boolean
function common.IsUIRenderEnabled() end

---Является ли объект ValuedObject-ом. DEPRECATED: Функция устарела и помечена к удалению, следует использовать apitype (apitype( value ) == "ValuedObjectLua")
---@param object any type любое значение
---@return boolean
function common.IsValuedObject(object) end

---Возвращает true, если переданный объект типа ValuedText. DEPRECATED: Функция устарела и помечена к удалению, следует использовать apitype (apitype( value ) == "ValuedText")
---@param value any type любое значение
---@return boolean
function common.IsValuedText(value) end

---Проверяет, является ли аргумент локализуемой строкой. DEPRECATED: Функция устарела и помечена к удалению, следует использовать apitype (apitype( value ) == "WString")
---@param value any type любое значение
---@return boolean
function common.IsWString(value) end

---Выводит список строк в консоль/чат с префиксом "script: " с уровнем ERROR. Переданные строки объединяются в одну. В качестве аргументов можно передавать как нелокализованные, так и локализованные строки. Параметр filter определяет фильтр логирования - если он не включен соответствующими командами (см. DebugGame), команда будет проигнорирована. Можно использовать глобальную переменную luaLogErrorShowAddonPath (см. DebugGame) для включения/выключения вывода пути до аддона.
---@param filter string фильтр логирования
---@param text01 string|string первый обязательный текстовый аргумент
---@return нет
function common.LogError(filter, text01) end

---Выводит список строк в консоль/чат с префиксом "script: ". Переданные строки объединяются в одну. В качестве аргументов можно передавать как нелокализованные, так и локализованные строки. Параметр filter определяет фильтр логирования - если он не включен соответствующими командами (см. DebugGame), команда будет проигнорирована. Можно использовать глобальную переменную luaLogInfoShowAddonPath (см. DebugGame) для включения/выключения вывода пути до аддона.
---@param filter string фильтр логирования
---@param text01 string|string первый обязательный текстовый аргумент
---@return нет
function common.LogInfo(filter, text01) end

---Выводит список строк в консоль/чат с префиксом "script: " с уровнем WARNING. Переданные строки объединяются в одну. В качестве аргументов можно передавать как нелокализованные, так и локализованные строки. Параметр filter определяет фильтр логирования - если он не включен соответствующими командами (см. DebugGame), команда будет проигнорирована. Можно использовать глобальную переменную luaLogWarningShowAddonPath (см. DebugGame) для включения/выключения вывода пути до аддона.
---@param filter string фильтр логирования
---@param text01 string|string первый обязательный текстовый аргумент
---@return нет
function common.LogWarning(filter, text01) end

---Запускает музыку по алиасу, указанному в поле musicParameters в "\Interface\System\UIGameRoot.(UIGameRoot).xdb". Музыка запускается с параметрами, соответствующими этому алиасу.
---@param musicAlias string алиас музыки
---@return нет
function common.PlayMusic(musicAlias) end

---Немедленно выходит из игры, независимо от текущего состояния. Эмулирует разрыв соединения аналогично выходу через системное меню (в оконном режиме).
---@return нет
function common.QuitGame() end

---Подписывает обработчик аддона на указанное событие. На одно событие может быть несколько обработчиков. Функция-обработчик обязана соответствовать  шаблону Также обработчику можно сопоставить таблицу filter. Когда инициируется скриптовое сообщение, и обработка доходит до данного зарегистрированного обработчика, то проверяется, что в инициированном сообщении имеются точно такие же поля, точно с такими же значениями, что и в фильтре. И только в этом случае управление передаётся обработчику. Допустимые типы ключей в filter: number(int), string. Допустимые типы значений в filter: number, string, boolean, wstring, indexable_userdata. filter - необязательный параметр, то есть его можно вообще не указывать. В этом случае поля сообщения не будут проверяться на соответствие для такого обработчика и управление перейдёт в него в любом случае, при любых параметрах сообщения. Существует ряд событий для которых используется система персональных событий (personalEvents). Для формирования такого события для конкретной игровой сущности (objectId) необходимо включить для нее данное событие. Это можно  сделать двумя способами: автоматически при регистрации события с надлежащим фильтром при registerPersonal == true (по умолчанию) или вручную через  common.EnablePersonalEvent( sysEventName, objectId ) . Список таких событий можно посмотреть в описании данной функции. Для  common.RegisterEventHandler() есть обратный метод  common.UnRegisterEventHandler(). Если от обработчика сообщения необходимо отказаться, то необходимо передать параметры идентичные таковым при регистрации.
---@param eventFunction function функция-обработчик, должна соответствовать шаблону
---@param sysEventName string название события
---@param filter table|nil фильтр сообщения или nil (по умолчанию, без фильтрации)
---@param registerPersonal boolean|nil автоматически активировать personalEvents если это применимо (по умолчанию true).
---@return нет
function common.RegisterEventHandler(eventFunction, sysEventName, filter, registerPersonal) end

---Подписывает обработчик аддона на событие кадра. У аддона может быть только один обработчик события кадра. Функция-обработчик обязана соответствовать  шаблону Обработчик можно подписать двумя способами:
---@param handlerFunction function функция-обработчик соответствующая шаблону
---@param needHit boolean требуется ли взводить флаг для вызова обработчика
---@return нет
function common.RegisterFrameHandler(handlerFunction, needHit) end

---Подписывает обработчик аддона на указанную реакцию. На одну реакцию может быть подписано несколько обработчиков. Функция-обработчик принимает один параметр - таблицу.
---@param reactionFunction function функция-обработчик
---@param sysReactionName string название реакции
---@return CommonRegisterReactionHandlerResult
function common.RegisterReactionHandler(reactionFunction, sysReactionName) end

---Посылка события с данным именем и параметрами. Если функция вызвана из встроенного аддона - событие будет отправлено только встроенным аддонам, из пользовательского - только пользовательским. Для имени события настоятельно рекомендуется использовать формат SCRIPT_[A-Z_]*. Имя не должно быть пустым. Для таблицы eventData имеются следующие ограничения:
---@param eventName string идентификатор события, непустая строка
---@param eventParams table таблица с параметрами события, произвольная с учетом ограничений перечисленных выше
---@return нет
function common.SendEvent(eventName, eventParams) end

---Задает текущий курсор, курсор берется по указанному имени (alias) из ресурсной системы. Дополнительные подробности:  LuaApiDetails (закрытая ссылка)
---@param name string псевдоним (alias) курсора
---@return нет
function common.SetCursor(name) end

---Вызывает мигание иконкой в панели задач до момента получения приложением фокуса (т.е. становления окна активным).
---@param flashCount integer количество миганий (вспышек)
---@return нет
function common.SetIconFlash(flashCount) end

---Устанавливает текущее значение раскладки клавиатуры.
---@param locale string|integer короткое имя или индекс локали из списка полученного из GetLocaleList
---@return нет
function common.SetLocale(locale) end

---Загружает указанный аддон. Можно загружать только не загруженные аддоны. Нельзя использовать комбинацию Unload+Load, вместо нее надлежит использовать Reload.
---@param name string имя аддона
---@return нет
function common.StateLoadManagedAddon(name) end

---Перезагружает указанный аддон. Можно перезагружать только managed аддоны в состоянии LOADED.
---@param name string имя аддона
---@return нет
function common.StateReloadManagedAddon(name) end

---Выгружает указанный аддон. Нельзя выгружать главный аддон или аддоны, имеющие поддержку в коде.
---@param name string имя аддона
---@return нет
function common.StateUnloadManagedAddon(name) end

---Отписывает аддон от обработки события (отписывает все его обработчики). DEPRECATED: Функция устарела, признана багоопасной и помечена к удалению
---@param sysEventName string название события
---@return нет
function common.UnRegisterEvent(sysEventName) end

---Отписывает обработчик события аддона (указанную функцию). См. подробнее в  common.RegisterEventHandler( eventFunction, sysEventName, filter, unregisterPersonal ).
---@param eventHandler function функция-обработчик
---@param sysEventName string название события
---@param filter table|nil фильтр сообщения или nil (по умолчанию, без фильтрации)
---@param unregisterPersonal boolean|nil автоматически деактивировать personalEvents если это применимо (по умолчанию true).
---@return нет
function common.UnRegisterEventHandler(eventHandler, sysEventName, filter, unregisterPersonal) end

---Удаляет обработчик события кадра. Если такового нет - ничего не делает. Подробнее про обработчик события кадра смотри  common.RegisterFrameHandler.
---@return нет
function common.UnRegisterFrameHandler() end

---Отписывает аддон от реакции. Все обработчики будут удалены. DEPRECATED: Функция устарела, признана багоопасной и помечена к удалению
---@param sysReactionName string название реакции
---@return нет
function common.UnRegisterReaction(sysReactionName) end

---Отписывает обработчик аддона от указанной реакции. На одну реакцию может быть подписано несколько обработчиков.
---@param reactionFunction function функция-обработчик
---@param sysReactionName string название реакции
---@return нет
function common.UnRegisterReactionHandler(reactionFunction, sysReactionName) end
