---@meta

--- CategoryPosition
--- События и функции Lua Api, относящиеся к позиции.

---@class positionLib
position = {}

--- Возвращает информацию о направлении аватара.
---@return number
function position.GetDir() end

--- Возвращает информацию о координатах аватара.
---@return GamePosition
function position.GetPos() end

--- Возвращает true, если в данный момент бежим до точки на карте по найденному пути.
---@return boolean
function position.IsNavigateToPoint() end

--- Начинает сотворение заклинания в указанную точку на карте. См. также  GamePosition.
---@param spellId SpellId идентификатор заклинания
---@param position table
function position.RunAESpell(spellId, position) end

--- Можно ли найти путь для этой карты.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function position.CanNavigateToPoint(zonesMapId) end

--- Возвращает описание карты, в которой находится персонаж.
function position.GetCurrentMapInfo() end

--- Возвращает описание зоны, в которой находится персонаж.
function position.GetCurrentZoneInfo() end

--- Возвращает описание блока интерфейсных карт. В каждый блок входит одна или несколько интерфейсных карт зон. Например, в блок Кания входят: {Новоград, Светлолесье, Сиверия и т.д.}. В списке блока будут показываться только те карты, у которых isShowInList == true.
---@param mapBlockId ObjectId идентификатор блока
---@return table|nil
function position.GetMapBlockInfo(mapBlockId) end

--- Возвращает список идентификаторов блоков интерфейсных карт. Например: {Кания, Хадаган, Карты мира}. В каждый блок входит одна или несколько интерфейсных карт зон.
---@return table
function position.GetMapBlocks() end

--- Возвращает геодату, необходимую для проецирования координат интерактивного объекта в реальном мира в координаты текстуры интерфейсной карты.
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return table
function position.GetMapGeodata(zonesMapId) end

--- Возвращает геодату, необходимую для проецирования координат интерактивного объекта в реальном мира в координаты текстуры интерфейсной карты.
---@param objectId ObjectId идентификатор интерактивного объекта
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты зоны, для которой надо получить геодату, если nil то будет взята зона на которой находится объект
---@return table
function position.GetObjectGeodata(objectId, zonesMapId) end

--- Возвращает геодату, необходимую для проецирования реальных координат точки возвращения задания в координаты текстуры интерфейсной карты.
---@param questId QuestId
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return table
function position.GetQuestGeodata(questId, zonesMapId) end

--- Возвращает таблицу геодат, необходимых для проецирования реальных координат точек заданной цели задания в координаты заданной текстуры интерфейсной карты.
---@param objectiveId QuestId
---@param zonesMapId ObjectId идентификатор интерфейсной карты зоны, для которой надо получить геодату
---@return Geodata[]|nil
function position.GetQuestObjectiveGeodata(objectiveId, zonesMapId) end

--- Возвращает описание объекта SOS (объект на карте - "призыв о помощи", который появляется при использовании специального фейрверка другим игроком фракции главного игрока). GamePosition - позиция.
---@param id ObjectId идентификатор объекта
---@return ObjectId
function position.GetSosInfo(id) end

--- Возвращает интерфейсные данные карты зоны по её Id. Или nil, если такой карты нет.
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты, если nil то будет взята текущая зона
---@return table|nil
function position.GetZonesMapInfo(zonesMapId) end

--- Возвращает информацию о неважных заданиях, относящихся к интерфейсной карте, но не участвующих в прогрессе.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table|nil
function position.GetZonesMapLowQuests(zonesMapId) end

--- Возвращает информацию о заданиях, относящихся к интерфейсной карте.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return table|nil
function position.GetZonesMapQuests(zonesMapId) end

--- Проверяет, является ли карта, на которой находится персонаж, анонимной.
function position.IsCurrentZoneAnonymizedMap() end

--- Проверяет, является ли рифтом карты, в которой находится персонаж.
function position.IsCurrentZoneRiftMap() end

--- Возвращает true, если финализирующее задание интерфейсной карты выполнено. Финализирующее задание - это такое задание, выполнение которой достаточно для утверждения, что прогресс зоны выполнен.
---@param zonesMapId ObjectId идентификатор интерфейсной карты
---@return boolean
function position.IsFinalQuestCompleted(zonesMapId) end

--- Возвращает true, если текущая карта является межсерверной
---@return boolean
function position.IsOnCommon() end

--- Возвращает величину поворота (yaw) камеры в радианах.
function position.GetCameraDirection() end

--- Возвращает расстояние между аватаром и каким-либо объектом. Объект обязан быть валидным. В случае невозможности вычисления вернет nil.
---@param objectId ObjectId идентификатор объекта
---@param is2D boolean|nil считать расстояние в 2D, игнорировать разницу по высоте. По умолчанию false
---@param isInternal boolean|nil игнорировать фильтр детектируемости объекта. По умолчанию false. Для пользовательских дополнений всегда false.
---@return float|nil
function position.GetDistance(objectId, is2D, isInternal) end

--- Возвращает координаты какого-либо объекта, если разрешено их получать. В данный момент разрешено получать координаты транспортов и детектируемых юнитов.
---@param objectId ObjectId идентификатор объекта
---@return GamePosition|nil
function position.GetPos(objectId) end

--- Возвращает информацию о координатах транспортного средства (корабля)) по его Id.
---@return table
function position.GetPosition() end

-- Events

--- Событие присылается при клике в террейн при активном AEMark. См. также  GamePosition.
EVENT_AEMARK_POINT_CLICKED = "EVENT_AEMARK_POINT_CLICKED"

--- Событие присылается при изменении координат астрального моба.
EVENT_ASTRAL_UNIT_POS_CHANGED = "EVENT_ASTRAL_UNIT_POS_CHANGED"

--- Событие присылается при переходе аватара в другую зону. Уведомляет о более мелких (клиентских) подзонах чем  EVENT_AVATAR_ZONE_CHANGED.
EVENT_AVATAR_CLIENT_ZONE_CHANGED = "EVENT_AVATAR_CLIENT_ZONE_CHANGED"

--- Событие присылается при изменении направления аватара более чем на 3 градуса.
EVENT_AVATAR_DIR_CHANGED = "EVENT_AVATAR_DIR_CHANGED"

--- Событие присылается при переходе аватара на другую карту.
EVENT_AVATAR_MAP_CHANGED = "EVENT_AVATAR_MAP_CHANGED"

--- Событие присылается когда становится доступна информация о местонахождении аватара. Только после этого события можно пытаться вызывать функции связанные с картой.
EVENT_AVATAR_MAP_INFO_AVAILABLE = "EVENT_AVATAR_MAP_INFO_AVAILABLE"

--- Событие присылается при изменении координат аватара.
EVENT_AVATAR_POS_CHANGED = "EVENT_AVATAR_POS_CHANGED"

--- Серверное событие о переходе персонажа в другую зону. Для более подробного уведомления (но только при наличии UI) следует использовать (клиентское):  EVENT_AVATAR_CLIENT_ZONE_CHANGED.
EVENT_AVATAR_ZONE_CHANGED = "EVENT_AVATAR_ZONE_CHANGED"

--- Событие посылается каждый раз, когда у камеры меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
EVENT_CAMERA_DIRECTION_CHANGED = "EVENT_CAMERA_DIRECTION_CHANGED"

--- Событие присылается при изменении координат цели прицела главного игрока.
EVENT_CROSSHAIR_TARGET_POS_CHANGED = "EVENT_CROSSHAIR_TARGET_POS_CHANGED"

--- Событие посылается при окончании отслеживания объекта на карте с помощью специального умения.
EVENT_OBJECT_DETECT_FINISHED = "EVENT_OBJECT_DETECT_FINISHED"

--- Событие посылается, если у отслеживаемого объекта изменился список детекторов.
EVENT_OBJECT_DETECTOR_LIST_CHANGED = "EVENT_OBJECT_DETECTOR_LIST_CHANGED"

--- Событие посылается при начале отслеживания объекта на карте.
EVENT_OBJECT_DETECT_STARTED = "EVENT_OBJECT_DETECT_STARTED"

--- Событие присылается при изменение координат игрока, состоящего в группе с основным игроком.
EVENT_PARTY_MEMBER_POSITION_UPDATED = "EVENT_PARTY_MEMBER_POSITION_UPDATED"

--- Событие посылается один раз в кадр, если произошло изменение проецированной 2D координаты (или других параметров) некоторых объектов из списка проецируемых объектов.
EVENT_PROJECTED_OBJECTS_CHANGED = "EVENT_PROJECTED_OBJECTS_CHANGED"

--- Событие присылается при изменение координат игрока, состоящего в отряде с основным игроком.
EVENT_RAID_MEMBER_POSITION_UPDATED = "EVENT_RAID_MEMBER_POSITION_UPDATED"

--- Событие присылается при изменение координат игрока, состоящего в браке с основным игроком.
EVENT_SPOUSE_POSITION_UPDATED = "EVENT_SPOUSE_POSITION_UPDATED"

--- Событие присылается при изменении координат цели главного игрока.
EVENT_TARGET_POS_CHANGED = "EVENT_TARGET_POS_CHANGED"

--- Событие присылается при изменении координат транспорта.
EVENT_TRANSPORT_POS_CHANGED = "EVENT_TRANSPORT_POS_CHANGED"

--- Событие присылается при изменении координат юнита. В данный момент такое событие приходит только для юнитов, задетекченных специальным умением главного игрока.
EVENT_UNIT_POS_CHANGED = "EVENT_UNIT_POS_CHANGED"
