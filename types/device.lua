---@meta

---@class deviceLib
device = {}

---@class DeviceGetScanerHubInfoResult
---@field hasMajorAllods boolean есть ли в хабе основные аллоды (Кания и т.п.)
---@field mobDensity number количество астральных мобов по шкале [0, 1]
---@field mobDifficulty number сила астральных мобов по шкале [0, 1]

---@class DeviceGetScanerPvEInfoResult
---@field islandCount integer количество островов в хабе
---@field wreckCount integer количество развалин в хабе

---@class DeviceGetScanerPvPInfoResult
---@field shipCount integer количество кораблей в хабе

---@class DeviceGetScanerTrailInfoResult
---@field strength number сила следа в диапазоне [0, 1]

---Можно ли попытаться использовать устройство в текущий момент.
---@param deviceId ObjectId идентификатор устройства
---@return boolean
function device.CanUse(deviceId) end

---Возвращает цель пушки. Цель становится известна в момент выстрела и доступна только во время полета снаряда до цели. В остальное время цель не известна и метод возвращает nil.
---@param deviceId ObjectId идентификатор устройства
---@return ObjectId
function device.GetCannonTarget(deviceId) end

---Возвращает информацию о кулдауне одного экшена используемого устройства (например, рули, пушки на корабле). Если устройство не найдено или не является используемым, то возвращает nil.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
---@param actionIndex integer номер экшена устройства
---@param remainingMs integer сколько времени кулдауна осталось в миллисекундах
---@param durationMs integer сколько кулдаун длится в миллисекундах
function device.GetCooldown(deviceId, actionIndex, remainingMs, durationMs) end

---Возвращает вставленный итем в устройство (сейчас вставляются только в корабельный устройства). если не найденно, то возвращает nul.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
---@return ObjectId
function device.GetItemInstalled(deviceId) end

---Возвращает информацию о массе корабельного устройства (например, рули, пушки на корабле). Если устройство не найдено или не является корабельным(его нельзя использовать, как корабельное устройство), то возвращает nil.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
function device.GetMass(deviceId) end

---Позволяет получить список названий сундуков в трюме корабля осматриваемого через визор навигатора.
function device.GetNavigatorTargetChests() end

---Возвращает список целей заданий игрока, которые связаны с указанным устройством.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
---@return nil|ObjectId[]
function device.GetRelatedQuestObjectives(deviceId) end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает информацию о текущем сканируемом хабе.
---@return DeviceGetScanerHubInfoResult
function device.GetScanerHubInfo() end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER) и включил на устройстве просмотр информации об астрале, возвращает информацию о текущем сканируемом хабе.
---@return DeviceGetScanerPvEInfoResult
function device.GetScanerPvEInfo() end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER) и включил на устройстве просмотр информации об игроках, возвращает информацию о текущем сканируемом хабе.
---@return DeviceGetScanerPvPInfoResult
function device.GetScanerPvPInfo() end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает информацию о следе какого-либо корабля в текущем хабе корабля игрока.
---@param trailId ObjectId идентификатор следа
---@return DeviceGetScanerTrailInfoResult
function device.GetScanerTrailInfo(trailId) end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает список следов кораблей в текущем хабе корабля. Может быть пустым, если список ещё не пришёл с сервера.
---@return table
function device.GetScanerTrails() end

---Возвращает силу щита, представленную парой - значение/максимальное значение. Если устройство не найдено или не является щитом, то возвращает nil.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
---@param value integer сила щита
---@param maxValue integer максимальная сила щита
function device.GetShieldStrength(deviceId, value, maxValue) end

---Возвращает информацию о слоте используемого устройства (например пушка на корабле). Сторона корабля, на которой расположено устройство, представлена SHIP_SIDE_.... Если устройство не найдено, или оно не используемое, или не находится на корабле, то возвращается nil.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
---@param interfaceSlot integer индекс слота при показе устройства в интерфейсе
---@param side number сторона корабля
function device.GetShipSlotInfo(deviceId, interfaceSlot, side) end

---Возвращает титул устройства.
---@param deviceId ObjectId (not nil) -- идентификатор юнита
---@return WString -
function device.GetTitle(deviceId) end

---Возвращает id транспорта(корабля), на котором расположено используемое устройство. Если устройство не найдено, или оно не используемое, или не находится на корабле, то возвращается nil.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
function device.GetTransport(deviceId) end

---Возвращает тип используемого устройства (например пушка на корабле). если устройство не найдено или оно не используемое, то возвращает USDEV_NOT_USABLE_DEVICE.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
function device.GetUsableDeviceType(deviceId) end

---Если у активного навигационного устройства корабля есть возможность отслеживать, преследуется ли корабль главного игрока или нет, возвращает статус - преследуется/не преследуется. Работает только для активного (используемого главным игроком) устройства навигатора.
function device.HasNavigatorFollowedMarker() end

---Используется ли устройство кем-либо в текущий момент.
---@param deviceId ObjectId идентификатор устройства
---@return boolean
function device.IsInUse(deviceId) end

---Возвращает true, если используемое устройство (например, прибор на корабле) выключено.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
function device.IsOffline(deviceId) end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает true.
function device.IsScanerScanning() end

---Возвращает true, если щит находится в состоянии регенерирования.
---@param deviceId ObjectId (not nil) -- идентификатор устройства
function device.IsShieldRegenInProgress(deviceId) end

---Возвращает возможность принципиального использования устройства.
---@param deviceId ObjectId идентификатор устройства
---@return boolean
function device.IsUsable(deviceId) end

---Возвращает цель устройства-навигатора корабля главного игрока. См. также  device.NavigatorSetTarget(),  EVENT_TRANSPORT_OBSERVING_STARTED,  EVENT_TRANSPORT_OBSERVING_FINISHED.
---@param objectId ObjectId|nil идентификатор транспорта или астрального юнита, или nil
function device.NavigatorGetTarget(objectId) end

---Возвращает объект, на который назумлена камера устройства-навигатора корабля главного игрока.
---@param objectId ObjectId|nil идентификатор транспорта или астрального юнита, или nil
function device.NavigatorGetZoomedObject(objectId) end

---Если главный игрок использует навигационное устройство ( тип устройства - USDEV_NAVIGATOR), то он может выбрать или сбросить цель, отслеживаемую навигатором. Информация об этой цели начнет передаваться для всех членов команды игрока. См. также  EVENT_TRANSPORT_OBSERVING_STARTED,  EVENT_TRANSPORT_OBSERVING_FINISHED.
---@param objectId ObjectId|nil идентификатор транспорта или астрального юнита, или nil, если надо сбросить цель
function device.NavigatorSetTarget(objectId) end

---Если главный игрок использует навигационное устройство ( тип устройства - USDEV_NAVIGATOR), то этим методом он может навестись на выбранный корабль или астрального юнита и расмотреть его ближе. влияет только на камеру, не затрагивая цель навигатора. О настройке данных см. в DeviceViewSight.
---@param objectId ObjectId|nil -- идентификатор корабля или астрального юнита, или nil, если надо отзумиться
function device.NavigatorZoom(objectId) end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), устанавливает текущий сканируемый хаб целью навигационного сканера и будущего прыжка.
---@return нет
function device.SetScanerDestinationDevice() end

---Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), устанавливает текущий след корабля целью навигационного сканера и будущего прыжка.
---@param trailId ObjectId идентификатор следа
---@return нет
function device.SetScanerDestinationTrail(trailId) end
