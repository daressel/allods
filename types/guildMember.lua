---@meta

--- CategoryGuildMember
--- События и функции Lua API, относящиеся к работе с членом гильдии.

--- Онлайн-статус члена гильдии.
ENUM_AvatarOnlineStatus_Offline = "ENUM_AvatarOnlineStatus_Offline"
--- аватар в игре
ENUM_AvatarOnlineStatus_Online = "ENUM_AvatarOnlineStatus_Online"
--- в игре другое перерождение этого аватара
ENUM_AvatarOnlineStatus_OnAlt = "ENUM_AvatarOnlineStatus_OnAlt"
--- не в игре, но в чате (например с мобильника)
ENUM_AvatarOnlineStatus_Shadow = "ENUM_AvatarOnlineStatus_Shadow"

--- Знак гильдейского отличия.
ENUM_TabardType_None = "ENUM_TabardType_None"
ENUM_TabardType_Common = "ENUM_TabardType_Common"
ENUM_TabardType_Champion = "ENUM_TabardType_Champion"
ENUM_TabardType_BannerTier1 = "ENUM_TabardType_BannerTier1"
ENUM_TabardType_BannerTier2 = "ENUM_TabardType_BannerTier2"
ENUM_TabardType_BannerTier3 = "ENUM_TabardType_BannerTier3"
ENUM_TabardType_None = "ENUM_TabardType_None"
ENUM_TabardType_Common = "ENUM_TabardType_Common"
ENUM_TabardType_Champion = "ENUM_TabardType_Champion"
ENUM_TabardType_BannerTier1 = "ENUM_TabardType_BannerTier1"
ENUM_TabardType_BannerTier2 = "ENUM_TabardType_BannerTier2"
ENUM_TabardType_BannerTier3 = "ENUM_TabardType_BannerTier3"

---@class guildMemberLib
guildMember = {}

--- Можно ли выдавать знак отличия в награду члену гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@return boolean
function guildMember.CanDistributeTabard(memberId) end

--- Изменить ранг члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@param rank integer новый ранг игрока
function guildMember.ChangeRank(memberId, rank) end

--- Производит коррекцию баланса члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@param changeSum integer величина изменения в меди
---@param comment WString комментарий
function guildMember.CorrectMemberBalance(memberId, changeSum, comment) end

--- Выдать знак отличия в награду члену гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@param tabardType integer тип знака отличия
function guildMember.DistributeTabard(memberId, tabardType) end

--- В ответ на вызов этой функции придёт событие  EVENT_GUILD_AVATAR_HISTORY.
function guildMember.GetAvatarHistory() end

--- Возвращает идентификатор члена гильдии для главного игрока.
---@return ObjectId|nil
function guildMember.GetAvatarMemberId() end

--- Возвращает идентификатор лидера гильдии главного игрока.
---@return ObjectId|nil
function guildMember.GetLeader() end

--- Возвращает ограничения для использования гильдейских свойств и методов.
---@return table
function guildMember.GetLimits() end

--- Возвращает идентификатор члена гильдии главного игрока по имени игрока.
---@param playerName WString имя игрока
---@return ObjectId|nil
function guildMember.GetMember(playerName) end

--- Возвращает информацию о балансе члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@return number
function guildMember.GetMemberBalance(memberId) end

--- Получить описание игрока из гильдии по его идентификатору.
---@param memberId ObjectId идентификатор члена гильдии
---@return WString
function guildMember.GetMemberDescription(memberId) end

--- Возвращает информацию об одном члене гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return table|nil
function guildMember.GetMemberInfo(memberId) end

--- Возвращает список членов гильдии.
---@return table
function guildMember.GetMembers() end

--- Возвращает список миссий гильдии.
---@return table|nil
function guildMember.GetMissions() end

--- Возвращает список альтвалют гильдии, которые могут добывать игроки.
---@return CurrencyId[]|nil
function guildMember.GetProfitableCurrencies() end

--- Возвращает ранг члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return number
function guildMember.GetRank(memberId) end

--- Возвращает права члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return table
function guildMember.GetRights(memberId) end

--- Возвращает описание бонусов для носителей гильдейских накидок гильдии игрока.
---@param unitId ObjectId|nil идентификатор персонажа, либо nil, тогда по умолчанию вернет информацию для собственного аватара
---@return table
function guildMember.GetTabardBonus(unitId) end

--- Возвращает идентификатор лидера гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@return boolean
function guildMember.IsLeader(memberId) end

--- Объявляет сбор в гильдейском банке.
---@param sum integer сумма сбора в меди
---@param comment WString комментарий при объявлении сбора
---@param ranks integer[] индексы рангов гильдии, попавших в транзакцию. Может быть пустым
---@param tabards integer[] накидки гильдии, носители которых попали в транзакцию. Может быть пустым
function guildMember.RaiseFunds(sum, comment, ranks, tabards) end

--- Изменить описание игрока в гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@param description WString описание игрока
function guildMember.SetMemberDescription(memberId, description) end

-- Events

--- Присылается, если в гильдию главного игрока добавлен игрок.
EVENT_GUILD_MEMBER_ADDED = "EVENT_GUILD_MEMBER_ADDED"

--- Присылается, если изменилось влияние у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_AUTHORITY_CHANGED = "EVENT_GUILD_MEMBER_AUTHORITY_CHANGED"

--- Присылается, если у члена гильдии изменился баланс в гильдейском банке.
EVENT_GUILD_MEMBER_BALANCE_CHANGED = "EVENT_GUILD_MEMBER_BALANCE_CHANGED"

--- Присылается, если изменились параметры члена гильдии главного игрока.
EVENT_GUILD_MEMBER_CHANGED = "EVENT_GUILD_MEMBER_CHANGED"

--- Присылается, если изменилось влияние, набранное за день, у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_DAY_AUTHORITY_CHANGED = "EVENT_GUILD_MEMBER_DAY_AUTHORITY_CHANGED"

--- Присылается, если изменилось преданность члена гильдии главного игрока.
EVENT_GUILD_MEMBER_LOYALTY_CHANGED = "EVENT_GUILD_MEMBER_LOYALTY_CHANGED"

--- Присылается, если изменилось влияние, набранное за месяц, у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_MONTH_AUTHORITY_CHANGED = "EVENT_GUILD_MEMBER_MONTH_AUTHORITY_CHANGED"

--- Присылается когда меняется онлайн-статус члена гильдии (см. поле onlineStatus функции  guild.GetMemberInfo( memberId )).
EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED = "EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED"

--- Присылается, если изменился ранг члена гильдии.
EVENT_GUILD_MEMBER_RANK_CHANGED = "EVENT_GUILD_MEMBER_RANK_CHANGED"

--- Присылается, если из списка гильдии главного игрока удален игрок.
EVENT_GUILD_MEMBER_REMOVED = "EVENT_GUILD_MEMBER_REMOVED"

--- Присылается, если изменилось право на ношение накидки у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_TABARD_CHANGED = "EVENT_GUILD_MEMBER_TABARD_CHANGED"

--- Присылается, если изменилось влияние, набранное за неделю , у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED = "EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED"
