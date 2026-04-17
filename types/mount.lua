---@meta

--- CategoryMount
--- Функции Lua Api связанные с ездовыми животными.

---@class mountLib
mount = {}

--- Привязывает вызов маунта-метаморфа из конюшни главного игрока к слоту экшен панели.
---@param index integer индекс слота от 0 до max
function mount.BindMountMetamorphToActionPanel(index) end

--- Привязывает вызов маунта с определенным скином из конюшни главного игрока к слоту экшен панели.
---@param skinId ObjectId Id скина маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function mount.BindMountSkinToActionPanel(skinId, index) end

--- Привязывает вызов маунта из конюшни главного игрока к слоту экшен панели.
---@param mountId ObjectId Id маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function mount.BindMountToActionPanel(mountId, index) end

--- Использовать выбранную вещь на маунта и выполнить какие-то воздействия.
---@param itemId ObjectId идентификатор предмета, который применяется на маунта
---@param mountId ObjectId идентификатор маунта, на который будет применятся предмет
function mount.UseItemOnMountAndTakeActions(itemId, mountId) end

--- Проверяет можно ли активировать предмет для применения на маунта. Исходный предмет должен обладать свойством IsUseOnMountAndTakeActions
---@param itemId ObjectId идентификатор активируемого предмета
---@return boolean|nil
function mount.CanActivateForUseOnMount(itemId) end

--- Проверяет можно ли применить предмет на маунта.
---@param itemId ObjectId идентификатор предмета, который используют
---@param mountId ObjectId идентификатор маунта, на котором используют предмет
---@return boolean|nil
function mount.CanUseOnMount(itemId, mountId) end

--- Информация об использовании предмета на маунта.
---@param itemId ObjectId идентификатор предмета
---@param mountId ObjectId идентификатор маунта
---@return table
function mount.GetUsageOnMountInfo(itemId, mountId) end

--- Информация об использовании предмета на маунта.
---@param itemId ObjectId идентификатор предмета
---@param mountId ObjectId идентификатор маунта
---@return table
function mount.GetUsagesOnMountInfo(itemId, mountId) end

--- Возвращает алиас курсора для использования на маунта с выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return string
function mount.GetUseOnMountCursor(itemId) end

--- Является ли предметом, который можно использовать на маунта с проверкой на том итемпредикатов и выполнением кастомных действий.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function mount.IsUseOnMountAndTakeActions(itemId) end

--- Показывает указанного маунта главного игрока в данном контроле-3D.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtCharacterControl3D Control3DSafe контрол, в котором должен отображаться персонаж
---@param mountSkinId ObjectId идентификатор отображаемого скина маунта главного игрока
function mount.SetMountScene(index, wtCharacterControl3D, mountSkinId) end

--- Показывает визуальный объект в данном контроле-3D.
---@param index integer индекс сцены, [0..GetMaxCharacterSceneCount() - 1]
---@param wtControl3D Control3DSafe контрол, в котором должен отображаться объект
---@param visObjectId VisObjectId идентификатор визуального объекта (эффекта) или его обвязки
function mount.SetMountScene(index, wtControl3D, visObjectId) end

--- Отозвать вызванное ездовое животное главного игрока в конюшню (игрок слезает с животного).
function mount.Dismount() end

--- Покормить ездовое животное из конюшни главного игрока одной порцией еды.
---@param mountId ObjectId идентификатор животного в конюшне
---@param amount integer|nil количество корма; необязательный параметр, по умолчанию 1
function mount.Feed(mountId, amount) end

--- Возвращает идентификатор вызванного в данный момент ездового животного из конюшни главного игрока.
---@return ObjectId|nil
function mount.GetActive() end

--- Возвращает текущий список контекстных действий ездового животного главного игрока.
---@return nil
function mount.GetActiveContextActions() end

--- Возвращает время в миллисекундах до полного истощения вызванного ездового животного главного игрока.
---@return number
function mount.GetActiveSatiation() end

--- Возвращает идентификатор текущего скина текущего ездового животного главного игрока.
function mount.GetActiveSkin() end

--- Возвращает время в миллисекундах до исчезновения вызванного ездового животного главного игрока из конюшни.
---@return number
function mount.GetActiveTimeLeftMs() end

--- Позволяет получить список доступных для выбора талантов маунта. Список может изменятся при изменении анлоков аватара EVENT_AVATAR_UNLOCKS_CHANGED.
---@param mountId ObjectId идентификатор маунта
---@return table|nil
function mount.GetAvailableTalents(mountId) end

--- Возвращает идентификатор имеющегося экзоскелета.
---@return ObjectId|nil
function mount.GetExoMount() end

--- Возвращает информацию о ездовом животном главного игрока.
---@param mountId ObjectId
function mount.GetInfo(mountId) end

--- Возвращает идентификатор ездового животного метаморфа из конюшни главного игрока.
---@return ObjectId|nil
function mount.GetMetamorph() end

--- Возвращает базовую информацию о метаморфе.
---@return table
function mount.GetMetamorphBaseInfo() end

--- Возвращает основное название ездового животного метаморфа из конюшни главного игрока, без имени его текущего облика.
---@return WString|nil
function mount.GetMetamorphName() end

--- Возвращает список животных в конюшне главного игрока.
---@return table
function mount.GetMounts() end

--- Возвращает список идентификаторов скинов ездового животного.
function mount.GetMountSkins() end

--- Позволяет получить текущий список выбранных талантов маунты, если таковые у него имеются. Выбрать таланты можно при помощи  mount.SelectTalents( mountId, talents ).
---@param mountId ObjectId идентификатор маунта
---@return MountTalentId[]|nil
function mount.GetSelectedTalents(mountId) end

--- Возвращает информацию о скине ездового животного.
---@param skinId ObjectId
function mount.GetSkinInfo(skinId) end

--- Возвращает информацию о конюшне главного игрока.
function mount.GetStableInfo() end

--- Возвращает информацию об альтернативной валюте талантов маунта.
---@return CurrencyId|nil
function mount.GetTalentCurrency() end

--- Информация о таланте маунта.
---@return table|nil
function mount.GetTalentInfo() end

--- Возвращает информацию о здоровье используемого ездового животного игрока.
---@param unitId ObjectId
function mount.GetUnitMountHealth(unitId) end

--- Возвращает true, если требуется оплата для переключения метаморфа на скин.
---@param skinId ObjectId идентификатор скина
---@return boolean
function mount.GetMetamorphBaseInfo(skinId) end

--- Возвращает true если есть такой маунт в конюшне главного игрока.
---@param mountId ObjectId
function mount.IsMountExist(mountId) end

--- Возвращает true, если у главного игрока есть конюшня.
---@return boolean
function mount.IsStableExist() end

--- Вызвать ездовое животное из конюшни главного игрока.
---@param skinId ObjectId идентификатор скина животного в конюшне
function mount.Ride(skinId) end

--- Позволяет выбрать таланты маунты, если таковые у него имеются. В случае успешного вызова сработает событие EVENT_STABLE_MOUNT_TALENTS_CHANGED
---@param mountId ObjectId идентификатор маунта
---@param talents ([] список выбранных талантов, таблица в которой ключем является номер слота, а значением идентификатор ресурса таланта, индексация с 1
function mount.SelectTalents(mountId, talents) end

--- Изменяет скин ездового животного метаморфа главного игрока. Скин должен быть доступен для использования.
---@param skinId ObjectId идентификатор скина ездового животного из конюшни главного игрока
function mount.SetMetamorphSkin(skinId) end

--- Изменяет скин активного ездового животного главного игрока. Если это скин не активного животного или уже используемый скин, то вызывает ошибку.
---@param skinId ObjectId идентификатор скина активного животного
function mount.SetSkin(skinId) end

--- Забирает ездовое животное главного игрока у побратима.
---@param mountId ObjectId идентификатор ездового животного из конюшни
function mount.GetBackMount(mountId) end

--- Отдает ездовое животное главного игрока обратно побратиму, у которого оно было взято.
---@param mountId ObjectId идентификатор ездового животного из конюшни
function mount.GiveBackMount(mountId) end

--- Передает ездовое животное главного игрока указанному побратиму.
---@param friendId ObjectId идентификатор побратима
---@param mountId ObjectId идентификатор ездового животного из конюшни
function mount.LendMount(friendId, mountId) end

--- Возвращает новый экземпляр ValuedObject по Id маунта.
function GetValuedObject() end

-- Events

--- Событие посылается каждый раз, когда у главного игрока меняется активное ездовое животное (он садится на него или слазит с него).
EVENT_ACTIVE_MOUNT_CHANGED = "EVENT_ACTIVE_MOUNT_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока поменялся скин ездового животного.
EVENT_ACTIVE_MOUNT_SKIN_CHANGED = "EVENT_ACTIVE_MOUNT_SKIN_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока кардинально поменялось время жизни ездового животного (сколько времени осталось до исчезновения этого животного из конюшни).
EVENT_ACTIVE_MOUNT_TIME_LEFT_CHANGED = "EVENT_ACTIVE_MOUNT_TIME_LEFT_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется количество еды для ездовых животных.
EVENT_STABLE_FOOD_CHANGED = "EVENT_STABLE_FOOD_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока появилось ездовое животное в конюшне.
EVENT_STABLE_MOUNT_ADDED = "EVENT_STABLE_MOUNT_ADDED"

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялись характеристики (опыт, максимум здоровья, максимум времени насыщения и т.п.).
EVENT_STABLE_MOUNT_CHANGED = "EVENT_STABLE_MOUNT_CHANGED"

--- Событие посылается каждый раз, когда одно из ездовых животных главного игрока проголодалось.
EVENT_STABLE_MOUNT_HUNGRY = "EVENT_STABLE_MOUNT_HUNGRY"

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялся уровень.
EVENT_STABLE_MOUNT_LEVEL_CHANGED = "EVENT_STABLE_MOUNT_LEVEL_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока исчезает ездовое животное из конюшни. Плучаемый идентификатор уже не валиден и по нему нельзя получить информацию об исчезнувшем животном.
EVENT_STABLE_MOUNT_REMOVED = "EVENT_STABLE_MOUNT_REMOVED"

--- Событие посылается каждый раз, когда у главного игрока меняется список ездовых животных в конюшне.
EVENT_STABLE_MOUNTS_CHANGED = "EVENT_STABLE_MOUNTS_CHANGED"

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялись свойства скинов (доступность).
EVENT_STABLE_MOUNT_SKINS_CHANGED = "EVENT_STABLE_MOUNT_SKINS_CHANGED"

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока меняются ативные(выбранные) таланты в результате вызова функции mount.SelectTalents( mountId, talents )
EVENT_STABLE_MOUNT_TALENTS_CHANGED = "EVENT_STABLE_MOUNT_TALENTS_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется количество слотов в конюшне.
EVENT_STABLE_SLOTS_COUNT_CHANGED = "EVENT_STABLE_SLOTS_COUNT_CHANGED"

--- Событие посылается каждый раз, когда у игрока меняется текущее здоровье ездового животного.
EVENT_UNIT_MOUNT_HEALTH_CHANGED = "EVENT_UNIT_MOUNT_HEALTH_CHANGED"
