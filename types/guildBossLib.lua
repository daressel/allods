---@meta

--- CategoryGuildBossLib
--- События и функции Lua API, относящиеся к работе с боссом гильдии.

--- Перечисление слотов способностей босса гильдии.
ENUM_GuildBossAbilitySlot_CommonPassive = "ENUM_GuildBossAbilitySlot_CommonPassive"
ENUM_GuildBossAbilitySlot_CommonActive = "ENUM_GuildBossAbilitySlot_CommonActive"
ENUM_GuildBossAbilitySlot_RarePassive = "ENUM_GuildBossAbilitySlot_RarePassive"
ENUM_GuildBossAbilitySlot_RareActive = "ENUM_GuildBossAbilitySlot_RareActive"
ENUM_GuildBossAbilitySlot_LegendaryPassive = "ENUM_GuildBossAbilitySlot_LegendaryPassive"
ENUM_GuildBossAbilitySlot_LegendaryActive = "ENUM_GuildBossAbilitySlot_LegendaryActive"

---@class guildBossLibLib
guildBossLib = {}

--- Возвращает спецификацию слотов способностей босса гильдии.
---@return table|nil
function guildBossLib.GetAbilitiesSlots() end

--- Возвращает сводную информацию о боссе гильдии
---@return table|nil
function guildBossLib.GetInfo() end

--- Возвращает информацию о задании для прогресса босса гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestInfo( questId ).
---@param questId QuestId
---@return any
function guildBossLib.GetQuestInfo(questId) end

--- Возвращает информацию о награде за выполнение задания для прогресса босса гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestReward( questId ).
---@param questId QuestId
---@return any
function guildBossLib.GetQuestReward(questId) end

--- Возвращает список заданий для прогресса босса гильдии.
---@return table|nil
function guildBossLib.GetQuests() end

--- Возвращает список выбранных способностей босса гильдии.
---@return AbilityId[]|nil
function guildBossLib.GetSelectedAbilities() end

--- Возвращает список выбранных заклинаний босса гильдии.
---@return SpellId[]|nil
function guildBossLib.GetSelectedSpells() end

--- Возвращает собственное имя босс гильдии, данное ему при создании.
---@return WString|nil
function guildBossLib.GetSelfName() end

--- Возвращает список возможных вариантов для выбора босса гильдии.
---@return table|nil
function guildBossLib.GetVariations() end

--- Проверка того что босс гильдии существует.
---@return boolean
function guildBossLib.IsExist() end

--- Осуществляет выбор заклинаний и способностей босса гильдии.
function guildBossLib.SelectAbilities() end

-- Events

--- Присылается при измении списока выбранных способностей босса гильдии.
EVENT_GUILD_BOSS_ABILITIES_CHANGED = "EVENT_GUILD_BOSS_ABILITIES_CHANGED"

--- Присылается в случае если изменился босс гильдии.
EVENT_GUILD_BOSS_CHANGED = "EVENT_GUILD_BOSS_CHANGED"

--- Присылается в случае, если изменился опыт босса гильдии.
EVENT_GUILD_BOSS_EXPERIENCE_CHANGED = "EVENT_GUILD_BOSS_EXPERIENCE_CHANGED"

--- Присылается в случае, если изменилась сила босса гильдии.
EVENT_GUILD_BOSS_GEAR_SCORE_CHANGED = "EVENT_GUILD_BOSS_GEAR_SCORE_CHANGED"

--- Присылается при измении списка заданий для прогресса босса гильдии.
EVENT_GUILD_BOSS_QUESTS_CHANGED = "EVENT_GUILD_BOSS_QUESTS_CHANGED"

--- Присылается при измении статуса заданий для прогресса босса гильдии.
EVENT_GUILD_BOSS_QUESTS_STATUS_CHANGED = "EVENT_GUILD_BOSS_QUESTS_STATUS_CHANGED"

--- Присылается при измении списока выбранных заклинаний босса гильдии.
EVENT_GUILD_BOSS_SPELLS_CHANGED = "EVENT_GUILD_BOSS_SPELLS_CHANGED"

--- Присылается при измении состояния босса гильдии.
EVENT_GUILD_BOSS_STATE_CHANGED = "EVENT_GUILD_BOSS_STATE_CHANGED"
