---@meta

--- CategoryLuaMap
--- Функции и события Lua API, связанные с обработкой карт, зон, инстансов и т.п.

--- Текстовый enum. Префикс для автоматической проверки - "ENUM_AvatarKickCause".
ENUM_AvatarKickCause_Void = "ENUM_AvatarKickCause_Void"
ENUM_AvatarKickCause_ExtraAvatar = "ENUM_AvatarKickCause_ExtraAvatar"
ENUM_AvatarKickCause_InvalidGuild = "ENUM_AvatarKickCause_InvalidGuild"
ENUM_AvatarKickCause_NoGuild = "ENUM_AvatarKickCause_NoGuild"
ENUM_AvatarKickCause_NoTabard = "ENUM_AvatarKickCause_NoTabard"
ENUM_AvatarKickCause_NoGroup = "ENUM_AvatarKickCause_NoGroup"
ENUM_AvatarKickCause_NoRaid = "ENUM_AvatarKickCause_NoRaid"
ENUM_AvatarKickCause_LevelControl = "ENUM_AvatarKickCause_LevelControl"
ENUM_AvatarKickCause_EventFinished = "ENUM_AvatarKickCause_EventFinished"
ENUM_AvatarKickCause_NoShip = "ENUM_AvatarKickCause_NoShip"
ENUM_AvatarKickCause_InvalidMap = "ENUM_AvatarKickCause_InvalidMap"
ENUM_AvatarKickCause_RaidVarsConflict = "ENUM_AvatarKickCause_RaidVarsConflict"

---@class luaMapLib
luaMap = {}

--- Возвращает информацию о причине и времени до выброса главного игрока из инстанса. Если счетчика нет, возвращает nil.
---@return table|nil
function luaMap.GetMapInstanceKick() end

-- Events

--- Событие присылается при окончании отсчета времени до выброса из инстанса.
EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED = "EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED"

--- Событие присылается при начале отсчета времени до выброса из инстанса.
EVENT_MAP_INSTANCE_KICK_TIMER_STARTED = "EVENT_MAP_INSTANCE_KICK_TIMER_STARTED"
