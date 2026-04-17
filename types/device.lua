---@meta

--- CategoryDevice
--- Функции Lua API библиотеки device.

--- Причина, по которой устройство выключено. Текстовый енум, проверяется на билдере, префикс для проверки "TurnReason"
ENUM_TR_Broken = "ENUM_TR_Broken"
ENUM_TR_Abordage = "ENUM_TR_Abordage"
ENUM_TR_Silence = "ENUM_TR_Silence"
ENUM_TR_InterHubAcceleration = "ENUM_TR_InterHubAcceleration"
ENUM_TR_Construction = "ENUM_TR_Construction"
ENUM_TR_InHangar = "ENUM_TR_InHangar"
ENUM_TR_TeleportToIsland = "ENUM_TR_TeleportToIsland"
ENUM_TR_Teleport = "ENUM_TR_Teleport"
ENUM_TR_Malfunction = "ENUM_TR_Malfunction"
ENUM_TR_ReactorsShutdown = "ENUM_TR_ReactorsShutdown"
ENUM_TR_ShipDestroyed = "ENUM_TR_ShipDestroyed"
ENUM_TR_Init = "ENUM_TR_Init"

--- Енум типа корабельного устройства.
--- это не используемое устройство
---@type integer
USDEV_NOT_USABLE_DEVICE = nil
--- просто используемое устройство
---@type integer
USDEV_USABLE_DEVICE = nil
---@type integer
USDEV_BEAM_CANNON = nil
---@type integer
USDEV_CANNON = nil
---@type integer
USDEV_ENGINE_HORIZONTAL = nil
---@type integer
USDEV_ENGINE_VERTICAL = nil
---@type integer
USDEV_NAVIGATOR = nil
---@type integer
USDEV_REACTOR = nil
---@type integer
USDEV_REMOTE_RUDDER = nil
---@type integer
USDEV_REMOTE_ENGINE_VERTICAL = nil
---@type integer
USDEV_REPAIR = nil
---@type integer
USDEV_RUDDER = nil
---@type integer
USDEV_SCANER = nil
---@type integer
USDEV_VISUAL = nil
---@type integer
USDEV_SHIELD = nil

---@class deviceLib
device = {}

--- Возвращает id используемого устройства. Например, корабельные устройства (управление, пушки и т.д.).
---@return ObjectId
function device.GetActiveUsableDevice() end

--- Возвращает информацию о действии используемого устройства. Например корабельного (управление, пушки и т.д.).
---@param index integer индекс действия [0..(pDevice-&gt;GetActionCount() - 1)]
---@return table|nil
function device.GetActiveUsableDeviceActionInfo(index) end

--- Возвращает информацию об устройстве. Например, корабельные устройства (управление, пушки и т.д.).
---@return table|nil
function device.GetUsableDeviceInfo() end

--- Можно ли попытаться использовать устройство в текущий момент.
---@param deviceId ObjectId идентификатор устройства
---@return boolean
function device.CanUse(deviceId) end

--- Возвращает цель пушки. Цель становится известна в момент выстрела и доступна только во время полета снаряда до цели. В остальное время цель не известна и метод возвращает nil.
---@param deviceId ObjectId идентификатор устройства
---@return ObjectId
function device.GetCannonTarget(deviceId) end

--- Возвращает информацию о кулдауне одного экшена используемого устройства (например, рули, пушки на корабле). Если устройство не найдено или не является используемым, то возвращает nil.
---@param deviceId ObjectId
---@param actionIndex integer номер экшена устройства
function device.GetCooldown(deviceId, actionIndex) end

--- Возвращает вставленный итем в устройство (сейчас вставляются только в корабельный устройства). если не найденно, то возвращает nul.
---@param deviceId ObjectId
---@return ObjectId
function device.GetItemInstalled(deviceId) end

--- Возвращает информацию о массе корабельного устройства (например, рули, пушки на корабле). Если устройство не найдено или не является корабельным(его нельзя использовать, как корабельное устройство), то возвращает nil.
---@param deviceId ObjectId
function device.GetMass(deviceId) end

--- Позволяет получить список названий сундуков в трюме корабля осматриваемого через визор навигатора.
function device.GetNavigatorTargetChests() end

--- Возвращает список целей заданий игрока, которые связаны с указанным устройством.
---@param deviceId ObjectId
---@return nil
function device.GetRelatedQuestObjectives(deviceId) end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает информацию о текущем сканируемом хабе.
---@return table|nil
function device.GetScanerHubInfo() end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER) и включил на устройстве просмотр информации об астрале, возвращает информацию о текущем сканируемом хабе.
---@return table|nil
function device.GetScanerPvEInfo() end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER) и включил на устройстве просмотр информации об игроках, возвращает информацию о текущем сканируемом хабе.
---@return table|nil
function device.GetScanerPvPInfo() end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает информацию о следе какого-либо корабля в текущем хабе корабля игрока.
---@param trailId ObjectId идентификатор следа
---@return table|nil
function device.GetScanerTrailInfo(trailId) end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает список следов кораблей в текущем хабе корабля.
---@return table
function device.GetScanerTrails() end

--- Возвращает силу щита, представленную парой - значение/максимальное значение. Если устройство не найдено или не является щитом, то возвращает nil.
---@param deviceId ObjectId
function device.GetShieldStrength(deviceId) end

--- Возвращает информацию о слоте используемого устройства (например пушка на корабле). Сторона корабля, на которой расположено устройство, представлена SHIP_SIDE_....
---@param deviceId ObjectId
function device.GetShipSlotInfo(deviceId) end

--- Возвращает титул устройства.
---@param deviceId ObjectId
---@return WString
function device.GetTitle(deviceId) end

--- Возвращает id транспорта(корабля), на котором расположено используемое устройство.
---@param deviceId ObjectId
function device.GetTransport(deviceId) end

--- Возвращает тип используемого устройства (например пушка на корабле). если устройство не найдено или оно не используемое, то возвращает USDEV_NOT_USABLE_DEVICE.
---@param deviceId ObjectId
function device.GetUsableDeviceType(deviceId) end

--- Если у активного навигационного устройства корабля есть возможность отслеживать, преследуется ли корабль главного игрока или нет, возвращает статус - преследуется/не преследуется.
function device.HasNavigatorFollowedMarker() end

--- Используется ли устройство кем-либо в текущий момент.
---@param deviceId ObjectId идентификатор устройства
---@return boolean
function device.IsInUse(deviceId) end

--- Возвращает true, если используемое устройство (например, прибор на корабле) выключено.
---@param deviceId ObjectId
function device.IsOffline(deviceId) end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), возвращает true.
function device.IsScanerScanning() end

--- Возвращает true, если щит находится в состоянии регенерирования.
---@param deviceId ObjectId
function device.IsShieldRegenInProgress(deviceId) end

--- Возвращает возможность принципиального использования устройства.
---@param deviceId ObjectId идентификатор устройства
---@return boolean
function device.IsUsable(deviceId) end

--- Возвращает цель устройства-навигатора корабля главного игрока.
function device.NavigatorGetTarget() end

--- Возвращает объект, на который назумлена камера устройства-навигатора корабля главного игрока.
function device.NavigatorGetZoomedObject() end

--- Если главный игрок использует навигационное устройство ( тип устройства - USDEV_NAVIGATOR), то он может выбрать или сбросить цель, отслеживаемую навигатором. Информация об этой цели начнет передаваться для всех членов команды игрока.
---@param objectId ObjectId|nil идентификатор транспорта или астрального юнита, или nil, если надо сбросить цель
function device.NavigatorSetTarget(objectId) end

--- Если главный игрок использует навигационное устройство ( тип устройства - USDEV_NAVIGATOR), то этим методом он может навестись на выбранный корабль или астрального юнита и расмотреть его ближе. влияет только на камеру, не затрагивая цель навигатора.
---@param objectId ObjectId
function device.NavigatorZoom(objectId) end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), устанавливает текущий сканируемый хаб целью навигационного сканера и будущего прыжка.
function device.SetScanerDestinationDevice() end

--- Если главный игрок использует навигационный сканер хабов (тип устройства - USDEV_SCANER), устанавливает текущий след корабля целью навигационного сканера и будущего прыжка.
---@param trailId ObjectId идентификатор следа
function device.SetScanerDestinationTrail(trailId) end

--- Возвращает список идентификаторов используемых устройств транспортного средства. Если транспорт не найден, то возвращает пустую таблицу.
---@param transportId ObjectId
function device.GetDevices(transportId) end

-- Events

--- Событие посылается в момент выстрела (тика) из лучемета. В этот момент уже известно, есть попадания или нет. Если нет, то targets = nil.
EVENT_BEAM_CANNON_SHOT_STARTED = "EVENT_BEAM_CANNON_SHOT_STARTED"

--- Событие посылается в момент попадания выстрела из пушки в цель (или просто окончании полета снаряда).
EVENT_CANNON_SHOT_FINISHED = "EVENT_CANNON_SHOT_FINISHED"

--- Событие посылается в момент начала каста выстрела из пушки.
EVENT_CANNON_SHOT_PREPARATION_STARTED = "EVENT_CANNON_SHOT_PREPARATION_STARTED"

--- Событие посылается в момент выстрела из пушки. В этот момент уже известно, попала пушка в цель или нет. Если промазала, то target = nil.
EVENT_CANNON_SHOT_STARTED = "EVENT_CANNON_SHOT_STARTED"

--- Событие посылается при изменении состояния устройства. Например, устройство кто-то стал использовать.
EVENT_CHEST_LOOTER_CHANGED = "EVENT_CHEST_LOOTER_CHANGED"

--- Событие посылается каждый раз, когда у одного из действий используемого устройства (например, выстрел огнём у пушки) изменилась эффективность.
EVENT_DEVICE_ACTION_EFFECTIVENESS_CHANGED = "EVENT_DEVICE_ACTION_EFFECTIVENESS_CHANGED"

--- Событие посылается каждый раз, когда у используемого устройства (например, рули, пушки на корабле) изменилось активное действие.
EVENT_DEVICE_ACTIVE_ACTION_CHANGED = "EVENT_DEVICE_ACTIVE_ACTION_CHANGED"

--- Событие посылается каждый раз, когда у одного экшена используемого устройства (например, выстрел огнём из пушки) закончился кулдаун.
EVENT_DEVICE_COOLDOWN_FINISHED = "EVENT_DEVICE_COOLDOWN_FINISHED"

--- Событие посылается каждый раз, когда у какого-либо дейсвия используемого устройства (например, поворот вправо у руля) меняется состояние доступности. См. avatar.GetUsableDeviceInfo().
EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED = "EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED"

--- Событие посылается каждый раз, когда у одного экшена используемого устройства (например, выстрел огнём у пушки) начинается кулдаун.
EVENT_DEVICE_COOLDOWN_STARTED = "EVENT_DEVICE_COOLDOWN_STARTED"

--- Событие присылается при нанесение повреждения устройству. См. EVENT_UNIT_DAMAGE_RECEIVED.
EVENT_DEVICE_DAMAGE_RECEIVED = "EVENT_DEVICE_DAMAGE_RECEIVED"

--- Событие присылается при изменение статуса смерти устройства (готово или уже использовано).
EVENT_DEVICE_DEAD_CHANGED = "EVENT_DEVICE_DEAD_CHANGED"

--- Событие посылается каждый раз, когда используемое устройство (например, рули, пушки на корабле) включается или выключается.
EVENT_DEVICE_OFFLINE_CHANGED = "EVENT_DEVICE_OFFLINE_CHANGED"

--- Событие посылается каждый раз, когда поюзанное устройство (например, рули, пушки на корабле) выключенно. Содержит причину.
EVENT_DEVICE_OFFLINE_REASON = "EVENT_DEVICE_OFFLINE_REASON"

--- Приходит, если изменился список заданий, связанных с устройством.
EVENT_DEVICE_RELATED_QUESTS_CHANGED = "EVENT_DEVICE_RELATED_QUESTS_CHANGED"

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает устройство (например улей или доска объявлений).
EVENT_DEVICES_CHANGED = "EVENT_DEVICES_CHANGED"

--- Событие посылается при попытке повернуть руль на нулевой скорости.
EVENT_DEVICE_ZERO_SPEED = "EVENT_DEVICE_ZERO_SPEED"

--- Событие посылается, когда навигационный сканер получил информацию об астрале в текущем сканируемом хабе сканера.
EVENT_NAVIGATION_SCANER_HUB_PVE_INFO = "EVENT_NAVIGATION_SCANER_HUB_PVE_INFO"

--- Событие посылается, когда навигационный сканер получил информацию об игроках в текущем сканируемом хабе сканера.
EVENT_NAVIGATION_SCANER_HUB_PVP_INFO = "EVENT_NAVIGATION_SCANER_HUB_PVP_INFO"

--- Событие посылается, когда навигационный сканер начал сканировать хаб и уже получил базовую информацию об этом хабе.
EVENT_NAVIGATION_SCANER_HUB_STARTED = "EVENT_NAVIGATION_SCANER_HUB_STARTED"

--- Событие посылается, когда навигационный сканер получил информацию о следах кораблей игроков в хабе главного игрока.
EVENT_NAVIGATION_SCANER_HUB_TRAILS_INFO = "EVENT_NAVIGATION_SCANER_HUB_TRAILS_INFO"

--- Событие посылается каждый раз, когда меняется статус device.HasNavigatorFollowedMarker().
EVENT_NAVIGATOR_FOLLOWED_CHANGED = "EVENT_NAVIGATOR_FOLLOWED_CHANGED"

--- Событие посылается каждый раз, когда меняется список сундуков во вражеской сокровищнице, увиденных с помощью специального предмета через навигатор корабля главного игрока.
EVENT_NAVIGATOR_TARGET_CHESTS_CHANGED = "EVENT_NAVIGATOR_TARGET_CHESTS_CHANGED"

--- Событие посылается каждый раз, когда у щита корабля меняется регенерирование.
EVENT_SHIELD_REGEN_IN_PROGRESS_CHANGED = "EVENT_SHIELD_REGEN_IN_PROGRESS_CHANGED"

--- Событие посылается каждый раз, когда у щита корабля меняется сила (само значение или максимальная величина).
EVENT_SHIELD_STRENGTH_CHANGED = "EVENT_SHIELD_STRENGTH_CHANGED"

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает корабельное устройство.
EVENT_USABLE_DEVICES_CHANGED = "EVENT_USABLE_DEVICES_CHANGED"
