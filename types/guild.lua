---@meta

---@class guildLib
guild = {}

---@class GuildCanDropTalentResult
---@field field integer номер поля
---@field row integer номер строки
---@field column integer номер столбца

---@class GuildCanLearnTalentResult
---@field result boolean true если изучение таланта доступно
---@field requirements table|nil требования для изучения таланта, таблица с полями:
---@field nearFieldClosed boolean true если рядом нет открытых талантов
---@field talentsPoint integer доступное количество очков талантов
---@field talentsPointRequired integer требуемое количество очков талантов
---@field experience integer доступное количество опыта
---@field experienceRequired integer требуемое количество опыта
---@field requiredCurrency CurrencyId|nil требуемая альтвалюта

---@class GuildGetAbilityInfoResult
---@field id GuildAbilityId Id умения
---@field spells SpellId|nil[] список идентификаторов заклинания, которые выдает абилка, nil если не задано ни единого заклинания
---@field name WString
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field shortDescription ValuedText|nil краткое описание с подставленными текущими значениями параметров
---@field rank integer ранг умения (начиная с 1)
---@field sysInfo string системная информация для дебага (путь к файлу)
---@field texture TextureId идентификатор текстуры для иконки абилки

---@class GuildGetBankInfoResult
---@field realMinimumTransaction integer минимальное реальное ограничение в данный момент по величине транзакции в меди
---@field minimumTransaction integer ограничение на минимальное реальное ограничение по величине транзакции в меди
---@field maximumTransaction integer максимальное ограничение по величине транзакции в меди
---@field maximumGuildMoney integer максимальное количество меди в банке
---@field operationHistorySize integer глубина истории операций
---@field moneyHistorySize integer глубина истории оплат
---@field memberHistorySize integer глубина истории по отдельному члену
---@field guildHistoryPageSize integer максимальное количество записей на одной странице истории операций в банке
---@field guildHistorySize integer текущее общее количество записей истории операций в банке

---@class GuildGetBossInfoResult
---@field hasBoss boolean true если босс есть
---@field experience integer опыт босса
---@field gearScore integer сила босс
---@field name string|nil имя босса
---@field maxAvailableAbilities integer|nil максимальное количество доступных способностей
---@field currentState integer|nil номер текущей стадии
---@field states table|nil стадии прогресса босса, таблица индексированная с 1, каждая ячейка которой таблица с полями:
---@field experienceRequired integer количество опыта до достижения стадии
---@field maxAvailableAbilities integer максимальное количество доступных способностей на данной стадии

---@class GuildGetCommonTalentsInfoResult
---@field fieldsCount integer количество полей
---@field rowsCount integer количество строк
---@field columnsCount integer количество столбцов
---@field learnTalentCurrency CurrencyId|nil валюта для изучения талантов
---@field dropTalentCurrency CurrencyId|nil валюта для сброса талантов

---@class GuildGetDistributedTabardsResult
---@field key number по этому индексу лежит количество розданных наград данного типа
---@field value integer|nil количество розданных наград данного типа. Если наград нет, то nil

---@class GuildGetEnableTimeResult
---@field y integer год
---@field m integer месяц
---@field d integer день

---@class GuildGetFieldInfoResult
---@field name string локализованное название поля
---@field image UISingleTexture|nil иконка
---@field description string|nil локализованное описание поля
---@field startRow integer стартовый ряд
---@field startColumn integer стартовая колонка

---@class GuildGetItemsInfoResult
---@field operationHistorySize integer глубина истории операций
---@field guildHistoryPageSize integer максимальное количество записей на одной странице истории операций
---@field guildHistorySize integer текущее общее количество записей истории операций

---@class GuildGetItemsOperationHistoryResult
---@field time LuaFullDateTime время транзакции
---@field actorMemberId ObjectId|nil если информация доступна, то идентификатор члена гильдии, производившего операцию
---@field actorMemberName string имя покупателя
---@field itemId ObjectId|nil идентификатор предмета
---@field vendorName string|nil имя продавца

---@class GuildGetLimitsResult
---@field guildMembersLimit integer максимальное количество членов гильдии
---@field guildMessageLimit integer максимальное количество знаков в новости гильдии
---@field guildMemberDescrptionLimit integer максимальное количество знаков в описании гильдии
---@field guildDescriptionLimit integer максимальное количество знаков в описании члена гильдии
---@field maxGuildLoyalty integer максимальное значение верности
---@field minGuildLoyalty integer минимальное значение верности
---@field maxGuildLevel integer максимально возможный уровень гильдии
---@field tabardDistributionDelayMs integer сколько миллисекунд длится таймаут (от вступления в гильдию) на разрешение для ношения знака отличия
---@field tabardDistributionDelay table этот же таймаут, представленный таблицей с полями:

---@class GuildGetMemberInfoResult
---@field id ObjectId идентификатор этого члена гильдии
---@field playerId ObjectId идентификатор персонажа или nil, если его нет в игре (порвалась связь и т.п.)
---@field name string имя персонажа
---@field level integer уровень игрока
---@field onlineStatus "ENUM_AvatarOnlineStatus_..." (string) онлайн-статус аватара, см. значения энама "ENUM_AvatarOnlineStatus_..."; при изменении приходит событие EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED
---@field authority integer влияние этого члена гильдии
---@field monthAuthority integer влияние этого члена гильдии, полученное за месяц
---@field weekAuthority integer влияние этого члена гильдии, полученное за неделю
---@field dayAuthority integer влияние этого члена гильдии, полученное за день
---@field fame integer известность этого члена гильдии
---@field monthFame integer известность этого члена гильдии, полученная за месяц
---@field weekFame integer известность этого члена гильдии, полученная за неделю
---@field dayFame integer известность этого члена гильдии, полученная за день
---@field loyalty integer верность этого члена гильдии (1..100)
---@field description string описание игрока
---@field zoneName string локализованное название зоны в которой находится игрок
---@field subZoneName string локализованное название подзоны (пустая строка, если аватар не в подзоне)
---@field class string локализованное название класса игрока
---@field sysClassName string внутриигровое название класса игрока
---@field tabardType number тип отличия
---@field sysTabardType string строковое имя типа отличия
---@field joinTime table дата вступления в гильдию представлена полями y,m,d  - год, месяц, день
---@field lastOnlineTime table время последнего входа в игру представлена полями y,m,d,h,min,s  - год, месяц, день, час, минута, секунда (в формате LuaFullDateTime)
---@field profit table или nil nil если нет информации; иначе данные о заработанных для гильдии ресурсах в виде списка (индексированного начиная от 0) таблиц с полями:
---@field key CurrencyId идентификатор валюты
---@field value table таблица с полями:
---@field profitLongPeriod integer количество валюты за текущий месяц
---@field profitMediumPeriod integer количество валюты за текущую неделю (начиная с четверга)
---@field profitShortPeriod integer количество валюты за текущий день
---@field totalProfit integer количество валюты за всё время

---@class GuildGetMissionsResult
---@field currency CurrencyId альтвалюта, от которой зависит прогресс миссии
---@field softCap integer предельное количество альтвалюты необходимое, необходимое для завершения миссии
---@field name string название миссии
---@field description string описание миссии
---@field image TextureId иллюстрация миссии
---@field reward аналогично avatar.GetQuestReward( questId ) награда за завершение миссии

---@class GuildGetMountsResult
---@field id ObjectId идентификатор предмета выдающего маунта
---@field ranks integer[] список индексов рангов гильдии, таблица индексированная с 1

---@class GuildGetOperationHistoryResult
---@field balanceChange integer величина транзакции в меди
---@field comment string комментарий при проведении операции
---@field operationType number тип изменения баланса
---@field sysOperationType string тип изменения баланса
---@field time LuaFullDateTime время транзакции
---@field actorMemberId ObjectId|nil если информация доступна, то идентификатор члена гильдии, производившего операцию
---@field actorMemberName string|nil если информация доступна, то имя члена гильдии
---@field members table[] индексированная с 0 таблица с таблицами описаний членов гильдии, попавших в операцию, с полями:
---@field id ObjectId|nil если информация доступна, то идентификатор члена гильдии
---@field name string|nil если информация доступна, то имя члена гильдии
---@field ranks integer[] индексы рангов гильдии, попавших в транзакцию. Может быть пустым
---@field tabards number[] накидки гильдии, носители которых попали в транзакцию. Может быть пустым

---@class GuildGetProgressResult
---@field authority integer влияние гильдии
---@field monthAuthority integer влияние гильдии, набранное за последний месяц
---@field maxAuthority integer максимально возможное влияние гильдии на текущем уровне
---@field minAuthority integer минимально возможное влияние гильдии на текущем уровне
---@field unlockedLevel integer доступный уровень для гильдии
---@field level integer уровень гильдии
---@field nextLevelPrice integer цена следующего уровня гильдии в деньгах

---@class GuildGetRankInfoResult
---@field rank integer числовое значение ранга
---@field sysName string служебное название ранга
---@field name string локализованное название ранга
---@field description string локализованное описание ранга

---@class GuildGetRewardsResult
---@field level integer уровень гильдии для которой доступна награда
---@field amount integer количество наград
---@field name string название награды
---@field description string описание награды
---@field image TextureId идентификатор текстуры для иконки награды

---@class GuildGetRootInfoResult
---@field championTabard ItemId идентификатор чемпионской накидки
---@field tabard ItemId идентификатор обычной накидки
---@field banners table|nil знамёна, каждый элемент таблица с полями:
---@field previewItem ItemId|nil идентификатор знамени

---@class GuildGetSeasonProgressResult
---@field bonusPool integer бонусный пул авторитета
---@field authority integer влияние гильдии накопленное в данном сезоне
---@field secureAuthority integer "несгораемое" влияние
---@field maxAuthority integer максимально возможное влияние гильдии на текущем уровне
---@field minAuthority integer минимально возможное влияние гильдии на текущем уровне
---@field unlockedLevel integer максимальный доступный сезонный уровень для гильдии
---@field level integer сезонный уровень гильдии

---@class GuildGetTabardBonusResult
---@field alchemyDurationPercent integer дополнительной процент увеличения длительности алхимических зелий
---@field characteristicBonus number значение прибавки к Могуществу и Выносливости
---@field characteristicPercent number процент увеличения Могущества и Выносливости (значение умноженное на 100)
---@field reputationBonus number значение модификатора репутации
---@field reputationPercent number процент увеличения репутации (значение умноженное на 100)

---@class GuildGetTabardsResult
---@field key number по этому индексу лежит количество наград данного типа
---@field value integer|nil количество наград данного типа. Если наград нет, то nil

---@class GuildGetTalentInfoResult
---@field field integer номер поля таланта
---@field row integer номер строки таланта
---@field column integer номер столбца таланта
---@field canUpdate boolean возможно ли изучить/проапдейтить данный талант
---@field isStart boolean стартовый талант
---@field isStored boolean поставлен на изучение
---@field isLocked boolean нельзя изучать
---@field isEmpty boolean является ли клетка пустой
---@field isLearned boolean выучена ли клетка таланта
---@field groupName string|nil группа талантов
---@field groupQuality integer качество
---@field abilityId GuildAbilityId|nil абилка

---@class GuildGetTalentsByGroupResult
---@field field integer поле
---@field row integer строка
---@field column integer столбец

---Согласиться на приглашение в гильдию.
---@return нет
function guild.Accept() end

---Выучить помеченные таланты и вехи.
---@return нет
function guild.ApplyStoredTalents() end

---Запрос, можно ли создать гильдию в данном месте с помощью данного предмета.
---@param itemId objectId идентификатор предмета для создания гильдии
---@return нет
function guild.CanCreateGuildHereRequest(itemId) end

---Можно ли выдавать знак отличия в награду члену гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@return boolean
function guild.CanDistributeTabard(memberId) end

---Можно ли сбросить веху из поля талантов гильдии за альтвалюту.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return GuildCanDropTalentResult
function guild.CanDropTalent(field, row, column) end

---Возвращает возможность и условия изучения таланта гильдии.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@param talentType number|nil тип таланата, по-умолчанию ENUM_TalentType_GUILD
---@return GuildCanLearnTalentResult
function guild.CanLearnTalent(field, row, column, talentType) end

---Показывает, может ли игрок переименовать гильдию, в которую входит аватар игрока. При изменении этой информации приходит событие EVENT_GUILD_NEED_RENAME_CHANGED.
---@return boolean
function guild.CanRename() end

---Изменить ранг члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@param rank integer новый ранг игрока
---@return нет
function guild.ChangeRank(memberId, rank) end

---Сбрасывание выбранных на изучение вех.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return нет
function guild.ClearStoredTalents(field, row, column) end

---Производит коррекцию баланса члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@param changeSum integer величина изменения в меди
---@param comment string комментарий
---@return нет
function guild.CorrectMemberBalance(memberId, changeSum, comment) end

---Создает гильдию.
---@param itemId ObjectId идентификатор предмета для создания гильдии. Предмет должен находиться в сумке.
---@param guildName string желаемое имя
---@return нет
function guild.Create(itemId, guildName) end

---Создает холл гильдии.
---@param guildHallName string желаемое имя
---@return нет
function guild.CreateGuildHall(guildHallName) end

---Отказаться от приглашения в гильдию.
---@return нет
function guild.Decline() end

---Выдать знак отличия в награду члену гильдии главного игрока. См. типы знаков отличия в  ENUM_TabardType_....
---@param memberId ObjectId идентификатор члена гильдии
---@param tabardType number тип знака отличия
---@return нет
function guild.DistributeTabard(memberId, tabardType) end

---Cбросить веху из поля талантов гильдии за альтвалюту.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return нет
function guild.DropTalent(field, row, column) end

---Необходимо вызвать в ответ на запрос разрешения прогресса гильдии  EVENT_GUILD_ENABLE_PROGRESS_REQUEST.
---@param accept boolean true, если игрок согласен начать развитие гильдии
---@return нет
function guild.EnableProgressReply(accept) end

---Возвращает информацию об гильдейской абилке по идентификатору её ресурса.
---@param id GuildAbilityId Id ресурса умения
---@return GuildGetAbilityInfoResult
function guild.GetAbilityInfo(id) end

---В ответ на вызов этой функции придёт событие  EVENT_GUILD_AVATAR_HISTORY.
---@return нет
function guild.GetAvatarHistory() end

---Возвращает идентификатор члена гильдии для главного игрока. Информацию об отдельном члене гильдии см. в  guild.GetMemberInfo( memberId ).
---@return ObjectId|nil
function guild.GetAvatarMemberId() end

---Возвращает описание свойств гильдейского банка.
---@return GuildGetBankInfoResult
function guild.GetBankInfo() end

---Общая базовая информация по боссу гильдии.
---@return GuildGetBossInfoResult
function guild.GetBossInfo() end

---Возвращает информацию о бафах гилдии игрока.
---@return ObjectId[]
function guild.GetBuffs() end

---Получить размер поля талантов.
---@return GuildGetCommonTalentsInfoResult
function guild.GetCommonTalentsInfo() end

---Получить время создания гильдии. См. LuaFullDateTime.
---@return table|nil
function guild.GetCreationTime() end

---Возвращает описание имеющихся у гильдии главного игрока валют.
---@return CurrencyId[]
function guild.GetCurrencies() end

---Получить описание гильдии.
---@return string
function guild.GetDescription() end

---Возвращает описание знаков отличия, уже розданных гильдией. См. типы знаков отличия в  ENUM_TabardType_....
---@return GuildGetDistributedTabardsResult
function guild.GetDistributedTabards() end

---Цена забывания таланта.
---@return integer
function guild.GetDropTalentCost() end

---Получить время активации гильдейского прогресса.
---@return GuildGetEnableTimeResult
function guild.GetEnableTime() end

---Получить информацию о поле талантов гильдии.
---@param field integer номер поля
---@return GuildGetFieldInfoResult
function guild.GetFieldInfo(field) end

---Запрашивает у сервера историю операций казны гильдии постранично. В ответ придет событие EVENT_GUILD_BANK_OPERATION_RESULT с параметром sysOperationType равным "ENUM_GuildBankOperation_GetHistory". Успешным итогом вызова данной функции является вызов события EVENT_GUILD_BANK_HISTORY_CHANGED.
---@param page integer интересующая страница(начиная с 1)
---@param orderBy number сортировать историю по параметру
---@param rearOrder boolean задает порядок сортировки; true - обратный порядок, false - прямой
---@return нет
function guild.GetHistory(page, orderBy, rearOrder) end

---Запрашивает у сервера историю операций с предметами гильдии постранично. В ответ придет событие EVENT_GUILD_BANK_OPERATION_RESULT. Успешным итогом вызова данной функции является вызов события EVENT_GUILD_BANK_HISTORY_CHANGED.
---@param page integer интересующая страница(начиная с 1)
---@param orderBy number сортировать историю по параметру
---@param rearOrder boolean задает порядок сортировки; true - обратный порядок, false - прямой
---@return нет
function guild.GetItemsHistory(page, orderBy, rearOrder) end

---Общая информация об истории операций с предметами гильдии.
---@return GuildGetItemsInfoResult
function guild.GetItemsInfo() end

---Возвращает описание истории операций с предметами гильдии.
---@return GuildGetItemsOperationHistoryResult
function guild.GetItemsOperationHistory() end

---Возвращает идентификатор лидера гильдии главного игрока. Информацию об отдельном члене гильдии см. в  guild.GetMemberInfo( memberId ).
---@return ObjectId|nil
function guild.GetLeader() end

---Возвращает ограничения для использования гильдейских свойств и методов.
---@return GuildGetLimitsResult
function guild.GetLimits() end

---Возвращает идентификатор члена гильдии главного игрока по имени игрока. Информацию об отдельном члене гильдии см. в  guild.GetMemberInfo( memberId ).
---@param playerName string имя игрока
---@return ObjectId|nil
function guild.GetMember(playerName) end

---Возвращает информацию о балансе члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@return integer
function guild.GetMemberBalance(memberId) end

---Получить описание игрока из гильдии по его идентификатору.
---@param memberId ObjectId идентификатор члена гильдии
---@return string
function guild.GetMemberDescription(memberId) end

---Возвращает информацию об одном члене гильдии. Каждый член гильдии имеет уникальный идентификатор. Этот идентификатор не совпадает с идентификатором игрока в игре. Типы отличия см. в ENUM_TabardType_....
---@param memberId ObjectId идентификатор члена гильдии
---@return GuildGetMemberInfoResult
function guild.GetMemberInfo(memberId) end

---Возвращает список членов гильдии. Информацию об отдельном члене гильдии см. в  guild.GetMemberInfo( memberId ).
---@return ObjectId[]
function guild.GetMembers() end

---Получить гильдийское сообщение.
---@return string
function guild.GetMessage() end

---Возвращает список миссий гильдии.
---@return GuildGetMissionsResult
function guild.GetMissions() end

---Возвращает количество имеющихся у гильдии денег.
---@return integer
function guild.GetMoney() end

---Возвращает список маунтов гильдии.
---@return GuildGetMountsResult
function guild.GetMounts() end

---Получить имя гильдии.
---@return string
function guild.GetName() end

---Возвращает описание истории операций в гильдейском банке. См.  ENUM_MoneyChangeReason.
---@return GuildGetOperationHistoryResult
function guild.GetOperationHistory() end

---Возвращает список альтвалют гильдии, которые могут добывать игроки.
---@return CurrencyId|nil[]
function guild.GetProfitableCurrencies() end

---Возвращает описание развития гильдии главного игрока.
---@return GuildGetProgressResult
function guild.GetProgress() end

---Возвращает ранг члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return integer
function guild.GetRank(memberId) end

---Возвращает информацию о ранге в гильдии.
---@param rank integer ранг игрока
---@return GuildGetRankInfoResult
function guild.GetRankInfo(rank) end

---Возвращает количество рангов в гильдии.
---@return integer
function guild.GetRanksCount() end

---Получить значение дополнительного бонуса (множитель) получения реальгара от изученных вех.
---@return rewardFactor: number (float)|nil
function guild.GetRewardFactor() end

---Возвращает описание гильдейских наград.
---@return GuildGetRewardsResult
function guild.GetRewards() end

---Возвращает права члена гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@return table
function guild.GetRights(memberId) end

---Общая базовая информация по ресурсам гильдии.
---@return GuildGetRootInfoResult
function guild.GetRootInfo() end

---Возвращает описание сезонного развития гильдии главного игрока.
---@return GuildGetSeasonProgressResult
function guild.GetSeasonProgress() end

---Возвращает количество выбранных на изучение вех.
---@return integer
function guild.GetStoredTalentsCount() end

---Возвращает описание бонусов для носителей гильдейских накидок гильдии игрока.
---@param unitId ObjectId|nil идентификатор персонажа, либо nil, тогда по умолчанию вернет информацию для собственного аватара
---@return GuildGetTabardBonusResult
function guild.GetTabardBonus(unitId) end

---Возвращает описание имеющихся у гильдии главного игрока наград (знаков отличия). См. типы знаков отличия в  ENUM_TabardType_....
---@return GuildGetTabardsResult
function guild.GetTabards() end

---Получить информацию о таланте гильдии из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return GuildGetTalentInfoResult
function guild.GetTalentInfo(field, row, column) end

---Возвращает координаты всех абилок заданной группы/
---@param groupName string имя группы
---@return GuildGetTalentsByGroupResult
function guild.GetTalentsByGroup(groupName) end

---Возвращает гильдийскую текстуру.
---@return TextureId|nil
function guild.GetTexture() end

---Попытка пригласить указанного персонажа в гильдию. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши. То есть на нажатие кнопки.
---@param unitId ObjectId идентификатор персонажа, приглашаемого в гильдию
---@return нет
function guild.Invite(unitId) end

---Попытка пригласить указанного персонажа в гильдию. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши. То есть на нажатие кнопки.
---@param playerName string имя игрока
---@return нет
function guild.InviteByName(playerName) end

---Находится ли аватар в какой-нибудь гильдии.
---@return boolean
function guild.IsExist() end

---Возвращает идентификатор лидера гильдии главного игрока.
---@param memberId ObjectId идентификатор члена гильдии
---@return boolean
function guild.IsLeader(memberId) end

---Показывает, нуждается ли в переименовании гильдия, в которую входит аватар игрока. При изменении этой информации приходит событие EVENT_GUILD_NEED_RENAME_CHANGED. Необходимость переименования не связана с правом игрока переименовывать гильдию, для определения возможности переименования игроком гильдии его аватара есть функция guild.CanRename()
---@return boolean
function guild.IsNeedRename() end

---Установлен ли талант на изучение
---@param field integer поле
---@param row integer ряд
---@param column integer колонка
---@return boolean
function guild.IsStoredTalent(field, row, column) end

---Объявляет сбор в гильдейском банке.
---@param sum integer сумма сбора в меди
---@param comment string комментарий при объявлении сбора
---@param ranks integer[] индексы рангов гильдии, попавших в транзакцию. Может быть пустым
---@param tabards number[] накидки гильдии, носители которых попали в транзакцию. Может быть пустым
---@return нет
function guild.RaiseFunds(sum, comment, ranks, tabards) end

---Переименовывает гильдию (можно ли это сделать в данный момент - показывает функция guild.CanRename()). После успешного вызова (и изменения имени гильдии) приходит событие EVENT_GUILD_NAME_CHANGED.
---@param name string новое имя гильдии (локализованная строка); должно соответствовать правилам именования гильдий
---@return нет
function guild.Rename(name) end

---Изменить описание гильдии. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод может не работать на турнирах.
---@param description string описание гильдии
---@return нет
function guild.SetDescription(description) end

---Изменить описание игрока в гильдии.
---@param memberId ObjectId идентификатор члена гильдии
---@param description string описание игрока
---@return нет
function guild.SetMemberDescription(memberId, description) end

---Изменить сообщение гильдии. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод может не работать на турнирах.
---@param message string сообщение гильдии
---@return нет
function guild.SetMessage(message) end

---Устанавливает размер минимальной транзакции в гильдейском банке.
---@param minimumTransaction integer размер минимальной транзакции в меди
---@return нет
function guild.SetMinimumTransaction(minimumTransaction) end

---Пометить для изучения веху из поля талантов гильдии.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return нет
function guild.StoreTalent(field, row, column) end

---Производит операцию с деньгами в гильдейском банке.
---@param sum integer сумма операции в меди
---@param changeReason number причина операции
---@param direction number направление перевода денег
---@param comment string комментарий при объявлении сбора
---@return нет
function guild.TransferMoney(sum, changeReason, direction, comment) end

---Попытка исключить игрока из рейда.
---@param uniqueId UniqueId уникальный постоянный идентификатор игрока - участника отряда
---@return нет
function guild.Kick(uniqueId) end
