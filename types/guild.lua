---@meta

--- CategoryGuild
--- События и функции Lua API, относящиеся к работе с гильдией (и близкие к этому).

--- Онлайн-статус члена гильдии.
ENUM_AvatarOnlineStatus_Offline = "ENUM_AvatarOnlineStatus_Offline"
--- аватар в игре
ENUM_AvatarOnlineStatus_Online = "ENUM_AvatarOnlineStatus_Online"
--- в игре другое перерождение этого аватара
ENUM_AvatarOnlineStatus_OnAlt = "ENUM_AvatarOnlineStatus_OnAlt"
--- не в игре, но в чате (например с мобильника)
ENUM_AvatarOnlineStatus_Shadow = "ENUM_AvatarOnlineStatus_Shadow"

--- Текстовый енум. Роль главного игрока в войне за гильдейский аллод.
--- нападающий
ENUM_BattleMemberRole_Attacker = "ENUM_BattleMemberRole_Attacker"
--- защитник
ENUM_BattleMemberRole_Defender = "ENUM_BattleMemberRole_Defender"

--- Перечисление слотов способностей босса гильдии.
ENUM_GuildBossAbilitySlot_CommonPassive = "ENUM_GuildBossAbilitySlot_CommonPassive"
ENUM_GuildBossAbilitySlot_CommonActive = "ENUM_GuildBossAbilitySlot_CommonActive"
ENUM_GuildBossAbilitySlot_RarePassive = "ENUM_GuildBossAbilitySlot_RarePassive"
ENUM_GuildBossAbilitySlot_RareActive = "ENUM_GuildBossAbilitySlot_RareActive"
ENUM_GuildBossAbilitySlot_LegendaryPassive = "ENUM_GuildBossAbilitySlot_LegendaryPassive"
ENUM_GuildBossAbilitySlot_LegendaryActive = "ENUM_GuildBossAbilitySlot_LegendaryActive"

--- Права члена гильдии:
---@type integer
GUILD_MEMBER_RIGHT_CHAT = nil
---@type integer
GUILD_MEMBER_RIGHT_OFFICER_CHAT = nil
---@type integer
GUILD_MEMBER_RIGHT_RECRUIT = nil
---@type integer
GUILD_MEMBER_RIGHT_PROMOTE_DEMOTE = nil
---@type integer
GUILD_MEMBER_RIGHT_KICK = nil
---@type integer
GUILD_MEMBER_RIGHT_WEAR_SYMBOLICS = nil
---@type integer
GUILD_MEMBER_RIGHT_MODIFY_SYMBOLICS = nil
---@type integer
GUILD_MEMBER_RIGHT_MODIFY_MESSAGE = nil
---@type integer
GUILD_MEMBER_RIGHT_MODIFY_DESCRIPTION = nil
---@type integer
GUILD_MEMBER_RIGHT_MODIFY_MEMBER_DESCRIPTION = nil
---@type integer
GUILD_MEMBER_RIGHT_PUT_MONEY = nil
---@type integer
GUILD_MEMBER_RIGHT_GET_MONEY = nil
---@type integer
GUILD_MEMBER_RIGHT_DUE = nil
---@type integer
GUILD_MEMBER_RIGHT_MWAR_COMMANDER = nil
---@type integer
GUILD_MEMBER_RIGHT_APPLY_TALENTS = nil
---@type integer
GUILD_MEMBER_RIGHT_FORGET_TALENTS = nil
---@type integer
GUILD_MEMBER_RIGHT_DISTRIBUTE_TABARDS = nil
---@type integer
GUILD_MEMBER_RIGHT_CREATE_GUILD_HALL = nil

--- Причина невыполнения действия с гильдией. Текстовый енум, провверяется на билдере. Префикс для проверки "ENUM_GUILD_RESULT".
ENUM_GUILD_RESULT_NOT_ENOUGH_RIGHTS = "ENUM_GUILD_RESULT_NOT_ENOUGH_RIGHTS"
ENUM_GUILD_RESULT_CANT_CREATE_WRONG_GROUP_SIZE = "ENUM_GUILD_RESULT_CANT_CREATE_WRONG_GROUP_SIZE"
ENUM_GUILD_RESULT_CANT_CREATE_GROUP_MEMBER_TOO_FAR = "ENUM_GUILD_RESULT_CANT_CREATE_GROUP_MEMBER_TOO_FAR"
ENUM_GUILD_RESULT_CANT_CREATE_NO_GROUP = "ENUM_GUILD_RESULT_CANT_CREATE_NO_GROUP"
ENUM_GUILD_RESULT_CANT_CREATE_NOT_GROUP_LEADER = "ENUM_GUILD_RESULT_CANT_CREATE_NOT_GROUP_LEADER"
ENUM_GUILD_RESULT_CANT_CREATE_PLAYER_ALREADY_IN_GUILD = "ENUM_GUILD_RESULT_CANT_CREATE_PLAYER_ALREADY_IN_GUILD"
ENUM_GUILD_RESULT_PLAYER_IS_NOT_IN_GUILD = "ENUM_GUILD_RESULT_PLAYER_IS_NOT_IN_GUILD"
ENUM_GUILD_RESULT_PLAYER_ALREADY_IN_GUILD = "ENUM_GUILD_RESULT_PLAYER_ALREADY_IN_GUILD"
ENUM_GUILD_RESULT_CANT_OPERATE_WITH_THIS_RANK = "ENUM_GUILD_RESULT_CANT_OPERATE_WITH_THIS_RANK"
ENUM_GUILD_RESULT_LEADER_CANT_LEAVE = "ENUM_GUILD_RESULT_LEADER_CANT_LEAVE"
ENUM_GUILD_RESULT_ALREADY_FULL = "ENUM_GUILD_RESULT_ALREADY_FULL"
ENUM_GUILD_RESULT_NO_GUILD = "ENUM_GUILD_RESULT_NO_GUILD"
ENUM_GUILD_RESULT_BANK_NOT_EMPTY = "ENUM_GUILD_RESULT_BANK_NOT_EMPTY"

--- Тип слоя с текстурой для гильдийской символики.
--- Field, гербовое поле (заливка гербового поля)
---@type integer
GUILD_SIMBOLICS_TEXTURE_TYPE_PATTERN = nil
--- Fringe, оторочка (обрамление герба по краям)
---@type integer
GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM1 = nil
--- CrestBase, основа (под фигуркой)
---@type integer
GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM2 = nil
--- CrestFill, наполнение (между основой и фигуркой)
---@type integer
GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM3 = nil
--- CrestFigure, фигурка (самый верхний элемент)
---@type integer
GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM4 = nil

---@class guildLib
guild = {}

--- Согласиться на приглашение в гильдию.
function guild.Accept() end

--- Возвращает спецификацию слотов способностей босса гильдии.
---@return table|nil
function guild.GetAbilitiesSlots() end

--- Возвращает сводную информацию о боссе гильдии
---@return table|nil
function guild.GetInfo() end

--- Возвращает информацию о задании для прогресса босса гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestInfo( questId ).
---@param questId QuestId
---@return any
function guild.GetQuestInfo(questId) end

--- Возвращает информацию о награде за выполнение задания для прогресса босса гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestReward( questId ).
---@param questId QuestId
---@return any
function guild.GetQuestReward(questId) end

--- Возвращает список заданий для прогресса босса гильдии.
---@return table|nil
function guild.GetQuests() end

--- Возвращает список выбранных способностей босса гильдии.
---@return AbilityId[]|nil
function guild.GetSelectedAbilities() end

--- Возвращает список выбранных заклинаний босса гильдии.
---@return SpellId[]|nil
function guild.GetSelectedSpells() end

--- Возвращает собственное имя босс гильдии, данное ему при создании.
---@return WString|nil
function guild.GetSelfName() end

--- Возвращает список возможных вариантов для выбора босса гильдии.
---@return table|nil
function guild.GetVariations() end

--- Проверка того что босс гильдии существует.
---@return boolean
function guild.IsExist() end

--- Осуществляет выбор заклинаний и способностей босса гильдии.
function guild.SelectAbilities() end

--- Запрос, можно ли создать гильдию в данном месте с помощью данного предмета.
---@param itemId objectId идентификатор предмета для создания гильдии
function guild.CanCreateGuildHereRequest(itemId) end

--- Можно ли выдавать знак отличия в награду члену гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@return boolean
function guild.CanDistributeTabard(memberId) end

--- Показывает, может ли игрок переименовать гильдию, в которую входит аватар игрока. При изменении этой информации приходит событие EVENT_GUILD_NEED_RENAME_CHANGED.
---@return boolean
function guild.CanRename() end

--- Изменить ранг члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@param rank integer новый ранг игрока
function guild.ChangeRank(memberId, rank) end

--- Производит коррекцию баланса члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@param changeSum integer величина изменения в меди
---@param comment WString комментарий
function guild.CorrectMemberBalance(memberId, changeSum, comment) end

--- Создает гильдию.
---@param itemId ObjectId идентификатор предмета для создания гильдии. Предмет должен находиться в сумке.
---@param guildName WString желаемое имя
function guild.Create(itemId, guildName) end

--- Создает холл гильдии.
---@param guildHallName WString желаемое имя
function guild.Create(guildHallName) end

--- Отказаться от приглашения в гильдию.
function guild.Decline() end

--- Выдать знак отличия в награду члену гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@param tabardType integer тип знака отличия
function guild.DistributeTabard(memberId, tabardType) end

--- Необходимо вызвать в ответ на запрос разрешения прогресса гильдии  EVENT_GUILD_ENABLE_PROGRESS_REQUEST.
---@param accept boolean true, если игрок согласен начать развитие гильдии
function guild.EnableProgressReply(accept) end

--- Возвращает информацию об гильдейской абилке по идентификатору её ресурса.
---@param id GuildAbilityId Id ресурса умения
---@return nil
function guild.GetAbilityInfo(id) end

--- В ответ на вызов этой функции придёт событие  EVENT_GUILD_AVATAR_HISTORY.
function guild.GetAvatarHistory() end

--- Возвращает идентификатор члена гильдии для главного игрока.
---@return ObjectId|nil
function guild.GetAvatarMemberId() end

--- Возвращает описание свойств гильдейского банка.
---@return table|nil
function guild.GetBankInfo() end

--- Общая базовая информация по боссу гильдии.
---@return table|nil
function guild.GetBossInfo() end

--- Возвращает информацию о бафах гилдии игрока.
---@return table
function guild.GetBuffs() end

--- Получить время создания гильдии.
---@return table
function guild.GetCreationTime() end

--- Возвращает описание имеющихся у гильдии главного игрока валют.
---@return table
function guild.GetCurrencies() end

--- Получить описание гильдии.
---@return WString
function guild.GetDescription() end

--- Возвращает описание знаков отличия, уже розданных гильдией.
---@return table|nil
function guild.GetDistributedTabards() end

--- Получить время активации гильдейского прогресса.
---@return table|nil
function guild.GetEnableTime() end

--- Запрашивает у сервера историю операций казны гильдии постранично. В ответ придет событие EVENT_GUILD_BANK_OPERATION_RESULT с параметром sysOperationType равным "ENUM_GuildBankOperation_GetHistory". Успешным итогом вызова данной функции является вызов события EVENT_GUILD_BANK_HISTORY_CHANGED.
---@param page integer интересующая страница(начиная с 1)
---@param orderBy integer сортировать историю по параметру
---@param rearOrder boolean задает порядок сортировки; true - обратный порядок, false - прямой
function guild.GetHistory(page, orderBy, rearOrder) end

--- Запрашивает у сервера историю операций с предметами гильдии постранично. В ответ придет событие EVENT_GUILD_BANK_OPERATION_RESULT. Успешным итогом вызова данной функции является вызов события EVENT_GUILD_BANK_HISTORY_CHANGED.
---@param page integer интересующая страница(начиная с 1)
---@param orderBy integer сортировать историю по параметру
---@param rearOrder boolean задает порядок сортировки; true - обратный порядок, false - прямой
function guild.GetItemsHistory(page, orderBy, rearOrder) end

--- Общая информация об истории операций с предметами гильдии.
---@return table|nil
function guild.GetItemsInfo() end

--- Возвращает описание истории операций с предметами гильдии.
---@return table
function guild.GetItemsOperationHistory() end

--- Возвращает идентификатор лидера гильдии главного игрока.
---@return ObjectId|nil
function guild.GetLeader() end

--- Возвращает ограничения для использования гильдейских свойств и методов.
---@return table
function guild.GetLimits() end

--- Возвращает идентификатор члена гильдии главного игрока по имени игрока.
---@param playerName WString имя игрока
---@return ObjectId|nil
function guild.GetMember(playerName) end

--- Возвращает информацию о балансе члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@return number
function guild.GetMemberBalance(memberId) end

--- Получить описание игрока из гильдии по его идентификатору.
---@param memberId ObjectId идентификатор члена гильдии
---@return WString
function guild.GetMemberDescription(memberId) end

--- Возвращает информацию об одном члене гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return table|nil
function guild.GetMemberInfo(memberId) end

--- Возвращает список членов гильдии.
---@return table
function guild.GetMembers() end

--- Получить гильдийское сообщение.
---@return WString
function guild.GetMessage() end

--- Возвращает список миссий гильдии.
---@return table|nil
function guild.GetMissions() end

--- Возвращает количество имеющихся у гильдии денег.
---@return number
function guild.GetMoney() end

--- Возвращает список маунтов гильдии.
---@return table|nil
function guild.GetMounts() end

--- Получить имя гильдии.
---@return WString
function guild.GetName() end

--- Возвращает описание истории операций в гильдейском банке.
---@return table
function guild.GetOperationHistory() end

--- Возвращает список альтвалют гильдии, которые могут добывать игроки.
---@return CurrencyId[]|nil
function guild.GetProfitableCurrencies() end

--- Возвращает описание развития гильдии главного игрока.
---@return table|nil
function guild.GetProgress() end

--- Возвращает ранг члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return number
function guild.GetRank(memberId) end

--- Возвращает информацию о ранге в гильдии.
---@param rank integer ранг игрока
---@return table
function guild.GetRankInfo(rank) end

--- Возвращает количество рангов в гильдии.
---@return number
function guild.GetRanksCount() end

--- Получить значение дополнительного бонуса (множитель) получения реальгара от изученных вех.
---@return float|nil
function guild.GetRewardFactor() end

--- Возвращает описание гильдейских наград.
---@return nil
function guild.GetRewards() end

--- Возвращает права члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return table
function guild.GetRights(memberId) end

--- Общая базовая информация по ресурсам гильдии.
---@return table|nil
function guild.GetRootInfo() end

--- Возвращает описание сезонного развития гильдии главного игрока.
---@return table|nil
function guild.GetSeasonProgress() end

--- Возвращает описание бонусов для носителей гильдейских накидок гильдии игрока.
---@param unitId ObjectId|nil идентификатор персонажа, либо nil, тогда по умолчанию вернет информацию для собственного аватара
---@return table
function guild.GetTabardBonus(unitId) end

--- Возвращает описание имеющихся у гильдии главного игрока наград (знаков отличия).
---@return table|nil
function guild.GetTabards() end

--- Возвращает гильдийскую текстуру.
---@return TextureId|nil
function guild.GetTexture() end

--- Проверка того что создание оплота гильдии доступно.
---@return table
function guild.CanCreate() end

--- Инициирует создание оплота гильдии. В случаи успеха возникнет событие EVENT_GUILD_HALL_STATE_CHANGED.
---@param hallName WString
---@param bossName WString
---@param bossIndex integer
function guild.Create(hallName, bossName, bossIndex) end

--- Возвращает описание текущего состояний оплота гильдии.
---@return table|nil
function guild.GetCurrentStateInfo() end

--- Возвращает текущее значение прогресса гильдии.
---@return number
function guild.GetExperience() end

--- Возвращает оставшееся значение дневного прогресса гильдии.
---@return number
function guild.GetExperienceDaily() end

--- Возвращает название оплота гильдии если он существует.
---@return WString
function guild.GetName() end

--- Возвращает информацию о задании для прогресса оплота гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestInfo( questId ).
---@param questId QuestId
---@return any
function guild.GetQuestInfo(questId) end

--- Возвращает информацию о награде за выполнение задания для прогресса оплота гильдии. Формат возвращаемых данных аналогичный  avatar.GetQuestReward( questId ).
---@param questId QuestId
---@return any
function guild.GetQuestReward(questId) end

--- Возвращает список заданий для прогресса оплота гильдии.
---@return table|nil
function guild.GetQuests() end

--- Возвращает список состояний оплота гильдии и их описание.
---@return table|nil
function guild.GetStatesInfo() end

--- Возвращает заклинание телепортации в оплот гильдии, если оно существует.
---@return SpellId|nil
function guild.GetTeleportSpell() end

--- Проверка того что оплот гильдии существует.
---@return boolean
function guild.IsExist() end

--- Попытка пригласить указанного персонажа в гильдию.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в гильдию
function guild.Invite(unitId) end

--- Попытка пригласить указанного персонажа в гильдию.
---@param playerName WString имя игрока
function guild.InviteByName(playerName) end

--- Находится ли аватар в какой-нибудь гильдии.
---@return boolean
function guild.IsExist() end

--- Возвращает идентификатор лидера гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@return boolean
function guild.IsLeader(memberId) end

--- Показывает, нуждается ли в переименовании гильдия, в которую входит аватар игрока. При изменении этой информации приходит событие EVENT_GUILD_NEED_RENAME_CHANGED. Необходимость переименования не связана с правом игрока переименовывать гильдию, для определения возможности переименования игроком гильдии его аватара есть функция guild.CanRename()
---@return boolean
function guild.IsNeedRename() end

--- Объявляет сбор в гильдейском банке.
---@param sum integer сумма сбора в меди
---@param comment WString комментарий при объявлении сбора
---@param ranks integer[] индексы рангов гильдии, попавших в транзакцию. Может быть пустым
---@param tabards integer[] накидки гильдии, носители которых попали в транзакцию. Может быть пустым
function guild.RaiseFunds(sum, comment, ranks, tabards) end

--- Переименовывает гильдию (можно ли это сделать в данный момент - показывает функция guild.CanRename()). После успешного вызова (и изменения имени гильдии) приходит событие EVENT_GUILD_NAME_CHANGED.
---@param name WString новое имя гильдии (локализованная строка); должно соответствовать правилам именования гильдий
function guild.Rename(name) end

--- Изменить описание гильдии.
---@param description WString описание гильдии
function guild.SetDescription(description) end

--- Изменить описание игрока в гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@param description WString описание игрока
function guild.SetMemberDescription(memberId, description) end

--- Изменить сообщение гильдии.
---@param message WString сообщение гильдии
function guild.SetMessage(message) end

--- Устанавливает размер минимальной транзакции в гильдейском банке.
---@param minimumTransaction integer размер минимальной транзакции в меди
function guild.SetMinimumTransaction(minimumTransaction) end

--- Производит операцию с деньгами в гильдейском банке.
---@param sum integer сумма операции в меди
---@param changeReason integer причина операции
---@param direction integer направление перевода денег
---@param comment WString комментарий при объявлении сбора
function guild.TransferMoney(sum, changeReason, direction, comment) end

--- Возвращает true если в предмете есть компоненты, изменяющиеся в зависимости от состояния гильдии игрока (например, гильдейские наплечники).
---@param itemId ObjectId идентификатор предмета
---@return boolean
function guild.HasGuildComponent(itemId) end

--- Получить имя гильдии игрока.
---@param unitId ObjectId
---@return table|nil
function guild.GetGuildInfo(unitId) end

-- Events

--- Присылается в ответ на запрос guild.CanCreateGuildHereRequest( inventorySlot ).
EVENT_CAN_CREATE_GUILD_HERE_RESPONSE = "EVENT_CAN_CREATE_GUILD_HERE_RESPONSE"

--- Запрос на роспуск гильдии от игрока. Приходит, например, при выполнении слеш-команды роспуска гильдии. Ожидаемая обработка - запрос игроку на подтверждение роспуска и отдача команды серверу на собственно роспуск.
EVENT_DISBAND_GUILD_REQUEST = "EVENT_DISBAND_GUILD_REQUEST"

--- Присылается в случае, если какой-либо игрок вступил в гильдию главного игрока.
EVENT_GUILD_ACCEPTED = "EVENT_GUILD_ACCEPTED"

--- Присылается в случае, если атака на чужой гильдейский аллод провалилась.
EVENT_GUILD_ALLOD_ATTACK_FAILED = "EVENT_GUILD_ALLOD_ATTACK_FAILED"

--- Присылается в случае, если атака на чужой гильдейский аллод удалась.
EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL = "EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL"

--- Присылается в случае, если изменился владелец гильдейского аллода.
EVENT_GUILD_ALLOD_OWNER_CHANGED = "EVENT_GUILD_ALLOD_OWNER_CHANGED"

--- Присылается в случае неудачной попытки приглашения в гильдию (игрок уже в гильдии).
EVENT_GUILD_ALREADY_IN_GUILD = "EVENT_GUILD_ALREADY_IN_GUILD"

--- Присылается, если главный игрок попал в гильдию (в новую, или в существующую при входе в игру).
EVENT_GUILD_APPEARED = "EVENT_GUILD_APPEARED"

--- Присылается, если изменилось влияние гильдии главного игрока.
EVENT_GUILD_AUTHORITY_CHANGED = "EVENT_GUILD_AUTHORITY_CHANGED"

--- Событие возникает при обновление данных об истории операций казны гильдии, является итогом вызова guild.GetHistory( page, orderBy, rearOrder )).
EVENT_GUILD_BANK_HISTORY_CHANGED = "EVENT_GUILD_BANK_HISTORY_CHANGED"

--- Присылается, если изменилось минимальное ограничение на транзакцию в гильдейскомм банке.
EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED = "EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED"

--- Событие возникает при изменении баланса казны гильдии.
EVENT_GUILD_BANK_MONEY_CHANGED = "EVENT_GUILD_BANK_MONEY_CHANGED"

--- Присылается, если завершилась операция в гильдейском банке.
EVENT_GUILD_BANK_OPERATION_RESULT = "EVENT_GUILD_BANK_OPERATION_RESULT"

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

--- Событие посылается каждый раз, когда у гилдии игрока меняется набор бафов.
EVENT_GUILD_BUFFS_CHANGED = "EVENT_GUILD_BUFFS_CHANGED"

--- Присылается в случае невозможности вступить в гильдию (после вызова guild.Accept()).
EVENT_GUILD_CANT_ACCEPT = "EVENT_GUILD_CANT_ACCEPT"

--- Присылается в случае, если была создана гильдия, в создании которой участвовал главный игрок.
EVENT_GUILD_CREATED = "EVENT_GUILD_CREATED"

--- Присылается, если изменилось количество гильдейских валют в гильдии главного игрока.
EVENT_GUILD_CURRENCIES_CHANGED = "EVENT_GUILD_CURRENCIES_CHANGED"

--- Присылается в случае неудачной попытки приглашения в гильдию.
EVENT_GUILD_DECLINE = "EVENT_GUILD_DECLINE"

--- Присылается в случае неудачной попытки приглашения в гильдию (игрок занят).
EVENT_GUILD_DECLINE_BUSY = "EVENT_GUILD_DECLINE_BUSY"

--- Уведомление о невозможности приглашения в гильдию по причине игнора.
EVENT_GUILD_DECLINE_IGNORED = "EVENT_GUILD_DECLINE_IGNORED"

--- Присылается, если изменилось описание гильдии главного игрока.
EVENT_GUILD_DESCRIPTION_CHANGED = "EVENT_GUILD_DESCRIPTION_CHANGED"

--- Присылается, если игрок вышел из гильдии.
EVENT_GUILD_DISAPPEARED = "EVENT_GUILD_DISAPPEARED"

--- Присылается запрос на подтверждение открытия прогресса гильдии. Необходимо ответить  guild.EnableProgressReply().
EVENT_GUILD_ENABLE_PROGRESS_REQUEST = "EVENT_GUILD_ENABLE_PROGRESS_REQUEST"

--- Присылается в случае невозможности выполнить указанную операцию с гильдией.
EVENT_GUILD_FAILED = "EVENT_GUILD_FAILED"

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

--- Присылается в случае получения приглашения в гильдию.
EVENT_GUILD_INVITE = "EVENT_GUILD_INVITE"

--- Событие возникает при обновление данных об истории операций с предметами гильдии, является итогом вызова guild.GetItemsHistory( page, orderBy, rearOrder )).
EVENT_GUILD_ITEMS_HISTORY_CHANGED = "EVENT_GUILD_ITEMS_HISTORY_CHANGED"

--- Присылается при попытке получить историю операций с предметами гильдии.
EVENT_GUILD_ITEMS_OPERATION_RESULT = "EVENT_GUILD_ITEMS_OPERATION_RESULT"

--- Присылается в случае изменения лидера гильдии главного игрока.
EVENT_GUILD_LEADER_CHANGED = "EVENT_GUILD_LEADER_CHANGED"

--- Присылается, если изменился уровень гильдии главного игрока.
EVENT_GUILD_LEVEL_CHANGED = "EVENT_GUILD_LEVEL_CHANGED"

--- Присылается в случае изменения списка членов гильдии главного игрока.
EVENT_GUILD_LIST_CHANGED = "EVENT_GUILD_LIST_CHANGED"

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

--- Присылается в случае, если какой-либо игрок вышел или его вывели из гильдии главного игрока.
EVENT_GUILD_MEMBER_KICKED = "EVENT_GUILD_MEMBER_KICKED"

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

--- Присылается когда выдаются или отнимаются права у игрока на использовании гильдейсткой символики.
EVENT_GUILD_MEMBER_SYMBOLICS = "EVENT_GUILD_MEMBER_SYMBOLICS"

--- Присылается, если изменилось право на ношение накидки у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_TABARD_CHANGED = "EVENT_GUILD_MEMBER_TABARD_CHANGED"

--- Присылается, если изменилось влияние, набранное за неделю , у члена гильдии главного игрока.
EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED = "EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED"

--- Присылается, если изменилась новость гильдии.
EVENT_GUILD_MESSAGE_CHANGED = "EVENT_GUILD_MESSAGE_CHANGED"

--- Присылается, если изменилось набранное за месяц влияние гильдии главного игрока.
EVENT_GUILD_MONTH_AUTHORITY_CHANGED = "EVENT_GUILD_MONTH_AUTHORITY_CHANGED"

--- Приходит при изменении имени гильдии, в которой состоит аватар игрока.
EVENT_GUILD_NAME_CHANGED = "EVENT_GUILD_NAME_CHANGED"

--- Присылается в случае попытки создать гильдию с недоступным именем.
EVENT_GUILD_NAME_NOT_AVAILABLE = "EVENT_GUILD_NAME_NOT_AVAILABLE"

--- Приходит при изменении флага "гильдию требуется переименовать" у гильдии, в которой состоит аватар игрока.
EVENT_GUILD_NEED_RENAME_CHANGED = "EVENT_GUILD_NEED_RENAME_CHANGED"

--- Присылается, если изменилсся пул бонусного авторитета гильдии главного игрока.
EVENT_GUILD_SEASON_AUTHORITY_BONUS_POOL_CHANGED = "EVENT_GUILD_SEASON_AUTHORITY_BONUS_POOL_CHANGED"

--- Присылается, если изменилось сезонное влияние гильдии главного игрока.
EVENT_GUILD_SEASON_AUTHORITY_CHANGED = "EVENT_GUILD_SEASON_AUTHORITY_CHANGED"

--- Присылается, если изменился сезонный уровень гильдии главного игрока.
EVENT_GUILD_SEASON_LEVEL_CHANGED = "EVENT_GUILD_SEASON_LEVEL_CHANGED"

--- Присылается, если изменилось "несгораемое" сезонное влияние гильдии главного игрока.
EVENT_GUILD_SEASON_SECURE_AUTHORITY_CHANGED = "EVENT_GUILD_SEASON_SECURE_AUTHORITY_CHANGED"

--- Присылается когда произошли изменения в уникальной символике гильдии.
EVENT_GUILD_SYMBOLICS_CHANGED = "EVENT_GUILD_SYMBOLICS_CHANGED"

--- Присылается, если изменился список знаков отличия для наград гильдии главного игрока.
EVENT_GUILD_TABARDS_CHANGED = "EVENT_GUILD_TABARDS_CHANGED"

--- Присылается в случае смены гильдийской текстуры.
EVENT_GUILD_TEXTURE_CHANGED = "EVENT_GUILD_TEXTURE_CHANGED"

--- Присылается, если изменился уровень гильдии главного игрока.
EVENT_GUILD_UNLOCKED_LEVEL_CHANGED = "EVENT_GUILD_UNLOCKED_LEVEL_CHANGED"

--- Присылается в случае изменения гильдии какого-либо игрока.
EVENT_UNIT_GUILD_CHANGED = "EVENT_UNIT_GUILD_CHANGED"
