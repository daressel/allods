---@meta

--- CategorySkill
--- Все методы и события, относящиеся к умениям (skills).

--- Свойства ремесленных инструментов и их улучшителей.
ENUM_ToolProperty_Quality = "ENUM_ToolProperty_Quality"
ENUM_ToolProperty_Stable = "ENUM_ToolProperty_Stable"
ENUM_ToolProperty_Handy = "ENUM_ToolProperty_Handy"
ENUM_ToolProperty_Optimized = "ENUM_ToolProperty_Optimized"

---@class skillLib
skill = {}

--- Возвращает идентификатор крафтового скила, которые сейчас активен, то есть сейчас совершается крафт. если никакого крафта сейчас не присходит, то возвращается nil.
---@return SkillId|nil
function skill.GetActiveCraftingSkill() end

--- Возвращает описание крафтового компонента по идентификатору ресурса.
---@param id ComponentPropertyId Id ресурса компонента
---@return nil
function skill.GetComponentInfo(id) end

--- Возвращает максимально возможный уровень скилла для текущего уровня главного игрока.
---@param skillId ObjectId идентификатор скилла
---@return number
function skill.GetCurrentMaxSkillScore(skillId) end

--- Возвращает максимально возможный уровень скилла в игре.
---@param skillId ObjectId идентификатор скилла
---@return number
function skill.GetMaxSkillScore(skillId) end

--- Возвращает идентификатор предмета, выдающего озарение, для указанного рецепта по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return ItemId
function skill.GetRecipeAfflatusItem(id) end

--- Возвращает информацию о рецепте по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return nil
function skill.GetRecipeInfo(id) end

--- Возвращает информацию о скилле по идентификатору ресурса. Дает информацию по любому скиллу, даже если он не изучен игроком. В этом случае score = nil.
---@param id SkillId Id умения (скила)
---@return nil
function skill.GetSkillInfo(id) end

--- Возвращает список скилов главного героя.
---@return table
function skill.GetSkills() end

--- Возвращает информацию об активации созданных предметов.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function skill.GetActivationInfo(itemId) end

--- Возвращает таблицу с информацией о предмете, связанную с крафтами.
---@param itemId ObjectId идентификатор предмета
---@return table
function skill.GetCraftInfo(itemId) end

--- Возвращает информацию о ремесленном инструменте, если это инструмент.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function skill.GetCraftToolInfo(itemId) end

--- Проверяет можно ли обменять предмет на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return table|nil
function skill.GetExchangeInfo(itemId) end

--- Возвращает информацию об ограничении количества предметов во владении, т.е. сколько максимум таких предметов единовременно может находится "на руках" у персонажа.
---@param itemId ObjectId(Number) идентификатор предмета
---@return number
function skill.GetOwnershipLimit(itemId) end

--- Был ли предмет скопирован, если да - его нельзя продать на бирже наград.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function skill.IsCopied(itemId) end

-- Events

--- Уведомление о неудачном исполнении фуражирования.
EVENT_FORAGING_FAILED = "EVENT_FORAGING_FAILED"

--- Главный игрок изучил скилл.
EVENT_SKILL_ADDED = "EVENT_SKILL_ADDED"

--- Изменился опыт, накопленный на уровне скилла.
EVENT_SKILL_IMPROVEMENT_CHANGED = "EVENT_SKILL_IMPROVEMENT_CHANGED"

--- Главный игрок забыл скилл.
EVENT_SKILL_REMOVED = "EVENT_SKILL_REMOVED"

--- Изменился список скиллов главного героя.
EVENT_SKILLS_CHANGED = "EVENT_SKILLS_CHANGED"

--- Изменился уровень скилла главного игрока.
EVENT_SKILL_SCORE_CHANGED = "EVENT_SKILL_SCORE_CHANGED"
