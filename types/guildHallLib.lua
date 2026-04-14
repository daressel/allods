---@meta

---@class guildHallLibLib
guildHallLib = {}

---@class GuildHallLibCanCreateResult
---@field result boolean -- true если создание оплота гильдии доступно, иначе false
---@field reason table(RequirementsTable) -- причины недоступности строительства оплота гильдии

---@class GuildHallLibGetCurrentStateInfoResult
---@field description WString -- художественное описание данного состояния
---@field requiredExp Number(int) -- требуемое количество прогресса для достижения данного состояния
---@field prevRequiredExp Number(int) -- требуемое количество прогресса для достижения предыдущего состояния

---@class GuildHallLibGetQuestsResult
---@field questId QuestId -- идентификатор ресурса задания
---@field count Number(int) -- счетчик выполнения данного заданий, значения: 0 если не выполненно, 1 и более если выполненно
---@field texture TextureId|nil -- идентификатор текстуры миниатюры задания
---@field requiredItems ItemId|nil -- список особых предметов необходимых для выполнения задания, индексация с 0[]

---@class GuildHallLibGetStatesInfoResult
---@field description WString -- художественное описание данного состояния
---@field requiredExp Number(int) -- требуемое количество прогресса для достижения данного состояния

---Проверка того что создание оплота гильдии доступно.
---@return GuildHallLibCanCreateResult
function guildHallLib.CanCreate() end

---Инициирует создание оплота гильдии. В случаи успеха возникнет событие EVENT_GUILD_HALL_STATE_CHANGED.
---@param hallName WString -- название оплота гильдии
---@param bossName WString -- название босса гильдии
---@param bossIndex Number(int) -- индекс выбранного босса
---@return нет
function guildHallLib.Create(hallName, bossName, bossIndex) end

---Возвращает описание текущего состояний оплота гильдии.
---@return GuildHallLibGetCurrentStateInfoResult
function guildHallLib.GetCurrentStateInfo() end

---Возвращает текущее значение прогресса гильдии.
---@return Number(int) -
function guildHallLib.GetExperience() end

---Возвращает оставшееся значение дневного прогресса гильдии.
---@return Number(int) -
function guildHallLib.GetExperienceDaily() end

---Возвращает название оплота гильдии если он существует.
---@return WString -
function guildHallLib.GetName() end

---Возвращает информацию о задании для прогресса оплота гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestInfo( questId ).
---@param questId QuestId -- идентификатор ресурса задания
---@return аналогично avatar.GetQuestInfo( questId )
function guildHallLib.GetQuestInfo(questId) end

---Возвращает информацию о награде за выполнение задания для прогресса оплота гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestReward( questId ).
---@param questId QuestId -- идентификатор ресурса задания
---@return аналогично avatar.GetQuestReward( questId )
function guildHallLib.GetQuestReward(questId) end

---Возвращает список заданий для прогресса оплота гильдии.
---@return GuildHallLibGetQuestsResult
function guildHallLib.GetQuests() end

---Возвращает список состояний оплота гильдии и их описание.
---@return GuildHallLibGetStatesInfoResult
function guildHallLib.GetStatesInfo() end

---Возвращает заклинание телепортации в оплот гильдии, если оно существует.
---@return SpellId|nil
function guildHallLib.GetTeleportSpell() end

---Проверка того что оплот гильдии существует.
---@return boolean
function guildHallLib.IsExist() end
