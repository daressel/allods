---@meta

---@class medalsLibLib
medalsLib = {}

---@class MedalsLibGetCategoriesResult
---@field name string название категории
---@field subCategories table список подкатегорий; индексация с 0; каждая ячейка является таблицей с полями:
---@field name string название подкатегории

---@class MedalsLibGetMedalInfoResult
---@field id Number идентификатор достижения
---@field medalId ResourceId идентификатор ресурса достижения
---@field medalRankId ResourceId идентификатор ресурса ранга достижения
---@field name string название достижения
---@field description string описание достижения
---@field image TextureId картинка достижения
---@field canLink boolean true, если можно ли линковать в чат(хвастаться)
---@field finishDate Number дата выполнения
---@field categoryIndex integer индекс категории(порядковый номер категории из medalsLib.GetCategories() начиная с 0)
---@field subCategoryIndex integer индекс подкатегории
---@field progress table данные о прогрессе выполнения, таблица с полями:
---@field value Number прогресс выполнения
---@field title string|nil заговолок для прогрессбара
---@field dressCollection table|nil набор условий связанных с экипировкой, список индексированный с 1, каждый элемент таблица с полями:
---@field slot Number индекс слота экипировки
---@field description string описание условия выполнения
---@field success boolean true если условие выполнено
---@field medalCollection table|nil набор условий связанных с достижениями, список индексированный с 1, каждый элемент таблица с полями:
---@field medal ResourceId идентификатор ресурса достижения
---@field success boolean true если условие выполнено
---@field remortCollection table|nil набор условий связанных с перерождениями, список индексированный с 1, каждый элемент таблица с полями:
---@field class CharacterClassId идентификатор класса персонажа-перерождения
---@field success boolean true если условие выполнено
---@field unlockCollection table|nil набор условий связанных с навыками, список индексированный с 1, каждый элемент таблица с полями:
---@field unlock UnlockId идентификатор ресурса навыка
---@field success boolean true если условие выполнено

---@class MedalsLibGetMedalRanksResult
---@field completeProgress integer количество очков прогресса необходимых для завершения ранга
---@field name string название ранга
---@field description string описание ранга
---@field image TextureId картинка ранга
---@field score integer количество очков за выполнение ранга
---@field reward table награда, таблица с полями
---@field description string описание награды

---Список категорий достижений.
---@return MedalsLibGetCategoriesResult
function medalsLib.GetCategories() end

---Информация о достижении.
---@param id Number идентификатор достижения
---@return MedalsLibGetMedalInfoResult
function medalsLib.GetMedalInfo(id) end

---Список рангов достижения.
---@param medalId ObjectId идентификатор достижения
---@return MedalsLibGetMedalRanksResult
function medalsLib.GetMedalRanks(medalId) end

---Список активных достижений.
---@return ObjectId|nil[]
function medalsLib.GetMedals() end

---Получить информацию о достижениях другого игрока. Результатом вызова функции является эвент EVENT_INSPECT_AVATAR_MEDALS_RESULT
---@param avatarId Number идентификатор персонажа игрока
---@return нет
function medalsLib.InspectAvatarMedals(avatarId) end

---Осуществляет поиск достижений. Поиск осуществляет на основе строки, в которой через пробел перечислены ключевые слова. Слова длина которых менее трех символов не учитываются при поиске. Результат поиска возвращается в эвенте EVENT_MEDALS_SEARCH_RESULTS.
---@param name string название достижения
---@param limit integer|nil ограничение на количество искомых достижений; необязательный параметр, при значения nil и менее 1 будут найдены все достижения соответствующие запросу
---@return нет
function medalsLib.SearchMedals(name, limit) end
