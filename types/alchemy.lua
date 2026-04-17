---@meta

--- CategoryAlchemy
--- Все методы и события, относящиеся к умению алхимии.

---@class alchemyLib
alchemy = {}

--- Отменить текущее алхимическое действо. После этого прийдёт EVENT_ALCHEMY_CANCELED.
function alchemy.CancelAlchemy() end

--- Возвращает базовую информацию о барабане умения алхимии. Если барабан не используется (алхимия не начата, или слот не доступен в имеющемся алхимическом инструменте), то вернёт nil.
---@param drum number( номер барабана (слота) текущего алхимического действа
---@return nil
function alchemy.GetAlchemyDrumInfo(drum) end

--- Возвращает базовую информацию об умении алхимии главного игрока.
---@return nil
function alchemy.GetAlchemyInfo() end

--- Возвращает информацию о рецепте, по которому создастся предмет в выбранной строке после проведения алхимической реакции (учитываются текущие корректировки). Если рецепт не найден, то возвращается nil, иначе возвращается идентификатор ресурса рецепта и флаг, бонусное ли расположение компонент для этого рецепта. Это расположение компонент в инструменте такое же как в рецепте. В таком случае количество произведенного продукта увеличивается на некую величину (см. avatar.GetAlchemyInfo()).
---@param line number( строка в которой необходимо узнать результат
---@return nil
function alchemy.GetAlchemyMatchedRecipe(line) end

--- Возвращает true, если в алхимическом приборе достаточно реагентов для начала реакции.
---@return boolean
function alchemy.IsAlchemyComponentsReady() end

--- Возвращает базовую информацию об умении алхимии главного игрока.
---@param line number( строка результата (-1, 0, 1)
---@return boolean
function alchemy.IsAlchemyLineAvailable(line) end

--- Положить/вынуть ингредиент в алхимический слот. После этого прийдёт EVENT_ALCHEMY_ITEM_PLACED. Если передать nil, то слот будет очищен и прийдёт сообщение.
---@param itemId ObjectId|nil идентификатор ингридиента (предмета из инвентаря). nil - очистить слот.
---@param slot number( номер барабана (слота)
function alchemy.PutAlchemyItemToSlot(itemId, slot) end

-- Events

--- Использование умения алхиии завершилось или было прервано.
EVENT_ALCHEMY_CANCELED = "EVENT_ALCHEMY_CANCELED"

--- Алхимический компонент удачно положен/вынут в алхимический слот с помощью avatar.PutAlchemyItemToSlot(itemId, slot).
EVENT_ALCHEMY_ITEM_PLACED = "EVENT_ALCHEMY_ITEM_PLACED"

--- Событие приходит, если игрок пытается положить в ступку предмет, но он не является алхимическим.
EVENT_ALCHEMY_NOT_ALCHEMY_ITEM = "EVENT_ALCHEMY_NOT_ALCHEMY_ITEM"

--- Событие приходит, когда не удалось добавить компонент в ступку из-за того что в сумке недостаточно таких предметов.
EVENT_ALCHEMY_NOT_AVAILABLE_RESOURCES = "EVENT_ALCHEMY_NOT_AVAILABLE_RESOURCES"

--- Событие приходит, если не хватает компонент для алхимии.
EVENT_ALCHEMY_NOT_ENOUGH_COMPONENTS = "EVENT_ALCHEMY_NOT_ENOUGH_COMPONENTS"

--- Завершён первый этап алхимической реакции.
EVENT_ALCHEMY_REACTION_FINISHED = "EVENT_ALCHEMY_REACTION_FINISHED"

--- Изменился список алхимических рецептов главного игрока.
EVENT_ALCHEMY_RECIPES_CHANGED = "EVENT_ALCHEMY_RECIPES_CHANGED"

--- Изменился уровень умения алхимии главного игрока.
EVENT_ALCHEMY_SCORE_CHANGED = "EVENT_ALCHEMY_SCORE_CHANGED"

--- Умение алхиии начало действие после использования алхимического инструмента. Теперь можно положить ингредиенты, используя avatar.PutAlchemyItemToSlot( itemId, slot ).
EVENT_ALCHEMY_STARTED = "EVENT_ALCHEMY_STARTED"
