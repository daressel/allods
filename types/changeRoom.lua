---@meta

--- CategoryChangeRoom
--- Функции и события Lua API библиотеки changeRoom, предназначенный для работы с парикмахерской.

---@class changeRoomLib
changeRoom = {}

--- Выставляет признак, что на экране создания персонажей их нужно показывать в шлемах (по умолчанию персонажи показываются без шлемов).
---@param show boolean показывать ли шлем на персонаже
function changeRoom.ChargenShowHelm(show) end

--- Функция возвращает информацию об указанном шаблоне аватара. Вместе с шаблоном возвращается информация о вариациях персонажей.
---@param isMale boolean true, если требуются настройки по мужскому персонажу, иначе по женскому
---@return table|nil
function changeRoom.GetAvatarTemplate(isMale) end

--- Возвращает цены на услуги парикмахерской, выраженные в альтернативной валюте (её идентификатор ticketCurrencyId).
---@return table|nil
function changeRoom.GetCosts() end

--- Выставляет список индексов вариаций внешнего вида главного игрока из списков, возвращенных  changeRoom.GetAvatarTemplate().
---@return table|nil
function changeRoom.GetPlayerIndexes() end

--- Возвращает информацию о персонаже игрока, выставленном на сцену. Для персонажа игрока может быть один основной персонаж (модель) и несколько дополнительных (например, для гибберлингов), включая питомца.
---@return table|nil
function changeRoom.GetSceneAvatarInfo() end

--- Возвращает true, если можно назумиться на лицо при выборе или создании персонажа. Также в таком состоянии можно назумливаться колесом мыши.
---@return boolean
function changeRoom.IsZoomEnabled() end

--- Возвращает true, если при выборе или создании персонажа камера назумлена на лицо.
---@return boolean
function changeRoom.IsZoomOnFace() end

--- Возвращает true, если при выборе или создании персонажа камера отзумлена на максимум.
---@return boolean
function changeRoom.IsZoomOnFar() end

--- Функция убирает ранее созданную сцену (если таковая была). Может использоваться при работе с несколькими Control3DSafe (например, в разных аддонах).
function changeRoom.RemoveScene() end

--- Сбросить вращение выбранного персонажа (основной или дополнительный - из трио, включая питомца) в главном меню.
---@param characterId ObjectId идентификатор персонажа в сцене
function changeRoom.ResetSceneCharacterRotation(characterId) end

--- Повернуть выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param angle float на сколько градусов повернуть
function changeRoom.RotateSceneCharacter(characterId, angle) end

--- Метод позволяет, находясь в режиме парикмахерской, запустить камеру по указанному пути (в данный момент имя файла без пути и расширения. Рауты лежат в Maps/&lt;Map&gt;/GlobalObjects/Routes/...).
---@param cameraPath string имя раута движения камеры
---@param targetPath string имя раута движения прицела камеры
---@param delay number задержка в секундах перед запуском камеры
function changeRoom.SetCameraPath(cameraPath, targetPath, delay) end

--- Задает вид показываемой экипировки на экране создания персонажа (по умолчанию персонажи показываются в специальной высокоуровневой экипировке).
---@param equipType integer вид показываемой экипировки, значения:
function changeRoom.SetChargenEquipType(equipType) end

--- Функция создает сцену для работы с персонажами для указанного Control3DSafe. Одновременно (в разных аддонах) может быть только одна сцена. Если сцена уже была в другом контроле, она автоматически убирается из него.
---@param wtControl3D Control3DSafe контрол, для которого создается сцена
---@param sceneName string имя сцены
function changeRoom.SetScene(wtControl3D, sceneName) end

--- Функция выставляет в сцене аватара по информации о главном игроке. Также задается информация о том, какого пола основной и дополнительные персонажи (например, для гибберлингов), эта информация используется только в том случае, если дополнительные персонажи действительно есть.
---@param isPrimaryMale boolean пол основного персонажа
---@param isTrio2Male boolean пол второго (дополнительного) персонажа, игнорируется, если персонаж не трио
---@param isTrio3Male boolean пол третьего (дополнительного) персонажа, игнорируется, если персонаж не трио
---@param petIndex integer|nil индекс облика пета, если он есть
---@param growthIndex integer|nil номер стадии развития персонажа, начиная с 0
function changeRoom.SetSceneAvatarByTemplate(isPrimaryMale, isTrio2Male, isTrio3Male, petIndex, growthIndex) end

--- Выбранный персонаж (основной или дополнительный - из трио, включая питомца) в сцене будет поворачиваться при помощи мыши.
---@param characterId ObjectId идентификатор персонажа в сцене
function changeRoom.SetSceneCharacterMouseRotation(characterId) end

--- Функция выставляет позицию для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене. Позиция задается относительно центральной точки сцены.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param pos table таблица с относительной позицией персонажа, поля:
---@param posX float смещение в сцене по X
---@param posY float смещение в сцене по Y
---@param posZ float смещение в сцене по Z
function changeRoom.SetSceneCharacterPos(characterId, pos, posX, posY, posZ) end

--- Функция выставляет коэффициент масштабирования для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param scale float коэффициент масштабирования для персонажа
function changeRoom.SetSceneCharacterScaleFactor(characterId, scale) end

--- Функция выставляет указанную вариацию для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене. Вариация задается набором индексов. Замечание: вариацию можно менять только для персонажей, созданных на сцене по шаблону аватара. Для персонажей, созданных на сцене по имени аватара, это запрещено (выставляется автоматически).
---@param characterId ObjectId идентификатор персонажа в сцене
---@param variation table таблица с информацией, задающей вариацию для аватара, поля:
---@param skinTexture integer индекс вариации тела [0..]
---@param skinColor integer индекс вариации цвета тела [0..]
---@param hairType integer индекс типа волос [0..]
---@param hairColor integer индекс цвета волос [0..], может игнорироваться (например, для гибберлингов)
---@param face integer индекс типа лица [0..]
---@param facialType integer индекс типа особенностей (лица или украшений) [0..]
---@param additional integer индекс варианта татуировки [0..]
---@param morphPresetIndex integer индекс варианта пропорций персонажа [0..]
function changeRoom.SetSceneCharacterVariation(characterId, variation, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex) end

--- Переключает назумленность камеры на лицо персонажа в экранах выбора или создания нового персонажа. Если перед вызовом камера была назумлена на лицо (в крайней ближней точке), иначе камера назумится на лицо (на крайнюю ближнюю точку).
function changeRoom.ToggleZoom() end

--- Попытка применить изменения, выбранные в парикмахерской. Передаются индексы вариаций внешнего вида каждого персонажа. Описывается как основной персонаж, так и дополнительные (если есть), включая питомца.
---@param isMale boolean пол главного персонажа
---@param primary table таблица с информацией, задающей вариацию для основного персонажа игрока, поля описаны ниже
---@param trio2 table|nil если не трио, то nil, иначе таблица с информацией, задающей вариацию для второго персонажа игрока
---@param trio3 table|nil если не трио, то nil, иначе таблица с информацией, задающей вариацию для третьего персонажа игрока
---@param pet table|nil если настраиваемого питомца нет, то nil, иначе таблица с информацией, задающей вариацию для питомца
---@param petIndex integer|nil если настраиваемого питомца нет, то nil, иначе индекс облика пета
---@param price integer цена изменений. Внимание! Обязательна для передачи на сервер, для проверки стоимости.
---@param skinTexture integer индекс вариации тела [0..]
---@param skinColor integer индекс вариации цвета тела [0..]
---@param hairType integer индекс типа волос [0..]
---@param hairColor integer индекс цвета волос [0..], может игнорироваться (например, для гибберлингов)
---@param face integer индекс типа лица [0..]
---@param facialType integer индекс типа особенностей (лица или украшений) [0..]
---@param additional integer индекс варианта татуировки [0..]
---@param morphPresetIndex integer индекс варианта пропорций персонажа [0..]
---@param name WString имя персонажа
---@param isMale boolean пол персонажа
---@param name WString имя питомца
function changeRoom.Use(isMale, primary, trio2, trio3, pet, petIndex, price, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex, name, isMale, name) end

-- Events

--- В режиме парикмахерской, камера закончила движение после вызова сhangeRoom.SetCameraPath(...).
EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY = "EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY"

--- Событие приходит, если необходимо открыть интерфейс парикмахерской.
EVENT_CHANGE_ROOM_STARTED = "EVENT_CHANGE_ROOM_STARTED"

--- В режиме парикмахерской, камера может назумливаться на лицо персонажа. При изменении состояния назумленности (на лицо, на максимум, в середине) или возможности назумливаться приходит это сообщение.
EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED = "EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED"
