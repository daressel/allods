---@meta

---@class missionLib
mission = {}

---@class MissionGetChatInputSimilarCommandsResult
---@field alias string (локализованный) алиас команды
---@field sysId string системный идентификатор команды

---@class MissionGetLoginLotteryInfoResult
---@field comboCounter CurrencyId валюта, которая используется как счетчик количества дней которые аватар заходил в игру подряд
---@field prizes tables[] список описаний призов, индексированная целыми числами (начиная с 0) таблица, каждое значение - таблица с полями:
---@field daysToReceive integer количество последовательных входов за которые нужно выдавать валюту
---@field prizes table список призов, таблица индексированная целыми числами (начиная от 0), значения - ItemId предметов, аналогичных призовым (см. itemLib.GetItemInfo( itemId))
---@field counter CurrencyId валюта, выдаваемая за вход в игру daysToReceive дней подряд; за каждую единицу этой валюты можно получить все предметы указанные в prizes

---@class MissionGetLotteryHistoryResult
---@field avatar string имя победителя
---@field lotteryTime integer начало розыгрыша, в UTC
---@field prize ObjectId полученный приз
---@field state integer состояние лотереи
---@field lotteryResource table общая информация о лотерее, поля:
---@field maxWinners integer количество разыгрываемых призов
---@field prizes table список возможных призов, каждый элемент - ObjectId предмета-приза
---@field ticketCounter CurrencyId идентификатор альтернативной валюты-счётчика для числа активированных билетов
---@field ticketResource ObjectId идентификатор предмета-лотерейного билета

---@class MissionGetLotteryInfoResult
---@field state integer состояние лотереи
---@field tickets table список (индексированная целыми начиная с нуля таблица) номеров (integer) активированных билетов
---@field winners table список выигравших билетов и призов, каждый элемент - таблица с полями:
---@field key integer номер выигравшего билета
---@field value ObjectId идентификатор предмета-приза
---@field lotteryResource table общая информация о лотерее, поля:
---@field maxWinners integer количество разыгрываемых призов
---@field prizes table список возможных призов, каждый элемент - ObjectId предмета-приза
---@field ticketCounter CurrencyId идентификатор альтернативной валюты-счётчика для числа активированных билетов
---@field ticketResource ObjectId идентификатор предмета-лотерейного билета
---@field consolationPrizes table список, начинающийся с 0, с информацией об утешительных призах, поля в элементах:
---@field positions integer позиция
---@field prizes table список возможных призов, каждый элемент - ObjectId предмета-утешительного приза

---@class MissionGetWeakFactionBonusResult
---@field experienceFactor number во сколько раз приходит больше опыта

---@class MissionLoginLotteryReceivePrizesResult
---@field comboCounter CurrencyId валюта, которая используется как счетчик количества дней которые аватар заходил в игру подряд
---@field prizes tables[] список описаний призов, индексированная целыми числами (начиная с 0) таблица, каждое значение - таблица с полями:
---@field daysToReceive integer количество последовательных входов за которые нужно выдавать валюту
---@field counter CurrencyId валюта, выдаваемая за вход в игру; за каждую единицу можно получить все предметы указанные в prizes
---@field prizes table список призов, таблица индексированная целыми числами (начиная от 0), значения - ItemId предметов, аналогичных призовым (см. itemLib.GetItemInfo( itemId))

---Попытаться отменить завершение миссии после mission.Logout().
---@return нет
function mission.CancelLogout() end

---Удаляет всех персонажей со сцены.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@return нет
function mission.ClearCharacterScene(index) end

---Очищает строку ввода с префиксами/слеш-командами.
function mission.ClearChatInput() end

---Примеривает вещь на модели персонажа в указанной сцене. Примерять вещи можно только на главном игроке и инспектируемом игроке. Примерить можно только одну вещь. Чтобы сбросить примерку, передайте itemId == nil.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param items nil|ObjectId[] индексированный с 0 идентификатор вещей. Если nil, то ничего не примериваем.
---@return нет
function mission.DressCharacterScene(index, items) end

---Освободить ресурсы портрета данного размера в указанном слоте. См. также  mission.SetPortraitBackgroundTexture и  EVENT_MISSION_FREE_PORTRAIT_SLOT. Также скрипт должен очистить фоновые слои для всех контролов, которые использовали указанный портрет.
---@param slotIndex integer индекс слота, 0..3 для нормальных портретов, 0..15 для маленьких
---@param isSmall boolean портрет в маленьком разрешении
---@return нет
function mission.FreePortrait(slotIndex, isSmall) end

---Возвращает величину поворота (yaw) камеры в радианах.
function mission.GetCameraDirection() end

---Возвращает состояние строки ввода с префиксами/слеш-командами. Строка ввода получается в результате разбора исходного текста на наличие слеш-команд.
---@param sysCmdType string тип команды (ее идентификатор)
---@param hasPrefix boolean есть ли префикс (и слеш-команды)
---@param cmdName string имя активной слеш-команды (в случае наличия префикса)
---@param cmdArg string аргумент активной слеш-команды (или пустая строка)
---@param text string текст, оставшийся после разбора и выделения слеш-команд
function mission.GetChatInput(sysCmdType, hasPrefix, cmdName, cmdArg, text) end

---Возвращает список команд, являющихся подходящими вариантами-продолжениями для переданной строки. Правила описаны на странице: [:InterfaceChat#head-cac61000afaf8de829a2e1c3c58685451ab696d1: InterfaceChat, строка ввода текста].
---@param text string строка, для которой надо вернуть похожие команды
---@return MissionGetChatInputSimilarCommandsResult
function mission.GetChatInputSimilarCommands(text) end

---Возвращает некое время в формате LuaFullDateTime, от которого можно считать дельту для глобальных событий. Примечание: Является серверным временем пересчитанным в часовой пояс клиента.
---@return таблица LuaFullDateTime
function mission.GetGlobalDateTime() end

---Возвращает некое время в формате Unix time, от которого можно считать дельту для глобальных событий. Примечание: Является серверным временем пересчитанным в часовой пояс клиента.
---@return number
function mission.GetGlobalDateTimeMs() end

---Общая информация о вознаграждениях за вход в игру. Содержит только неизменные (в рамках одного календарного ивента) параметры, информация об изменяемых параметрах (счётчики посещений и заслуженных призов) передаётся через механизм альтернативных валют (см. поля comboCounter и counter).
---@return MissionGetLoginLotteryInfoResult
function mission.GetLoginLotteryInfo() end

---Возвращает информацию о победителях в лотерее "Лото".
---@return MissionGetLotteryHistoryResult
function mission.GetLotteryHistory() end

---Возвращает информацию о лотерее "Лото".
---@return MissionGetLotteryInfoResult
function mission.GetLotteryInfo() end

---Возвращает максимально допустимое количество сцен для отображения персонажей.
---@return integer
function mission.GetMaxCharacterSceneCount() end

---Возвращает количество дней данного месяца/года
---@param month integer месяц
---@param year integer год
function mission.GetMonthDaysCount(month, year) end

---Возвращает в миллисекундах время, прошедшее с начала текущей игры (сессии).
function mission.GetPlayTimeMs() end

---Возвращает имя шарда, на котором происходит игра.
---@return string
function mission.GetShardName() end

---Возвращает спелле вытаскивания главного игрока, если персонаж застрял, если такая возможность доступна.
---@return SpellId|nil
function mission.GetUnstuckSpell() end

---Возвращает информацию о бонусах более слабой фракции на шарде.
---@return MissionGetWeakFactionBonusResult
function mission.GetWeakFactionBonus() end

---Возвращает информацию о более слабой фракции на шарде, которой выдаются какие-то дополнительные бонусы.
---@return FactionId|nil
function mission.GetWeakFactionId() end

---Серверное время в формате unixTimeMs. Обновляется 1 раз в кадр.
function mission.GetWorldTimeMs() end

---Получить вознаграждения за входы в игру.
---@param currencyId CurrencyId идентификатор валюты, служащей счётчиком полученных призов (см. mission.LoginLotteryReceivePrizes( currencyId ), поля counter)
---@return MissionLoginLotteryReceivePrizesResult
function mission.LoginLotteryReceivePrizes(currencyId) end

---Попытаться завершить миссию (выйти в экран работы с персонажами). Если игрок пытается выйти из миссии, но находится в бою, выход будет отложен на некоторое время (прийдёт EVENT_AVATAR_WILL_BE_REMOVED). Если ничего не делать, то через некоторое время аватар будет уничтожен. Однако в это время можно отменить выход из миссии с помощью (mission.CancelLogout()). В этом случае прийдёт EVENT_AVATAR_LOGOUT_CANCELLED.
---@return нет
function mission.Logout() end

---Запрашивает с сервера актуальный список победителей. При обычном сценарии использования не нужен.
---@return нет
function mission.RequestLotteryHistory() end

---Сбрасывает поворот персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@return нет
function mission.ResetCharacterSceneRotation(index) end

---Поворачивает персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param angle number на сколько радиан повернуть
---@return нет
function mission.RotateCharacterScene(index, angle) end

---Установить декал для AEMark
---@param decalId DecalObjectId идентификатор декала
---@return нет
function mission.SetAEMarkDecal(decalId) end

---Установить радиус AEMark
---@param minRange number минимальная область действия спела AEMark (в метрах)
---@return нет
function mission.SetAEMarkMinRange(minRange) end

---Установить текстуру, отображаемую при указании в точку, выходящую за область действия спела
---@param decalId DecalObjectId идентификатор декала
---@return нет
function mission.SetAEMarkOutOfRangeDecal(decalId) end

---Установить радиус AEMark
---@param radius number радиус AEMark (в метрах)
---@return нет
function mission.SetAEMarkRadius(radius) end

---Установить радиус AEMark
---@param range number область действия спела AEMark (в метрах)
---@return нет
function mission.SetAEMarkRange(range) end

---Назначить VisObject для AEMark
---@param visObjectId VisObjectId идентификатор объекта VisObject
---@return нет
function mission.SetAEMarkVisObj(visObjectId) end

---Назначить свойства для AEMark типа AEMarkSector
---@param range number длина сектора, в метрах
---@param angle number угол раствора сектора, в радианах
---@return нет
function mission.SetAESectorProps(range, angle) end

---Назначить VisObject-ы для AEMark типа AEMarkSector
---@param fillerObjId VisObjectId|nil идентификатор объекта VisObject для заполнения сектора
---@param leftObjId VisObjectId|nil идентификатор объекта VisObject для левого края сектора
---@param rightObjId VisObjectId|nil идентификатор объекта VisObject для правого края сектора
---@param centerObjId VisObjectId|nil идентификатор объекта VisObject для середины сектора
---@return нет
function mission.SetAESectorVisObj(fillerObjId, leftObjId, rightObjId, centerObjId) end

---Показывает указанного персонажа в данном контроле-3D. Можно создавать несколько сцен для показа персонажей. Количество допустимых сцен ограничено, для выбора сцены используется index в диапазоне [0..GetMaxCharacterSceneCount() - 1].
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtCharacterControl3D Control3DSafe контрол, в котором должен отображаться персонаж
---@param unitId ObjectId|nil идентификатор отображаемого юнита, или nil  для очистки
---@return нет
function mission.SetCharacterScene(index, wtCharacterControl3D, unitId) end

---Поворачивает персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param pos table таблица с относительной позицией персонажа, поля:
---@param posX number смещение в сцене по X
---@param posY number смещение в сцене по Y
---@param posZ number смещение в сцене по Z
---@return нет
function mission.SetCharacterScenePosition(index, pos, posX, posY, posZ) end

---Масштабирует персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param scale number коэффициент масштабирования
---@return нет
function mission.SetCharacterSceneScaleFactor(index, scale) end

---Если isSmooth = true, то модель в 3D-view-ах (окно персонажа, итеммол, конюшня) будет поворачиваться плавно с анимацией поворота. Иначе поворот будет моментальный и без анимации.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param isSmooth boolean если true (по умолчанию), то поворачивать персонажа в 3D-view-е с анимацией
---@return нет
function mission.SetCharacterSceneSmoothRotation(index, isSmooth) end

---Меняет состояние строки ввода чата с префиксами/слеш-командами. Исходная строка разбирается на предмет наличия в ней слеш-команд, текста и информации о предметах.
---@param wtEditLine EditLineSafe строка ввода
function mission.SetChatInputData(wtEditLine) end

---Устанавливает максимальное количество записей в истории ввода в строку чата. Начальное значение 10, предельное 100.
---@param limit integer максимальное количество записей
function mission.SetChatInputHistoryMaxSize(limit) end

---Делает переход на шаг вперед при обзоре истории ввода и возвращает строку ввода чата в предыдущее состояние.
---@param wtEditLine EditLineSafe строка ввода
function mission.SetChatInputNextData(wtEditLine) end

---Делает переход на шаг назад при обзоре истории ввода и возвращает строку ввода чата в предыдущее состояние.
---@param wtEditLine EditLineSafe строка ввода
function mission.SetChatInputPrevData(wtEditLine) end

---Меняет состояние строки ввода с префиксами/слеш-командами. Исходная строка разбирается на предмет наличия в ней слеш-команд.
---@param text string исходная строка (чаще всего из EditLine)
---@param cursorPos integer позиция курсора
function mission.SetChatInputText(text, cursorPos) end

---Показывает босса гильдии главного игрока в данном контроле-3D. Так же позволяет делать предмостр боссов при выборе босса для гильдии если указать параметры bossIndex, stateIndex.
---@param index number 1]
---@param wtCharacterControl3D Control3DSafe -- контрол, в котором должен отображаться босс
---@param bossIndex integer|nil -- необязательынй параметр, индекс босса полученный из guildBossLib.GetVariations()
---@param stateIndex integer|nil -- необязательынй параметр, индекс состояния босса, полученный guildBossLib.GetVariations() из списка previewStates
---@return нет
function mission.SetGuildBossScene(index, wtCharacterControl3D, bossIndex, stateIndex) end

---Ставит в заданную точку или убирает модель (VisObjectTemplate - в данных) маркера.
---@param markerId VisObjectId|nil- модель маркера или nil, если маркер удаляется
---@param pos table|nil таблица с позицией маркера или nil, если позиция неважна (маркер удаляется), поля:
---@param posX number
---@param posY number
---@param posZ number
---@return нет
function mission.SetMarkerObject(markerId, pos, posX, posY, posZ) end

---Показывает указанного маунта главного игрока в данном контроле-3D. Также см. mission.SetCharacterScene( index, wtCharacterControl3D, unitId ).
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtCharacterControl3D Control3DSafe контрол, в котором должен отображаться персонаж
---@param mountSkinId ObjectId идентификатор отображаемого скина маунта главного игрока
---@return нет
function mission.SetMountScene(index, wtCharacterControl3D, mountSkinId) end

---Сгенерировать портрет юнита и поместить его текстуру в фоновый слой указанного контрола. См. также  mission.FreePortrait,  EVENT_MISSION_FREE_PORTRAIT_SLOT и  Portraits.
---@param slotIndex integer индекс слота, 0..3 для нормальных портретов, 0..15 для маленьких
---@param isSmall boolean задавать ли портрет в маленьком разрешении
---@param wtPortrait WidgetSafe контрол, для фоновового слоя которого будет задана текстура портрета
---@param unitId ObjectId идентификатор юнита, для которого задается портрет
---@return нет
function mission.SetPortraitBackgroundTexture(slotIndex, isSmall, wtPortrait, unitId) end

---Показывает визуальный объект в данном контроле-3D.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtControl3D Control3DSafe контрол, в котором должен отображаться объект
---@param visObjectId VisObjectId|AliasVisObjectId идентификатор визуального объекта (эффекта) или его обвязки
---@return нет
function mission.SetVisObjectScene(index, wtControl3D, visObjectId) end

---Показать/скрыть AEMark типа AEMarkDecal
---@param show boolean показать/скрыть AEMark типа AEMarkDecal
---@return нет
function mission.ShowAEMark(show) end

---Показать/скрыть AEMark типа AEMarkSector
---@param show boolean показать/скрыть AEMark типа AEMarkSector
---@return нет
function mission.ShowAESector(show) end
