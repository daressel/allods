---@meta

--- CategoryDungeonChoice
--- События и функции Lua API, относящиеся к выбору личного приключения для атаки.

---@class dungeonChoiceLib
dungeonChoice = {}

--- Выбрать личное приключение для атаки из списка  dungeonChoice.GetList() по индексу. Также надо выбрать награду по индексу.
---@param dungeonIndex integer индекс личного приключения в списке
---@param rewardIndex integer индекс награды, которую выбирает игрок
function dungeonChoice.ChooseDungeon(dungeonIndex, rewardIndex) end

--- Возвращает список категорий (лиг) личных приключений на выбор для атаки.
---@return table
function dungeonChoice.GetCategories() end

--- Возвращает список наград, доступных для получения при атаке личного приключения.
---@param dungeonIndex integer индекс личного приключения в списке
---@return table
function dungeonChoice.GetDungeonReward(dungeonIndex) end

--- Возвращает список личных приключений на выбор для атаки.
---@return table
function dungeonChoice.GetList() end

--- Возвращает время, отведенное на выбор личного приключения для атаки.
---@return table
function dungeonChoice.GetTimeout() end

--- Находимся ли в состоянии выбора личного приключения для атаки.
---@return boolean
function dungeonChoice.IsActive() end

-- Events

--- Посылается каждый раз, когда выбор личного приключения для атаки закончен.
EVENT_DUNGEON_CHOICE_FINISHED = "EVENT_DUNGEON_CHOICE_FINISHED"

--- Посылается каждый раз, когда стартовал выбор личного приключения для атаки.
EVENT_DUNGEON_CHOICE_STARTED = "EVENT_DUNGEON_CHOICE_STARTED"
