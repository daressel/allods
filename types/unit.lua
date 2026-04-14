---@meta

---@class unitLib
unit = {}

---@class UnitGetEquipmentItemSlotUnlockedQualitiesResult
---@field isFullyUnlocked boolean слот полностью разлочен
---@field qualities таблица, индексированная [0..], содержит допустимые для экипировки значения качества предметов, тип: number (enum ITEM_QUALITY_...)

---@class UnitGetFairyInfoResult
---@field isExist boolean true, если у игрока есть покровитель
---@field name string имя покровителя
---@field description string описание покровителя
---@field rank integer ранг покровителя
---@field level integer уровень покровителя
---@field experience integer опыт покровителя
---@field levelExperience integer опыт покровителя, необходимый для достижения этого уровня
---@field nextLevelExperience integer опыт покровителя, необходимый для достижения следующего уровня
---@field isHungry boolean благосклонен ли покровитель
---@field remainingMs number время в миллисекундах, которое покровитель будет благосклонен, nil - в случае отсутствия благосклонности
---@field isAlwaysActive boolean если true, то покровитель благосклонен всегда, независимо от значений isHungry и remainingMs
---@field currentRankRemainingMs number время в миллисекундах, которое у покровителя будет текущий ранг (временно хало 5-го уровня), nil - ранг навсегда
---@field dpsBonus integer во сколько раз увеличивается наносимый игроком урон
---@field healBonus integer во сколько раз увеличивается способность игрока лечить
---@field powerBonus integer значение бонуса для характеристики "Могущество"

---@class UnitGetFairyZodiacSignInfoResult
---@field sysName string уникальное системное имя знака зодиака
---@field name string имя знака зодиака
---@field description string описание знака зодиака
---@field image TextureId идентификатор текстуры для иконки

---@class UnitGetGuildInfoResult
---@field name string имя гильдии игрока (пустая строка, если игрок не состоит в гильдии)
---@field rank number|nil ранг игрока в гильдии, если он состоит в гильдии
---@field level number|nil уровень гильдии, если игрок состоит в гильдии
---@field guildId integer|nil идентификатор гильдии, если игрок состоит в гильдии

---@class UnitGetHealAbsorbPoolInfoResult
---@field healAbsorbValue number текущее значение пула анти-хила юнита
---@field healAbsorbLimit number максимальное значение пула анти-хила юнита
---@field healAbsorbFactor number часть хила, уходящая в никуда (степень влияния анти-хилла)

---@class UnitGetManaResult
---@field mana integer|nil текущая мана юнита для дружественных целей(аватар, группа), в остальных случаях присылается nil
---@field maxMana integer|nil максимальная мана юнита для дружественных целей(аватар, группа), в остальных случаях присылается nil
---@field percents integer|nil процент текущей маны от максимальной

---@class UnitGetMobActionProgressResult
---@field duration number время действия "действия"
---@field progress number прошло времени (так как событие может прийти с задержкой)
---@field name string название действия
---@field spellId SpellId|nill если известен спелл, то присылается идентификатор спелла
---@field isPrecast boolean|nil если известен спелл, то присылается признак, что у спелла есть время прекаста
---@field isChannel boolean|nil если известен спелл, то присылается признак, что у спелла есть механика чаннелинга

---@class UnitGetPlayerTitleResult
---@field name string титул юнита
---@field id ObjectId идентификатор титула

---@class UnitGetPlayerTitlesResult
---@field name string титул юнита
---@field id ObjectId идентификатор титула

---@class UnitGetPvPFlagInfoResult
---@field isOn boolean PvP флаг
---@field serverFlag boolean|nil только для игроков: true, если PvP выставлено сервером
---@field playerFlag boolean|nil только для игроков: true, если PvP выставлено игроком
---@field timeLeft boolean|nil только для игроков: Сколько времени осталось до истечения PvP. Имеется, если PvP флаг выставлен временно. Иначе nil. Поля:

---@class UnitGetTrioInfoResult
---@field name2 string имя второго персонажа
---@field name3 string имя третьего персонажа

---@class UnitGetVeteranRankResult
---@field name string название ветеранского ранга
---@field description string описание ранга
---@field image TextureId|nil идентификатор текстуры иконки ранга

---Возвращает возможность принципиального использования объекта.
---@param objectId ObjectId идентификатор объекта
---@return boolean
function unit.IsUsable(objectId) end

---Возвращает true, если юнит может сейчас иметь врагов
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return boolean
function unit.CanHaveEnemy(unitId) end

---Возвращает true, если можно ли выделить данное существо в цель главного игрока. Запрет выделения может быть, например, из-за нахождения существа в другом плане.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.CanSelectTarget(unitId) end

---Можно ли попытаться использовать юнит в текущий момент. Для разговора, лута из трупов мобов.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.CanUse(unitId) end

---Возвращает информацию о пете персонажа, если персонаж - активный игрок или член его группы.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@param id ObjectId (or nil) -- идентификатор пета, если он есть (только для активного игрока или члена его группы), иначе возвращает nil.
function unit.GetActivePet(unitId, id) end

---Возвращает текущую форму класса персонажа CharacterFormId.
---@param unitId ObjectId идентификатор персонажа
---@return CharacterFormId|nil
function unit.GetCharacterForm(unitId) end

---Возвращает информацию о классе персонажа
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@param className string -- имя класса
---@param manaType number тип маны героя mana/energy
---@param name WString -- имя класса(локализованное)
---@param greatName WString -- имя Великого класса(локализованное)
---@param raceClassName string локализованное имя расы-класса
function unit.GetClass(unitId, className, manaType, name, greatName, raceClassName) end

---Возвращает ресурс класса персонажа CharacterClassId.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return CharacterClassId|nil
function unit.GetClassId(unitId) end

---Возвращает идентификатор указанного предмета экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент. См.  DRESS_SLOT_... Тип контейнера в  ITEM_CONT_....
---@param unitId ObjectId идентификатор юнита
---@param slot number индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType number тип контейнера
---@return ObjectId
function unit.GetEquipmentItemId(unitId, slot, slotType) end

---Возвращает таблицу со всей экипировкой данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент. Тип контейнера в  ITEM_CONT_....
---@param unitId ObjectId идентификатор юнита
---@param slotType number тип контейнера
---@return table
function unit.GetEquipmentItemIds(unitId, slotType) end

---Возвращает состояние разлоченности для слота экипировки главного или инспектируемого игрока.
---@param unitId ObjectId идентификатор игрока
---@param equipmentSlot number индекс слота в экипировке
---@return UnitGetEquipmentItemSlotUnlockedQualitiesResult
function unit.GetEquipmentItemSlotUnlockedQualities(unitId, equipmentSlot) end

---Возвращает количество слотов под экипировку у данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@return integer
function unit.GetEquipmentSize(unitId) end

---Возвращает таблицу с информацией о бонусах, даваемых предметом в определенном слоте экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент. ВАЖНО! Информация возвращается с учетом наложенных бафов, влияющих на характеристики экипировки. Функция возвращает результаты в том же формате что и itemLib.GetBonus( itemId ) См.  DRESS_SLOT_... Тип контейнера в  ITEM_CONT_...
---@param unitId ObjectId идентификатор юнита
---@param slot number индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType number тип контейнера
---@return см. itemLib.GetBonus( itemId )
function unit.GetEquipmentSlotBonus(unitId, slot, slotType) end

---Получить фракцию юнита.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return FactionId
function unit.GetFactionId(unitId) end

---Возвращает информацию о покровителе. Наличие покровителя можно определить по флагу isExist.
---@param unitId ObjectId идентификатор юнита
---@return UnitGetFairyInfoResult
function unit.GetFairyInfo(unitId) end

---Возвращает величину прибавки к Могуществу от уровня покровителя. При изменении приходит событие  EVENT_UNIT_FAIRY_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return integer|nil
function unit.GetFairyPowerBonus(unitId) end

---Возвращает информацию о знаке зодиака покровителя указанного юнита.
---@param unitId ObjectId идентификатор юнита
---@return UnitGetFairyZodiacSignInfoResult
function unit.GetFairyZodiacSignInfo(unitId) end

---Возвращает хозяина, которому подчинен объект (пет, ассистент, турель и т.п.).
---@param unitId ObjectId идентификатор игрока
function unit.GetFollowerMaster(unitId) end

---Возвращает список юнитов, подчинённых персонажу (петы, ассистенты, турель и т.п.).
---@param unitId ObjectId идентификатор игрока
function unit.GetFollowers(unitId) end

---Возвращает текущий рейтинг экипировки персонажа. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях, в которых есть возможность голосовать за изгнание игрока. Проверить доступность можно функцией  avatar.IsInspectAllowed()
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetGearScore(unitId) end

---Получить имя гильдии игрока.
---@param unitId ObjectId -- идентификатор игрока
---@return UnitGetGuildInfoResult
function unit.GetGuildInfo(unitId) end

---Возвращает информацию о пуле анти-хила персонажа. Если пула нету, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return UnitGetHealAbsorbPoolInfoResult
function unit.GetHealAbsorbPoolInfo(unitId) end

---Возвращает текущий уровень юнита
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return number
function unit.GetLevel(unitId) end

---Возвращает информацию об мане персонажа. Если значения каких-то параметров неизвестны, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return UnitGetManaResult
function unit.GetMana(unitId) end

---Возвращает информацию об мане персонажа в процентах. Если значение маны неизвестно, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return percents: number (int)|nil
function unit.GetManaPercentage(unitId) end

---Возвращает информацию о прогрессе произнесения заклинания мобом.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return UnitGetMobActionProgressResult
function unit.GetMobActionProgress(unitId) end

---Если у указанного игрока выставлено какое-либо настроение, то метод возвращает идентификатор эмоции, с помощью которой выставлено это настроение.
---@param unitId ObjectId идентификатор игрока, для которого надо получить эмоцию настроения
---@return ObjectId|nil
function unit.GetMoodEmoteId(unitId) end

---Возвращает настройку отображения овертипа юнита в виде ENUM_MobWorld_OvertipCustomView.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetOvertipCustomView(unitId) end

---Возвращает информацию о специальной текстуре ассоциированной с кричей. Если таковой нет - вернет nil Данную текстуру надлежит отображать в овертипе обжа. Подробности описаны в справке к CreatureSetOvertipAction
---@param unitId ObjectId (not nil) -- идентификатор игрока/моба
---@return TextureId|nil
function unit.GetOvertipTexture(unitId) end

---Возвращает имя моба-пета игрока. Если персонаж не является петом (который может иметь имя) игрока - возвращается nil. Работает только для мобов.
---@param unitId ObjectId (not nil) -- идентификатор моба
---@return string|nil
function unit.GetPetName(unitId) end

---Возвращает информацию о владельца пета.
---@param unitId ObjectId (not nil) -- идентификатор пета
function unit.GetPetOwner(unitId) end

---Возвращает имя шарда игрока Если игрок не найден или передан Id NPC или моба, то возвращается nil.
---@param unitId ObjectId (not nil) -- идентификатор игрока
---@return shardName: WString / nil
function unit.GetPlayerShardName(unitId) end

---Возвращает титул игрока.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return UnitGetPlayerTitleResult
function unit.GetPlayerTitle(unitId) end

---Возвращает все возможные титулы игрока.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return UnitGetPlayerTitlesResult
function unit.GetPlayerTitles(unitId) end

---Возвращает новый экземпляр ValuedObject по имени игрока.
function unit.GetPlayerValuedObject() end

---Возвращает информацию об основной цели юнита.
---@param unitId ObjectId идентификатор юнита
---@return ObjectId – идентификатор цели или nil, если цели нет
function unit.GetPrimaryTarget(unitId) end

---Возвращает информацию PvP флаге юнита. При изменении приходит  EVENT_UNIT_PVP_FLAG_CHANGED.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return UnitGetPvPFlagInfoResult
function unit.GetPvPFlagInfo(unitId) end

---Получить элитность юнита. Значения:
function unit.GetQuality() end

---Возвращает информацию о расе персонажа См.  ENUM_CreatureRace_...
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@param race Table / nil- содержит поля с информацией о расе
---@param creatureRace number раса существа (список см. ниже). Для игроков всегда ENUM_CreatureRace_HUMANOID.
---@param sysCreatureRace string раса существа, для игроков всегда "ENUM_CreatureRace_HUMANOID"
---@param characterRace WString / nil имя расы игрока (локализованное). Для мобов и NPC всегда nil.
---@param sysCharacterRaceName string / nil служебное имя расы игрока. Для мобов и NPC всегда nil.
function unit.GetRace(unitId, race, creatureRace, sysCreatureRace, characterRace, sysCharacterRaceName) end

---Возвращает количество Гнева, накопленное у юнита. При изменении этой величины приходит событие  EVENT_UNIT_RAGE_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return integer
function unit.GetRage(unitId) end

---Возвращает список целей процедурного данжа, которые связаны с указанным мобом.
---@param unitId ObjectId (not nil) -- идентификатор моба
---@return ObjectId|nil[]
function unit.GetRelatedGoals(unitId) end

---Возвращает список целей заданий игрока, которые связаны с указанным мобом.
---@param unitId ObjectId (not nil) -- идентификатор моба
---@return nil|ObjectId[]
function unit.GetRelatedQuestObjectives(unitId) end

---Получить информацию об уровне репутации с мобом.
---@param mobId ObjectId идентификатор моба
---@return level: number (enum REPUTATION_LEVEL_...)
function unit.GetReputationLevel(mobId) end

---Позволяет узнать текущий активный набор ритуальных вещей.
---@param unitId ObjectId идентификатор игрока
---@return number
function unit.GetRitualActivePreset(unitId) end

---Возвращает информацию о рунической сложности ран юнита.
---@param unitId ObjectId идентификатор юнита
---@return integer
function unit.GetRuneWoundsComplexity(unitId) end

---Возвращает информацию о поле игрока Если игрок не найден или передан Id NPC или моба, то возвращается nil.
---@param unitId ObjectId (not nil) -- идентификатор игрока
---@param sex Table / nil- содержит поля с информацией о поле игрока.
---@param sex number пол игрока
---@param name string локализованное имя пола (например: "Мужчина" / "Женщина").
---@param raceSexName string локализованное расозависимое имя пола (например: "Каниец" / "Канийка").
function unit.GetSex(unitId, sex, sex, name, raceSexName) end

---Возвращает информацию о цели юнита (только если юнит - аватар или сам является целью аватара). Используется дополнительная цель для аватара и основная - для всех остальных юнитов.
---@param unitId ObjectId идентификатор юнита
---@return ObjectId – идентификатор цели или nil, если цели нет
function unit.GetTarget(unitId) end

---Возвращает титул юнита. Замечание: реализовано только для мобов.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return WString -
function unit.GetTitle(unitId) end

---Возвращает информацию о классе тренера. Класс тренера может отличаться от класса самого персонажа. В случае ошибки метод возвращает nil. Также см.  unit.GetClass(id).
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@param className string -- имя класса
---@param manaType number тип маны обучаемого класса MANA/ENERGY
---@param name WString -- имя класса(локализованное)
function unit.GetTrainerClass(unitId, className, manaType, name) end

---Возвращает Id о транспортном средстве, на котором находится юнит. Если игрок не находится на транспорте, или транспорт не найден, то возвращает nil.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@param id ObjectId (or nil) -- идентификатор транспортного средства
function unit.GetTransport(unitId, id) end

---Возвращает доп. информацию о персонажах игрока - для трио (гибберлинги). Если персонаж не трио - возвращается nil. Работает только для игроков.
---@param unitId ObjectId (not nil) -- идентификатор игрока
---@return UnitGetTrioInfoResult
function unit.GetTrioInfo(unitId) end

---Возвращает новый экземпляр ValuedObject по Id существа.
function unit.GetUnitValuedObject() end

---Возвращает информацию о ветеранском ранге игрока. Можно вызывать только для игроков.
---@param unitId ObjectId идентификатор игрока
---@return UnitGetVeteranRankResult
function unit.GetVeteranRank(unitId) end

---Возвращает количество Воли, накопленное у юнита. При изменении этой величины приходит событие  EVENT_UNIT_WILL_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return integer
function unit.GetWill(unitId) end

---Возвращает информацию о PvP-опасности зоны для персонажа.
---@param unitId ObjectId (not nil) -- идентификатор игрока
---@return string
function unit.GetZonePvPDanger(unitId) end

---Возвращает информацию о PvP-типе зоны для персонажа.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return number
function unit.GetZonePvPType(unitId) end

---Возвращает Id интерфейсной карты зоны, на которой находится игрок. Работает только для главного игрока, членов его группы и рейда, а так же для игроков, задетекченных детекторами, если такие есть. Подробную информацию о карте см. в cartographer.GetZonesMapInfo( zonesMapId ).
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return ObjectId|nil
function unit.GetZonesMapId(unitId) end

---Метод возвращает true, если требуется показ особой плашки с внутренним состоянием моба.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return boolean
function unit.HasBossPlate(unitId) end

---Возвращает информацию о наличии экипировки у данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.HasEquipment(unitId) end

---Возвращает информацию о статусе AFK игрока Если игрок не найден или передан Id NPC или моба, то возвращается false.
---@param unitId ObjectId (not nil) -- идентификатор игрока
---@return boolean
function unit.IsAfk(unitId) end

---Возвращает true, если юнит агрессивен по отношению к главному игроку.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return boolean
function unit.IsAggressive(unitId) end

---Возвращает true, если юнит мёртв и на нём будет проигрываться (или уже проигрывается) фаталити.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.IsFatalityDeath(unitId) end

---Возвращает true, если указанный игрок является Великим. Только для игроков.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.IsGreat(unitId) end

---Возвращает true, если указанный юнит - чей-то пет.
---@param unitId ObjectId (not nil) -- идентификатор юнита
function unit.IsPet(unitId) end

---Возвращает true, если указанный юнит - игрок.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return isPlayer: boolean
function unit.IsPlayer(unitId) end

---Возвращает true, если главный или инспектируемый игрок уже может находится в состоянии ритуала (надевать ритуальные вещи, видеть их контейнер).
---@param unitId ObjectId идентификатор игрока
---@return boolean
function unit.IsRitualEnabled(unitId) end

---Возвращает true, если моб потэган каким-либо игроком. Это значит, что какой-то игрок вступил с мобом в бой, и весь лут достанется этому игроку. См. EVENT_UNIT_TAG_CHANGED.
---@param unitId ObjectId (not nil) -- идентификатор моба
---@return boolean
function unit.IsTagged(unitId) end

---Возвращает true, если моб потэган главным игроком. Это значит, что главный игрок вступил с мобом в бой, и весь лут достанется главному игроку. См. EVENT_UNIT_TAG_CHANGED.
---@param unitId ObjectId (not nil) -- идентификатор моба
---@return boolean
function unit.IsTaggedByMainPlayer(unitId) end

---Возвращает true, если юнит является учителем. Иначе false. В некоторых случаях может не соответствовать действительности (при динамически изменяющейся способности учить). Для уточнения необходимо вызывать avatar.IsInteractorTrainer().
---@param id ObjectId Id юнита. Если передан Id игрока, вернёт false.
---@return boolean
function unit.IsTrainer(id) end

---Возвращает возможность принципиального использования юнита. Только для лута мертвых мобов.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.IsUsable(unitId) end

---Выделяет юнит заданным декалом и цветом ( тип Color ).
---@param unitId ObjectId идентификатор юнита
---@param visible boolean показать/убрать выделение
---@param decalId DecalObjectId идентификатор декала
---@param color Color|nil цвет выделения
---@param thickness float|nil толщина
---@return нет
function unit.Select(unitId, visible, decalId, color, thickness) end

---Выбирает (устанавливает текущий) титул персонажа. Титул можно устанавливать только собственному персонажу
---@param unitId ObjectId (not nil) -- идентификатор персонажа
---@param titleId ObjectId|nil идентификатор титула (идентификатор), или nil для сброса титула
---@return result: boolean
function unit.SetPlayerTitle(unitId, titleId) end
