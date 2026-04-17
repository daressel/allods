---@meta

--- CategoryGuildHallLib
--- События и функции Lua API, относящиеся к работе с оплотом гильдии.

---@class guildHallLibLib
guildHallLib = {}

--- Проверка того что создание оплота гильдии доступно.
---@return table
function guildHallLib.CanCreate() end

--- Инициирует создание оплота гильдии. В случаи успеха возникнет событие EVENT_GUILD_HALL_STATE_CHANGED.
---@param hallName WString
---@param bossName WString
---@param bossIndex integer
function guildHallLib.Create(hallName, bossName, bossIndex) end

--- Возвращает описание текущего состояний оплота гильдии.
---@return table|nil
function guildHallLib.GetCurrentStateInfo() end

--- Возвращает текущее значение прогресса гильдии.
---@return number
function guildHallLib.GetExperience() end

--- Возвращает оставшееся значение дневного прогресса гильдии.
---@return number
function guildHallLib.GetExperienceDaily() end

--- Возвращает название оплота гильдии если он существует.
---@return WString
function guildHallLib.GetName() end

--- Возвращает информацию о задании для прогресса оплота гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestInfo( questId ).
---@param questId QuestId
---@return any
function guildHallLib.GetQuestInfo(questId) end

--- Возвращает информацию о награде за выполнение задания для прогресса оплота гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestReward( questId ).
---@param questId QuestId
---@return any
function guildHallLib.GetQuestReward(questId) end

--- Возвращает список заданий для прогресса оплота гильдии.
---@return table|nil
function guildHallLib.GetQuests() end

--- Возвращает список состояний оплота гильдии и их описание.
---@return table|nil
function guildHallLib.GetStatesInfo() end

--- Возвращает заклинание телепортации в оплот гильдии, если оно существует.
---@return SpellId|nil
function guildHallLib.GetTeleportSpell() end

--- Проверка того что оплот гильдии существует.
---@return boolean
function guildHallLib.IsExist() end

-- Events

--- Присылается при измении прогресса оплота гильдии.
EVENT_GUILD_HALL_EXPERIENCE_CHANGED = "EVENT_GUILD_HALL_EXPERIENCE_CHANGED"

--- Присылается при измении дневного прогресса оплота гильдии.
EVENT_GUILD_HALL_EXPERIENCE_DAILY_CHANGED = "EVENT_GUILD_HALL_EXPERIENCE_DAILY_CHANGED"

--- Присылается при измении списка заданий для прогресса оплота гильдии.
EVENT_GUILD_HALL_QUESTS_CHANGED = "EVENT_GUILD_HALL_QUESTS_CHANGED"

--- Присылается при измении статуса заданий для прогресса оплота гильдии.
EVENT_GUILD_HALL_QUESTS_STATUS_CHANGED = "EVENT_GUILD_HALL_QUESTS_STATUS_CHANGED"

--- Присылается при измении состояния оплота гильдии.
EVENT_GUILD_HALL_STATE_CHANGED = "EVENT_GUILD_HALL_STATE_CHANGED"
