---@meta

---@class changeRoomLib
changeRoom = {}

---@class ChangeRoomGetAvatarTemplateResult
---@field hasActualVariationInfo boolean содержит ли таблица актуальную информацию о вариациях персонажей (информация может быть неактуальной в случае ошибок данных, либо если она не была запрошена, либо еще не получена с сервера)
---@field primaryVariationTemplateInfo table таблица с количеством вариаций для главного персонажа, описание полей см. ниже
---@field isTrio boolean true, если персонаж представляет собой троицу (например, гибберлинги), для троицы возвращаются дополнительные поля:
---@field maleVariationTemplateInfo table таблица с количеством вариаций для дополнительных персонажей мужского пола, описание полей см. ниже
---@field femaleVariationTemplateInfo table таблица с количеством вариаций для дополнительных персонажей женского пола, описание полей см. ниже
---@field pets nil|table[] при наличии настраиваемого питомца - таблица с таблицами описаний обликов петов, каждая из которых с количеством вариаций для него, описание полей см. ниже, иначе nil. Замечание: для питомца реально используется только поле "face".
---@field skins таблица флагов, описана ниже доступные вариации тела
---@field skinColors таблица флагов, описана ниже доступные вариации цвета тела
---@field hairs таблица флагов, описана ниже доступные прически
---@field hairColors таблица флагов, описана ниже, или nil доступные цвета волос, если есть
---@field faces таблица флагов, описана ниже доступные варианты лица
---@field facials таблица флагов, описана ниже доступные типы особенностей (лица или украшений)
---@field additionals таблица флагов, описана ниже доступные варианты татуировок
---@field morphPresets таблица флагов, описана ниже доступные варианты пропорций персонажа

---@class ChangeRoomGetCostsResult
---@field ticketCurrencyId CurrencyId|nil если нет ошибки, то идентификатор ресурса альтернативной валюты
---@field sexChangeCost integer цена изменения пола
---@field petChangeCost integer цена изменения облика пета
---@field petNameChangeCost integer цена изменения имени пета
---@field petFacialChangeCost integer цена изменения внешнего вида пета
---@field whiteList table таблица, описывающая цены изменения вариаций из белого списка (обычные)
---@field greyList table таблица, описывающая цены изменения вариаций из серого списка (уникальные)
---@field skin integer цена изменения текстуры кожи
---@field skinColor integer цена изменения цвета кожи
---@field petColor integer цена изменения цвета пета
---@field hairColor integer цена изменения цвета волос
---@field hair integer цена изменения волос
---@field facial integer цена изменения дополнительных лицевых признаков
---@field face integer цена изменения лица
---@field body integer цена изменения строения тела
---@field additional integer цена изменения дополнительных параметров

---@class ChangeRoomGetPlayerIndexesResult
---@field primary table таблица, описывающая вариации основного персонажа
---@field trio2 table|nil таблица, описывающая вариации второго персонажа, если он есть
---@field trio3 table|nil таблица, описывающая вариации третьего персонажа, если он есть
---@field pet table|nil таблица, описывающая вариации питомца, если он есть
---@field petIndex integer|nil индекс текущего облика пета, если он есть
---@field name string имя персонажа
---@field sexId number пол игрока
---@field variations table таблица с полями
---@field skin integer индекс (с нуля) вариации кожи
---@field skinColor integer индекс (с нуля) вариации цвета кожи
---@field hair integer индекс (с нуля) вариации волос
---@field hairColor integer индекс (с нуля) вариации цвета волос
---@field face integer индекс (с нуля) вариации лица
---@field facial integer индекс (с нуля) вариации дополнительных признаков
---@field additional integer индекс (с нуля) вариации дополнительных параметров
---@field body integer индекс (с нуля) вариации телосложения

---@class ChangeRoomGetSceneAvatarInfoResult
---@field primaryId ObjectId идентификатор основного персонажа или nil
---@field trio2Id ObjectId идентификатор второго (дополнительного) персонажа (только для троицы) или nil
---@field trio3Id ObjectId идентификатор третьего (дополнительного) персонажа (только для троицы) или nil
---@field petId ObjectId идентификатор питомца или nil

---Выставляет признак, что на экране создания персонажей их нужно показывать в шлемах (по умолчанию персонажи показываются без шлемов). Замечание. Рекомендуется состояние показа/скрытия шлема всегда задавать явно из скрипта.
---@param show boolean показывать ли шлем на персонаже
---@return нет
function changeRoom.ChargenShowHelm(show) end

---Функция возвращает информацию об указанном шаблоне аватара. Вместе с шаблоном возвращается информация о вариациях персонажей.
---@param isMale boolean true, если требуются настройки по мужскому персонажу, иначе по женскому
---@return ChangeRoomGetAvatarTemplateResult
function changeRoom.GetAvatarTemplate(isMale) end

---Возвращает цены на услуги парикмахерской, выраженные в альтернативной валюте (её идентификатор ticketCurrencyId).
---@return ChangeRoomGetCostsResult
function changeRoom.GetCosts() end

---Выставляет список индексов вариаций внешнего вида главного игрока из списков, возвращенных  changeRoom.GetAvatarTemplate().
---@return ChangeRoomGetPlayerIndexesResult
function changeRoom.GetPlayerIndexes() end

---Возвращает информацию о персонаже игрока, выставленном на сцену. Для персонажа игрока может быть один основной персонаж (модель) и несколько дополнительных (например, для гибберлингов), включая питомца.
---@return ChangeRoomGetSceneAvatarInfoResult
function changeRoom.GetSceneAvatarInfo() end

---Возвращает true, если можно назумиться на лицо при выборе или создании персонажа. Также в таком состоянии можно назумливаться колесом мыши. При изменении состояния приходит  EVENT_REMORT_ZOOM_TRIGGER_CHANGED.
---@return boolean
function changeRoom.IsZoomEnabled() end

---Возвращает true, если при выборе или создании персонажа камера назумлена на лицо. При изменении состояния приходит  EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED.
---@return boolean
function changeRoom.IsZoomOnFace() end

---Возвращает true, если при выборе или создании персонажа камера отзумлена на максимум. При изменении состояния приходит  EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED.
---@return boolean
function changeRoom.IsZoomOnFar() end

---Функция убирает ранее созданную сцену (если таковая была). Может использоваться при работе с несколькими Control3DSafe (например, в разных аддонах).
---@return нет
function changeRoom.RemoveScene() end

---Сбросить вращение выбранного персонажа (основной или дополнительный - из трио, включая питомца) в главном меню.
---@param characterId ObjectId идентификатор персонажа в сцене
---@return нет
function changeRoom.ResetSceneCharacterRotation(characterId) end

---Повернуть выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param angle number на сколько градусов повернуть
---@return нет
function changeRoom.RotateSceneCharacter(characterId, angle) end

---Метод позволяет, находясь в режиме парикмахерской, запустить камеру по указанному пути (в данный момент имя файла без пути и расширения. Рауты лежат в Maps/<Map>/GlobalObjects/Routes/...). Начало движения можно отложить на delay секунд. Сама камера двигается по пути с именем camerapath, а точка, куда она направлена, по targetPath. После завершения движения, придёт EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY.
---@param cameraPath string имя раута движения камеры
---@param targetPath string имя раута движения прицела камеры
---@param delay number задержка в секундах перед запуском камеры
---@return нет
function changeRoom.SetCameraPath(cameraPath, targetPath, delay) end

---Задает вид показываемой экипировки на экране создания персонажа (по умолчанию персонажи показываются в специальной высокоуровневой экипировке). Замечание. Рекомендуется вид показываемой экипировки всегда задавать явно из скрипта.
---@param equipType number вид показываемой экипировки, значения:
---@return нет
function changeRoom.SetChargenEquipType(equipType) end

---Функция создает сцену для работы с персонажами для указанного Control3DSafe. Одновременно (в разных аддонах) может быть только одна сцена. Если сцена уже была в другом контроле, она автоматически убирается из него. Сцены выбираются по имени из списка characterScenes в \Interface\System\CharacterScenes.(UICharacterScenes).xdb. Каждая сцена представлена картой и точками расположения и поворотами персонажа и камеры.
---@param wtControl3D Control3DSafe контрол, для которого создается сцена
---@param sceneName string имя сцены
---@return нет
function changeRoom.SetScene(wtControl3D, sceneName) end

---Функция выставляет в сцене аватара по информации о главном игроке. Также задается информация о том, какого пола основной и дополнительные персонажи (например, для гибберлингов), эта информация используется только в том случае, если дополнительные персонажи действительно есть.
---@param isPrimaryMale boolean пол основного персонажа
---@param isTrio2Male boolean пол второго (дополнительного) персонажа, игнорируется, если персонаж не трио
---@param isTrio3Male boolean пол третьего (дополнительного) персонажа, игнорируется, если персонаж не трио
---@param petIndex integer|nil индекс облика пета, если он есть
---@param growthIndex integer|nil номер стадии развития персонажа, начиная с 0
---@return нет
function changeRoom.SetSceneAvatarByTemplate(isPrimaryMale, isTrio2Male, isTrio3Male, petIndex, growthIndex) end

---Выбранный персонаж (основной или дополнительный - из трио, включая питомца) в сцене будет поворачиваться при помощи мыши.
---@param characterId ObjectId идентификатор персонажа в сцене
---@return нет
function changeRoom.SetSceneCharacterMouseRotation(characterId) end

---Функция выставляет позицию для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене. Позиция задается относительно центральной точки сцены.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param pos table таблица с относительной позицией персонажа, поля:
---@param posX number смещение в сцене по X
---@param posY number смещение в сцене по Y
---@param posZ number смещение в сцене по Z
---@return нет
function changeRoom.SetSceneCharacterPos(characterId, pos, posX, posY, posZ) end

---Функция выставляет коэффициент масштабирования для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене.
---@param characterId ObjectId идентификатор персонажа в сцене
---@param scale number коэффициент масштабирования для персонажа
---@return нет
function changeRoom.SetSceneCharacterScaleFactor(characterId, scale) end

---Функция выставляет указанную вариацию для выбранного персонажа (основного или дополнительного - из трио, включая питомца) в сцене. Вариация задается набором индексов. Замечание: вариацию можно менять только для персонажей, созданных на сцене по шаблону аватара. Для персонажей, созданных на сцене по имени аватара, это запрещено (выставляется автоматически).
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
---@return нет
function changeRoom.SetSceneCharacterVariation(characterId, variation, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex) end

---Переключает назумленность камеры на лицо персонажа в экранах выбора или создания нового персонажа. Если перед вызовом камера была назумлена на лицо (в крайней ближней точке), иначе камера назумится на лицо (на крайнюю ближнюю точку).
---@return нет
function changeRoom.ToggleZoom() end

---Попытка применить изменения, выбранные в парикмахерской. Передаются индексы вариаций внешнего вида каждого персонажа. Описывается как основной персонаж, так и дополнительные (если есть), включая питомца.
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
---@param name string имя персонажа
---@param isMale boolean пол персонажа
---@param name string имя питомца
---@return нет
function changeRoom.Use(isMale, primary, trio2, trio3, pet, petIndex, price, skinTexture, skinColor, hairType, hairColor, face, facialType, additional, morphPresetIndex, name, isMale, name) end
