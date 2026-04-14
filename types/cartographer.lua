---@meta

---@class cartographerLib
cartographer = {}

---@class CartographerGetMapBlockInfoResult
---@field id ObjectId идентификатор блока
---@field name string имя блока
---@field description string описание блока
---@field isShowInList boolean true, если этот блок показывается в главном списке блоков
---@field zonesMaps ObjectId[] список идентификаторов интерфейсных карт зон, которые входят в этот блок

---@class CartographerGetMapMarkerObjectsResult
---@field pos GamePosition глобальные координаты объекта
---@field geodata table|nil если геодата получена, то таблица с полями:

---@class CartographerGetMapModifierInfoResult
---@field name string имя модификатора
---@field description string описание модификатора
---@field difficult integer сложность
---@field finishTime integer|nil дата окончания действия модификатора если есть.
---@field image TextureId идентификатор текстуры иконки модификатора

---@class CartographerGetMarkerInfoResult
---@field name string название типа маркера
---@field syaName string системное имя типа маркера, для специальной обработки в скриптах
---@field description string описание типа маркера
---@field priority integer приоритет такого маркера. Используется, если для одного объекта обнаружено несколько типов маркеров. Минимальный приоритет 0.
---@field image TextureId идентификатор текстуры иконки типа маркера

---@class CartographerGetQuestGeodataResult
---@field returnGeodata Geodata|nil геодата точки возвращения

---@class CartographerGetSosInfoResult
---@field durationMs integer сколько длится показ объекта
---@field remainingMs integer сколько осталось до окончания показа объекта
---@field requesterName string имя отправителя
---@field zonesMapId ObjectId|nil идентификатор интерфейсной карты, где поставлен объект, если она найдена.
---@field position GamePosition позиция на указанной карте
---@field message string текст сообщения

---@class CartographerGetZonesMapInfoResult
---@field id ObjectId идентификатор карты
---@field sysName string уникальное внутреннее имя карты
---@field name string имя карты
---@field description string описание карты
---@field mapBlockId ObjectId|nil идентификатор блока карт, в который входит эта карта
---@field isShowInList boolean true, если эта карта показывается в списке карт её блока
---@field isShowPositions boolean true, если на этой карте можно показыватьобъекты (для них можно получить геодату)
---@field isShowQuestProgress boolean true, если показывать для этой карты количество выполненых/всех важных заданий. Для таких карт список квестов пустой.
---@field isUnknown boolean true, если это карта неизвестных мест (астрал, закрытые или ненайденные, ошибочные области)
---@field isNeedTeleportUnlock boolean true, если для карты требуется анлок портала (нужен и еще не был получен)
---@field minLevel integer|nil минимальный комфортный уровень игрока, на котором ему следует играть на этой карте. Может быть не задан
---@field maxLevel integer|nil максимальный комфортный уровень игрока, на котором ему следует играть на этой карте. Может быть не задан
---@field zoneCeil integer|nil верхний вертикальный предел зоны
---@field zoneFloor integer|nil нижний вертикальный предел зоны
---@field texture TextureId идентификатор текстуры карты
---@field sysMapResources table массив имен отладочных карт, входящих в состав интерфейсной карты

---@class CartographerGetZonesMapLowQuestsResult
---@field totalCount integer общее количество заданий, относящихся к локации
---@field currentCount integer количество заданий активных в данный момент
---@field completedCount integer количество завершённых заданий
---@field currentQuests QuestId[] список идентификаторов ресурсов активных заданий, относящихся к карте
---@field completedQuests QuestId[] список идентификаторов ресурсов завершённых заданий, относящихся к карте

---@class CartographerGetZonesMapQuestsResult
---@field totalCount integer общее количество заданий, относящихся к локации
---@field currentCount integer количество заданий активных в данный момент
---@field completedCount integer количество завершённых заданий
---@field currentQuests QuestId[] список идентификаторов ресурсов активных заданий, относящихся к карте
---@field completedQuests QuestId[] список идентификаторов ресурсов завершённых заданий, относящихся к карте

---Можно ли найти путь для этой карты.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function cartographer.CanNavigateToPoint(zonesMapId) end

---Возвращает описание карты, в которой находится персонаж.
---@param name string имя карты
---@param description string описание карты
---@param isTerrain boolean true, если это карта земли, иначе - астрал
---@param isAstralIsland boolean true, если это карта астрального острова, иначе - false
---@param size Размер стороны карты в метрах. Начало координат левый нижний угол карты.
---@param isStartInstance boolean true, если это стартовый инстанс. В нем запрещены сохранения сервреной информации (не работает магазин, аукцион, почта, обмен и т.п.).
---@param mapSysName string отладочное имя карты
---@param zoneSysName string отладочное имя зоны
function cartographer.GetCurrentMapInfo(name, description, isTerrain, isAstralIsland, size, isStartInstance, mapSysName, zoneSysName) end

---Возвращает интерфейсные данные модификаторов карты, на которой находится главный игрок.
---@return table
function cartographer.GetCurrentMapModifiers() end

---Возвращает индексированный массив строковых атрибутов зоны в которой находится главный игрок. Атрибуты задаются в ресурсах зон и собираются и с самой зоны и с её родительских зон. В полученном массиве по индексу строкового аттрибута находится значение true.
---@return string[]
function cartographer.GetCurrentZoneAttributes() end

---Возвращает описание зоны, в которой находится персонаж. Также см.  cartographer.GetCurrentMapInfo().
---@param allod string название аллода
---@param zoneName string название зоны
---@param sysZoneName string служебное название зоны
---@param subZoneName string название подзоны (пустая строка, если аватар не в подзоне)
---@param sysSubZoneName string служебное название подзоны
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты зон, на которой находится главный игрок в данный момент, если такая карта найдена в ресурсах
function cartographer.GetCurrentZoneInfo(allod, zoneName, sysZoneName, subZoneName, sysSubZoneName, zonesMapId) end

---Возвращает описание блока интерфейсных карт. В каждый блок входит одна или несколько интерфейсных карт зон. Например, в блок Кания входят: {Новоград, Светлолесье, Сиверия и т.д.}. В списке блока будут показываться только те карты, у которых isShowInList == true.
---@param mapBlockId ObjectId идентификатор блока
---@return CartographerGetMapBlockInfoResult
function cartographer.GetMapBlockInfo(mapBlockId) end

---Возвращает список идентификаторов блоков интерфейсных карт. Например: {Кания, Хадаган, Карты мира}. В каждый блок входит одна или несколько интерфейсных карт зон.
---@return ObjectId[]
function cartographer.GetMapBlocks() end

---Возвращает геодату, необходимую для проецирования координат интерактивного объекта в реальном мира в координаты текстуры интерфейсной карты. См.  Geodata.
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return table
function cartographer.GetMapGeodata(zonesMapId) end

---Возвращает список глобальных координат (GamePosition) объектов, помеченных соответствующим маркером на интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@param markerId InterfaceMapMarkerId идентификатор ресурса маркера
---@return CartographerGetMapMarkerObjectsResult
function cartographer.GetMapMarkerObjects(zonesMapId, markerId) end

---Возвращает список идентификаторов ресурсов типов маркеров, которые присутствуют на заданной интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return InterfaceMapMarkerId[]
function cartographer.GetMapMarkers(zonesMapId) end

---Возвращает интерфейсные данные модификатора карты.
---@return CartographerGetMapModifierInfoResult
function cartographer.GetMapModifierInfo() end

---Возвращает новый экземпляр ValuedObject для модификатора карты.
function cartographer.GetMapModifierValuedObject() end

---Возвращает описание типа маркера, которым помечаются перманентные объекты на интерфейсной карте.
---@param markerId InterfaceMapMarkerId идентификатор ресурса маркера
---@return CartographerGetMarkerInfoResult
function cartographer.GetMarkerInfo(markerId) end

---Возвращает геодату, необходимую для проецирования координат интерактивного объекта в реальном мира в координаты текстуры интерфейсной карты. Возвращается, если интерактивный объект objectId находится в зоне, принадлежащей интерфейсной карте зон zonesMapId. если он не находится в этих зонах, то геодата не может быть получена и возвращается nil. Работает только для главного игрока, членов его группы и рейда, а так же для объектов, задетекченных детекторами, если такие есть. См.  Geodata.
---@param objectId ObjectId идентификатор интерактивного объекта
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты зоны, для которой надо получить геодату, если nil то будет взята зона на которой находится объект
---@return table|nil
function cartographer.GetObjectGeodata(objectId, zonesMapId) end

---Возвращает геодату, необходимую для проецирования реальных координат точки возвращения задания в координаты текстуры интерфейсной карты. См.  Geodata.
---@param questId QuestId -- идентификатор задания.
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return CartographerGetQuestGeodataResult
function cartographer.GetQuestGeodata(questId, zonesMapId) end

---Возвращает таблицу геодат, необходимых для проецирования реальных координат точек заданной цели задания в координаты заданной текстуры интерфейсной карты. Индекс каждой геодаты соответствует индексам точек из таблицы locations метода  avatar.GetQuestObjectiveInfo( objectiveId ). То есть, полученая таблица может содержать nil, по тем индексам точек, для которых не получено геодаты по заданным данным. Если для всех точек не нашлось геодаты, то естественно, таблица будет пустой, а в случае ошибки, вместо таблицы будет возвращён nil. См.  Geodata.
---@param objectiveId QuestId -- идентификатор цели задания.
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return Geodata|nil[]
function cartographer.GetQuestObjectiveGeodata(objectiveId, zonesMapId) end

---Возвращает описание объекта SOS (объект на карте - "призыв о помощи", который появляется при использовании специального фейрверка другим игроком фракции главного игрока). GamePosition - позиция.
---@param id ObjectId идентификатор объекта
---@return CartographerGetSosInfoResult
function cartographer.GetSosInfo(id) end

---Возвращает список идентификаторов объектов SOS (объект на карте, который появляется при использовании специального фейрверка другим игроком фракции главного игрока).
---@return ObjectId[]
function cartographer.GetSosObjects() end

---Возвращает Id интерфейсной карты зоны по уникальному имени.
---@param sysName string -- уникальное имя карты
---@return ObjectId|nil
function cartographer.GetZonesMapId(sysName) end

---Возвращает интерфейсные данные карты зоны по её Id. Или nil, если такой карты нет.
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты, если nil то будет взята текущая зона
---@return CartographerGetZonesMapInfoResult
function cartographer.GetZonesMapInfo(zonesMapId) end

---Возвращает информацию о неважных заданиях, относящихся к интерфейсной карте, но не участвующих в прогрессе. Также см.  cartographer.IsFinalQuestCompleted( zonesMapId ) - финализирующее задание. См. cartographer.GetZonesMapInfo( zonesMapId ).isShowQuestProgress
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return CartographerGetZonesMapLowQuestsResult
function cartographer.GetZonesMapLowQuests(zonesMapId) end

---Возвращает информацию о заданиях, относящихся к интерфейсной карте. Также см.  cartographer.IsFinalQuestCompleted( zonesMapId ) - финализирующее задание. См. cartographer.GetZonesMapInfo( zonesMapId ).isShowQuestProgress
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return CartographerGetZonesMapQuestsResult
function cartographer.GetZonesMapQuests(zonesMapId) end

---Проверяет, является ли карта, на которой находится персонаж, анонимной.
---@param isAnonymizedMap boolean true, если карта анонимной.
function cartographer.IsCurrentZoneAnonymizedMap(isAnonymizedMap) end

---Проверяет, является ли рифтом карты, в которой находится персонаж.
---@param isRiftMap boolean true, если это рифт.
function cartographer.IsCurrentZoneRiftMap(isRiftMap) end

---Возвращает true, если финализирующее задание интерфейсной карты выполнено. Финализирующее задание - это такое задание, выполнение которой достаточно для утверждения, что прогресс зоны выполнен.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function cartographer.IsFinalQuestCompleted(zonesMapId) end

---Возвращает true, если текущая карта является межсерверной
---@return boolean
function cartographer.IsOnCommon() end
