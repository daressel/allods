---@meta

--- CategoryTransport
--- Функции Lua Api связанные с транспортными средствами.

--- Текстовый енум. Префикс для автоматической проверки "ENUM_CriticalMalfunctionType_CMT"
--- реактор выключился от перегрева
ENUM_CriticalMalfunctionType_CMT_ReactorShutdown = "ENUM_CriticalMalfunctionType_CMT_ReactorShutdown"
--- случился Mana Burst
ENUM_CriticalMalfunctionType_CMT_ManaBurst = "ENUM_CriticalMalfunctionType_CMT_ManaBurst"
--- движок выключился
ENUM_CriticalMalfunctionType_CMT_EngineShutdown = "ENUM_CriticalMalfunctionType_CMT_EngineShutdown"
--- руль заклинило
ENUM_CriticalMalfunctionType_CMT_RudderStuck = "ENUM_CriticalMalfunctionType_CMT_RudderStuck"
--- руль не поворачивается влево
ENUM_CriticalMalfunctionType_CMT_RudderBrokenLeft = "ENUM_CriticalMalfunctionType_CMT_RudderBrokenLeft"
--- руль не поворачивается вправо
ENUM_CriticalMalfunctionType_CMT_RudderBrokenRight = "ENUM_CriticalMalfunctionType_CMT_RudderBrokenRight"
--- чувак в лазарете оставлен на второй срок
ENUM_CriticalMalfunctionType_CMT_DoubleDeath = "ENUM_CriticalMalfunctionType_CMT_DoubleDeath"
--- пушка критически промахнулась
ENUM_CriticalMalfunctionType_CMT_CriticalMiss = "ENUM_CriticalMalfunctionType_CMT_CriticalMiss"

--- Стороны корабля:
---@type integer
SHIP_SIDE_NONE = nil
---@type integer
SHIP_SIDE_GENERAL = nil
---@type integer
SHIP_SIDE_FRONT = nil
---@type integer
SHIP_SIDE_REAR = nil
---@type integer
SHIP_SIDE_LEFT = nil
---@type integer
SHIP_SIDE_RIGHT = nil

---@class transportLib
transport = {}

--- Выполняет прыжок в заданный сектор астрала до выбранной POI за марки (быстрое путешествие).
---@param poiId ObjectId идентификатор астральной POI
---@param spellId SpellId идентификатор заклинания, при помощи которого будет происходить перемещение
function transport.AstrolabeJump(poiId, spellId) end

--- Выполняет проверку группы на возможность совершения прыжка в заданный сектор астрала до выбранной POI за марки (быстрое путешествие).
---@param poiId ObjectId идентификатор астральной POI
---@param direct boolean если true, проверяется возможность совершить прыжок с использованием ускорителей(прыжок из ангара на остров), если false, проверяется возможность совершить обычный прыжок на остров из страла
function transport.CheckJump(poiId, direct) end

--- Возвращает два списка имён игроков, находящихся в команде корабля, из-за которых нельзя использовать астролябию, так как у них нет альтернативной валюты или благосклонности покровителя.
---@return table
function transport.GetAstrolabeDeniedPlayers() end

--- Возвращает Id транспортного средства, которое привязано к главному игроку (игрок вызвал его в ангаре).
function transport.GetBindedTransport() end

--- Возвращает Id астрального моба, которое просматривается через навигационное устройство корабля, на котором находится главный игрок (навигатор корабля игрока назумился на другой корабль).
function transport.GetObservedAstralUnit() end

--- Возвращает Id о транспортном средстве, которое просматривается через навигационное устройство корабля, на котором находится главный игрок (навигатор корабля игрока назумился на другой корабль). У просматриваемого транспорта доступна информация по устройствам
function transport.GetObservedTransport() end

--- Получить список всех транспортов в зоне действия аватара
---@return table
function transport.GetTransportList() end

--- Позволяет получить список названий сундуков в трюме корабля осматриваемого через визор навигатора.
function transport.GetNavigatorTargetChests() end

--- Возвращает цель устройства-навигатора корабля главного игрока.
function transport.NavigatorGetTarget() end

--- Возвращает объект, на который назумлена камера устройства-навигатора корабля главного игрока.
function transport.NavigatorGetZoomedObject() end

--- Если главный игрок использует навигационное устройство ( тип устройства - USDEV_NAVIGATOR), то он может выбрать или сбросить цель, отслеживаемую навигатором. Информация об этой цели начнет передаваться для всех членов команды игрока.
---@param objectId ObjectId|nil идентификатор транспорта или астрального юнита, или nil, если надо сбросить цель
function transport.NavigatorSetTarget(objectId) end

--- Возвращает true, если требуется отрисовывать интерфейс выбранного корабля. То есть это боевой корабль, на котором могут летать игроки и они могут им управлять. Если это просто транспортное средство без управления (плот, лодка или скриптовый корабль), двигающиеся по заданному маршруту, то вернется false.
---@param transportId ObjectId
function transport.CanDrawInterface(transportId) end

--- Возвращает возвращает массу корабля, номинальную для двигателя транспортного средства. Если масса корабля больше, то движок будет перегружен. Если транспорт  или движок не найден, то возвращает nil.
---@param transportId ObjectId
---@return number|nil
function transport.GetAcceleratorNominalMass(transportId) end

--- Возвращает список идентификаторов используемых устройств транспортного средства. Если транспорт не найден, то возвращает пустую таблицу.
---@param transportId ObjectId
function transport.GetDevices(transportId) end

--- Возвращает величину поворота (yaw) транспортного средства в радианах. Если транспорт не найден, то возвращает 0.
---@param transportId ObjectId
function transport.GetDirection(transportId) end

--- Возвращает информацию об энергии транспортного средства. Если транспорт не найден, то возвращает nil.
---@param transportId ObjectId
function transport.GetEnergy(transportId) end

--- Возвращает значение здоровья максимально возможного для имеющегося корпуса. Если транспорт не найден, то возвращает ноль.
---@param transportId ObjectId
function transport.GetHealthMaximum(transportId) end

--- Возвращает информацию о количестве эманации транспортного средства, которое привязано к главному игроку. Если транспорт не найден, то возвращает nil.
---@param transportId ObjectId
function transport.GetInsight(transportId) end

--- Возвращает массу транспортного средства без устройств. Если транспорт не найден, то возвращает nil.
---@param transportId ObjectId
function transport.GetMass(transportId) end

--- Возвращает информацию о координатах транспортного средства (корабля)) по его Id.
---@return table
function transport.GetPosition() end

--- Возвращает информацию о силе щита транспортного средства по какой-либо стороне (SHIP_SIDE_...). Сила представлена парой - значение/максимальное значение. Если транспорт не найден, то возвращает 0/0.
---@param transportId ObjectId
---@param side integer сторона
function transport.GetShieldStrength(transportId, side) end

--- Возвращает общую информацию о постороннем корабле по его Id.
---@return table|nil
function transport.GetShipInfo() end

--- Возвращает информацию о скоростях перемещения транспортного средства в пространстве. Если транспорт не найден, то возвращает nil. Проверка на изменение происходит не на каждом тике, а один раз в секунду.
---@param transportId ObjectId
function transport.GetVelocities(transportId) end

--- Возвращает Id о транспортном средстве, на котором находится юнит. Если игрок не находится на транспорте, или транспорт не найден, то возвращает nil.
---@param unitId ObjectId
function transport.GetTransport(unitId) end

-- Events

--- Событие посылается при изменении информации о доступных секторах для прыжка (быстрое путешествие).
EVENT_ASTROLABE_INFO_CHANGED = "EVENT_ASTROLABE_INFO_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется привязанное транспортное средство (вызвал в ангаре/отозвал и т.п.).
EVENT_AVATAR_BINDED_TRANSPORT_CHANGED = "EVENT_AVATAR_BINDED_TRANSPORT_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется транспортное средство (появляется, исчезает).
EVENT_AVATAR_TRANSPORT_CHANGED = "EVENT_AVATAR_TRANSPORT_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства игрока до взрыва реактора осталось определённое время.
EVENT_REACTOR_COUNTDOWN = "EVENT_REACTOR_COUNTDOWN"

--- Событие посылается каждый раз, когда у транспортного средства игрока отменено самоуничтожение реактора.
EVENT_REACTOR_COUNTDOWN_CANCELLED = "EVENT_REACTOR_COUNTDOWN_CANCELLED"

--- Событие посылается в момент нанесения урона кораблю. Поля attacker, defender, damageSource могут быть равны nil, если за время до получения события соответствующий корабль или астральный монстр успел исчезнуть (вышел за пределы видимости, разрушился). Кроме того attacker может быть равен nil, если стрелял не корабль и не астральный монстр.
EVENT_SHIP_DAMAGE_RECEIVED = "EVENT_SHIP_DAMAGE_RECEIVED"

--- Изменился целевой сектор для астрального прыжка.
EVENT_TRANSPORT_ACCELERATION_TARGET_CHANGED = "EVENT_TRANSPORT_ACCELERATION_TARGET_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется скорость поворота.
EVENT_TRANSPORT_ANGULAR_VELOCITY_CHANGED = "EVENT_TRANSPORT_ANGULAR_VELOCITY_CHANGED"

--- Событие присылается, если на кораблечто-то сломалось. Получает его команда этого корабля и чужие навигаторы, следящие за этим кораблём. Содержит код поломки ENUM_CriticalMalfunctionType_CMT....
EVENT_TRANSPORT_CRITICAL_MALFUNCTION = "EVENT_TRANSPORT_CRITICAL_MALFUNCTION"

--- Событие посылается каждый раз, когда у транспортного средства меняется список устройств.
EVENT_TRANSPORT_DEVICES_CHANGED = "EVENT_TRANSPORT_DEVICES_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
EVENT_TRANSPORT_DIRECTION_CHANGED = "EVENT_TRANSPORT_DIRECTION_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется какая-либо состовляющая энергии.
EVENT_TRANSPORT_ENERGY_CHANGED = "EVENT_TRANSPORT_ENERGY_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется скорость движения по горизонтали (вперёд).
EVENT_TRANSPORT_HORIZONTAL_VELOCITY_CHANGED = "EVENT_TRANSPORT_HORIZONTAL_VELOCITY_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется "Инсайт".
EVENT_TRANSPORT_INSIGHT_CHANGED = "EVENT_TRANSPORT_INSIGHT_CHANGED"

--- Событие присылается при окончании просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор отзумился от чужого корабля). Теперь у ранее просматриваемого транспорта недоступна информация по устройствам.
EVENT_TRANSPORT_OBSERVING_FINISHED = "EVENT_TRANSPORT_OBSERVING_FINISHED"

--- Событие присылается при началe просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор назумился на другой корабль). Теперь у просматриваемого транспорт доступна информация по устройствам.
EVENT_TRANSPORT_OBSERVING_STARTED = "EVENT_TRANSPORT_OBSERVING_STARTED"

--- Событие присылается при изменении координат транспорта.
EVENT_TRANSPORT_POS_CHANGED = "EVENT_TRANSPORT_POS_CHANGED"

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает корабль.
EVENT_TRANSPORTS_CHANGED = "EVENT_TRANSPORTS_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется сила щита с определенной стороны.
EVENT_TRANSPORT_SHIELD_CHANGED = "EVENT_TRANSPORT_SHIELD_CHANGED"

--- Событие посылается каждый раз, когда изменилась базовая информация по какому-то кораблю.
EVENT_TRANSPORT_SHIP_INFO_CHANGED = "EVENT_TRANSPORT_SHIP_INFO_CHANGED"

--- Событие посылается каждый раз, когда у транспортного средства меняется скорость движения по вертикали.
EVENT_TRANSPORT_VERTICAL_VELOCITY_CHANGED = "EVENT_TRANSPORT_VERTICAL_VELOCITY_CHANGED"
