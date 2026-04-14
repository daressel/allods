---@meta

---@class lootLib
loot = {}

---@class LootGetCommonInfoResult
---@field allLoot table список (индексируемый от 0 массив) LootGroupId, варианты выпадения лута на астральных островах, см. loot.SelectLootGroup( lootGroupId )

---@class LootGetLootGroupPartInfoResult
---@field lootGroup LootGroupId идентификатор варианта, используемого в данный момент

---Узнать можно ли менять схему дележа лута в рейде/группе. Схема дележа лута запрещена, например, в автоматически созданных рейдах. Это свойство не меняется в течение жизни рейда/группы.
---@return boolean или nil
function loot.CanSetLootScheme() end

---Позволяет получить информацию общего характера, неизменную в процессе игры.
---@return LootGetCommonInfoResult
function loot.GetCommonInfo() end

---Возвращает время в миллисекундах, через которое будет произведен автоматический Greed/Need ролл.
---@return integer
function loot.GetGreedNeedForLootTimeMs() end

---Сколько осталось времени для Greed/Need ролла.
---@param rollId ObjectId уникальный идентификатор ролла
---@return integer
function loot.GetGreedNeedTimeRemainingMs(rollId) end

---Позволяет получить информацию о текущем варианте выпадения лута на астральных островах.
---@return LootGetLootGroupPartInfoResult
function loot.GetLootGroupPartInfo() end

---Узнать текущую схему дележа лута.
---@return number
function loot.GetLootScheme() end

---Узнать пороговое качество итемов для текущей лут схемы.
---@return number
function loot.GetMinItemQualityForLootScheme() end

---Cделать выбор для Greed/Need ролла.
---@param rollId ObjectId уникальный идентификатор ролла
---@param choice number выбор
---@return нет
function loot.SelectGreedNeedForLoot(rollId, choice) end

---Позволяет установить вариант выпадения лута на астральных островах.
---@param lootGroupId LootGroupId идентификатор выбранного варианта, может быть выбран из списка loot.GetCommonInfo().allLoot
---@return нет
function loot.SelectLootGroup(lootGroupId) end

---Cделать выбор для Master ролла.
---@param rollId ObjectId уникальный идентификатор ролла
---@param winnerId ObjectId уникальный идентификатор игрока, получающего лут
---@return нет
function loot.SelectWinnerForLoot(rollId, winnerId) end

---Задать схему дележа лута.
---@param scheme number тип лут схемы
---@return нет
function loot.SetLootScheme(scheme) end

---Задать пороговое качество итемов для текущей лут схемы.
---@param quality number идентификатор качества итема
---@return нет
function loot.SetMinItemQualityForLootScheme(quality) end

---Переключить ролл с master на greed-need схему распределения.
---@param rollId ObjectId уникальный идентификатор ролла
---@return нет
function loot.SwitchToGreedNeed(rollId) end
