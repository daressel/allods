---@meta

--- CategoryTutorialLib
--- Методы и события, относящиеся к достижениям.

--- Числовой енум.
ENUM_TutorialRunType_ClientData = "ENUM_TutorialRunType_ClientData"
ENUM_TutorialRunType_LevelUp = "ENUM_TutorialRunType_LevelUp"
ENUM_TutorialRunType_Custom = "ENUM_TutorialRunType_Custom"

--- Числовой енум.
ENUM_TutorialViewType_Window = "ENUM_TutorialViewType_Window"
ENUM_TutorialViewType_BlockerWindow = "ENUM_TutorialViewType_BlockerWindow"
ENUM_TutorialViewType_PopUp = "ENUM_TutorialViewType_PopUp"
ENUM_TutorialViewType_Custom = "ENUM_TutorialViewType_Custom"

---@class tutorialLibLib
tutorialLib = {}

--- Возвращает все категории обучения.
---@return TutorialCategoryId[]|nil
function tutorialLib.GetCategories() end

--- Возвращает идентификаторы всех обучений в заданной категории. В список не включаются обучения не прошедшие проверки по requiredContentKeys и excludeContentKeys.
---@param id TutorialCategoryId(ResourceId) идентификатор категории обучения
---@return table
function tutorialLib.GetCategoryContent(id) end

--- Возвращает информацию об категории обучения.
---@param id TutorialCategoryId(ResourceId) идентификатор категории обучения
---@return WString
function tutorialLib.GetCategoryInfo(id) end

--- Возвращает найденное по sysName обучение. Если обучение с таким sysName нет - вернет nil. Если таких обучений несколько - вернет первое найденное.
---@param sysName String
---@return any
function tutorialLib.GetTutorialBySysName(sysName) end

--- Возвращает содержимое обучения и данные необходимые для его отображения.
---@param id TutorialId(ResourceId) идентификатор обучения
---@return WString|nil
function tutorialLib.GetTutorialContent(id) end

--- Возвращает информацию об общих свойствах обучения.
---@param id TutorialId(ResourceId) идентификатор обучения
---@return String
function tutorialLib.GetTutorialInfo(id) end

--- Возвращает отображаемое название обучения.
---@param id TutorialId(ResourceId) идентификатор обучения
---@return WString|nil
function tutorialLib.GetTutorialName(id) end

--- Запрос поиска обучения. Результатом является появление события EVENT_TUTORIAL_SEARCH_RESULT
---@param request WString строка запроса
function tutorialLib.SearchTutorial(request) end

-- Events

--- Уведомление об инициировании показа обучения.
EVENT_TUTORIAL_REQUEST = "EVENT_TUTORIAL_REQUEST"

--- Срабатывает при выдаче результатов поиска обучения. Результат вызова tutorialLib.SearchTutorial( request ).
EVENT_TUTORIAL_SEARCH_RESULT = "EVENT_TUTORIAL_SEARCH_RESULT"
