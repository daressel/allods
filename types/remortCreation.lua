---@meta

--- CategoryRemortCreation
--- Функции и события Lua API библиотеки remortCreation, предназначенный для создания нового альтернативного персонажа в миссии..

---@class remortCreationLib
remortCreation = {}

--- Выставляет признак, что на экране создания персонажей их нужно показывать в шлемах (по умолчанию персонажи показываются без шлемов).
---@param show boolean показывать ли шлем на персонаже
function remortCreation.ChargenShowHelm(show) end

--- Попытка создать аватара с указанным именем, шаблоном (фракция/раса/класс/пол), вариантом внешнего вида и др. Описывается как основной персонаж, так и дополнительные (если есть), включая питомца.
---@param avatarName WString имя аватара
---@param template table таблица с информацией, задающей шаблон для аватара, поля:
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@param sex integer индекс пола [0..]
---@param primary table таблица с информацией, задающей вариацию для основного персонажа игрока, поля описаны ниже
---@param trio2 table|nil если не трио, то nil, иначе таблица с информацией, задающей вариацию для второго (дополнительного) персонажа игрока и некоторые дополнительные параметры, поля описаны ниже
---@param trio3 table|nil если не трио, то nil, иначе таблица с информацией, задающей вариацию для третьего (дополнительного) персонажа игрока и некоторые дополнительные параметры, поля описаны ниже
---@param petIndex integer|nil индекс облика пета, если он есть, начиная с 0
---@param petVariation table|nil если настраиваемого питомца нет, то nil, иначе таблица с информацией, задающей вариацию для питомца, поля описаны ниже
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
function remortCreation.CreateAvatar(avatarName, template, faction, race, class, sex, primary, trio2, trio3, petIndex, petVariation, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex, name, isMale, name) end

--- Функция возвращает информацию об указанном шаблоне аватара. Вместе с шаблоном возвращается информация о вариациях персонажей, которую предварительно нужно запросить с сервера:  remortCreation.RequestAllVariations().
---@param templateIndexes table таблица с информацией, задающей шаблон для аватара, поля:
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@param sex integer индекс пола [0..]
---@return table|nil
function remortCreation.GetAvatarTemplate(templateIndexes, faction, race, class, sex) end

--- Возвращает информацию о шаблонах для аватаров.
---@return table
function remortCreation.GetAvatarTemplatesInfo() end

--- Возвращает информацию о расе-классе (по индексам в таблице faction-race-class-sex).
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@return table
function remortCreation.GetAvatarTemplatesRaceClassInfo(faction, race, class) end

--- Возвращает информацию о персонаже игрока, выставленном на сцену. Для персонажа игрока может быть один основной персонаж (модель) и несколько дополнительных (например, для гибберлингов), включая питомца.
---@return table|nil
function remortCreation.GetSceneAvatarInfo() end

--- Возвращает информацию о состоянии запроса о вариациях персонажей.
---@return table
function remortCreation.GetVariationsStatus() end

--- Возвращает true, если можно назумиться на лицо при выборе или создании персонажа. Также в таком состоянии можно назумливаться колесом мыши.
---@return boolean
function remortCreation.IsZoomEnabled() end

--- Возвращает true, если при выборе или создании персонажа камера назумлена на лицо.
---@return boolean
function remortCreation.IsZoomOnFace() end

--- Возвращает true, если при выборе или создании персонажа камера отзумлена на максимум.
---@return boolean
function remortCreation.IsZoomOnFar() end

--- Функция убирает ранее созданную сцену (если таковая была). Может использоваться при работе с несколькими Control3DSafe (например, в разных аддонах).
function remortCreation.RemoveScene() end

--- Убирает аватара из сцены (как основного, так и всех дополнительных персонажей, включая питомца).
function remortCreation.RemoveSceneAvatar() end

--- Запрос информации о вариациях персонажей с сервера. В ответ приходит событие:  EVENT_REMORT_VARIATIONS_INFO_CHANGED
function remortCreation.RequestAllVariations() end

--- Попытка сбросить параметры имеющегося альтернативного персонажа с указанным именем на новое имя, шаблон (фракция/раса/класс/пол), вариант внешнего вида и др. Описывается как основной персонаж, так и дополнительные (если есть), включая питомца.
---@param avatarName WString новое имя альтернативного персонажа
---@param template table таблица с информацией, задающей шаблон для аватара, поля:
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@param sex integer индекс пола [0..]
---@param primary table таблица с информацией, задающей вариацию для основного персонажа игрока, поля описаны ниже
---@param trio2 table|nil если не трио, то nil, иначе таблица с информацией, задающей вариацию для второго (дополнительного) персонажа игрока и некоторые дополнительные параметры, поля описаны ниже
---@param trio3 table|nil если не трио, то nil, иначе таблица с информацией, задающей вариацию для третьего (дополнительного) персонажа игрока и некоторые дополнительные параметры, поля описаны ниже
---@param petIndex integer|nil индекс облика пета, если он есть, начиная с 0
---@param petVariation table|nil если настраиваемого питомца нет, то nil, иначе таблица с информацией, задающей вариацию для питомца, поля описаны ниже
---@param resetedAvatarId PersistentId идентификатор имеющегося альтернативного персонажа
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
function remortCreation.ResetAvatar(avatarName, template, faction, race, class, sex, primary, trio2, trio3, petIndex, petVariation, resetedAvatarId, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex, name, isMale, name) end

--- Сбросить вращение выбранного персонажа (основной или дополнительный - из трио, включая питомца) в главном меню.
---@param characterId ObjectId идентификатор персонажа в сцене
function remortCreation.ResetSceneCharacterRotation(characterId) end

--- Повернуть выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param angle float на сколько градусов повернуть
function remortCreation.RotateSceneCharacter(characterId, angle) end

--- Метод позволяет, находясь в экране создания реморта, запустить камеру по указанному пути (в данный момент имя файла без пути и расширения. Рауты лежат в Maps/&lt;Map&gt;/GlobalObjects/Routes/...).
---@param cameraPath string имя раута движения камеры
---@param targetPath string имя раута движения прицела камеры
---@param delay number задержка в секундах перед запуском камеры
function remortCreation.SetCameraPath(cameraPath, targetPath, delay) end

--- Задает вид показываемой экипировки на экране создания персонажа (по умолчанию персонажи показываются в специальной высокоуровневой экипировке).
---@param equipType integer вид показываемой экипировки, значения:
function remortCreation.SetChargenEquipType(equipType) end

--- Функция создает сцену для работы с персонажами для указанного Control3DSafe. Одновременно (в разных аддонах) может быть только одна сцена. Если сцена уже была в другом контроле, она автоматически убирается из него.
---@param wtControl3D Control3DSafe контрол, для которого создается сцена
---@param sceneName string имя сцены
function remortCreation.SetScene(wtControl3D, sceneName) end

--- Функция выставляет в сцене указанного аватара (из списка аватаров на шарде).
---@param avatarServerId integer серверный идентификатор аватара
function remortCreation.SetSceneAvatar(avatarServerId) end

--- Функция выставляет в сцене аватара по данной информации о шаблоне. Шаблон задается набором индексов в таблице (из ресурсной системе) с информацией о шаблонах. Также задается информация о том, какого пола дополнительные персонажи (например, для гибберлингов), эта информация используется только в том случае, если дополнительные персонажи действительно есть.
---@param template table таблица с информацией, задающей шаблон для аватара, поля:
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@param sex integer индекс пола [0..]
---@param avatarId integer|nil серверный id аватара; если указан, то текущий пет аватара будет учтен при формировании сцены, иначе на сцене будет только дефолтный пет
---@param isTrio2Male boolean пол второго (дополнительного) персонажа, игнорируется, если персонаж не трио
---@param isTrio3Male boolean пол третьего (дополнительного) персонажа, игнорируется, если персонаж не трио
---@param petIndex integer|nil индекс облика пета, если он есть, начиная с 0
---@param growthIndex integer номер стадии развития персонажа, начиная с 0
function remortCreation.SetSceneAvatarByTemplate(template, faction, race, class, sex, avatarId, isTrio2Male, isTrio3Male, petIndex, growthIndex) end

--- Выбранный персонаж (основной или дополнительный - из трио, включая питомца) в сцене будет поворачиваться при помощи мыши.
---@param characterId ObjectId идентификатор персонажа в сцене
function remortCreation.SetSceneCharacterMouseRotation(characterId) end

--- Функция выставляет позицию для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене. Позиция задается относительно центральной точки сцены.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param pos table таблица с относительной позицией персонажа, поля:
---@param posX float смещение в сцене по X
---@param posY float смещение в сцене по Y
---@param posZ float смещение в сцене по Z
function remortCreation.SetSceneCharacterPos(characterId, pos, posX, posY, posZ) end

--- Функция выставляет коэффициент масштабирования для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param scale float коэффициент масштабирования для персонажа
function remortCreation.SetSceneCharacterScaleFactor(characterId, scale) end

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
function remortCreation.SetSceneCharacterVariation(characterId, variation, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex) end

--- Переключает назумленность камеры на лицо персонажа в экранах выбора или создания нового персонажа. Если перед вызовом камера была назумлена на лицо (в крайней ближней точке), иначе камера назумится на лицо (на крайнюю ближнюю точку).
function remortCreation.ToggleZoom() end

-- Events

--- В окне создания реморта, камера закончила движение после вызова  remortCreation.SetCameraPath(...).
EVENT_REMORT_CHARACTER_SCENE_CAMERA_READY = "EVENT_REMORT_CHARACTER_SCENE_CAMERA_READY"

--- В режиме создания реморта, камера может назумливаться на лицо персонажа. При изменении состояния назумленности или возможности назумливаться приходит это сообщение.
EVENT_REMORT_ZOOM_TRIGGER_CHANGED = "EVENT_REMORT_ZOOM_TRIGGER_CHANGED"
