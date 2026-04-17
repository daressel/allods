---@meta

--- CategoryRemort
--- События и функции Lua API, относящиеся к перерождению.

---@class remortLib
remort = {}

--- Возвращает true, если можно получить список альтернативных персонажей, на которых может переключиться главный игрок.
---@return boolean
function remort.CanGetRemortsList() end

--- Расшаривает умения и заклинания главного игрока для использования альтом.
function remort.ChooseSharedAbilities() end

--- Выставляет признак, что на экране создания персонажей их нужно показывать в шлемах (по умолчанию персонажи показываются без шлемов).
---@param show boolean показывать ли шлем на персонаже
function remort.ChargenShowHelm(show) end

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
function remort.CreateAvatar(avatarName, template, faction, race, class, sex, primary, trio2, trio3, petIndex, petVariation, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex, name, isMale, name) end

--- Функция возвращает информацию об указанном шаблоне аватара. Вместе с шаблоном возвращается информация о вариациях персонажей, которую предварительно нужно запросить с сервера:  remortCreation.RequestAllVariations().
---@param templateIndexes table таблица с информацией, задающей шаблон для аватара, поля:
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@param sex integer индекс пола [0..]
---@return table|nil
function remort.GetAvatarTemplate(templateIndexes, faction, race, class, sex) end

--- Возвращает информацию о шаблонах для аватаров.
---@return table
function remort.GetAvatarTemplatesInfo() end

--- Возвращает информацию о расе-классе (по индексам в таблице faction-race-class-sex).
---@param faction integer индекс фракции [0..]
---@param race integer индекс расы [0..]
---@param class integer индекс класса [0..]
---@return table
function remort.GetAvatarTemplatesRaceClassInfo(faction, race, class) end

--- Возвращает информацию о персонаже игрока, выставленном на сцену. Для персонажа игрока может быть один основной персонаж (модель) и несколько дополнительных (например, для гибберлингов), включая питомца.
---@return table|nil
function remort.GetSceneAvatarInfo() end

--- Возвращает информацию о состоянии запроса о вариациях персонажей.
---@return table
function remort.GetVariationsStatus() end

--- Возвращает true, если можно назумиться на лицо при выборе или создании персонажа. Также в таком состоянии можно назумливаться колесом мыши.
---@return boolean
function remort.IsZoomEnabled() end

--- Возвращает true, если при выборе или создании персонажа камера назумлена на лицо.
---@return boolean
function remort.IsZoomOnFace() end

--- Возвращает true, если при выборе или создании персонажа камера отзумлена на максимум.
---@return boolean
function remort.IsZoomOnFar() end

--- Функция убирает ранее созданную сцену (если таковая была). Может использоваться при работе с несколькими Control3DSafe (например, в разных аддонах).
function remort.RemoveScene() end

--- Убирает аватара из сцены (как основного, так и всех дополнительных персонажей, включая питомца).
function remort.RemoveSceneAvatar() end

--- Запрос информации о вариациях персонажей с сервера. В ответ приходит событие:  EVENT_REMORT_VARIATIONS_INFO_CHANGED
function remort.RequestAllVariations() end

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
function remort.ResetAvatar(avatarName, template, faction, race, class, sex, primary, trio2, trio3, petIndex, petVariation, resetedAvatarId, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex, name, isMale, name) end

--- Сбросить вращение выбранного персонажа (основной или дополнительный - из трио, включая питомца) в главном меню.
---@param characterId ObjectId идентификатор персонажа в сцене
function remort.ResetSceneCharacterRotation(characterId) end

--- Повернуть выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param angle float на сколько градусов повернуть
function remort.RotateSceneCharacter(characterId, angle) end

--- Метод позволяет, находясь в экране создания реморта, запустить камеру по указанному пути (в данный момент имя файла без пути и расширения. Рауты лежат в Maps/&lt;Map&gt;/GlobalObjects/Routes/...).
---@param cameraPath string имя раута движения камеры
---@param targetPath string имя раута движения прицела камеры
---@param delay number задержка в секундах перед запуском камеры
function remort.SetCameraPath(cameraPath, targetPath, delay) end

--- Задает вид показываемой экипировки на экране создания персонажа (по умолчанию персонажи показываются в специальной высокоуровневой экипировке).
---@param equipType integer вид показываемой экипировки, значения:
function remort.SetChargenEquipType(equipType) end

--- Функция создает сцену для работы с персонажами для указанного Control3DSafe. Одновременно (в разных аддонах) может быть только одна сцена. Если сцена уже была в другом контроле, она автоматически убирается из него.
---@param wtControl3D Control3DSafe контрол, для которого создается сцена
---@param sceneName string имя сцены
function remort.SetScene(wtControl3D, sceneName) end

--- Функция выставляет в сцене указанного аватара (из списка аватаров на шарде).
---@param avatarServerId integer серверный идентификатор аватара
function remort.SetSceneAvatar(avatarServerId) end

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
function remort.SetSceneAvatarByTemplate(template, faction, race, class, sex, avatarId, isTrio2Male, isTrio3Male, petIndex, growthIndex) end

--- Выбранный персонаж (основной или дополнительный - из трио, включая питомца) в сцене будет поворачиваться при помощи мыши.
---@param characterId ObjectId идентификатор персонажа в сцене
function remort.SetSceneCharacterMouseRotation(characterId) end

--- Функция выставляет позицию для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене. Позиция задается относительно центральной точки сцены.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param pos table таблица с относительной позицией персонажа, поля:
---@param posX float смещение в сцене по X
---@param posY float смещение в сцене по Y
---@param posZ float смещение в сцене по Z
function remort.SetSceneCharacterPos(characterId, pos, posX, posY, posZ) end

--- Функция выставляет коэффициент масштабирования для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param scale float коэффициент масштабирования для персонажа
function remort.SetSceneCharacterScaleFactor(characterId, scale) end

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
function remort.SetSceneCharacterVariation(characterId, variation, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex) end

--- Переключает назумленность камеры на лицо персонажа в экранах выбора или создания нового персонажа. Если перед вызовом камера была назумлена на лицо (в крайней ближней точке), иначе камера назумится на лицо (на крайнюю ближнюю точку).
function remort.ToggleZoom() end

--- Возвращает список умений, которые может расшарить главный игрок для использования своим альтом (реморт).
---@return --
function remort.GetAbilitiesForSharing() end

--- Возвращает список умений, который в принципе может расшарить игрок с указанным классом для использования своим альтом (реморт).
---@param classId CharacterClassId идентификатор ресурса класса игрока
---@return --
function remort.GetClassAbilitiesForSharing(classId) end

--- Возвращает информацию о требованиях расы при создании реморта.
---@return table|nil
function remort.GetCreateRemortRequirements() end

--- Возвращает имя основного персонажа, если игрок является альтернативным персонажем.
---@param unitId ObjectId идентификатор игрока
---@return WString|nil
function remort.GetMainName(unitId) end

--- Возвращает список альтернативных персонажей, на которых может переключиться главный игрок.
---@return table
function remort.GetRemortsList() end

--- Возвращает информацию о требованиях к использованию некоторых действий, связанных с ремортом.
---@return table|nil
function remort.GetRequirements() end

--- Возвращает информацию о требованиях расы при пересоздании реморта.
---@return table|nil
function remort.GetResetRemortRequirements() end

--- Возвращает количество умений, которые может расшарить главный игрок для использования своим альтом (реморт).
---@return number
function remort.GetSharedAbilitiesCount() end

--- Возвращает true, если игрок является альтернативным персонажем.
---@param unitId ObjectId идентификатор игрока
---@return boolean
function remort.IsAlt(unitId) end

--- Переключиться на другого  альтернативного персонажа.
---@param name WString имя персонажа
---@param anonymous boolean true, если хотим переключиться анонимно
function remort.SwitchRemort(name, anonymous) end

-- Events

--- Событие о запросе на расшаривание умений для альта главного игрока.
EVENT_REMORT_ABILITY_SHARING_REQUEST = "EVENT_REMORT_ABILITY_SHARING_REQUEST"

--- Пришел список ремортов для переключения главного игрока на один из них.
EVENT_REMORT_LIST_GAINED = "EVENT_REMORT_LIST_GAINED"

--- Пришел запрос на создание реморта. Необходимо показать диалог создания реморта.
EVENT_REMORT_SHOW_CREATION_DIALOG = "EVENT_REMORT_SHOW_CREATION_DIALOG"

--- Событие приходит при обновлении информации о вариациях персонажей.
EVENT_REMORT_VARIATIONS_INFO_CHANGED = "EVENT_REMORT_VARIATIONS_INFO_CHANGED"
