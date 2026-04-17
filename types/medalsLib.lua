---@meta

--- CategoryMedalsLib
--- Методы и события, относящиеся к достижениям.

---@class medalsLibLib
medalsLib = {}

--- Список категорий достижений.
---@return table|nil
function medalsLib.GetCategories() end

--- Информация о достижении.
---@param id ObjectId идентификатор достижения
---@return table|nil
function medalsLib.GetMedalInfo(id) end

--- Список рангов достижения.
---@param medalId ObjectId(Number) идентификатор достижения
---@return table|nil
function medalsLib.GetMedalRanks(medalId) end

--- Список активных достижений.
---@return ObjectId[]|nil
function medalsLib.GetMedals() end

--- Получить информацию о достижениях другого игрока. Результатом вызова функции является эвент EVENT_INSPECT_AVATAR_MEDALS_RESULT
---@param avatarId ObjectId идентификатор персонажа игрока
function medalsLib.InspectAvatarMedals(avatarId) end

--- Осуществляет поиск достижений. Поиск осуществляет на основе строки, в которой через пробел перечислены ключевые слова. Слова длина которых менее трех символов не учитываются при поиске. Результат поиска возвращается в эвенте EVENT_MEDALS_SEARCH_RESULTS.
---@param name WString название достижения
---@param limit integer|nil ограничение на количество искомых достижений; необязательный параметр, при значения nil и менее 1 будут найдены все достижения соответствующие запросу
function medalsLib.SearchMedals(name, limit) end

-- Events

--- Уведомление о выполнении достижения аватаром.
EVENT_AVATAR_MEDAL_FINISHED = "EVENT_AVATAR_MEDAL_FINISHED"

--- Результат вызова информации о достижениях другого игрока.
EVENT_INSPECT_AVATAR_MEDALS_RESULT = "EVENT_INSPECT_AVATAR_MEDALS_RESULT"

--- Уведомление об появлении нового активного достижения.
EVENT_MEDAL_ADDED = "EVENT_MEDAL_ADDED"

--- Уведомление об изменении прогресса достижения.
EVENT_MEDAL_PROGRESS_CHANGED = "EVENT_MEDAL_PROGRESS_CHANGED"

--- Уведомление об удалении активного достижения.
EVENT_MEDAL_REMOVED = "EVENT_MEDAL_REMOVED"

--- Уведомление об изменении списка активных достижений.
EVENT_MEDALS_CHANGED = "EVENT_MEDALS_CHANGED"

--- Событие приходит в ответ на запрос medalsLib.SearchMedals( name, limit ). В ответе перечислены идентификаторы ресурсов рангов найденных достижений.
EVENT_MEDALS_SEARCH_RESULTS = "EVENT_MEDALS_SEARCH_RESULTS"

--- Уведомление о выполнении достижения членом группы или отряда аватара, но не самим аватаром.
EVENT_MEMBER_MEDAL_FINISHED = "EVENT_MEMBER_MEDAL_FINISHED"
