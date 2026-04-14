---@meta

---@class guildBossLibLib
guildBossLib = {}

---@class GuildBossLibGetAbilitiesSlotsResult
---@field spells SpellId|nil -- список возможных заклинаний босса гильдии для данного слота[]
---@field abilities AbilityId|nil -- список возможных способностей босса гильдии для данного слота[]

---@class GuildBossLibGetInfoResult
---@field experience Number(int) -- накопленный опыт босса гильдии
---@field gearScore Number(int) -- текущая сила босса гильдии
---@field name string|nil -- нарицательное имя босса гильдии
---@field description WString -- художественное описание босса гильдии
---@field currentState integer|nil -- индекс текущей стадии прогресса босса гильдии
---@field states table|nil -- список стадий прогресса боса, индексируется с 1, каждый элемент которого таблица с полями:
---@field experienceLimit Number(int) -- предел накапливаемого опыта босса гильдии на данной стадии
---@field availableAbilitySlots String|nil -- список доступных слотов способностей босса гильдии[]

---@class GuildBossLibGetQuestsResult
---@field questId QuestId -- идентификатор ресурса задания
---@field count Number(int) -- счетчик выполнения данного заданий, значения: 0 если не выполненно, 1 и более если выполненно
---@field texture TextureId|nil -- идентификатор текстуры миниатюры задания
---@field requiredItems ItemId|nil -- список особых предметов необходимых для выполнения задания, индексация с 0[]

---@class GuildBossLibGetVariationsResult
---@field name string|nil -- нарицательное имя
---@field description WString -- художественное описание
---@field preview TextureId  -- идентификатор текстуры для предпросмотра
---@field background TextureId -- идентификатор текстуры для подложки
---@field spells SpellId -- список заклинаний, которыми может владеть босс, индесация с 1[]
---@field abilities AbilityId -- список способностей, которыми может владеть босс, индесация с 1[]
---@field previewStates Number -- индексы состояния для которых следует позволять делать предпросмотр[]

---Возвращает спецификацию слотов способностей босса гильдии.
---@return GuildBossLibGetAbilitiesSlotsResult
function guildBossLib.GetAbilitiesSlots() end

---Возвращает сводную информацию о боссе гильдии
---@return GuildBossLibGetInfoResult
function guildBossLib.GetInfo() end

---Возвращает информацию о задании для прогресса босса гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestInfo( questId ).
---@param questId QuestId -- идентификатор ресурса задания
---@return аналогично avatar.GetQuestInfo( questId )
function guildBossLib.GetQuestInfo(questId) end

---Возвращает информацию о награде за выполнение задания для прогресса босса гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestReward( questId ).
---@param questId QuestId -- идентификатор ресурса задания
---@return аналогично avatar.GetQuestReward( questId )
function guildBossLib.GetQuestReward(questId) end

---Возвращает список заданий для прогресса босса гильдии.
---@return GuildBossLibGetQuestsResult
function guildBossLib.GetQuests() end

---Возвращает список выбранных способностей босса гильдии.
---@return AbilityId|nil -[]
function guildBossLib.GetSelectedAbilities() end

---Возвращает список выбранных заклинаний босса гильдии.
---@return SpellId|nil -[]
function guildBossLib.GetSelectedSpells() end

---Возвращает собственное имя босс гильдии, данное ему при создании.
---@return string|nil -
function guildBossLib.GetSelfName() end

---Возвращает список возможных вариантов для выбора босса гильдии.
---@return GuildBossLibGetVariationsResult
function guildBossLib.GetVariations() end

---Проверка того что босс гильдии существует.
---@return boolean
function guildBossLib.IsExist() end

---Осуществляет выбор заклинаний и способностей босса гильдии.
---@return нет
function guildBossLib.SelectAbilities() end
