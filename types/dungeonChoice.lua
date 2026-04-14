---@meta

---@class dungeonChoiceLib
dungeonChoice = {}

---@class DungeonChoiceGetDungeonRewardResult
---@field index integer индекс этой награды в списке
---@field name string название награды
---@field count integer количество выдаваемой награды

---@class DungeonChoiceGetListResult
---@field index integer индекс этого приключения в списке
---@field categoryName string название категории личного приключения
---@field hasRooms boolean если true, то нужно будет сражаться
---@field level number nil если нет информации; иначе уровень сложности категории приключения

---@class DungeonChoiceGetTimeoutResult
---@field durationMs integer количество миллисекунд, которое отводится на выбор личного приключения для атаки
---@field remainingMs integer количество миллисекунд, которое осталось на выбор личного приключения для атаки

---Выбрать личное приключение для атаки из списка  dungeonChoice.GetList() по индексу. Также надо выбрать награду по индексу.
---@param dungeonIndex integer индекс личного приключения в списке
---@param rewardIndex integer индекс награды, которую выбирает игрок
---@return нет
function dungeonChoice.ChooseDungeon(dungeonIndex, rewardIndex) end

---Возвращает список категорий (лиг) личных приключений на выбор для атаки.
---@return string[]
function dungeonChoice.GetCategories() end

---Возвращает список наград, доступных для получения при атаке личного приключения.
---@param dungeonIndex integer индекс личного приключения в списке
---@return DungeonChoiceGetDungeonRewardResult
function dungeonChoice.GetDungeonReward(dungeonIndex) end

---Возвращает список личных приключений на выбор для атаки.
---@return DungeonChoiceGetListResult
function dungeonChoice.GetList() end

---Возвращает время, отведенное на выбор личного приключения для атаки.
---@return DungeonChoiceGetTimeoutResult
function dungeonChoice.GetTimeout() end

---Находимся ли в состоянии выбора личного приключения для атаки.
---@return boolean
function dungeonChoice.IsActive() end
