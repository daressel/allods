---@meta

--- CategoryEnchant
--- События и функции Lua API, относящиеся к энчантам.

--- Причина, по которой нельзя вставить энчант в предмет.
--- причин, по которым нельзя вставить энчант в предмет, не обнаружено
ENUM_EnchantInsertionResult_SUCCESS = "ENUM_EnchantInsertionResult_SUCCESS"
--- энчант нельзя вставить в предмет, но причина неклассифицируема (например некорректные данные)
ENUM_EnchantInsertionResult_UNKNOWN = "ENUM_EnchantInsertionResult_UNKNOWN"
--- предмет, в который собираются вставить энчант, не привязан к аватару
ENUM_EnchantInsertionResult_ITEM_UNBOUND = "ENUM_EnchantInsertionResult_ITEM_UNBOUND"
--- у данного предмета нет статов, которые мог бы улучшить данный энчант
ENUM_EnchantInsertionResult_UNFITTED_ITEM_STATS = "ENUM_EnchantInsertionResult_UNFITTED_ITEM_STATS"
--- слот эквипмента, в который вставлен предмет, не позволяет вставлять предметы с качеством, соответствующим качеству данного энчанта
ENUM_EnchantInsertionResult_UNFITTED_DRESS_SLOT_UNLOCKS = "ENUM_EnchantInsertionResult_UNFITTED_DRESS_SLOT_UNLOCKS"

--- Тип слота, в который вставляется энчант.
ENUM_EnchantSlot_Offence = "ENUM_EnchantSlot_Offence"
ENUM_EnchantSlot_Defence = "ENUM_EnchantSlot_Defence"
ENUM_EnchantSlot_Special = "ENUM_EnchantSlot_Special"
ENUM_EnchantSlot_Offence = "ENUM_EnchantSlot_Offence"
ENUM_EnchantSlot_Defence = "ENUM_EnchantSlot_Defence"
ENUM_EnchantSlot_Special = "ENUM_EnchantSlot_Special"

--- Константы второстепенных харктеристик.
ENUM_InnateStats_Plain = "ENUM_InnateStats_Plain"
ENUM_InnateStats_Rage = "ENUM_InnateStats_Rage"
ENUM_InnateStats_Finisher = "ENUM_InnateStats_Finisher"
ENUM_InnateStats_Lethality = "ENUM_InnateStats_Lethality"
ENUM_InnateStats_Vitality = "ENUM_InnateStats_Vitality"
ENUM_InnateStats_Endurance = "ENUM_InnateStats_Endurance"
ENUM_InnateStats_Lifesteal = "ENUM_InnateStats_Lifesteal"
ENUM_InnateStats_Will = "ENUM_InnateStats_Will"
ENUM_InnateStats_CritChance = "ENUM_InnateStats_CritChance"
ENUM_InnateStats_Plain = "ENUM_InnateStats_Plain"
ENUM_InnateStats_Rage = "ENUM_InnateStats_Rage"
ENUM_InnateStats_Finisher = "ENUM_InnateStats_Finisher"
ENUM_InnateStats_Lethality = "ENUM_InnateStats_Lethality"
ENUM_InnateStats_Vitality = "ENUM_InnateStats_Vitality"
ENUM_InnateStats_Endurance = "ENUM_InnateStats_Endurance"
ENUM_InnateStats_Lifesteal = "ENUM_InnateStats_Lifesteal"
ENUM_InnateStats_Will = "ENUM_InnateStats_Will"
ENUM_InnateStats_CritChance = "ENUM_InnateStats_CritChance"

---@class enchantLib
enchant = {}

--- Показывает, можно ли вставить данный энчант в предмет.
---@param enchantItemId ObjectId идентификатор энчанта
---@param itemId ObjectId идентификатор проверяемого предмета
---@return table
function enchant.CanInsertEnchant(enchantItemId, itemId) end

--- Показывает, можно ли вообще вставлять хоть какие-нибудь энчанты в предмет.
---@param itemId ObjectId идентификатор проверяемого предмета
---@return boolean
function enchant.CanInsertEnchants(itemId) end

--- Извлечь самоцвет из заданного слота предмета. Если перед этим для этого же предмета вызывалась эта же функция или функция enchant.EnchantInsert( enchantItemId, itemId ), то извлечение не будет работать до завершения предыдущей операции: вызов функции игнорируется до прихода события  EVENT_GAME_ITEM_CHANGED с соответствующим itemId (если предыдущая операция удалась) или  EVENT_ITEM_SERVER_CMD_FINISHED с соответствующим itemId и isSuccess==false (если предыдущая операция не удалась).
---@param itemId ObjectId идентификатор предмета
---@param slot integer слот
function enchant.EnchantExtract(itemId, slot) end

--- Вставить самоцвет в предмет. Если перед этим для этого же предмета вызывалась эта же функция или функция enchant.EnchantExtract( itemId, slot ), то вставка не будет работать до завершения предыдущей операции: вызов функции игнорируется до прихода события  EVENT_GAME_ITEM_CHANGED с соответствующим itemId (если предыдущая операция удалась) или  EVENT_ITEM_SERVER_CMD_FINISHED с соответствующим itemId и isSuccess==false (если предыдущая операция не удалась).
---@param enchantItemId ObjectId идентификатор самоцвета
---@param itemId ObjectId идентификатор предмета
function enchant.EnchantInsert(enchantItemId, itemId) end

--- Получить информация о том в предметы какого качества можно вставить данный энчант.
---@param itemId ObjectId идентификатор энчанта
---@return table
function enchant.GetCompatibleQualities(itemId) end

--- Получить список идентификаторов энчантов (улучшителей), вставленных в предмет.
---@param itemId ObjectId идентификатор предмета
---@return table
function enchant.GetEnchants(itemId) end

--- Возвращает слот энчанта.
---@param itemId ObjectId идентификатор энчанта
---@return number
function enchant.GetEnchantSlot(itemId) end

--- Получить слоты предмета, доступные для вставки энчантов.
---@param itemId ObjectId идентификатор предмета
---@return table
function enchant.GetItemSlots(itemId) end

--- Получить информацию о слотах предмета, доступных для вставки энчантов и соответствующих этим слотам статах.
---@param itemId ObjectId идентификатор предмета
---@return table
function enchant.GetItemSlotsInfo(itemId) end

--- Возвращает является ли предмет энчантом.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function enchant.IsEnchant(itemId) end

-- Events

--- Событие о завершении сервером операции с предметом. Некоторые операции с предметом не могут производиться до завершения предыдущих операций, это событие служит для определения момента, когда можно проводить следующее действие такого рода. Информация о новом состоянии предмета на клиенте может запаздывать и в момент прихода сообщения может быть устаревшей, т.е. при необходимости надо ждать  EVENT_GAME_ITEM_CHANGED.
EVENT_ITEM_SERVER_CMD_FINISHED = "EVENT_ITEM_SERVER_CMD_FINISHED"
