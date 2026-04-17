---@meta

--- CategoryUnit
--- Функции Lua Api библиотеки unit.

--- Варианты выбора фракции прайденом
--- Лига
ENUM_PridenFactionChoice_League = "ENUM_PridenFactionChoice_League"
--- Империя
ENUM_PridenFactionChoice_Empire = "ENUM_PridenFactionChoice_Empire"

---@class unitLib
unit = {}

--- Возвращает информацию о здоровье используемого ездового животного игрока.
---@param unitId ObjectId
function unit.GetUnitMountHealth(unitId) end

--- Возвращает информацию о количестве буфов, висящих на данном объекте. Дебуфы тоже считаются буфами.
---@param Id ObjectId
---@return number
function unit.GetBuffCount(Id) end

--- Возвращает true, если юнит может сейчас иметь врагов
---@param unitId ObjectId
---@return boolean
function unit.CanHaveEnemy(unitId) end

--- Возвращает true, если можно ли выделить данное существо в цель главного игрока. Запрет выделения может быть, например, из-за нахождения существа в другом плане.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.CanSelectTarget(unitId) end

--- Можно ли попытаться использовать юнит в текущий момент. Для разговора, лута из трупов мобов.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.CanUse(unitId) end

--- Возвращает информацию о пете персонажа, если персонаж - активный игрок или член его группы.
---@param unitId ObjectId
function unit.GetActivePet(unitId) end

--- Возвращает текущую форму класса персонажа CharacterFormId.
---@param unitId ObjectId идентификатор персонажа
---@return CharacterFormId|nil
function unit.GetCharacterForm(unitId) end

--- Возвращает информацию о классе персонажа
---@param unitId ObjectId
function unit.GetClass(unitId) end

--- Возвращает ресурс класса персонажа CharacterClassId.
---@param unitId ObjectId
---@return CharacterClassId|nil
function unit.GetClassId(unitId) end

--- Возвращает идентификатор указанного предмета экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slot integer индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType integer тип контейнера
---@return ObjectId
function unit.GetEquipmentItemId(unitId, slot, slotType) end

--- Возвращает таблицу со всей экипировкой данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slotType integer тип контейнера
---@return table
function unit.GetEquipmentItemIds(unitId, slotType) end

--- Возвращает состояние разлоченности для слота экипировки главного или инспектируемого игрока.
---@param unitId ObjectId идентификатор игрока
---@param equipmentSlot integer индекс слота в экипировке
---@return table
function unit.GetEquipmentItemSlotUnlockedQualities(unitId, equipmentSlot) end

--- Возвращает количество слотов под экипировку у данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetEquipmentSize(unitId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом в определенном слоте экипировки данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@param slot integer индекс слота (0..DRESS_SLOT_UNDRESSABLE - 1)
---@param slotType integer тип контейнера
---@return any
function unit.GetEquipmentSlotBonus(unitId, slot, slotType) end

--- Получить фракцию юнита.
---@param unitId ObjectId
---@return FactionId
function unit.GetFactionId(unitId) end

--- Возвращает информацию о покровителе. Наличие покровителя можно определить по флагу isExist.
---@param unitId ObjectId идентификатор юнита
---@return table|nil
function unit.GetFairyInfo(unitId) end

--- Возвращает величину прибавки к Могуществу от уровня покровителя. При изменении приходит событие  EVENT_UNIT_FAIRY_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetFairyPowerBonus(unitId) end

--- Возвращает хозяина, которому подчинен объект (пет, ассистент, турель и т.п.).
---@param unitId ObjectId идентификатор игрока
function unit.GetFollowerMaster(unitId) end

--- Возвращает список юнитов, подчинённых персонажу (петы, ассистенты, турель и т.п.).
---@param unitId ObjectId идентификатор игрока
function unit.GetFollowers(unitId) end

--- Возвращает текущий рейтинг экипировки персонажа.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetGearScore(unitId) end

--- Получить имя гильдии игрока.
---@param unitId ObjectId
---@return table|nil
function unit.GetGuildInfo(unitId) end

--- Возвращает информацию о пуле анти-хила персонажа. Если пула нету, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return table|nil
function unit.GetHealAbsorbPoolInfo(unitId) end

--- Возвращает текущий уровень юнита
---@param unitId ObjectId
---@return number
function unit.GetLevel(unitId) end

--- Возвращает информацию об мане персонажа. Если значения каких-то параметров неизвестны, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return table
function unit.GetMana(unitId) end

--- Возвращает информацию об мане персонажа в процентах. Если значение маны неизвестно, возвращается nil.
---@param unitId ObjectId идентификатор юнита
---@return integer|nil
function unit.GetManaPercentage(unitId) end

--- Возвращает информацию о прогрессе произнесения заклинания мобом.
---@param unitId ObjectId
---@return table|nil
function unit.GetMobActionProgress(unitId) end

--- Если у указанного игрока выставлено какое-либо настроение, то метод возвращает идентификатор эмоции, с помощью которой выставлено это настроение.
---@param unitId ObjectId идентификатор игрока, для которого надо получить эмоцию настроения
---@return ObjectId|nil
function unit.GetMoodEmoteId(unitId) end

--- Возвращает настройку отображения овертипа юнита в виде ENUM_MobWorld_OvertipCustomView.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetOvertipCustomView(unitId) end

--- Возвращает информацию о специальной текстуре ассоциированной с кричей. Если таковой нет - вернет nil
---@param unitId ObjectId
---@return TextureId|nil
function unit.GetOvertipTexture(unitId) end

--- Возвращает имя моба-пета игрока. Если персонаж не является петом (который может иметь имя) игрока - возвращается nil. Работает только для мобов.
---@param unitId ObjectId
---@return WString|nil
function unit.GetPetName(unitId) end

--- Возвращает информацию о владельца пета.
---@param unitId ObjectId
function unit.GetPetOwner(unitId) end

--- Возвращает имя шарда игрока
---@param unitId ObjectId
---@return WString
function unit.GetPlayerShardName(unitId) end

--- Возвращает титул игрока.
---@param unitId ObjectId
---@return table|nil
function unit.GetPlayerTitle(unitId) end

--- Возвращает все возможные титулы игрока.
---@param unitId ObjectId
---@return table|nil
function unit.GetPlayerTitles(unitId) end

--- Возвращает информацию об основной цели юнита.
---@param unitId ObjectId идентификатор юнита
---@return ObjectId
function unit.GetPrimaryTarget(unitId) end

--- Возвращает информацию PvP флаге юнита. При изменении приходит  EVENT_UNIT_PVP_FLAG_CHANGED.
---@param unitId ObjectId
---@return table
function unit.GetPvPFlagInfo(unitId) end

--- Возвращает информацию о расе персонажа
---@param unitId ObjectId
function unit.GetRace(unitId) end

--- Возвращает количество Гнева, накопленное у юнита. При изменении этой величины приходит событие  EVENT_UNIT_RAGE_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetRage(unitId) end

--- Возвращает список целей процедурного данжа, которые связаны с указанным мобом.
---@param unitId ObjectId
---@return ObjectId[]|nil
function unit.GetRelatedGoals(unitId) end

--- Возвращает список целей заданий игрока, которые связаны с указанным мобом.
---@param unitId ObjectId
---@return nil
function unit.GetRelatedQuestObjectives(unitId) end

--- Получить информацию об уровне репутации с мобом.
---@param mobId ObjectId идентификатор моба
---@return integer
function unit.GetReputationLevel(mobId) end

--- Возвращает информацию о рунической сложности ран юнита.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetRuneWoundsComplexity(unitId) end

--- Возвращает информацию о поле игрока
---@param unitId ObjectId
function unit.GetSex(unitId) end

--- Возвращает информацию о цели юнита (только если юнит - аватар или сам является целью аватара). Используется дополнительная цель для аватара и основная - для всех остальных юнитов.
---@param unitId ObjectId идентификатор юнита
---@return ObjectId
function unit.GetTarget(unitId) end

--- Возвращает титул юнита.
---@param unitId ObjectId
---@return WString
function unit.GetTitle(unitId) end

--- Возвращает информацию о классе тренера. Класс тренера может отличаться от класса самого персонажа. В случае ошибки метод возвращает nil.
---@param unitId ObjectId
function unit.GetTrainerClass(unitId) end

--- Возвращает Id о транспортном средстве, на котором находится юнит. Если игрок не находится на транспорте, или транспорт не найден, то возвращает nil.
---@param unitId ObjectId
function unit.GetTransport(unitId) end

--- Возвращает доп. информацию о персонажах игрока - для трио (гибберлинги). Если персонаж не трио - возвращается nil. Работает только для игроков.
---@param unitId ObjectId
---@return table
function unit.GetTrioInfo(unitId) end

--- Возвращает информацию о ветеранском ранге игрока. Можно вызывать только для игроков.
---@param unitId ObjectId идентификатор игрока
---@return table|nil
function unit.GetVeteranRank(unitId) end

--- Возвращает количество Воли, накопленное у юнита. При изменении этой величины приходит событие  EVENT_UNIT_WILL_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return number
function unit.GetWill(unitId) end

--- Возвращает информацию о PvP-опасности зоны для персонажа.
---@param unitId ObjectId
---@return string
function unit.GetZonePvPDanger(unitId) end

--- Возвращает информацию о PvP-типе зоны для персонажа.
---@param unitId ObjectId
---@return number
function unit.GetZonePvPType(unitId) end

--- Возвращает Id интерфейсной карты зоны, на которой находится игрок. Работает только для главного игрока, членов его группы и рейда, а так же для игроков, задетекченных детекторами, если такие есть.
---@param unitId ObjectId
---@return ObjectId|nil
function unit.GetZonesMapId(unitId) end

--- Метод возвращает true, если требуется показ особой плашки с внутренним состоянием моба.
---@param unitId ObjectId
---@return boolean
function unit.HasBossPlate(unitId) end

--- Возвращает информацию о наличии экипировки у данного юнита. Юнит может быть или главным игроком или игроком, инспектируемым в данный момент.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.HasEquipment(unitId) end

--- Возвращает информацию о статусе AFK игрока
---@param unitId ObjectId
---@return boolean
function unit.IsAfk(unitId) end

--- Возвращает true, если юнит агрессивен по отношению к главному игроку.
---@param unitId ObjectId
---@return boolean
function unit.IsAggressive(unitId) end

--- Возвращает true, если юнит мёртв и на нём будет проигрываться (или уже проигрывается) фаталити.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.IsFatalityDeath(unitId) end

--- Возвращает true, если указанный игрок является Великим. Только для игроков.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.IsGreat(unitId) end

--- Возвращает true, если указанный юнит - чей-то пет.
---@param unitId ObjectId
function unit.IsPet(unitId) end

--- Возвращает true, если указанный юнит - игрок.
---@param unitId ObjectId
---@return boolean
function unit.IsPlayer(unitId) end

--- Возвращает true, если главный или инспектируемый игрок уже может находится в состоянии ритуала (надевать ритуальные вещи, видеть их контейнер).
---@param unitId ObjectId идентификатор игрока
---@return boolean
function unit.IsRitualEnabled(unitId) end

--- Возвращает true, если моб потэган каким-либо игроком. Это значит, что какой-то игрок вступил с мобом в бой, и весь лут достанется этому игроку.
---@param unitId ObjectId
---@return boolean
function unit.IsTagged(unitId) end

--- Возвращает true, если моб потэган главным игроком. Это значит, что главный игрок вступил с мобом в бой, и весь лут достанется главному игроку.
---@param unitId ObjectId
---@return boolean
function unit.IsTaggedByMainPlayer(unitId) end

--- Возвращает true, если юнит является учителем. Иначе false.
---@param id ObjectId Id юнита. Если передан Id игрока, вернёт false.
---@return boolean
function unit.IsTrainer(id) end

--- Возвращает возможность принципиального использования юнита. Только для лута мертвых мобов.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unit.IsUsable(unitId) end

--- Выделяет юнит заданным декалом и цветом ( тип Color ).
---@param unitId ObjectId идентификатор юнита
---@param visible boolean показать/убрать выделение
---@param decalId DecalObjectId идентификатор декала
---@param color Color|nil цвет выделения
---@param thickness float|nil толщина
function unit.Select(unitId, visible, decalId, color, thickness) end

--- Выбирает (устанавливает текущий) титул персонажа. Титул можно устанавливать только собственному персонажу
---@param unitId ObjectId
---@param titleId ObjectId|nil идентификатор титула (идентификатор), или nil для сброса титула
---@return boolean
function unit.SetPlayerTitle(unitId, titleId) end

--- Возвращает новый экземпляр ValuedObject по имени игрока.
function GetPlayerValuedObject() end

--- Получить элитность юнита. Значения:
function GetQuality() end

--- Возвращает новый экземпляр ValuedObject по Id существа.
function GetUnitValuedObject() end

-- Events

--- Событие присылается при уничтожении RunTime аккаунта по причине дисконнекта, чтобы была возможность показать сообщение об этом игроку прежде, чем клиент схлопнется.
EVENT_ACCOUNT_HAS_DESTROYED = "EVENT_ACCOUNT_HAS_DESTROYED"

--- Событие посылается каждый раз, когда у главного игрока меняется активный пет.
EVENT_ACTIVE_PET_CHANGED = "EVENT_ACTIVE_PET_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется активный пет. Близкий аналог EVENT_ACTIVE_PET_CHANGED.
EVENT_ACTIVE_PET_EXIST_CHANGED = "EVENT_ACTIVE_PET_EXIST_CHANGED"

--- Событие посылается каждый раз, когда у активного пета главного игрока меняется список или активное заклинание.
EVENT_ACTIVE_PET_SPELLS_CHANGED = "EVENT_ACTIVE_PET_SPELLS_CHANGED"

--- Событие посылается каждый раз, когда у активного пета главного игрока меняется внутреннее состояние (тип движения, атаки или состояние боя).
EVENT_ACTIVE_PET_STATE_CHANGED = "EVENT_ACTIVE_PET_STATE_CHANGED"

--- Событие посылается, когда игрок меняет статус AFK
EVENT_AFK_STATE_CHANGED = "EVENT_AFK_STATE_CHANGED"

--- Событие присылается при изменении координат цели прицела главного игрока.
EVENT_CROSSHAIR_TARGET_POS_CHANGED = "EVENT_CROSSHAIR_TARGET_POS_CHANGED"

--- Событие присылается при претерпении урона (класс паладин, спелл "претерпеть боль").
EVENT_ENDURE_BARRIER_DAMAGE = "EVENT_ENDURE_BARRIER_DAMAGE"

--- Событие посылается, когда поменялся текущий активный набор ритуальных вещей  enum DUMMY_TYPE.
EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED = "EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED"

--- Событие посылается, когда главному или инспектируемому игроку становятся доступны ритуальные вещи (контейнер, действия и т.п.).
EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED = "EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED"

--- Событие посылается каждый раз, когда у гилдии появляется новый баф. Если апдейтится старый, то ничего не приходит.
EVENT_GUILD_BUFF_ADDED = "EVENT_GUILD_BUFF_ADDED"

--- Событие посылается каждый раз, когда у гилдии игрока меняется набор бафов.
EVENT_GUILD_BUFFS_CHANGED = "EVENT_GUILD_BUFFS_CHANGED"

--- Событие присылается при появлении у юнита пула анти-хила.
EVENT_HEAL_ABSORB_POOL_APPEARED = "EVENT_HEAL_ABSORB_POOL_APPEARED"

--- Событие присылается при изменении у юнита пула анти-хила.
EVENT_HEAL_ABSORB_POOL_CHANGED = "EVENT_HEAL_ABSORB_POOL_CHANGED"

--- Событие присылается при исчезании у юнита пула анти-хила.
EVENT_HEAL_ABSORB_POOL_DISAPPEARED = "EVENT_HEAL_ABSORB_POOL_DISAPPEARED"

--- Приходит, если изменился список заданий, связанных с предметом.
EVENT_ITEM_RELATED_QUESTS_CHANGED = "EVENT_ITEM_RELATED_QUESTS_CHANGED"

--- Событие присылается при измениние маны юнита другим юнитом.
EVENT_MANA_RECEIVED = "EVENT_MANA_RECEIVED"

--- Приходит, если изменился список заданий процедурного данжа, связанных с мобом.
EVENT_MOB_RELATED_GOALS_CHANGED = "EVENT_MOB_RELATED_GOALS_CHANGED"

--- Приходит, если изменился список заданий, связанных с мобом.
EVENT_MOB_RELATED_QUESTS_CHANGED = "EVENT_MOB_RELATED_QUESTS_CHANGED"

--- Событие посылается каждый раз, когда у объекта появляется новый баф. Если обновляются параметры существующего, то приходит  EVENT_OBJECT_BUFF_CHANGED.
EVENT_OBJECT_BUFF_ADDED = "EVENT_OBJECT_BUFF_ADDED"

--- Событие посылается каждый раз, когда у объекта изменяются свойства существующего бафа, а именно:
EVENT_OBJECT_BUFF_CHANGED = "EVENT_OBJECT_BUFF_CHANGED"

--- Событие посылается каждый раз, когда у объекта появляется новый бафф для которого требуется визуализация прогресса (бафф имеет группу castbar).
EVENT_OBJECT_BUFF_PROGRESS_ADDED = "EVENT_OBJECT_BUFF_PROGRESS_ADDED"

--- Событие посылается каждый раз, когда у объекта изменяются свойства бафа для которого требуется визуализация прогресса (бафф имеет группу castbar).
EVENT_OBJECT_BUFF_PROGRESS_CHANGED = "EVENT_OBJECT_BUFF_PROGRESS_CHANGED"

--- Событие посылается каждый раз, когда у объекта пропадает бафф для которого требуется визуализация прогресса (бафф имеет группу castbar).
EVENT_OBJECT_BUFF_PROGRESS_REMOVED = "EVENT_OBJECT_BUFF_PROGRESS_REMOVED"

--- Событие посылается каждый раз, когда у объекта пропадает баф.
EVENT_OBJECT_BUFF_REMOVED = "EVENT_OBJECT_BUFF_REMOVED"

--- Событие посылается не чаще одного раза в кадр, если в данном кадре у объекта изменился набор буфов. Подразумевается именно добавление или удаление бафов, но не изменение свойств существующих.
EVENT_OBJECT_BUFFS_CHANGED = "EVENT_OBJECT_BUFFS_CHANGED"

--- Событие посылается не чаще одного раза в кадр, если в данном кадре у какого-либо из объектов вокруг игрока меняется информация о каком либо буфе.
EVENT_OBJECT_BUFFS_ELEMENT_CHANGED = "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED"

--- Событие посылается каждый раз, когда у члена группы главного игрока меняется активный пет.
EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED = "EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED"

--- Событие присылается при изменение координат игрока, состоящего в группе с основным игроком.
EVENT_PARTY_MEMBER_POSITION_UPDATED = "EVENT_PARTY_MEMBER_POSITION_UPDATED"

--- Событие посылается каждый раз, когда у какого-либо пета, находящегося в области видимости главного игрока, меняется имя или пол.
EVENT_PET_INFO_CHANGED = "EVENT_PET_INFO_CHANGED"

--- Событие присылается при изменении уровня астрального анлока игрока.
EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED = "EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED"

--- Приходит, если изменился текущий рейтинг экипировки персонажа. Приходит только  для главного и инспектируемого игроков.
EVENT_PLAYER_GEAR_SCORE_CHANGED = "EVENT_PLAYER_GEAR_SCORE_CHANGED"

--- Приходит, если изменилось состояние величия игрока.
EVENT_PLAYER_GREAT_CHANGED = "EVENT_PLAYER_GREAT_CHANGED"

--- Событие присылается при изменении титула основного игрока или любого игрока, находящегося в области видимости.
EVENT_PLAYER_TITLE_CHANGED = "EVENT_PLAYER_TITLE_CHANGED"

--- Событие присылается при изменении списка доступных титулов персонажа, находящегося в области видимости.
EVENT_PLAYER_TITLES_CHANGED = "EVENT_PLAYER_TITLES_CHANGED"

--- Событие посылается при старте изменения фракции (прайденов).
EVENT_PRIDEN_FACTION_CHOICE = "EVENT_PRIDEN_FACTION_CHOICE"

--- Событие присылается при изгнании из барьера урона (класс паладин, спелл "изгнать боль").
EVENT_PURGE_BARRIER_DAMAGE = "EVENT_PURGE_BARRIER_DAMAGE"

--- Событие присылается при изменение координат игрока, состоящего в отряде с основным игроком.
EVENT_RAID_MEMBER_POSITION_UPDATED = "EVENT_RAID_MEMBER_POSITION_UPDATED"

--- Событие присылается при уменьшении барьера (класс паладин, спелл "уменьшить боль").
EVENT_RELIEF_BARRIER_DAMAGE = "EVENT_RELIEF_BARRIER_DAMAGE"

--- Событие присылается при изменение координат игрока, состоящего в браке с основным игроком.
EVENT_SPOUSE_POSITION_UPDATED = "EVENT_SPOUSE_POSITION_UPDATED"

--- Событие присылается при изменении координат цели главного игрока.
EVENT_TARGET_POS_CHANGED = "EVENT_TARGET_POS_CHANGED"

--- Сообщение об изменении информации о классе юнита.
EVENT_UNIT_CLASS_CHANGED = "EVENT_UNIT_CLASS_CHANGED"

--- Событие присылается при нанесение повреждения юниту. Тип повреждения -  "ENUM_SubElement_...".
EVENT_UNIT_DAMAGE_RECEIVED = "EVENT_UNIT_DAMAGE_RECEIVED"

--- Событие присылается при изменение статуса смерти юнита (юнит умер или ожил).
EVENT_UNIT_DEAD_CHANGED = "EVENT_UNIT_DEAD_CHANGED"

--- Событие об изменении экипировки юнита (главный игрок или игрок, инспектируемый главным).
EVENT_UNIT_EQUIPMENT_CHANGED = "EVENT_UNIT_EQUIPMENT_CHANGED"

--- Событие присылается при изменинии фракции юнита.
EVENT_UNIT_FACTION_CHANGED = "EVENT_UNIT_FACTION_CHANGED"

--- Событие присылается при изменении покровителя.
EVENT_UNIT_FAIRY_CHANGED = "EVENT_UNIT_FAIRY_CHANGED"

--- Событие присылается при изменении ранга покровителя - номера или статуса временный/постоянный.
EVENT_UNIT_FAIRY_RANK_CHANGED = "EVENT_UNIT_FAIRY_RANK_CHANGED"

--- Приходит, если изменилось состояние проигрывания фаталити на каком-то юните.
EVENT_UNIT_FATALITY_CHANGED = "EVENT_UNIT_FATALITY_CHANGED"

--- Событие посылается каждый раз, когда у какого-либо игрока меняется список подчинённых юнитов (петы, ассистенты, турели и т.п.).
EVENT_UNIT_FOLLOWERS_LIST_CHANGED = "EVENT_UNIT_FOLLOWERS_LIST_CHANGED"

--- Присылается в случае изменения гильдии какого-либо игрока.
EVENT_UNIT_GUILD_CHANGED = "EVENT_UNIT_GUILD_CHANGED"

--- Событие посылается каждый раз, когда у игрока меняется слава.
EVENT_UNIT_HONOR_VALUE_CHANGED = "EVENT_UNIT_HONOR_VALUE_CHANGED"

--- Событие присылается при изменении уровня.
EVENT_UNIT_LEVEL_CHANGED = "EVENT_UNIT_LEVEL_CHANGED"

--- Событие присылается при изменении процентного значения маны юнита и числового значение для аватара.
EVENT_UNIT_MANA_CHANGED = "EVENT_UNIT_MANA_CHANGED"

--- Событие присылается при измениние маны юнита.
EVENT_UNIT_MANA_PERCENTAGE_CHANGED = "EVENT_UNIT_MANA_PERCENTAGE_CHANGED"

--- Событие присылается, если NPC или моб прислал текстовое сообщение.
EVENT_UNIT_MESSAGE = "EVENT_UNIT_MESSAGE"

--- Приходит, если у какого-либо игрока изменилось настроение.
EVENT_UNIT_MOOD_CHANGED = "EVENT_UNIT_MOOD_CHANGED"

--- Событие посылается каждый раз, когда у игрока меняется текущее здоровье ездового животного.
EVENT_UNIT_MOUNT_HEALTH_CHANGED = "EVENT_UNIT_MOUNT_HEALTH_CHANGED"

--- Событие присылается при изменении координат юнита. В данный момент такое событие приходит только для юнитов, задетекченных специальным умением главного игрока.
EVENT_UNIT_POS_CHANGED = "EVENT_UNIT_POS_CHANGED"

--- Событие посылается при изменении PvP флага какого-либо юнита (игрока или моба).
EVENT_UNIT_PVP_FLAG_CHANGED = "EVENT_UNIT_PVP_FLAG_CHANGED"

--- Приходит, если изменилось количество Гнева у юнита.
EVENT_UNIT_RAGE_CHANGED = "EVENT_UNIT_RAGE_CHANGED"

--- Событие присылается при возможном изменение состояния юнита (враждебное/дружественное/нейтральное).
EVENT_UNIT_RELATION_CHANGED = "EVENT_UNIT_RELATION_CHANGED"

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает юнит.
EVENT_UNITS_CHANGED = "EVENT_UNITS_CHANGED"

--- Событие присылается при изменении потэганности моба. Моб становится потэганным, когда какой-нибудь игрок вступает с ним в бой. После этого, в случае скоропостижной смерти моба, весь лут достаётся этому игроку вне зависимости от того, кто ещё участвовал в жестоком убийстве.
EVENT_UNIT_TAG_CHANGED = "EVENT_UNIT_TAG_CHANGED"

--- Событие присылается, если игрок в группе (или аватар) взял лут (деньги).
EVENT_UNIT_TOOK_MONEY = "EVENT_UNIT_TOOK_MONEY"

--- Приходит, если изменился ветеранский ранг игрока.
EVENT_UNIT_VETERAN_RANK_CHANGED = "EVENT_UNIT_VETERAN_RANK_CHANGED"

--- Приходит, если изменилось количество Воли у юнита.
EVENT_UNIT_WILL_CHANGED = "EVENT_UNIT_WILL_CHANGED"

--- Событие посылается при изменении PvP-типа зоны для игрока.
EVENT_UNIT_ZONE_PVP_TYPE_CHANGED = "EVENT_UNIT_ZONE_PVP_TYPE_CHANGED"
