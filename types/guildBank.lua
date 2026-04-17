---@meta

--- CategoryGuildBank
--- События и функции Lua API, относящиеся к работе с банком гильдии.

--- Тип операции в гильдейском банке.
ENUM_GuildBankOperation_RaiseFunds = "ENUM_GuildBankOperation_RaiseFunds"
ENUM_GuildBankOperation_TransferMoney = "ENUM_GuildBankOperation_TransferMoney"
ENUM_GuildBankOperation_GetHistory = "ENUM_GuildBankOperation_GetHistory"

--- Причина транзакции в гильдейском банке.
ENUM_MoneyChangeReason_Unspecified = "ENUM_MoneyChangeReason_Unspecified"
ENUM_MoneyChangeReason_DirectTransfer = "ENUM_MoneyChangeReason_DirectTransfer"
ENUM_MoneyChangeReason_TaxPayment = "ENUM_MoneyChangeReason_TaxPayment"
ENUM_MoneyChangeReason_Antifraud = "ENUM_MoneyChangeReason_Antifraud"
ENUM_MoneyChangeReason_LevelUpPayment = "ENUM_MoneyChangeReason_LevelUpPayment"
ENUM_MoneyChangeReason_MWarPayment = "ENUM_MoneyChangeReason_MWarPayment"
ENUM_MoneyChangeReason_Taxes = "ENUM_MoneyChangeReason_Taxes"
ENUM_MoneyChangeReason_Correction = "ENUM_MoneyChangeReason_Correction"
ENUM_MoneyChangeReason_Unspecified = "ENUM_MoneyChangeReason_Unspecified"
ENUM_MoneyChangeReason_DirectTransfer = "ENUM_MoneyChangeReason_DirectTransfer"
ENUM_MoneyChangeReason_TaxPayment = "ENUM_MoneyChangeReason_TaxPayment"
ENUM_MoneyChangeReason_Antifraud = "ENUM_MoneyChangeReason_Antifraud"
ENUM_MoneyChangeReason_LevelUpPayment = "ENUM_MoneyChangeReason_LevelUpPayment"
ENUM_MoneyChangeReason_MWarPayment = "ENUM_MoneyChangeReason_MWarPayment"
ENUM_MoneyChangeReason_Taxes = "ENUM_MoneyChangeReason_Taxes"
ENUM_MoneyChangeReason_Correction = "ENUM_MoneyChangeReason_Correction"

--- Направление транзакции в гильдейском банке.
ENUM_TransferMoneyOperationDirection_Avatar2GuildBank = "ENUM_TransferMoneyOperationDirection_Avatar2GuildBank"
ENUM_TransferMoneyOperationDirection_GuildBank2Avatar = "ENUM_TransferMoneyOperationDirection_GuildBank2Avatar"
ENUM_TransferMoneyOperationDirection_Avatar2GuildBank = "ENUM_TransferMoneyOperationDirection_Avatar2GuildBank"
ENUM_TransferMoneyOperationDirection_GuildBank2Avatar = "ENUM_TransferMoneyOperationDirection_GuildBank2Avatar"

---@class guildBankLib
guildBank = {}

--- Производит коррекцию баланса члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@param changeSum integer величина изменения в меди
---@param comment WString комментарий
function guildBank.CorrectMemberBalance(memberId, changeSum, comment) end

--- В ответ на вызов этой функции придёт событие  EVENT_GUILD_AVATAR_HISTORY.
function guildBank.GetAvatarHistory() end

--- Возвращает описание свойств гильдейского банка.
---@return table|nil
function guildBank.GetBankInfo() end

--- Запрашивает у сервера историю операций казны гильдии постранично. В ответ придет событие EVENT_GUILD_BANK_OPERATION_RESULT с параметром sysOperationType равным "ENUM_GuildBankOperation_GetHistory". Успешным итогом вызова данной функции является вызов события EVENT_GUILD_BANK_HISTORY_CHANGED.
---@param page integer интересующая страница(начиная с 1)
---@param orderBy integer сортировать историю по параметру
---@param rearOrder boolean задает порядок сортировки; true - обратный порядок, false - прямой
function guildBank.GetHistory(page, orderBy, rearOrder) end

--- Запрашивает у сервера историю операций с предметами гильдии постранично. В ответ придет событие EVENT_GUILD_BANK_OPERATION_RESULT. Успешным итогом вызова данной функции является вызов события EVENT_GUILD_BANK_HISTORY_CHANGED.
---@param page integer интересующая страница(начиная с 1)
---@param orderBy integer сортировать историю по параметру
---@param rearOrder boolean задает порядок сортировки; true - обратный порядок, false - прямой
function guildBank.GetItemsHistory(page, orderBy, rearOrder) end

--- Общая информация об истории операций с предметами гильдии.
---@return table|nil
function guildBank.GetItemsInfo() end

--- Возвращает описание истории операций с предметами гильдии.
---@return table
function guildBank.GetItemsOperationHistory() end

--- Возвращает информацию о балансе члена гильдии в гильдейском банке.
---@param memberId ObjectId идентификатор члена гильдии
---@return number
function guildBank.GetMemberBalance(memberId) end

--- Возвращает количество имеющихся у гильдии денег.
---@return number
function guildBank.GetMoney() end

--- Возвращает описание истории операций в гильдейском банке.
---@return table
function guildBank.GetOperationHistory() end

--- Объявляет сбор в гильдейском банке.
---@param sum integer сумма сбора в меди
---@param comment WString комментарий при объявлении сбора
---@param ranks integer[] индексы рангов гильдии, попавших в транзакцию. Может быть пустым
---@param tabards integer[] накидки гильдии, носители которых попали в транзакцию. Может быть пустым
function guildBank.RaiseFunds(sum, comment, ranks, tabards) end

--- Устанавливает размер минимальной транзакции в гильдейском банке.
---@param minimumTransaction integer размер минимальной транзакции в меди
function guildBank.SetMinimumTransaction(minimumTransaction) end

--- Производит операцию с деньгами в гильдейском банке.
---@param sum integer сумма операции в меди
---@param changeReason integer причина операции
---@param direction integer направление перевода денег
---@param comment WString комментарий при объявлении сбора
function guildBank.TransferMoney(sum, changeReason, direction, comment) end

-- Events

--- Серверное событие с гильдейской банковской историей аватара. Приходит после вызова функции  guild.GetAvatarHistory().
EVENT_GUILD_AVATAR_HISTORY = "EVENT_GUILD_AVATAR_HISTORY"

--- Событие возникает при обновление данных об истории операций казны гильдии, является итогом вызова guild.GetHistory( page, orderBy, rearOrder )).
EVENT_GUILD_BANK_HISTORY_CHANGED = "EVENT_GUILD_BANK_HISTORY_CHANGED"

--- Присылается, если изменилось минимальное ограничение на транзакцию в гильдейскомм банке.
EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED = "EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED"

--- Событие возникает при изменении баланса казны гильдии.
EVENT_GUILD_BANK_MONEY_CHANGED = "EVENT_GUILD_BANK_MONEY_CHANGED"

--- Присылается, если завершилась операция в гильдейском банке.
EVENT_GUILD_BANK_OPERATION_RESULT = "EVENT_GUILD_BANK_OPERATION_RESULT"

--- Событие возникает при обновление данных об истории операций с предметами гильдии, является итогом вызова guild.GetItemsHistory( page, orderBy, rearOrder )).
EVENT_GUILD_ITEMS_HISTORY_CHANGED = "EVENT_GUILD_ITEMS_HISTORY_CHANGED"

--- Присылается при попытке получить историю операций с предметами гильдии.
EVENT_GUILD_ITEMS_OPERATION_RESULT = "EVENT_GUILD_ITEMS_OPERATION_RESULT"

--- Присылается, если у члена гильдии изменился баланс в гильдейском банке.
EVENT_GUILD_MEMBER_BALANCE_CHANGED = "EVENT_GUILD_MEMBER_BALANCE_CHANGED"
