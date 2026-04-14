---@meta

---@class hangarLib
hangar = {}

---@class HangarGetCustomizationSlotInfoResult
---@field id ObjectId идентификатор слота для кастомизации
---@field sysName string системное имя слота
---@field currentDeviceId ObjectId|nil идентификатор текущего (в процессе кастомизации) поставленного в этот слот устройства, находящегося в ангаре
---@field initialDeviceId ObjectId|nil идентификатор действительного (на реальном корабле) поставленного в этот слот устройства, находящегося в ангаре

---Применяет текущую кастомизацию всех слотов для визуальной кастомизации корабля в ангаре главного игрока.
---@return нет
function hangar.ApplyCustomization() end

---Возвращает true. если можно кастомизировать внешний вид корабля в ангаре.
function hangar.CanCustomize() end

---Показывает, есть ли у аватара в данный момент возможность передать активный корабль лучшему другу.
function hangar.CanLendShip() end

---Возвращает true, если можно удалить текущее корабельное устройство находясь в ангаре в режиме замены.
function hangar.CanRemoveDevice() end

---Устанавливает устройство в слот визуальной кастомизации корабля главного игрока в ангаре.
---@param slotId ObjectId идентификатор слота для кастомизации
---@param deviceId ObjectId|nil идентификатор устройства для кастомизации или nil, если надо снять устройства с этого слота
---@return нет
function hangar.ChangeSlotCustomization(slotId, deviceId) end

---Возвращает идентификатор активного корабля главного игрока.
function hangar.GetActiveShip() end

---Возвращает идентификатор корпуса активного корабля главного игрока.
function hangar.GetActiveShipHull() end

---Возвращает идентификатор скина корпуса активного корабля главного игрока.
function hangar.GetActiveShipSkin() end

---Возвращает список список устройств имеющихся в ангаре, доступных для покупки в режиме просмотра. Возможно получить только после разговора с НПС в ангаре
---@param deviceId ObjectId идентификатор устройства
---@param currencyId CurrencyId|nil идентификатор альтернативной валюты, если стоимость выражена в ней/ Иначе стоимость выражена в деньгах
---@param amount integer стоимость устройства в валюте, если есть currencyId, или в меди (деньгах), если currencyId = nil
function hangar.GetAllowedDeviceTypes(deviceId, currencyId, amount) end

---Возвращает список идентификаторов корпусов, которые можно задать активному кораблю главного игрока.
function hangar.GetAvailableHulls() end

---Возвращает список идентификаторов скинов, которые можно задать активному корпусу активного корабля главного игрока.
function hangar.GetAvailableSkins() end

---Возвращает информацию о прогрессе корабля, строящегося в ангаре. Можно получить только после специального запроса у НПС в ангаре.
---@param percent number процент готовности
---@param timeLeft таблица, сколько времени осталось до готовности:
function hangar.GetBuildProgress(percent, timeLeft) end

---Возвращает информацию о цене текущего устройства в заданном слоте. Возможно получить только после начала процесса кастомизации.
---@param slotId ObjectId идентификатор слота для кастомизации
---@return number
function hangar.GetCustomizationCost(slotId) end

---Возвращает информацию о валюте для замены устройств. Возможно получить только после начала процесса кастомизации.
---@return CurrencyId
function hangar.GetCustomizationCurrency() end

---Возвращает список идентификаторов устройств для кастомизации определённого слота корабля, имеющихся в ангаре. Возможно получить только после начала процесса кастомизации. Информацию по устройствам можно получить в  hangar.GetDeviceInfo( deviceId ).
---@param slotId ObjectId идентификатор слота для кастомизации
---@return ObjectId[]
function hangar.GetCustomizationSlotDevices(slotId) end

---Возвращает информацию о слоте для визуальной кастомизации корабля в ангаре главного игрока. Возможно получить только после начала процесса кастомизации. Информацию по устройствам можно получить в  hangar.GetDeviceInfo( deviceId ).
---@param slotId ObjectId идентификатор слота для кастомизации
---@return HangarGetCustomizationSlotInfoResult
function hangar.GetCustomizationSlotInfo(slotId) end

---Возвращает список слотов для визуальной кастомизации корабля в ангаре главного игрока. Возможно получить только после начала процесса кастомизации.
function hangar.GetCustomizationSlots() end

---Возвращает информацию по устройству, находящемуся в ангаре. Константы качества:  ITEM_QUALITY_.... Типы устройств: USDEV_....
---@param deviceId ObjectId идентификатор устройства
---@param id ObjectId идентификатор устройства
---@param name string имя устройства
---@param description ValuedText|nil описание с подставленными текущими значениями параметров
---@param sysDebugName string|nil дебажный идентификатор ресурса или nil для финальной версии
---@param image TextureId идентификатор иконки устройства
---@param mass number масса устройства
---@param count integer количество таких устройств в ангаре
---@param quality number качество предмета
---@param type number тип устройства
---@param techLevel integer технический уровень устройства
---@param category string|nil если задана категория устройства, то название категории
---@param sysCategoryName string|nil системное уникальное название категории устройств
function hangar.GetDeviceInfo(deviceId, id, name, description, sysDebugName, image, mass, count, quality, type, techLevel, category, sysCategoryName) end

---Возвращает список идентификаторов устройств, находящихся в ангаре главного игрока. Возможно получить только после разговора с НПС в ангаре
function hangar.GetDevices() end

---Выдаёт информацию о корпусе корабля.
---@param hullId VisualShipId идентификатор корпуса корабля
---@param name string название корпуса (локализованое)
---@param description string описание корпуса (локализованое)
---@param image TextureId иконка
function hangar.GetHullInfo(hullId, name, description, image) end

---Возвращает идентификатор спелла, используемого для передачи корабля. Для каста спеллу нужна цель - аватар, которому передаётся корабль.
function hangar.GetLendShipSpellId() end

---Возвращает случайное имя для транспортного средства. Имя генерится по принципу: имя-число, например Касатка-2351, где имя зависит от фракции аватара.
---@return string
function hangar.GetRandomName() end

---Возвращает информацию о прогрессе корабля, ремонтирующегося в ангаре. Можно получить только после специального запроса у НПС в ангаре.
---@param percent number процент ремонта
---@param timeLeft таблица, сколько времени осталось до окончания ремонта:
function hangar.GetRepairProgress(percent, timeLeft) end

---Возвращает идентификатор спелла, используемого для возврата одолженного корабля его хозяину.
function hangar.GetReturnLendedShipSpellId() end

---Возвращает информацию по кораблю, находящемуся в ангаре.
---@param shipId ObjectId идентификатор корабля
---@param id ObjectId идентификатор корабля
---@param name string имя корабля такого типа
---@param sysDebugName string|nil дебажный идентификатор ресурса или nil для финальной версии
---@param markers table или nil nil если нет информации; иначе набор маркеров, описывающих состояние корабля; каждый отдельный маркер, которым помечен корабль, представлен элементом таблицы с ключом, являющимся одним из элементов ENUM_ShipInfoMarker_... и значением true
---@param image TextureId идентификатор иконки корабля такого типа
---@param isSummoned boolean true, если корабль был уже вызван
---@param mass number масса корабля без устройств
function hangar.GetShipInfo(shipId, id, name, sysDebugName, markers, image, isSummoned, mass) end

---Возвращает список идентификаторов кораблей, находящихся в ангаре главного игрока.
function hangar.GetShips() end

---Выдаёт информацию о скине корпуса корабля.
---@param skinId ShipSkinId идентификатор скина корпуса корабля
---@param name string название скина (локализованое)
---@param description string описание скина (локализованое)
---@param image TextureId иконка
function hangar.GetSkinInfo(skinId, name, description, image) end

---Возвращает список идентификаторов устройств, находящихся в ангаре главного игрока, которые можно поставить в определенный слот на корабле. Возможно получить только после запроса у требуемого слота.
function hangar.GetSlotDevices() end

---Возвращает идентификатор спелла, используемого для призыва в ангар корабля главного игрока. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id )), вместо каста надо использовать  hangar.SummonShip( shipId ).
function hangar.GetSummonShipSpellId() end

---Возвращает идентификатор спелла, используемого для смены корпуса корабля. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), вместо каста надо использовать hangar.SwitchShipMasterHull( hullId ).
function hangar.GetSwitchShipMasterHullSpellId() end

---Возвращает идентификатор спелла, используемого для смены скина корабля. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), вместо каста надо использовать hangar.SwitchShipSkin( hullId ).
function hangar.GetSwitchShipSkinSpellId() end

---Возвращает идентификатор спелла, используемого для отбирания у лучшего друга ранее одолженного ему корабля главного игрока. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), а для самого действия вместо каста надо использовать  hangar.TakeAwayShip( shipId ). При изменении состояния спелла посылается событие EVENT_HANGAR_SPELL_CHANGED.
function hangar.GetTakeAwaySpellId() end

---Возвращает идентификатор спелла, используемого для отзыва корабля из ангара. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), вместо каста надо использовать  hangar.UnsummonShip( shipId ).
function hangar.GetUnsummonShipSpellId() end

---Передать активный корабль во временное пользование другому аватару. Аватар должен быть лучшим другом и быть онлайн (см.  social.GetFriendList(), поля isBestFriend и sysOnlineStatus).
---@param friendId ObjectId id аватара, которому передаётся корабль; это не обычный идентификатор игрока, а тот, который выдаёт social.GetFriendList()
function hangar.LendShip(friendId) end

---Посмотреть на устройство в ангаре перед покупкой, находясь в ангаре в режиме замены. Идентификатор один из возвращенных  hangar.GetAllowedDeviceTypes().
---@param deviceId ObjectId идентификатор устройства
function hangar.PreviewPurchasedDevice(deviceId) end

---Купить корабельное устройство находясь в ангаре в режиме замены. Идентификатор один из возвращенных  hangar.GetAllowedDeviceTypes().
---@param deviceId ObjectId идентификатор устройства
function hangar.PurchaseDevice(deviceId) end

---Удалить корабельное устройство находясь в ангаре в режиме замены.
function hangar.RemoveDevice() end

---Удалить корабельное устройство из хранимых в ангаре устройств.
---@param deviceId ObjectId идентификатор устройства, хранящегося в ангаре
---@param count integer количество удаляемых устройств
function hangar.RemoveDeviceFromHangar(deviceId, count) end

---Изменяет имя транспортного средства. В ответ прийдёт EVENT_TRANSPORT_RENAME_REPLY_RESULT.
---@param name string желаемое имя транспорта
---@return нет
function hangar.Rename(name) end

---Ответить на запрос о ремонте корабля - EVENT_HANGAR_REPAIR_QUESTION. Ремонт ускоряется на указанное количество тиков. При этом у игрока забирается необходимое количество ресурсов, требуемых для ускорения ремонта.
---@param positive boolean согласится или нет на ремонт
---@param ticks integer на сколько тиков ускорить ремонт
function hangar.RepairReply(positive, ticks) end

---Заменить корабельное устройство находясь в ангаре в режиме замены. Идентификатор один из возвращенных hangar.GetSlotDevices().
---@param deviceId ObjectId идентификатор устройства
function hangar.ReplaceDevice(deviceId) end

---Сбросить предпросмотр устройств в ангаре перед покупкой, находясь в ангаре в режиме замены.
function hangar.ResetDevicePreview() end

---Откатывет кастомизацию всех слотов для визуальной кастомизации корабля в ангаре главного игрока.
---@return нет
function hangar.RevertCustomization() end

---Вызывает корабль, находящийся в ангаре из списка  hangar.GetShips().
---@param shipId ObjectId идентификатор корабля
---@return нет
function hangar.SummonShip(shipId) end

---Меняет корпус активному кораблю главного игрока на заданный. Корпус должен присутствовать в списке, возвращаемом hangar.GetAvailableHulls()
---@param hullId VisualShipId идентификатор корпуса корабля
function hangar.SwitchShipMasterHull(hullId) end

---Меняет скин активного корпуса активного корабля главного игрока на заданный. Скин должен присутствовать в списке, возвращаемом hangar.GetAvailableSkins()
---@param hullId ShipSkinId идентификатор корпуса корабля
function hangar.SwitchShipSkin(hullId) end

---Отбирает корабль ранее одолженный корабль обратно. О возможности действия можно судить по спеллу, получаемому из hangar.GetTakeAwaySpellId() (поле enabled у  spellLib.GetState( id ) ). При изменении состояния посылается событие EVENT_HANGAR_SPELL_CHANGED.
---@param shipId ObjectId идентификатор корабля
---@return нет
function hangar.TakeAwayShip(shipId) end

---Убирает корабль из ангара.
function hangar.UnsummonShip() end
