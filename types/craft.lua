---@meta

---@class craftLib
craft = {}

---@class CraftDiceCraftStateResult
---@field maxLockedDices integer максимально допустимое количество залоченых костей для одного переброса
---@field maxRecipeLevel integer максимально допустимый уровень рецепта
---@field rerolls integer базовое количество рероллов
---@field inGame boolean false если мини-игра ещё не началась (в этом состоянии можно использовать, например, craft.DiceCraftPutItem(itemId, slot, count), craft.DiceCraftEmptySlot(slot)); true если идёт мини-игра (можно использовать craft.DiceCraftLockSlot(slot, lock))
---@field currentDicesNumber number число костей в мини-игре; nil если мини-игра ещё не начата
---@field rerollsLeft number число оставшихся рероллов в мини-игре; nil если мини-игра ещё не начата

---@class CraftGetDiceCraftRecipeResultsResult
---@field defaultItemId ObjectId идентификатор предмета, который будет результатом, если не выпадут одинаковые значения для всех слотов
---@field results table список (индексированный от 0) возможных значений, каждое значение - таблица с полями:
---@field diceValue integer значение, которое должно выпасть для всех слотов, чтобы результат был именно этот
---@field itemId ObjectId идентификатор предмета, который будет результатом крафтинга (в количестве resultQuantity)
---@field resultQuantity integer количество предметов
---@field bonusQuantity integer сколько дополнительных предметов будет дано за наличие непотраченных роллов

---@class CraftGetForgeRecipeInfoResult
---@field name string название
---@field price integer стоимость в деньгах
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field tierResource ForgeResourceId|nil идентификатор ресурса (тира) для этого forge-крафта, если доступен (иначе-nil)
---@field result ObjectId|nil итем, получаемый в результате форжа
---@field resources ObjectId[] индексированный с 1 список требуемых ресурсов в виде необходимых итемов
---@field available boolean true, если рецепт доступен, иначе false
---@field requirements RequirementsTable|nil если available == false, то список условий необходимых для получения доступа к рецепту, иначе nil
---@field altCurrencies table индексированный с 1 список требуемой альтвалюты, каждая ячейка таблица с полями
---@field currency CurrencyId ресурсный идентификатор валюты
---@field count integer количество требуемой валюты

---@class CraftGetReforgeInfoResult
---@field altCurrencies table индексированный с 1 список требуемой альтвалюты, каждая ячейка таблица с полями
---@field currency CurrencyId ресурсный идентификатор валюты
---@field count integer количество требуемой валюты

---Делает заданный слот пустым.
---@param slot integer номер слота (отсчитывается от 0)
---@return нет
function craft.DiceCraftEmptySlot(slot) end

---Значения костей на данный момент.
---@return table или nil
function craft.DiceCraftGetCurrentDices() end

---Возвращает id текущего рецепта крафтинга. Доступна только во время мини-игры крафтинга (по механике dice craft).
---@return RecipeId или nil
function craft.DiceCraftGetCurrentRecipe() end

---Возвращает список всех возможных значений, которые могут принимать слоты при ролле.
---@return table или nil
function craft.DiceCraftGetDiceValues() end

---Возвращает уровни вдохновения (number (int)), при достижении каждого из которых на 1 увеличивается число заготовок, на которые подействует вдохновение при использовании.
---@return table или nil
function craft.DiceCraftGetInspirationLevels() end

---Возвращает список рецептов, для которых накоплено вдохновение. Доступна только во время сессии крафтинга (по механике dice craft).
---@return table или nil
function craft.DiceCraftGetInspiredRecipes() end

---Возвращает список слотов, которые заблокированы от изменений при реролле.
---@return table или nil
function craft.DiceCraftGetLockedSlots() end

---Возвращает список компонентов, которые в данный момент находятся в слотах.
---@return table или nil
function craft.DiceCraftGetPlacedItems() end

---Возвращает величину накопленного вдохновения для заданого рецепта. Доступна только во время сессии крафтинга (по механике dice craft).
---@param recipeId RecipeId идентификатор рецепта
---@return number
function craft.DiceCraftGetRecipeInspiration(recipeId) end

---Возвращает список рецептов, доступных в текущем сеансе крафтинга.
---@return table или nil
function craft.DiceCraftGetRecipes() end

---Проверяет, является ли предмет джокером для DiceCraft механики, т.е. может быть использован вместо какого-нибудь другого предмета, требующегося по рецепту. Примечание: джокеры в этой механике замещают не любой предмет, а только из ограниченного списка; список замещаемых предметов для каждого джокера свой.
---@param itemId ObjectId идентификатор проверяемого предмета
---@return boolean
function craft.DiceCraftIsJoker(itemId) end

---Кладёт компонент в заданный слот.
---@param itemId ObjectId id итема с нужным компонентом
---@param slot integer номер слота (отсчитывается от 0)
---@param count integer количество
---@return нет
function craft.DiceCraftPutItem(itemId, slot, count) end

---Определяет тот ли это предмет, что может быть использован в рецепте DiceCraft-механики. Работает как с обычными преметами, так и с джокерами.
---@param recipeItemId ObjectId id итема из описания рецепта
---@param inventoryItemId ObjectId id итема (например из сумки), который предполагается использовать при крафтинге по рецепту
---@return boolean
function craft.DiceCraftRecipeIsSameItem(recipeItemId, inventoryItemId) end

---Состояние крафтинга.
---@return CraftDiceCraftStateResult
function craft.DiceCraftState() end

---Применяет вдохновение, накопленное для текущего рецепта (если вдохновение достигло хотя бы самого первого уровня из craft.DiceCraftGetInspirationLevels()). Доступна только во время мини-игры крафтинга (по механике dice craft). При неудаче приходит EVENT_DICE_CRAFT_CMD_FAILED с соответвствующим значением cmdType.
---@return нет
function craft.DiceCraftUseInspiration() end

---Завершает reforge крафт - выбирает из доступных вариантов нужный итем.
---@return success
function craft.FinishReforge() end

---Возвращает список всех возможных для рецепта результатов изготовления предметов.
---@param recipeId RecipeId идентификатор рецепта
---@return CraftGetDiceCraftRecipeResultsResult
function craft.GetDiceCraftRecipeResults(recipeId) end

---Возвращает информацию о рецепте для forge крафта.
---@return CraftGetForgeRecipeInfoResult
function craft.GetForgeRecipeInfo() end

---Возвращает список доступных рецептов для forge крафта.
---@param ignorePredicates boolean|nil игнорировать предикаты; если true, то будут возвращены даже недоступные рецепты; необязательный параметр, по-умолчанию false
---@return ForgeRecipeId|nil[]
function craft.GetForgeRecipes(ignorePredicates) end

---Возвращает список доступных рецептов для объединения золотых слотов.
---@param ignorePredicates boolean|nil игнорировать предикаты; если true, то будут возвращены даже недоступные рецепты; необязательный параметр, по-умолчанию false
---@return ForgeRecipeId|nil[]
function craft.GetGoldenSlotsForgeRecipes(ignorePredicates) end

---Возвращает список ресурсов тира рецептов для объединения золотых слотов.
---@return ForgeResourceId|nil[]
function craft.GetGoldenSlotsForgeTiersOrder() end

---Число слотов.
---@return number
function craft.DiceCraftGetItemSlotsCount() end

---Возвращает компонент (итем) для reforge крафта, установленный в указанный слот.
---@return itemId
function craft.GetReforgeComponent() end

---Возвращает список доступных рефоржей для предмета.
---@return CraftGetReforgeInfoResult
function craft.GetReforgeInfo() end

---Возвращает текущий рецепт и итем для reforge крафта.
---@return table|nil
function craft.GetReforgeRecipe() end

---Возвращает список доступных вариантов для reforge крафта.
---@return table или nil
function craft.GetReforgeVariants() end

---Применить просветление для открытия следующего рецепта ([:CraftV6#head-eeed2040fb16de44e6a140e895622366b6d64a7f:подробнее]). При неудаче приходит EVENT_DICE_CRAFT_CMD_FAILED с соответствующим значением cmdType.
---@return нет
function craft.IncreaseQualification() end

---Совершает forge крафт с указанными параметрами.
---@param forgeId ForgeCraftResourceId ресурс forge крафта (поле tierResource в craft.GetForgeRecipeInfo)
---@param recipeId ForgeCraftRecipeId ресурс рецепта крафта
---@param components table [0:MAX_FORGE_COMPONENT_COUNT] of tables (индексированы с 1): objectId таблица таблиц компонентов. Индекс внешней таблицы - номер компонента, значение - таблица (индексированная с 1) с objectId предметов компонентов в порядке приоритета применения.
---@return success
function craft.MakeForge(forgeId, recipeId, components) end

---Совершает reforge крафт с установленным рецептом и компонентами.
---@return success
function craft.MakeReforge() end

---Добавить компонент для reforge крафта.
---@return success
function craft.PutReforgeComponent() end

---Устанавливает текущий рецепт и итем для reforge крафта.
---@return success
function craft.SetReforgeRecipe() end
