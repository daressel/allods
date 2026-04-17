---@meta

--- CategoryCraft
--- Методы и события, относящиеся к крафтовым умениям (создание доспехов, одежды и т.п).

--- Тип команды крафтинга. Используется в сообщении о неудачном завершении команд крафтинга (EVENT_DICE_CRAFT_CMD_FAILED).
--- соответствует craft.DiceCraftPutItem(itemId, slot, count)
ENUM_DiceCraftCmdType_PutItem = "ENUM_DiceCraftCmdType_PutItem"
--- соответствует craft.DiceCraftEmptySlot(slot)
ENUM_DiceCraftCmdType_EmptySlot = "ENUM_DiceCraftCmdType_EmptySlot"
--- соответствует protectedCraft.DiceCraftStartGame(recipeId)
ENUM_DiceCraftCmdType_StartGame = "ENUM_DiceCraftCmdType_StartGame"
--- соответствует protectedCraft.DiceCraftReroll()
ENUM_DiceCraftCmdType_Reroll = "ENUM_DiceCraftCmdType_Reroll"
--- соответствует protectedCraft.DiceCraftFinishGame()
ENUM_DiceCraftCmdType_FinishGame = "ENUM_DiceCraftCmdType_FinishGame"
--- соответствует protectedCraft.DiceCraftCancelGame()
ENUM_DiceCraftCmdType_CancelGame = "ENUM_DiceCraftCmdType_CancelGame"
--- соответствует craft.DiceCraftUseInspiration()
ENUM_DiceCraftCmdType_UseInspiration = "ENUM_DiceCraftCmdType_UseInspiration"
--- соответствует craft.IncreaseQualification()
ENUM_DiceCraftCmdType_IncQualification = "ENUM_DiceCraftCmdType_IncQualification"

---@class craftLib
craft = {}

--- Возвращает идентификатор предмета, выдающего озарение, для указанного рецепта по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return ItemId
function craft.GetRecipeAfflatusItem(id) end

--- Возвращает информацию о рецепте по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return nil
function craft.GetRecipeInfo(id) end

--- Делает заданный слот пустым.
---@param slot integer номер слота (отсчитывается от 0)
function craft.DiceCraftEmptySlot(slot) end

--- Значения костей на данный момент.
---@return table
function craft.DiceCraftGetCurrentDices() end

--- Возвращает id текущего рецепта крафтинга. Доступна только во время мини-игры крафтинга (по механике dice craft).
---@return RecipeId
function craft.DiceCraftGetCurrentRecipe() end

--- Возвращает список всех возможных значений, которые могут принимать слоты при ролле.
---@return table
function craft.DiceCraftGetDiceValues() end

--- Возвращает уровни вдохновения (number (int)), при достижении каждого из которых на 1 увеличивается число заготовок, на которые подействует вдохновение при использовании.
---@return table
function craft.DiceCraftGetInspirationLevels() end

--- Возвращает список рецептов, для которых накоплено вдохновение. Доступна только во время сессии крафтинга (по механике dice craft).
---@return table
function craft.DiceCraftGetInspiredRecipes() end

--- Возвращает список слотов, которые заблокированы от изменений при реролле.
---@return table
function craft.DiceCraftGetLockedSlots() end

--- Возвращает список компонентов, которые в данный момент находятся в слотах.
---@return table
function craft.DiceCraftGetPlacedItems() end

--- Возвращает величину накопленного вдохновения для заданого рецепта. Доступна только во время сессии крафтинга (по механике dice craft).
---@param recipeId RecipeId идентификатор рецепта
---@return number
function craft.DiceCraftGetRecipeInspiration(recipeId) end

--- Возвращает список рецептов, доступных в текущем сеансе крафтинга.
---@return table
function craft.DiceCraftGetRecipes() end

--- Проверяет, является ли предмет джокером для DiceCraft механики, т.е. может быть использован вместо какого-нибудь другого предмета, требующегося по рецепту.
---@param itemId ObjectId идентификатор проверяемого предмета
---@return boolean
function craft.DiceCraftIsJoker(itemId) end

--- Кладёт компонент в заданный слот.
---@param itemId ObjectId id итема с нужным компонентом
---@param slot integer номер слота (отсчитывается от 0)
---@param count integer количество
function craft.DiceCraftPutItem(itemId, slot, count) end

--- Определяет тот ли это предмет, что может быть использован в рецепте DiceCraft-механики. Работает как с обычными преметами, так и с джокерами.
---@param recipeItemId ObjectId id итема из описания рецепта
---@param inventoryItemId ObjectId id итема (например из сумки), который предполагается использовать при крафтинге по рецепту
---@return boolean
function craft.DiceCraftRecipeIsSameItem(recipeItemId, inventoryItemId) end

--- Состояние крафтинга.
---@return table
function craft.DiceCraftState() end

--- Применяет вдохновение, накопленное для текущего рецепта (если вдохновение достигло хотя бы самого первого уровня из craft.DiceCraftGetInspirationLevels()). Доступна только во время мини-игры крафтинга (по механике dice craft). При неудаче приходит EVENT_DICE_CRAFT_CMD_FAILED с соответвствующим значением cmdType.
function craft.DiceCraftUseInspiration() end

--- Завершает reforge крафт - выбирает из доступных вариантов нужный итем.
---@return boolean
function craft.FinishReforge() end

--- Возвращает список всех возможных для рецепта результатов изготовления предметов.
---@param recipeId RecipeId идентификатор рецепта
---@return table
function craft.GetDiceCraftRecipeResults(recipeId) end

--- Возвращает информацию о рецепте для forge крафта.
---@return table|nil
function craft.GetForgeRecipeInfo() end

--- Возвращает список доступных рецептов для forge крафта.
---@param ignorePredicates boolean|nil игнорировать предикаты; если true, то будут возвращены даже недоступные рецепты; необязательный параметр, по-умолчанию false
---@return ForgeRecipeId[]|nil
function craft.GetForgeRecipes(ignorePredicates) end

--- Возвращает список доступных рецептов для объединения золотых слотов.
---@param ignorePredicates boolean|nil игнорировать предикаты; если true, то будут возвращены даже недоступные рецепты; необязательный параметр, по-умолчанию false
---@return ForgeRecipeId[]|nil
function craft.GetGoldenSlotsForgeRecipes(ignorePredicates) end

--- Возвращает список ресурсов тира рецептов для объединения золотых слотов.
---@return ForgeResourceId[]|nil
function craft.GetGoldenSlotsForgeTiersOrder() end

--- Число слотов.
---@return number
function craft.DiceCraftGetItemSlotsCount() end

--- Возвращает компонент (итем) для reforge крафта, установленный в указанный слот.
---@return itemId
function craft.GetReforgeComponent() end

--- Возвращает список доступных рефоржей для предмета.
---@return table
function craft.GetReforgeInfo() end

--- Возвращает текущий рецепт и итем для reforge крафта.
---@return table|nil
function craft.GetReforgeRecipe() end

--- Возвращает список доступных вариантов для reforge крафта.
---@return table
function craft.GetReforgeVariants() end

--- Применить просветление для открытия следующего рецепта ([:CraftV6#head-eeed2040fb16de44e6a140e895622366b6d64a7f:подробнее]). При неудаче приходит EVENT_DICE_CRAFT_CMD_FAILED с соответствующим значением cmdType.
function craft.IncreaseQualification() end

--- Совершает forge крафт с указанными параметрами.
---@param forgeId ForgeCraftResourceId ресурс forge крафта (поле tierResource в craft.GetForgeRecipeInfo)
---@param recipeId ForgeCraftRecipeId ресурс рецепта крафта
---@param components table таблица таблиц компонентов. Индекс внешней таблицы - номер компонента, значение - таблица (индексированная с 1) с objectId предметов компонентов в порядке приоритета применения.
---@return boolean
function craft.MakeForge(forgeId, recipeId, components) end

--- Совершает reforge крафт с установленным рецептом и компонентами.
---@return boolean
function craft.MakeReforge() end

--- Добавить компонент для reforge крафта.
---@return boolean
function craft.PutReforgeComponent() end

--- Устанавливает текущий рецепт и итем для reforge крафта.
---@return boolean
function craft.SetReforgeRecipe() end

-- Events

--- Выключён режим крафтинга (создания вещей).
EVENT_DICE_CRAFT_CANCELED = "EVENT_DICE_CRAFT_CANCELED"

--- Одна из команд, используемых для крафтинга, завершилась неудачей, состояние крафтинга не изменилось.
EVENT_DICE_CRAFT_CMD_FAILED = "EVENT_DICE_CRAFT_CMD_FAILED"

--- Завершёно созание вещи, режим крафтинга (создание вещей) остаётся включен.
EVENT_DICE_CRAFT_FINISHED = "EVENT_DICE_CRAFT_FINISHED"

--- Событие приходит, если не хватает компонент.
EVENT_DICE_CRAFT_NOT_ENOUGH_COMPONENTS = "EVENT_DICE_CRAFT_NOT_ENOUGH_COMPONENTS"

--- Включён режим выбора рецептов крафтинга (создание вещей) - приходит когда включается крафтинг или мини-игра крафтинга завершилась без выхода из крафтинга (если мини-игра завершилась выходом из крафтинга - приходит EVENT_DICE_CRAFT_CANCELED).
EVENT_DICE_CRAFT_PREPARED = "EVENT_DICE_CRAFT_PREPARED"

--- Изменился список рецептов.
EVENT_DICE_CRAFT_RECIPES_CHANGED = "EVENT_DICE_CRAFT_RECIPES_CHANGED"

--- Изменился уровень умения крафтинга.
EVENT_DICE_CRAFT_SCORE_CHANGED = "EVENT_DICE_CRAFT_SCORE_CHANGED"

--- Изменилось содержимое одного из слотов (добавлен/убран/заменён предмет).
EVENT_DICE_CRAFT_SLOT_CHANGED = "EVENT_DICE_CRAFT_SLOT_CHANGED"

--- Обновилась информация о состоянии текущго сеанса крафтинга (был очередной реролл).
EVENT_DICE_CRAFT_STATUS_CHANGED = "EVENT_DICE_CRAFT_STATUS_CHANGED"

--- Завершён reforge крафт вещи, можно запрашивать доступные варианты.
EVENT_REFORGE_RESULT = "EVENT_REFORGE_RESULT"

--- Reforge-крафт вещи завершён неудачно, выбранный вариант итема НЕ получен.
EVENT_REFORGE_RESULT_FAIL = "EVENT_REFORGE_RESULT_FAIL"

--- Завершён reforge крафт вещи, выбранный вариант итема получен.
EVENT_REFORGE_RESULT_READY = "EVENT_REFORGE_RESULT_READY"
