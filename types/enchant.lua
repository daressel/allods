---@meta

---@class enchantLib
enchant = {}

---@class EnchantCanInsertEnchantResult
---@field success boolean если true, то энчант можно вставить в предмет
---@field cause string причина, по которой нельзя вставить энчант

---Показывает, можно ли вставить данный энчант в предмет.
---@param enchantItemId ObjectId идентификатор энчанта
---@param itemId ObjectId идентификатор проверяемого предмета
---@return EnchantCanInsertEnchantResult
function enchant.CanInsertEnchant(enchantItemId, itemId) end

---Показывает, можно ли вообще вставлять хоть какие-нибудь энчанты в предмет. Примечание: точный ответ, можно ли вставить конкретный энчант, даёт enchant.CanInsertEnchant( enchantItemId, itemId ).
---@param itemId ObjectId идентификатор проверяемого предмета
---@return boolean
function enchant.CanInsertEnchants(itemId) end

---Извлечь самоцвет из заданного слота предмета. Если перед этим для этого же предмета вызывалась эта же функция или функция enchant.EnchantInsert( enchantItemId, itemId ), то извлечение не будет работать до завершения предыдущей операции: вызов функции игнорируется до прихода события  EVENT_GAME_ITEM_CHANGED с соответствующим itemId (если предыдущая операция удалась) или  EVENT_ITEM_SERVER_CMD_FINISHED с соответствующим itemId и isSuccess==false (если предыдущая операция не удалась).
---@param itemId ObjectId идентификатор предмета
---@param slot number слот
---@return нет
function enchant.EnchantExtract(itemId, slot) end

---Вставить самоцвет в предмет. Если перед этим для этого же предмета вызывалась эта же функция или функция enchant.EnchantExtract( itemId, slot ), то вставка не будет работать до завершения предыдущей операции: вызов функции игнорируется до прихода события  EVENT_GAME_ITEM_CHANGED с соответствующим itemId (если предыдущая операция удалась) или  EVENT_ITEM_SERVER_CMD_FINISHED с соответствующим itemId и isSuccess==false (если предыдущая операция не удалась).
---@param enchantItemId ObjectId идентификатор самоцвета
---@param itemId ObjectId идентификатор предмета
---@return нет
function enchant.EnchantInsert(enchantItemId, itemId) end

---Получить информация о том в предметы какого качества можно вставить данный энчант.
---@param itemId ObjectId идентификатор энчанта
---@return Enum|nil[]
function enchant.GetCompatibleQualities(itemId) end

---Получить список идентификаторов энчантов (улучшителей), вставленных в предмет. Идентификатор энчанта - это идентификатор предмета itemLib.GetItemInfo( enchantId ).
---@param itemId ObjectId идентификатор предмета
---@return table или nil
function enchant.GetEnchants(itemId) end

---Возвращает слот энчанта. Идентификатор энчанта - это идентификатор предмета.
---@param itemId ObjectId идентификатор энчанта
---@return number
function enchant.GetEnchantSlot(itemId) end

---Получить слоты предмета, доступные для вставки энчантов.
---@param itemId ObjectId идентификатор предмета
---@return table или nil
function enchant.GetItemSlots(itemId) end

---Получить информацию о слотах предмета, доступных для вставки энчантов и соответствующих этим слотам статах.
---@param itemId ObjectId идентификатор предмета
---@return table или nil
function enchant.GetItemSlotsInfo(itemId) end

---Возвращает является ли предмет энчантом.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function enchant.IsEnchant(itemId) end
