---@meta

---@class mountLib
mount = {}

---@class MountGetAvailableTalentsResult
---@field name string|nil название
---@field description string|nil описание
---@field hasCustomRank boolean true если таланты для данного слота имеют ранги
---@field talents MountTalentId[] доступные для данного слота таланты(индексация с 1)

---@class MountGetMetamorphBaseInfoResult
---@field switchCost integer цена переключения маунта на метаморфе
---@field switchCostcurrencyId CurrencyId|nil если информация доступна, то идентификатор ресурса альтернативной валюты, затрачиваемой на переключение маунта

---@class MountGetTalentInfoResult
---@field price integer стоимость при выборе
---@field unlock UnlockId идентификатор ресурса анлока для получаения данного таланта
---@field unlockItems table (from 0) of ItemId предвметы разблокирующий данный талант
---@field talentGroups table (from 0) of MountTalentGroupId список групп талантов маунта, к которым относится данный талант
---@field conflictGroups table (from 0) of MountTalentGroupId список групп талантов маунта, с которыми конфликтует данный талант

---Отозвать вызванное ездовое животное главного игрока в конюшню (игрок слезает с животного).
---@return нет
function mount.Dismount() end

---Покормить ездовое животное из конюшни главного игрока одной порцией еды.
---@param mountId ObjectId идентификатор животного в конюшне
---@param amount integer|nil количество корма; необязательный параметр, по умолчанию 1
---@return нет
function mount.Feed(mountId, amount) end

---Возвращает идентификатор вызванного в данный момент ездового животного из конюшни главного игрока.
---@return ObjectId|nil
function mount.GetActive() end

---Возвращает текущий список контекстных действий ездового животного главного игрока.
---@return nil|ObjectId[]
function mount.GetActiveContextActions() end

---Возвращает время в миллисекундах до полного истощения вызванного ездового животного главного игрока.
---@return integer
function mount.GetActiveSatiation() end

---Возвращает идентификатор текущего скина текущего ездового животного главного игрока.
function mount.GetActiveSkin() end

---Возвращает время в миллисекундах до исчезновения вызванного ездового животного главного игрока из конюшни.
---@return integer|nil
function mount.GetActiveTimeLeftMs() end

---Позволяет получить список доступных для выбора талантов маунта. Список может изменятся при изменении анлоков аватара EVENT_AVATAR_UNLOCKS_CHANGED.
---@param mountId ObjectId идентификатор маунта
---@return MountGetAvailableTalentsResult
function mount.GetAvailableTalents(mountId) end

---Возвращает идентификатор имеющегося экзоскелета.
---@return ObjectId|nil
function mount.GetExoMount() end

---Возвращает информацию о ездовом животном главного игрока.
---@param mountId ObjectId (not nil) -- идентификатор ездового животного
---@param id ObjectId идентификатор животного
---@param grade integer грейд
---@param name string название
---@param description ValuedText|nil описание
---@param sysName string|nil служебное название
---@param debugName string|nil путь к файлу описания предмета (отладочная информация)
---@param canGainExperience boolean получает ли животное опыт будучи призванным и прокачивает ли свой уровень
---@param experience integer опыт, накопленный животным
---@param level integer уровень, зависящий от опыта
---@param levelExperience integer базовый опыт для этого уровня
---@param nextLevelExperience integer опыт для следующего уровня
---@param satiationMs integer текущее время до полного истощения (меняется при кормлении)
---@param canBeFeeded boolean можно ли покормить этого маунта в принципе
---@param canBeMorphed boolean можно ли применять в сочетании с метаморфом
---@param isProbe boolean этот маунт является пробником
---@param isExoMount boolean этот маунт является экзоскелетом
---@param experienceToday integer сколько опыта получено за сегодня
---@param timeActivatedLeftMs integer|nil если у животного есть время жизни, то колличество миллисекунд до исчезновения животного из конюшни (время уменьшается, только если это животное вызвано в данный момент)
---@param timeTotalLeftMs integer|nil если у животного есть время жизни, то колличество миллисекунд до исчезновения животного из конюшни (время уменьшается в любом случае)
---@param currentLevelStats table таблица с полями, описывающими характеристики маунта на текущем уровне
---@param speed number скорость (м/с)
---@param health integer максимум здоровья
---@param regen number реген (количество восстановленного здоровья в секунду)
---@param castTimeMs integer время для вызова из конюшни в миллисекундах
---@param nextLevelStats table таблица с полями, описывающими характеристики маунта на следующем уровне. Поля такие же, как в currentLevelStats.
---@param hasLender boolean true, если ездовое животное выдано лучшим другом
---@param lenderId ObjectId|nil идентификатор лучшего друга, который дал ездовое животное
---@param hasBorrower boolean true, если ездовое животное выдано лучшему другу
---@param borrowerId ObjectId|nil идентификатор лучшего друга, которому ездовое животное отдано
---@param image TextureId идентификатор текстуры для иконки маунта
function mount.GetInfo(mountId, id, grade, name, description, sysName, debugName, canGainExperience, experience, level, levelExperience, nextLevelExperience, satiationMs, canBeFeeded, canBeMorphed, isProbe, isExoMount, experienceToday, timeActivatedLeftMs, timeTotalLeftMs, currentLevelStats, speed, health, regen, castTimeMs, nextLevelStats, hasLender, lenderId, hasBorrower, borrowerId, image) end

---Возвращает идентификатор ездового животного метаморфа из конюшни главного игрока.
---@return ObjectId|nil
function mount.GetMetamorph() end

---Возвращает базовую информацию о метаморфе.
---@return MountGetMetamorphBaseInfoResult
function mount.GetMetamorphBaseInfo() end

---Возвращает основное название ездового животного метаморфа из конюшни главного игрока, без имени его текущего облика.
---@return string|nil
function mount.GetMetamorphName() end

---Возвращает список животных в конюшне главного игрока.
---@return ObjectId[]
function mount.GetMounts() end

---Возвращает список идентификаторов скинов ездового животного.
function mount.GetMountSkins() end

---Позволяет получить текущий список выбранных талантов маунты, если таковые у него имеются. Выбрать таланты можно при помощи  mount.SelectTalents( mountId, talents ).
---@param mountId ObjectId идентификатор маунта
---@return MountTalentId|nil[]
function mount.GetSelectedTalents(mountId) end

---Возвращает информацию о скине ездового животного.
---@param skinId ObjectId (not nil) -- идентификатор скина ездового животного
---@param id ObjectId идентификатор скина
---@param mountId ObjectId идентификатор маунта, которому принадлежит скин
---@param name string название скина
---@param description string описание скина
---@param sourceDescription string описание источника скина (как разблокировать этот скин)
---@param enabled boolean доступен ли этот скин сейчас
---@param debugName string|nil путь к файлу описания предмета (отладочная информация)
---@param image TextureId идентификатор текстуры для иконки скина
function mount.GetSkinInfo(skinId, id, mountId, name, description, sourceDescription, enabled, debugName, image) end

---Возвращает информацию о конюшне главного игрока.
---@param singleFeedSatiationTime integer на сколько миллисекунд насыщается животное за одно кормление
---@param maxSatiationTime integer максимум миллисекунд, на сколько насыщается животное
---@param maxLevel integer максимальный уровень животного
---@param maxGrade integer максимальный грейд животного
---@param slotsCount integer количество слотов в конюшне
---@param foodCount integer имеющееся количество еды
---@param maxExperienceToday integer максимально возможное количество получаемого опыта за день
function mount.GetStableInfo(singleFeedSatiationTime, maxSatiationTime, maxLevel, maxGrade, slotsCount, foodCount, maxExperienceToday) end

---Возвращает информацию об альтернативной валюте талантов маунта.
---@return CurrencyId|nil
function mount.GetTalentCurrency() end

---Информация о таланте маунта.
---@return MountGetTalentInfoResult
function mount.GetTalentInfo() end

---Возвращает информацию о здоровье используемого ездового животного игрока.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@param health integer здоровье
---@param healthLimit integer максимум здоровье
function mount.GetUnitMountHealth(unitId, health, healthLimit) end

---Возвращает новый экземпляр ValuedObject по Id маунта.
function mount.GetValuedObject() end

---Возвращает true, если требуется оплата для переключения метаморфа на скин.
---@param skinId ObjectId идентификатор скина
---@return boolean
function mount.HasSwitchCost(skinId) end

---Возвращает true если есть такой маунт в конюшне главного игрока.
---@param mountId ObjectId (not nil) -- идентификатор ездового животного
function mount.IsMountExist(mountId) end

---Возвращает true, если у главного игрока есть конюшня.
---@return boolean
function mount.IsStableExist() end

---Вызвать ездовое животное из конюшни главного игрока.
---@param skinId ObjectId идентификатор скина животного в конюшне
---@return нет
function mount.Ride(skinId) end

---Позволяет выбрать таланты маунты, если таковые у него имеются. В случае успешного вызова сработает событие EVENT_STABLE_MOUNT_TALENTS_CHANGED Ограничения. 1. Таланты должны быть выбраны из списка доступных mount.GetAvailableTalents( mountId ) 2. Количество выбираемых талантов должно совпадать с числом слотов талантов. 3. Один и тот же талант нельзя использовать в нескольких слотах сразу.
---@param mountId ObjectId идентификатор маунта
---@param talents ( MountTalentId|nil )[] список выбранных талантов, таблица в которой ключем является номер слота, а значением идентификатор ресурса таланта, индексация с 1
---@return нет
function mount.SelectTalents(mountId, talents) end

---Изменяет скин ездового животного метаморфа главного игрока. Скин должен быть доступен для использования.
---@param skinId ObjectId идентификатор скина ездового животного из конюшни главного игрока
---@return нет
function mount.SetMetamorphSkin(skinId) end

---Изменяет скин активного ездового животного главного игрока. Если это скин не активного животного или уже используемый скин, то вызывает ошибку.
---@param skinId ObjectId идентификатор скина активного животного
---@return нет
function mount.SetSkin(skinId) end
