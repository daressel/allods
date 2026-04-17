---@meta

--- CategoryHangar
--- События и методы для корабельного ангара главного игрока.

--- Тип визуального отображения пушек корабля на интерфейсе:
ENUM_CANNON_VISUAL_TYPE_CORVET = "ENUM_CANNON_VISUAL_TYPE_CORVET"
ENUM_CANNON_VISUAL_TYPE_BRIG = "ENUM_CANNON_VISUAL_TYPE_BRIG"

--- Числовой enum.
--- одолжен у лучшего друга
ENUM_ShipInfoMarker_BorrowedFromBestFriend = "ENUM_ShipInfoMarker_BorrowedFromBestFriend"
--- одолжен лучшему другу
ENUM_ShipInfoMarker_LentToBestFriend = "ENUM_ShipInfoMarker_LentToBestFriend"

---@class hangarLib
hangar = {}

--- Применяет текущую кастомизацию всех слотов для визуальной кастомизации корабля в ангаре главного игрока.
function hangar.ApplyCustomization() end

--- Возвращает true. если можно кастомизировать внешний вид корабля в ангаре.
function hangar.CanCustomize() end

--- Показывает, есть ли у аватара в данный момент возможность передать активный корабль лучшему другу.
function hangar.CanLendShip() end

--- Возвращает true, если можно удалить текущее корабельное устройство находясь в ангаре в режиме замены.
function hangar.CanRemoveDevice() end

--- Устанавливает устройство в слот визуальной кастомизации корабля главного игрока в ангаре.
---@param slotId ObjectId идентификатор слота для кастомизации
---@param deviceId ObjectId|nil идентификатор устройства для кастомизации или nil, если надо снять устройства с этого слота
function hangar.ChangeSlotCustomization(slotId, deviceId) end

--- Возвращает идентификатор активного корабля главного игрока.
function hangar.GetActiveShip() end

--- Возвращает идентификатор корпуса активного корабля главного игрока.
function hangar.GetActiveShipHull() end

--- Возвращает идентификатор скина корпуса активного корабля главного игрока.
function hangar.GetActiveShipSkin() end

--- Возвращает список список устройств имеющихся в ангаре, доступных для покупки в режиме просмотра. Возможно получить только после разговора с НПС в ангаре
function hangar.GetAllowedDeviceTypes() end

--- Возвращает список идентификаторов корпусов, которые можно задать активному кораблю главного игрока.
function hangar.GetAvailableHulls() end

--- Возвращает список идентификаторов скинов, которые можно задать активному корпусу активного корабля главного игрока.
function hangar.GetAvailableSkins() end

--- Возвращает информацию о прогрессе корабля, строящегося в ангаре. Можно получить только после специального запроса у НПС в ангаре.
function hangar.GetBuildProgress() end

--- Возвращает информацию о цене текущего устройства в заданном слоте. Возможно получить только после начала процесса кастомизации.
---@param slotId ObjectId идентификатор слота для кастомизации
---@return number
function hangar.GetCustomizationCost(slotId) end

--- Возвращает информацию о валюте для замены устройств. Возможно получить только после начала процесса кастомизации.
---@return CurrencyId
function hangar.GetCustomizationCurrency() end

--- Возвращает список идентификаторов устройств для кастомизации определённого слота корабля, имеющихся в ангаре. Возможно получить только после начала процесса кастомизации.
---@param slotId ObjectId идентификатор слота для кастомизации
---@return table
function hangar.GetCustomizationSlotDevices(slotId) end

--- Возвращает информацию о слоте для визуальной кастомизации корабля в ангаре главного игрока. Возможно получить только после начала процесса кастомизации.
---@param slotId ObjectId идентификатор слота для кастомизации
---@return table|nil
function hangar.GetCustomizationSlotInfo(slotId) end

--- Возвращает список слотов для визуальной кастомизации корабля в ангаре главного игрока. Возможно получить только после начала процесса кастомизации.
function hangar.GetCustomizationSlots() end

--- Возвращает информацию по устройству, находящемуся в ангаре.
---@param deviceId ObjectId идентификатор устройства
function hangar.GetDeviceInfo(deviceId) end

--- Возвращает список идентификаторов устройств, находящихся в ангаре главного игрока. Возможно получить только после разговора с НПС в ангаре
function hangar.GetDevices() end

--- Выдаёт информацию о корпусе корабля.
---@param hullId VisualShipId идентификатор корпуса корабля
function hangar.GetHullInfo(hullId) end

--- Возвращает идентификатор спелла, используемого для передачи корабля. Для каста спеллу нужна цель - аватар, которому передаётся корабль.
function hangar.GetLendShipSpellId() end

--- Возвращает случайное имя для транспортного средства. Имя генерится по принципу: имя-число, например Касатка-2351, где имя зависит от фракции аватара.
---@return WString
function hangar.GetRandomName() end

--- Возвращает информацию о прогрессе корабля, ремонтирующегося в ангаре. Можно получить только после специального запроса у НПС в ангаре.
function hangar.GetRepairProgress() end

--- Возвращает идентификатор спелла, используемого для возврата одолженного корабля его хозяину.
function hangar.GetReturnLendedShipSpellId() end

--- Возвращает информацию по кораблю, находящемуся в ангаре.
---@param shipId ObjectId идентификатор корабля
function hangar.GetShipInfo(shipId) end

--- Возвращает список идентификаторов кораблей, находящихся в ангаре главного игрока.
function hangar.GetShips() end

--- Выдаёт информацию о скине корпуса корабля.
---@param skinId ShipSkinId идентификатор скина корпуса корабля
function hangar.GetSkinInfo(skinId) end

--- Возвращает список идентификаторов устройств, находящихся в ангаре главного игрока, которые можно поставить в определенный слот на корабле. Возможно получить только после запроса у требуемого слота.
function hangar.GetSlotDevices() end

--- Возвращает идентификатор спелла, используемого для призыва в ангар корабля главного игрока. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id )), вместо каста надо использовать  hangar.SummonShip( shipId ).
function hangar.GetSummonShipSpellId() end

--- Возвращает идентификатор спелла, используемого для смены корпуса корабля. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), вместо каста надо использовать hangar.SwitchShipMasterHull( hullId ).
function hangar.GetSwitchShipMasterHullSpellId() end

--- Возвращает идентификатор спелла, используемого для смены скина корабля. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), вместо каста надо использовать hangar.SwitchShipSkin( hullId ).
function hangar.GetSwitchShipSkinSpellId() end

--- Возвращает идентификатор спелла, используемого для отбирания у лучшего друга ранее одолженного ему корабля главного игрока. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), а для самого действия вместо каста надо использовать  hangar.TakeAwayShip( shipId ). При изменении состояния спелла посылается событие EVENT_HANGAR_SPELL_CHANGED.
function hangar.GetTakeAwaySpellId() end

--- Возвращает идентификатор спелла, используемого для отзыва корабля из ангара. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), вместо каста надо использовать  hangar.UnsummonShip( shipId ).
function hangar.GetUnsummonShipSpellId() end

--- Передать активный корабль во временное пользование другому аватару. Аватар должен быть лучшим другом и быть онлайн (см.  social.GetFriendList(), поля isBestFriend и sysOnlineStatus).
---@param friendId ObjectId id аватара, которому передаётся корабль; это не обычный идентификатор игрока, а тот, который выдаёт social.GetFriendList()
function hangar.LendShip(friendId) end

--- Посмотреть на устройство в ангаре перед покупкой, находясь в ангаре в режиме замены. Идентификатор один из возвращенных  hangar.GetAllowedDeviceTypes().
---@param deviceId ObjectId идентификатор устройства
function hangar.PreviewPurchasedDevice(deviceId) end

--- Купить корабельное устройство находясь в ангаре в режиме замены. Идентификатор один из возвращенных  hangar.GetAllowedDeviceTypes().
---@param deviceId ObjectId идентификатор устройства
function hangar.PurchaseDevice(deviceId) end

--- Удалить корабельное устройство находясь в ангаре в режиме замены.
function hangar.RemoveDevice() end

--- Удалить корабельное устройство из хранимых в ангаре устройств.
---@param deviceId ObjectId идентификатор устройства, хранящегося в ангаре
---@param count integer количество удаляемых устройств
function hangar.RemoveDeviceFromHangar(deviceId, count) end

--- Изменяет имя транспортного средства. В ответ прийдёт EVENT_TRANSPORT_RENAME_REPLY_RESULT.
---@param name WString желаемое имя транспорта
function hangar.Rename(name) end

--- Ответить на запрос о ремонте корабля - EVENT_HANGAR_REPAIR_QUESTION.
---@param positive boolean согласится или нет на ремонт
---@param ticks integer на сколько тиков ускорить ремонт
function hangar.RepairReply(positive, ticks) end

--- Заменить корабельное устройство находясь в ангаре в режиме замены. Идентификатор один из возвращенных hangar.GetSlotDevices().
---@param deviceId ObjectId идентификатор устройства
function hangar.ReplaceDevice(deviceId) end

--- Сбросить предпросмотр устройств в ангаре перед покупкой, находясь в ангаре в режиме замены.
function hangar.ResetDevicePreview() end

--- Откатывет кастомизацию всех слотов для визуальной кастомизации корабля в ангаре главного игрока.
function hangar.RevertCustomization() end

--- Вызывает корабль, находящийся в ангаре из списка  hangar.GetShips().
---@param shipId ObjectId идентификатор корабля
function hangar.SummonShip(shipId) end

--- Меняет корпус активному кораблю главного игрока на заданный. Корпус должен присутствовать в списке, возвращаемом hangar.GetAvailableHulls()
---@param hullId VisualShipId идентификатор корпуса корабля
function hangar.SwitchShipMasterHull(hullId) end

--- Меняет скин активного корпуса активного корабля главного игрока на заданный. Скин должен присутствовать в списке, возвращаемом hangar.GetAvailableSkins()
---@param hullId ShipSkinId идентификатор корпуса корабля
function hangar.SwitchShipSkin(hullId) end

--- Отбирает корабль ранее одолженный корабль обратно. О возможности действия можно судить по спеллу, получаемому из hangar.GetTakeAwaySpellId() (поле enabled у  spellLib.GetState( id ) ). При изменении состояния посылается событие EVENT_HANGAR_SPELL_CHANGED.
---@param shipId ObjectId идентификатор корабля
function hangar.TakeAwayShip(shipId) end

--- Убирает корабль из ангара.
function hangar.UnsummonShip() end

-- Events

--- Уведомление о смене корпуса активного корабля.
EVENT_HANGAR_ACTIVE_HULL_CHANGED = "EVENT_HANGAR_ACTIVE_HULL_CHANGED"

--- Уведомление о смене активного корабля.
EVENT_HANGAR_ACTIVE_SHIP_CHANGED = "EVENT_HANGAR_ACTIVE_SHIP_CHANGED"

--- Уведомление об изменении списка доступных для выбора корпусов у активного корабля кораблей.
EVENT_HANGAR_ACTIVE_SHIP_HULLS_CHANGED = "EVENT_HANGAR_ACTIVE_SHIP_HULLS_CHANGED"

--- Уведомление об изменении списка доступных для выбора скинов корпуса активного корабля.
EVENT_HANGAR_ACTIVE_SHIP_SKINS_CHANGED = "EVENT_HANGAR_ACTIVE_SHIP_SKINS_CHANGED"

--- Уведомление о смене скина корпуса активного корабля.
EVENT_HANGAR_ACTIVE_SKIN_CHANGED = "EVENT_HANGAR_ACTIVE_SKIN_CHANGED"

--- Уведомление о получении списка имеющихся устройств, после запроса НПС в ангаре.
EVENT_HANGAR_DEVICES_RECEIVED = "EVENT_HANGAR_DEVICES_RECEIVED"

--- Приходит информация о требуемом ремонте корабля. Требуется ответ hangar.RepairReply( positive ), чтобы начать или отменить ремонт.
EVENT_HANGAR_REPAIR_QUESTION = "EVENT_HANGAR_REPAIR_QUESTION"

--- Уведомление об изменении списка доступных для выбора кораблей.
EVENT_HANGAR_SHIPS_CHANGED = "EVENT_HANGAR_SHIPS_CHANGED"

--- Уведомление о получении списка имеющихся устройств для замены, после запроса слота в ангаре.
EVENT_HANGAR_SLOT_DEVICES_RECEIVED = "EVENT_HANGAR_SLOT_DEVICES_RECEIVED"

--- Уведомление об изменении одного из спеллов, используемых для работы с кораблём в ангаре, например в случае, когда изменилась возможность использовать этот спелл.
EVENT_HANGAR_SPELL_CHANGED = "EVENT_HANGAR_SPELL_CHANGED"

--- Оповещение о начале эффекта для одного из спеллов, используемых для работы с кораблём в ангаре. Аналогично  EVENT_SPELLBOOK_ELEMENT_EFFECT.
EVENT_HANGAR_SPELL_EFFECT = "EVENT_HANGAR_SPELL_EFFECT"

--- Уведомление об изменении в процессе кастомизации корабля в ангаре главного игрока.
EVENT_SHIP_CUSTOMIZING_CHANGED = "EVENT_SHIP_CUSTOMIZING_CHANGED"

--- Уведомление о получении конце кастомизации корабля в ангаре главного игрока.
EVENT_SHIP_CUSTOMIZING_FINISHED = "EVENT_SHIP_CUSTOMIZING_FINISHED"

--- Уведомление о получении начале кастомизации корабля в ангаре главного игрока. Начиная с этого момента можно заменять визуальные украшения корабля прямо на самом корабле.
EVENT_SHIP_CUSTOMIZING_STARTED = "EVENT_SHIP_CUSTOMIZING_STARTED"

--- Событие посылается в случае, если транспорт необходимо переименовать
EVENT_TRANSPORT_RENAME_REPLY = "EVENT_TRANSPORT_RENAME_REPLY"

--- Событие посылается в случае, если была попытка переименования транспорта  hangar.Rename( name ).
EVENT_TRANSPORT_RENAME_REPLY_RESULT = "EVENT_TRANSPORT_RENAME_REPLY_RESULT"
