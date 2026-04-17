---@meta

--- CategoryUnitInfo
--- События и функции Lua API, относящиеся к работе с юнитами: персонажами и др.

---@class unitInfoLib
unitInfo = {}

--- Возвращает true, если юнит может сейчас иметь врагов
---@param unitId ObjectId
---@return boolean
function unitInfo.CanHaveEnemy(unitId) end

--- Можно ли попытаться использовать юнит в текущий момент. Для разговора, лута из трупов мобов.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unitInfo.CanUse(unitId) end

--- Возвращает текущую форму класса персонажа CharacterFormId.
---@param unitId ObjectId идентификатор персонажа
---@return CharacterFormId|nil
function unitInfo.GetCharacterForm(unitId) end

--- Возвращает информацию о классе персонажа
---@param unitId ObjectId
function unitInfo.GetClass(unitId) end

--- Возвращает ресурс класса персонажа CharacterClassId.
---@param unitId ObjectId
---@return CharacterClassId|nil
function unitInfo.GetClassId(unitId) end

--- Получить фракцию юнита.
---@param unitId ObjectId
---@return FactionId
function unitInfo.GetFactionId(unitId) end

--- Возвращает текущий рейтинг экипировки персонажа.
---@param unitId ObjectId идентификатор юнита
---@return number
function unitInfo.GetGearScore(unitId) end

--- Получить имя гильдии игрока.
---@param unitId ObjectId
---@return table|nil
function unitInfo.GetGuildInfo(unitId) end

--- Возвращает текущий уровень юнита
---@param unitId ObjectId
---@return number
function unitInfo.GetLevel(unitId) end

--- Возвращает информацию о прогрессе произнесения заклинания мобом.
---@param unitId ObjectId
---@return table|nil
function unitInfo.GetMobActionProgress(unitId) end

--- Возвращает настройку отображения овертипа юнита в виде ENUM_MobWorld_OvertipCustomView.
---@param unitId ObjectId идентификатор юнита
---@return number
function unitInfo.GetOvertipCustomView(unitId) end

--- Возвращает информацию о специальной текстуре ассоциированной с кричей. Если таковой нет - вернет nil
---@param unitId ObjectId
---@return TextureId|nil
function unitInfo.GetOvertipTexture(unitId) end

--- Возвращает имя моба-пета игрока. Если персонаж не является петом (который может иметь имя) игрока - возвращается nil. Работает только для мобов.
---@param unitId ObjectId
---@return WString|nil
function unitInfo.GetPetName(unitId) end

--- Возвращает имя шарда игрока
---@param unitId ObjectId
---@return WString
function unitInfo.GetPlayerShardName(unitId) end

--- Возвращает титул игрока.
---@param unitId ObjectId
---@return table|nil
function unitInfo.GetPlayerTitle(unitId) end

--- Возвращает все возможные титулы игрока.
---@param unitId ObjectId
---@return table|nil
function unitInfo.GetPlayerTitles(unitId) end

--- Возвращает информацию о расе персонажа
---@param unitId ObjectId
function unitInfo.GetRace(unitId) end

--- Возвращает количество Гнева, накопленное у юнита. При изменении этой величины приходит событие  EVENT_UNIT_RAGE_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return number
function unitInfo.GetRage(unitId) end

--- Возвращает информацию о поле игрока
---@param unitId ObjectId
function unitInfo.GetSex(unitId) end

--- Возвращает титул юнита.
---@param unitId ObjectId
---@return WString
function unitInfo.GetTitle(unitId) end

--- Возвращает информацию о классе тренера. Класс тренера может отличаться от класса самого персонажа. В случае ошибки метод возвращает nil.
---@param unitId ObjectId
function unitInfo.GetTrainerClass(unitId) end

--- Возвращает доп. информацию о персонажах игрока - для трио (гибберлинги). Если персонаж не трио - возвращается nil. Работает только для игроков.
---@param unitId ObjectId
---@return table
function unitInfo.GetTrioInfo(unitId) end

--- Возвращает информацию о ветеранском ранге игрока. Можно вызывать только для игроков.
---@param unitId ObjectId идентификатор игрока
---@return table|nil
function unitInfo.GetVeteranRank(unitId) end

--- Возвращает количество Воли, накопленное у юнита. При изменении этой величины приходит событие  EVENT_UNIT_WILL_CHANGED.
---@param unitId ObjectId идентификатор юнита
---@return number
function unitInfo.GetWill(unitId) end

--- Возвращает информацию о PvP-опасности зоны для персонажа.
---@param unitId ObjectId
---@return string
function unitInfo.GetZonePvPDanger(unitId) end

--- Возвращает информацию о PvP-типе зоны для персонажа.
---@param unitId ObjectId
---@return number
function unitInfo.GetZonePvPType(unitId) end

--- Метод возвращает true, если требуется показ особой плашки с внутренним состоянием моба.
---@param unitId ObjectId
---@return boolean
function unitInfo.HasBossPlate(unitId) end

--- Возвращает информацию о статусе AFK игрока
---@param unitId ObjectId
---@return boolean
function unitInfo.IsAfk(unitId) end

--- Возвращает true, если юнит агрессивен по отношению к главному игроку.
---@param unitId ObjectId
---@return boolean
function unitInfo.IsAggressive(unitId) end

--- Возвращает true, если юнит мёртв и на нём будет проигрываться (или уже проигрывается) фаталити.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unitInfo.IsFatalityDeath(unitId) end

--- Возвращает true, если указанный игрок является Великим. Только для игроков.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unitInfo.IsGreat(unitId) end

--- Возвращает true, если указанный юнит - игрок.
---@param unitId ObjectId
---@return boolean
function unitInfo.IsPlayer(unitId) end

--- Возвращает true, если моб потэган каким-либо игроком. Это значит, что какой-то игрок вступил с мобом в бой, и весь лут достанется этому игроку.
---@param unitId ObjectId
---@return boolean
function unitInfo.IsTagged(unitId) end

--- Возвращает true, если моб потэган главным игроком. Это значит, что главный игрок вступил с мобом в бой, и весь лут достанется главному игроку.
---@param unitId ObjectId
---@return boolean
function unitInfo.IsTaggedByMainPlayer(unitId) end

--- Возвращает true, если юнит является учителем. Иначе false.
---@param id ObjectId Id юнита. Если передан Id игрока, вернёт false.
---@return boolean
function unitInfo.IsTrainer(id) end

--- Возвращает возможность принципиального использования юнита. Только для лута мертвых мобов.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function unitInfo.IsUsable(unitId) end

--- Выбирает (устанавливает текущий) титул персонажа. Титул можно устанавливать только собственному персонажу
---@param unitId ObjectId
---@param titleId ObjectId|nil идентификатор титула (идентификатор), или nil для сброса титула
---@return boolean
function unitInfo.SetPlayerTitle(unitId, titleId) end

--- Получить элитность юнита. Значения:
function GetQuality() end

-- Events

--- Событие посылается, когда игрок меняет статус AFK
EVENT_AFK_STATE_CHANGED = "EVENT_AFK_STATE_CHANGED"

--- Приходит, если изменился список заданий процедурного данжа, связанных с мобом.
EVENT_MOB_RELATED_GOALS_CHANGED = "EVENT_MOB_RELATED_GOALS_CHANGED"

--- Приходит, если изменился список заданий, связанных с мобом.
EVENT_MOB_RELATED_QUESTS_CHANGED = "EVENT_MOB_RELATED_QUESTS_CHANGED"

--- Приходит, если изменился текущий рейтинг экипировки персонажа. Приходит только  для главного и инспектируемого игроков.
EVENT_PLAYER_GEAR_SCORE_CHANGED = "EVENT_PLAYER_GEAR_SCORE_CHANGED"

--- Приходит, если изменилось состояние величия игрока.
EVENT_PLAYER_GREAT_CHANGED = "EVENT_PLAYER_GREAT_CHANGED"

--- Приходит, если изменилось состояние проигрывания фаталити на каком-то юните.
EVENT_UNIT_FATALITY_CHANGED = "EVENT_UNIT_FATALITY_CHANGED"

--- Событие присылается при изменении уровня.
EVENT_UNIT_LEVEL_CHANGED = "EVENT_UNIT_LEVEL_CHANGED"

--- Приходит, если изменилось количество Гнева у юнита.
EVENT_UNIT_RAGE_CHANGED = "EVENT_UNIT_RAGE_CHANGED"

--- Приходит, если изменился ветеранский ранг игрока.
EVENT_UNIT_VETERAN_RANK_CHANGED = "EVENT_UNIT_VETERAN_RANK_CHANGED"

--- Приходит, если изменилось количество Воли у юнита.
EVENT_UNIT_WILL_CHANGED = "EVENT_UNIT_WILL_CHANGED"
