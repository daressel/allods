---@meta

--- CategoryCartographer
--- События и функции Lua Api, относящиеся к интерфейсным картам.

---@class cartographerLib
cartographer = {}

--- Можно ли найти путь для этой карты.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function cartographer.CanNavigateToPoint(zonesMapId) end

--- Возвращает описание карты, в которой находится персонаж.
function cartographer.GetCurrentMapInfo() end

--- Возвращает интерфейсные данные модификаторов карты, на которой находится главный игрок.
---@return table
function cartographer.GetCurrentMapModifiers() end

--- Возвращает индексированный массив строковых атрибутов зоны в которой находится главный игрок. Атрибуты задаются в ресурсах зон и собираются и с самой зоны и с её родительских зон. В полученном массиве по индексу строкового аттрибута находится значение true.
---@return table
function cartographer.GetCurrentZoneAttributes() end

--- Возвращает описание зоны, в которой находится персонаж.
function cartographer.GetCurrentZoneInfo() end

--- Возвращает описание блока интерфейсных карт. В каждый блок входит одна или несколько интерфейсных карт зон. Например, в блок Кания входят: {Новоград, Светлолесье, Сиверия и т.д.}. В списке блока будут показываться только те карты, у которых isShowInList == true.
---@param mapBlockId ObjectId идентификатор блока
---@return table|nil
function cartographer.GetMapBlockInfo(mapBlockId) end

--- Возвращает список идентификаторов блоков интерфейсных карт. Например: {Кания, Хадаган, Карты мира}. В каждый блок входит одна или несколько интерфейсных карт зон.
---@return table
function cartographer.GetMapBlocks() end

--- Возвращает геодату, необходимую для проецирования координат интерактивного объекта в реальном мира в координаты текстуры интерфейсной карты.
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return table
function cartographer.GetMapGeodata(zonesMapId) end

--- Возвращает список глобальных координат (GamePosition) объектов, помеченных соответствующим маркером на интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@param markerId InterfaceMapMarkerId идентификатор ресурса маркера
---@return table
function cartographer.GetMapMarkerObjects(zonesMapId, markerId) end

--- Возвращает список идентификаторов ресурсов типов маркеров, которые присутствуют на заданной интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table
function cartographer.GetMapMarkers(zonesMapId) end

--- Возвращает интерфейсные данные модификатора карты.
---@return table
function cartographer.GetMapModifierInfo() end

--- Возвращает описание типа маркера, которым помечаются перманентные объекты на интерфейсной карте.
---@param markerId InterfaceMapMarkerId идентификатор ресурса маркера
---@return table|nil
function cartographer.GetMarkerInfo(markerId) end

--- Возвращает геодату, необходимую для проецирования координат интерактивного объекта в реальном мира в координаты текстуры интерфейсной карты.
---@param objectId ObjectId идентификатор интерактивного объекта
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты зоны, для которой надо получить геодату, если nil то будет взята зона на которой находится объект
---@return table
function cartographer.GetObjectGeodata(objectId, zonesMapId) end

--- Возвращает геодату, необходимую для проецирования реальных координат точки возвращения задания в координаты текстуры интерфейсной карты.
---@param questId QuestId
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return table
function cartographer.GetQuestGeodata(questId, zonesMapId) end

--- Возвращает таблицу геодат, необходимых для проецирования реальных координат точек заданной цели задания в координаты заданной текстуры интерфейсной карты.
---@param objectiveId QuestId
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return Geodata[]|nil
function cartographer.GetQuestObjectiveGeodata(objectiveId, zonesMapId) end

--- Возвращает описание объекта SOS (объект на карте - "призыв о помощи", который появляется при использовании специального фейрверка другим игроком фракции главного игрока). GamePosition - позиция.
---@param id ObjectId идентификатор объекта
---@return ObjectId
function cartographer.GetSosInfo(id) end

--- Возвращает список идентификаторов объектов SOS (объект на карте, который появляется при использовании специального фейрверка другим игроком фракции главного игрока).
---@return table
function cartographer.GetSosObjects() end

--- Возвращает Id интерфейсной карты зоны по уникальному имени.
---@param sysName string
---@return ObjectId|nil
function cartographer.GetZonesMapId(sysName) end

--- Возвращает интерфейсные данные карты зоны по её Id. Или nil, если такой карты нет.
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты, если nil то будет взята текущая зона
---@return table|nil
function cartographer.GetZonesMapInfo(zonesMapId) end

--- Возвращает информацию о неважных заданиях, относящихся к интерфейсной карте, но не участвующих в прогрессе.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table|nil
function cartographer.GetZonesMapLowQuests(zonesMapId) end

--- Возвращает информацию о заданиях, относящихся к интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table|nil
function cartographer.GetZonesMapQuests(zonesMapId) end

--- Проверяет, является ли карта, на которой находится персонаж, анонимной.
function cartographer.IsCurrentZoneAnonymizedMap() end

--- Проверяет, является ли рифтом карты, в которой находится персонаж.
function cartographer.IsCurrentZoneRiftMap() end

--- Возвращает true, если финализирующее задание интерфейсной карты выполнено. Финализирующее задание - это такое задание, выполнение которой достаточно для утверждения, что прогресс зоны выполнен.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function cartographer.IsFinalQuestCompleted(zonesMapId) end

--- Возвращает true, если текущая карта является межсерверной
---@return boolean
function cartographer.IsOnCommon() end

--- Получить список идентификаторов интерфейсных карт, которые доступны в календаре.
---@return table
function cartographer.GetZonesMaps() end

--- Возвращает Id интерфейсной карты зоны, на которой находится игрок. Работает только для главного игрока, членов его группы и рейда, а так же для игроков, задетекченных детекторами, если такие есть.
---@param unitId ObjectId
---@return ObjectId|nil
function cartographer.GetZonesMapId(unitId) end

--- Возвращает новый экземпляр ValuedObject для модификатора карты.
function GetMapModifierValuedObject() end

-- Events

--- Событие присылается при переходе аватара в другую зону. Уведомляет о более мелких (клиентских) подзонах чем  EVENT_AVATAR_ZONE_CHANGED.
EVENT_AVATAR_CLIENT_ZONE_CHANGED = "EVENT_AVATAR_CLIENT_ZONE_CHANGED"

--- Событие присылается, если изменились модификаторы карты на карте главного игрока.
EVENT_AVATAR_MAP_MODIFIERS_CHANGED = "EVENT_AVATAR_MAP_MODIFIERS_CHANGED"

--- Серверное событие о переходе персонажа в другую зону. Для более подробного уведомления (но только при наличии UI) следует использовать (клиентское):  EVENT_AVATAR_CLIENT_ZONE_CHANGED.
EVENT_AVATAR_ZONE_CHANGED = "EVENT_AVATAR_ZONE_CHANGED"

--- Событие присылается, если изменилась возможность автонавигации.
EVENT_NAVIGATE_ENABLED_CHANGED = "EVENT_NAVIGATE_ENABLED_CHANGED"

--- Событие присылается при исчезновении в зоне главного игрока объекта SOS, запущеного другим игроком той же фракции.
EVENT_SOS_FINISHED = "EVENT_SOS_FINISHED"

--- Событие присылается при появлении в зоне главного игрока объекта SOS, запущеного другим игроком той же фракции.
EVENT_SOS_STARTED = "EVENT_SOS_STARTED"
