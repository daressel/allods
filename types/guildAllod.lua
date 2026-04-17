---@meta

--- CategoryGuildAllod
--- События и функции Lua API, относящиеся к работе с гильдейскими аллодами (аукционами, война и т.п.).

--- Текстовый енум. Роль главного игрока в войне за гильдейский аллод.
--- нападающий
ENUM_BattleMemberRole_Attacker = "ENUM_BattleMemberRole_Attacker"
--- защитник
ENUM_BattleMemberRole_Defender = "ENUM_BattleMemberRole_Defender"

--- Результат ставки на гильдейском аукционе.
ENUM_MsgGuildAllodAuctionBidResultResult_SUCCESS = "ENUM_MsgGuildAllodAuctionBidResultResult_SUCCESS"
ENUM_MsgGuildAllodAuctionBidResultResult_ERROR = "ENUM_MsgGuildAllodAuctionBidResultResult_ERROR"
ENUM_MsgGuildAllodAuctionBidResultResult_OLDVERSION = "ENUM_MsgGuildAllodAuctionBidResultResult_OLDVERSION"
ENUM_MsgGuildAllodAuctionBidResultResult_SAMEUSER = "ENUM_MsgGuildAllodAuctionBidResultResult_SAMEUSER"
ENUM_MsgGuildAllodAuctionBidResultResult_NOGUILD = "ENUM_MsgGuildAllodAuctionBidResultResult_NOGUILD"
ENUM_MsgGuildAllodAuctionBidResultResult_NOMONEY = "ENUM_MsgGuildAllodAuctionBidResultResult_NOMONEY"
ENUM_MsgGuildAllodAuctionBidResultResult_NOAUCTION = "ENUM_MsgGuildAllodAuctionBidResultResult_NOAUCTION"
ENUM_MsgGuildAllodAuctionBidResultResult_FINISHED = "ENUM_MsgGuildAllodAuctionBidResultResult_FINISHED"

-- Events

--- Присылается в случае, если атака на чужой гильдейский аллод провалилась.
EVENT_GUILD_ALLOD_ATTACK_FAILED = "EVENT_GUILD_ALLOD_ATTACK_FAILED"

--- Присылается в случае, если атака на чужой гильдейский аллод удалась.
EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL = "EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL"

--- Присылается в случае, если изменился владелец гильдейского аллода.
EVENT_GUILD_ALLOD_OWNER_CHANGED = "EVENT_GUILD_ALLOD_OWNER_CHANGED"

--- Оповещение об окончании кулдауна телепортации на гильдейский аллод.
EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_FINISHED = "EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_FINISHED"

--- Оповещение о начале кулдауна телепортации на гильдейский аллод.
EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_STARTED = "EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_STARTED"
