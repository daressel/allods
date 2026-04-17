---@meta

--- CategoryAvatarInfo
--- Функции Lua Api, предоставляющие информацию об аватаре игрока.

--- Перечисления для представления характеристик персонажа, не вписывающиеся почему-либо в ENUM_InnateStats.
ENUM_CreatureStat_HealthRegen = "ENUM_CreatureStat_HealthRegen"
ENUM_CreatureStat_ManaRegen = "ENUM_CreatureStat_ManaRegen"
--- Могущество
ENUM_CreatureStat_Power = "ENUM_CreatureStat_Power"
--- Мудрость
ENUM_CreatureStat_Wisdom = "ENUM_CreatureStat_Wisdom"
--- Выносливость
ENUM_CreatureStat_Stamina = "ENUM_CreatureStat_Stamina"

--- Перечисления для представления сопротивляемостей персонажа.
ENUM_EELEMENTAL = "ENUM_EELEMENTAL"
ENUM_EDIVINE = "ENUM_EDIVINE"
ENUM_ENATURE = "ENUM_ENATURE"
ENUM_EPHYSICAL = "ENUM_EPHYSICAL"
---@type integer
RESISTANCE_ELEMENTAL = nil
---@type integer
RESISTANCE_DIVINE = nil
---@type integer
RESISTANCE_NATURE = nil
---@type integer
RESISTANCE_PHYSICAL = nil

---@class avatarInfoLib
avatarInfo = {}

--- Высчитывает и возвращает текущий рейтинг экипировки аватара
---@return number
function avatarInfo.CalcCurrentGearScore() end

--- Отсылает на сервер отказ от продолжения процесса смены класса (работает на стадии выбора замен для предметов, см.  avatar.GetClassChangerInfo()).
function avatarInfo.CancelClassChanger() end

--- Привязывает бонус от покровителя к заданной характеристике (должна присутствовать в списке характеристик, к которым в данный момент можно привязать бонус, см  avatar.GetStatsBonusesPart(), поле fairyBonus.allowedStats).
---@param stat integer индекс характеристики из таблицы fairyBonus.allowedStats
function avatarInfo.ChangeFairyBonus(stat) end

--- Возвращает начальную длительность барьеров (паладина) в миллисекундах.
---@return number
function avatarInfo.GetBarriersDelay() end

--- Возвращает информацию о барьерах (паладина).
---@return table
function avatarInfo.GetBarriersInfo() end

--- Возвращает класс аватара
---@return string
function avatarInfo.GetClass() end

--- Возвращает информациюю связанную со сменой класса
---@return table
function avatarInfo.GetClassChangeData() end

--- Рассчитывает сумму бонусов, даваемых предметами, выбранными для замены экипировки на соответствующей стадии процесса смены класса (набор замен для предметов). Входные данные аналогичны  avatar.SetClassChangerInfo( changeList ) (однако набор замен не обязательно должен быть полным), выходные данные аналогичны itemLib.GetBonus( itemId ) (с той только разницей, что тут бонусы не от одного предмета, а от всех, указанных во входных параметрах). Состояние процесса смены класса при этом остаётся неизменным.
---@param changeList table аналогично avatar.SetClassChangerInfo( changeList ), список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен
---@return any
function avatarInfo.GetClassChangerBonusStats(changeList) end

--- Возвращает информацию, необходимую для смены класса аватара, например варианты для замены вещей на подходящие новому классу. Имеет смысл, только если аватар находится в соответствующем состоянии (см.  EVENT_CHARACTER_CLASS_CHANGER_CHANGED), когда класс для замены уже выбран (для выбора используется  ClassSelectQuestion) и требуется уточнить детали замены.
---@return table|nil
function avatarInfo.GetClassChangerInfo() end

--- Рассчитывает сумму бонусов, даваемых дистанционным оружием, выбранным для замены экипировки на соответствующей стадии процесса смены класса (набор замен для предметов). Входные данные аналогичны  avatar.SetClassChangerInfo( changeList ) (однако набор замен не обязательно должен быть полным), выходные данные аналогичны itemLib.GetBonus( itemId ) (с той только разницей, что тут бонусы только для предмета из слота DRESS_SLOT_RANGED). Состояние процесса смены класса при этом остаётся неизменным.
---@param changeList table аналогично avatar.SetClassChangerInfo( changeList ), список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен
---@return any
function avatarInfo.GetClassChangerRangeBonusStats(changeList) end

--- Возвращает  идентификатор класса главного игрока.
---@return CharacterClassId
function avatarInfo.GetClassId() end

--- Получить список всех устройств в зоне действия аватара
---@return table
function avatarInfo.GetDeviceList() end

--- Возвращает значение CommandPoints пета друида, если у друида есть пет, и nil в противном случае.
function avatarInfo.GetDruidPetCommandPoints() end

--- Возвращает текущий рейтинг экипировки аватара, а так же информацию об уровнях и наградах за достижение рейтинга.
---@return table|nil
function avatarInfo.GetGearScoreInfo() end

--- Возвращает значение регена здоровья главного игрока. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName.
---@return table
function avatarInfo.GetHealthRegen() end

--- получить идентификатор аватара.
---@return ObjectId
function avatarInfo.GetId() end

--- Возвращает описание InnateStat характеристики аватара.
---@param sysName string("ENUM_InnateStats") служебное имя характеристики
---@return ValuedText|nil
function avatarInfo.GetInnateStatDescription(sysName) end

--- Возвращает основные характеристики аватара. Перечисления: ENUM_InnateStats.
---@return table
function avatarInfo.GetInnateStats() end

--- Возвращает значение скорости атаки основным оружием аватара.
function avatarInfo.GetMainhandSpeed() end

--- Возвращает значение регена маны главного игрока. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName.
---@return table
function avatarInfo.GetManaRegen() end

--- Возвращает значение BloodPool некроманта.
---@return integer
function avatarInfo.GetNecromancerBloodPool() end

--- Возвращает описание возможности (анлока), необходимой для получения следующего уровня главного игрока.
---@return table|nil
function avatarInfo.GetNextLevelUnlockInfo() end

--- Возвращает значение скорости атаки дополнительным оружием аватара.
function avatarInfo.GetOffhandSpeed() end

--- Возвращает количество Могущества аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatarInfo.GetPower() end

--- Возвращает значение скорости атаки дистанционныим оружием аватара.
function avatarInfo.GetRangedSpeed() end

--- Возвращает текущие рекомендованные характеристики для аватара(зависит от класса и включенного аспекта).
---@return table
function avatarInfo.GetRecommendedStats() end

--- Возвращает сопротивляемости аватара. Перечисления:  RESISTANCE_.../"ENUM_Element_...". Возвращаемые значения как в  avatar.GetInnateStats()
---@return table
function avatarInfo.GetResistances() end

--- получить постоянный идентификатор аватара.
---@return PersistentId
function avatarInfo.GetServerId() end

--- Возвращает специальные характеристики аватара.
---@return table
function avatarInfo.GetSpecialStats() end

--- Возвращает количество Выносливости у аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatarInfo.GetStamina() end

--- Возвращает информацию о бонусах к характеристикам аватара. При изменении информации о fairyBonus приходит событие  EVENT_FAIRY_BONUS_CHANGED.
---@return table
function avatarInfo.GetStatsBonusesPart() end

--- Возвращает уникальный постоянный(кросс-серверный) идентификатор аватара.
---@return UniqueId
function avatarInfo.GetUniqueId() end

--- Получить список всех юнитов в зоне действия аватара ( сам аватар исключается )
---@return table
function avatarInfo.GetUnitList() end

--- Возвращает количество свободных вех развиия, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return number
function avatarInfo.GetViewedBuildFreeRubyPoints() end

--- Возвращает количество пунктов характеристик, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return number
function avatarInfo.GetViewedBuildFreeStatPoints() end

--- Возвращает количество свободных очков умений, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return number
function avatarInfo.GetViewedBuildFreeTalentPoints() end

--- Возвращает количество Мудрости у аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatarInfo.GetWisdom() end

--- Сообщает, доступно ли клиентское управление перемещением аватара.
---@return boolean
function avatarInfo.IsAbleToMove() end

--- получить идентификатор аватара.
---@return boolean
function avatarInfo.IsAlive() end

--- true, если главный игрок уже существует. Иначе false.
---@return boolean
function avatarInfo.IsExist() end

--- Возвращает true, если в данный момент бежим до точки на карте по найденному пути.
---@return boolean
function avatarInfo.IsNavigateToPoint() end

--- Возвращает true, если получение следующего уровня невозможно для главного игрока.
---@return boolean
function avatarInfo.IsNextLevelLocked() end

--- Отсылает на сервер информацию, необходимую для продолжения процесса смены класса (набор замен для предметов). Должны быть указаны замены для всех предметов и самоцветов, информация о которых есть в  avatar.GetClassChangerInfo().
---@param changeList table список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен; должны быть указаны замены для всех предметов и самоцветов, иначе замена произведена не будет
function avatarInfo.SetClassChangerInfo(changeList) end

--- Возвращает базовую информацию об Special характеристике.
---@param specialStatId SpecialStatId(ResourceId) идентификатор Special-стата
---@return table|nil
function avatarInfo.GetSpecialStatInfo(specialStatId) end

--- Проверяет соответствуют ли характеристики друг другу. В качестве аргументов принимает идентификаторы характеристик SpecialStatId или ENUM_InnateStats
---@param firstStatId SpecialStatId идентификатор первой характеристики
---@param secondStatId SpecialStatId идентификатор второй характеристики
---@return boolean
function avatarInfo.IsEqualStats(firstStatId, secondStatId) end

-- Events

--- Событие посылается при изменении состояния жизни аватара.
EVENT_AVATAR_ALIVE_CHANGED = "EVENT_AVATAR_ALIVE_CHANGED"

--- Событие приходит при любом изменении состояния барьеров (паладина).
EVENT_AVATAR_BARRIERS_CHANGED = "EVENT_AVATAR_BARRIERS_CHANGED"

--- Событие посылается при создании игрока.
EVENT_AVATAR_CREATED = "EVENT_AVATAR_CREATED"

--- Событие посылается при появлении барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED"

--- Событие посылается при изменении состояния барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED"

--- Событие посылается при исчезновении барьеров дамага у лучника.
EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED = "EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED"

--- Изменение статов аватара: базовых, брони, сопротивляемости.
EVENT_AVATAR_STATS_CHANGED = "EVENT_AVATAR_STATS_CHANGED"

--- Событие посылается при изменении основной цели основной цели (это не опечатка) аватара.
EVENT_AVATAR_TARGET_TARGET_CHANGED = "EVENT_AVATAR_TARGET_TARGET_CHANGED"

--- Событие посылается при появлении барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED"

--- Событие посылается при изменении состояния барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED"

--- Событие посылается при исчезновении барьера дамага у воина.
EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED = "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED"

--- Событие посылается при изменении состояния смены класса - когда требуется выбрать замены для вещей на соответствующие новому классу и когда такая необходимость отпадает.
EVENT_CHARACTER_CLASS_CHANGER_CHANGED = "EVENT_CHARACTER_CLASS_CHANGER_CHANGED"

--- Присылается при изменении значения CommandPoints пета друида.
EVENT_DRUID_PET_COMMAND_POINTS_CHANGED = "EVENT_DRUID_PET_COMMAND_POINTS_CHANGED"

--- Событие приходит при любом изменении информации о бонусе от покровителя.
EVENT_FAIRY_BONUS_CHANGED = "EVENT_FAIRY_BONUS_CHANGED"

--- Присылается при изменении значения BloodPool некроманта.
EVENT_NECROMANCER_BLOOD_POOL_CHANGED = "EVENT_NECROMANCER_BLOOD_POOL_CHANGED"
