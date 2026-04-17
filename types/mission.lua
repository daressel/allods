---@meta

--- CategoryMission
--- Функции Lua Api библиотеки mission.

---@class missionLib
mission = {}

--- Попытаться отменить завершение миссии после mission.Logout().
function mission.CancelLogout() end

--- Удаляет всех персонажей со сцены.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
function mission.ClearCharacterScene(index) end

--- Очищает строку ввода с префиксами/слеш-командами.
function mission.ClearChatInput() end

--- Примеривает вещь на модели персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param items nil индексированный с 0 идентификатор вещей. Если nil, то ничего не примериваем.
function mission.DressCharacterScene(index, items) end

--- Освободить ресурсы портрета данного размера в указанном слоте. См. также  mission.SetPortraitBackgroundTexture и  EVENT_MISSION_FREE_PORTRAIT_SLOT.
---@param slotIndex integer индекс слота, 0..3 для нормальных портретов, 0..15 для маленьких
---@param isSmall boolean портрет в маленьком разрешении
function mission.FreePortrait(slotIndex, isSmall) end

--- Возвращает величину поворота (yaw) камеры в радианах.
function mission.GetCameraDirection() end

--- Возвращает состояние строки ввода с префиксами/слеш-командами. Строка ввода получается в результате разбора исходного текста на наличие слеш-команд.
function mission.GetChatInput() end

--- Возвращает список команд, являющихся подходящими вариантами-продолжениями для переданной строки. Правила описаны на странице: [:InterfaceChat#head-cac61000afaf8de829a2e1c3c58685451ab696d1: InterfaceChat, строка ввода текста].
---@param text WString строка, для которой надо вернуть похожие команды
---@return table
function mission.GetChatInputSimilarCommands(text) end

--- Возвращает некое время в формате LuaFullDateTime, от которого можно считать дельту для глобальных событий.
---@return table
function mission.GetGlobalDateTime() end

--- Возвращает некое время в формате Unix time, от которого можно считать дельту для глобальных событий.
---@return number
function mission.GetGlobalDateTime() end

--- Общая информация о вознаграждениях за вход в игру. Содержит только неизменные (в рамках одного календарного ивента) параметры, информация об изменяемых параметрах (счётчики посещений и заслуженных призов) передаётся через механизм альтернативных валют (см. поля comboCounter и counter).
---@return table
function mission.GetLoginLotteryInfo() end

--- Возвращает информацию о победителях в лотерее "Лото".
---@return table
function mission.GetLotteryHistory() end

--- Возвращает информацию о лотерее "Лото".
---@return table
function mission.GetLotteryInfo() end

--- Возвращает максимально допустимое количество сцен для отображения персонажей.
---@return number
function mission.GetMaxCharacterSceneCount() end

--- Возвращает количество дней данного месяца/года
---@param month integer месяц
---@param year integer год
function mission.GetMonthDaysCount(month, year) end

--- Возвращает в миллисекундах время, прошедшее с начала текущей игры (сессии).
function mission.GetPlayTimeMs() end

--- Возвращает имя шарда, на котором происходит игра.
---@return WString
function mission.GetShardName() end

--- Возвращает спелле вытаскивания главного игрока, если персонаж застрял, если такая возможность доступна.
---@return SpellId|nil
function mission.GetUnstuckSpell() end

--- Возвращает информацию о бонусах более слабой фракции на шарде.
---@return table|nil
function mission.GetWeakFactionBonus() end

--- Возвращает информацию о более слабой фракции на шарде, которой выдаются какие-то дополнительные бонусы.
---@return FactionId|nil
function mission.GetWeakFactionId() end

--- Серверное время в формате unixTimeMs. Обновляется 1 раз в кадр.
function mission.GetWorldTimeMs() end

--- Получить вознаграждения за входы в игру.
---@param currencyId CurrencyId идентификатор валюты, служащей счётчиком полученных призов (см. mission.LoginLotteryReceivePrizes( currencyId ), поля counter)
---@return table
function mission.LoginLotteryReceivePrizes(currencyId) end

--- Попытаться завершить миссию (выйти в экран работы с персонажами).
function mission.Logout() end

--- Запрашивает с сервера актуальный список победителей. При обычном сценарии использования не нужен.
function mission.RequestLotteryHistory() end

--- Сбрасывает поворот персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
function mission.ResetCharacterSceneRotation(index) end

--- Поворачивает персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param angle number на сколько радиан повернуть
function mission.RotateCharacterScene(index, angle) end

--- Установить декал для AEMark
---@param decalId DecalObjectId идентификатор декала
function mission.SetAEMarkDecal(decalId) end

--- Установить радиус AEMark
---@param minRange float минимальная область действия спела AEMark (в метрах)
function mission.SetAEMarkMinRange(minRange) end

--- Установить текстуру, отображаемую при указании в точку, выходящую за область действия спела
---@param decalId DecalObjectId идентификатор декала
function mission.SetAEMarkOutOfRangeDecal(decalId) end

--- Установить радиус AEMark
---@param radius float радиус AEMark (в метрах)
function mission.SetAEMarkRadius(radius) end

--- Установить радиус AEMark
---@param range float область действия спела AEMark (в метрах)
function mission.SetAEMarkRange(range) end

--- Назначить VisObject для AEMark
---@param visObjectId VisObjectId идентификатор объекта VisObject
function mission.SetAEMarkVisObj(visObjectId) end

--- Назначить свойства для AEMark типа AEMarkSector
---@param range number длина сектора, в метрах
---@param angle number угол раствора сектора, в радианах
function mission.SetAESectorProps(range, angle) end

--- Назначить VisObject-ы для AEMark типа AEMarkSector
---@param fillerObjId VisObjectId|nil идентификатор объекта VisObject для заполнения сектора
---@param leftObjId VisObjectId|nil идентификатор объекта VisObject для левого края сектора
---@param rightObjId VisObjectId|nil идентификатор объекта VisObject для правого края сектора
---@param centerObjId VisObjectId|nil идентификатор объекта VisObject для середины сектора
function mission.SetAESectorVisObj(fillerObjId, leftObjId, rightObjId, centerObjId) end

--- Показывает указанного персонажа в данном контроле-3D. Можно создавать несколько сцен для показа персонажей.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtCharacterControl3D Control3DSafe контрол, в котором должен отображаться персонаж
---@param unitId ObjectId|nil идентификатор отображаемого юнита, или nil  для очистки
function mission.SetCharacterScene(index, wtCharacterControl3D, unitId) end

--- Поворачивает персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param pos table таблица с относительной позицией персонажа, поля:
---@param posX float смещение в сцене по X
---@param posY float смещение в сцене по Y
---@param posZ float смещение в сцене по Z
function mission.SetCharacterScenePosition(index, pos, posX, posY, posZ) end

--- Масштабирует персонажа в указанной сцене.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param scale float коэффициент масштабирования
function mission.SetCharacterSceneScaleFactor(index, scale) end

--- Если isSmooth = true, то модель в 3D-view-ах (окно персонажа, итеммол, конюшня) будет поворачиваться плавно с анимацией поворота. Иначе поворот будет моментальный и без анимации.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param isSmooth boolean если true (по умолчанию), то поворачивать персонажа в 3D-view-е с анимацией
function mission.SetCharacterSceneSmoothRotation(index, isSmooth) end

--- Задает аргумент слеш-команды для строки ввода.
---@param arg WString аргумент команды
function mission.SetChatInputArg(arg) end

--- Меняет состояние строки ввода чата с префиксами/слеш-командами. Исходная строка разбирается на предмет наличия в ней слеш-команд, текста и информации о предметах.
---@param wtEditLine EditLineSafe строка ввода
function mission.SetChatInputData(wtEditLine) end

--- Устанавливает максимальное количество записей в истории ввода в строку чата. Начальное значение 10, предельное 100.
---@param limit integer максимальное количество записей
function mission.SetChatInputHistoryMaxSize(limit) end

--- Делает переход на шаг вперед при обзоре истории ввода и возвращает строку ввода чата в предыдущее состояние.
---@param wtEditLine EditLineSafe строка ввода
function mission.SetChatInputNextData(wtEditLine) end

--- Делает переход на шаг назад при обзоре истории ввода и возвращает строку ввода чата в предыдущее состояние.
---@param wtEditLine EditLineSafe строка ввода
function mission.SetChatInputPrevData(wtEditLine) end

--- Назначить цель слеш-команды для строки ввода(для межсервера).
---@param uniqueId UniqueId уникальный идентификатор персонажа
function mission.SetChatInputTarget(uniqueId) end

--- Меняет состояние строки ввода с префиксами/слеш-командами. Исходная строка разбирается на предмет наличия в ней слеш-команд.
---@param text WString исходная строка (чаще всего из EditLine)
---@param cursorPos integer позиция курсора
function mission.SetChatInputText(text, cursorPos) end

--- Задает тип слеш-команды (префикс) для строки ввода. Работает только для команд с префиксами. Текст слеш-команды при этом очищается.
---@param sysCmdType string тип команды (ее идентификатор)
function mission.SetChatInputType(sysCmdType) end

--- Показывает босса гильдии главного игрока в данном контроле-3D. Так же позволяет делать предмостр боссов при выборе босса для гильдии если указать параметры bossIndex, stateIndex.
---@param index integer 1]
---@param wtCharacterControl3D Control3DSafe
---@param bossIndex integer
---@param stateIndex integer
function mission.SetGuildBossScene(index, wtCharacterControl3D, bossIndex, stateIndex) end

--- Ставит в заданную точку или убирает модель (VisObjectTemplate - в данных) маркера.
---@param markerId VisObjectId
---@param pos table|nil таблица с позицией маркера или nil, если позиция неважна (маркер удаляется), поля:
---@param posX double
---@param posY double
---@param posZ double
function mission.SetMarkerObject(markerId, pos, posX, posY, posZ) end

--- Показывает указанного маунта главного игрока в данном контроле-3D.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtCharacterControl3D Control3DSafe контрол, в котором должен отображаться персонаж
---@param mountSkinId ObjectId идентификатор отображаемого скина маунта главного игрока
function mission.SetMountScene(index, wtCharacterControl3D, mountSkinId) end

--- Сгенерировать портрет юнита и поместить его текстуру в фоновый слой указанного контрола. См. также  mission.FreePortrait,  EVENT_MISSION_FREE_PORTRAIT_SLOT и  Portraits.
---@param slotIndex integer индекс слота, 0..3 для нормальных портретов, 0..15 для маленьких
---@param isSmall boolean задавать ли портрет в маленьком разрешении
---@param wtPortrait WidgetSafe контрол, для фоновового слоя которого будет задана текстура портрета
---@param unitId ObjectId идентификатор юнита, для которого задается портрет
function mission.SetPortraitBackgroundTexture(slotIndex, isSmall, wtPortrait, unitId) end

--- Показывает визуальный объект в данном контроле-3D.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtControl3D Control3DSafe контрол, в котором должен отображаться объект
---@param visObjectId VisObjectId идентификатор визуального объекта (эффекта) или его обвязки
function mission.SetMountScene(index, wtControl3D, visObjectId) end

--- Показать/скрыть AEMark типа AEMarkDecal
---@param show boolean показать/скрыть AEMark типа AEMarkDecal
function mission.ShowAEMark(show) end

--- Показать/скрыть AEMark типа AEMarkSector
---@param show boolean показать/скрыть AEMark типа AEMarkSector
function mission.ShowAESector(show) end

-- Events

--- Событие присылается, если игрок отменил выход из миссии (с помощью mission.CancelLogout()).
EVENT_AVATAR_LOGOUT_CANCELLED = "EVENT_AVATAR_LOGOUT_CANCELLED"

--- Событие присылается раз в секунду после того, как если игрок пытается выйти из миссии (mission.Logout()), но находится в бою. В этом случае выход будет отложен на некоторое время.
EVENT_AVATAR_WILL_BE_REMOVED = "EVENT_AVATAR_WILL_BE_REMOVED"

--- Событие посылается каждый раз, когда у камеры меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
EVENT_CAMERA_DIRECTION_CHANGED = "EVENT_CAMERA_DIRECTION_CHANGED"

--- Событие, уведомляющее о невозможности выхода из игры в бою.
EVENT_CANT_LEAVE_GAME_IN_COMBAT = "EVENT_CANT_LEAVE_GAME_IN_COMBAT"

--- Уведомление, что был освобожден слот с портретом. Скрипт обязан очистить (заменить на валидные) текстуры фонового слоя для всех виджетов, которые использовали данный слот. См. также:  mission.FreePortrait и mission.SetPortraitBackgroundTexture.
EVENT_MISSION_FREE_PORTRAIT_SLOT = "EVENT_MISSION_FREE_PORTRAIT_SLOT"

--- Событие, информирующее о инициализации загрузки миссии (все аддоны готовы к использованию). После этого события приходят ещё и  EVENT_ADDON_LOAD_STATE_CHANGED.
EVENT_MISSION_INITIALIZED = "EVENT_MISSION_INITIALIZED"

--- Событие, информирующее о прогрессе загрузки миссии.
EVENT_LOADING_PROGRESS = "EVENT_LOADING_PROGRESS"

--- Уведомление об изменении спелла вытаскивания игрока, если он застрял.
EVENT_UNSTUCK_SPELL_EFFECT = "EVENT_UNSTUCK_SPELL_EFFECT"

--- Оповещение о начале эффекта для спелла вытаскивания игрока, если он застрял.
EVENT_UNSTUCK_SPELL_CHANGED = "EVENT_UNSTUCK_SPELL_CHANGED"
