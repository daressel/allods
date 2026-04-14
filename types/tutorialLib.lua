---@meta

---@class tutorialLibLib
tutorialLib = {}

---@class TutorialLibGetCategoryInfoResult
---@field sysName String -- системное имя категории
---@field isHidden Boolean -- является ли категория скрытой

---@class TutorialLibGetTutorialContentResult
---@field section string имя секции
---@field name string имя бинда
---@field text ValuedText короткий текст всплывающего сообщения
---@field target string системное имя целевого виджета для всплывающего сообщения

---@class TutorialLibGetTutorialInfoResult
---@field viewType Number(Enum_TutorialViewType) -- тип отображения обучения
---@field runType Number(Enum_TutorialRunType) -- тип запуска обучения
---@field isForced Boolean -- игнорирует отключение
---@field isUnlearnable Boolean -- нельзя выучить
---@field minLevel Number(int) -- минимальный уровень
---@field maxLevel Number(int) -- максимальный уровень
---@field nextTutorial TutorialId|nil следующее обучение в цепочке
---@field runTimeout Number(int) -- время показа обучения при бездействии пользователя

---Возвращает все категории обучения.
---@return TutorialCategoryId|nil -[]
function tutorialLib.GetCategories() end

---Возвращает идентификаторы всех обучений в заданной категории. В список не включаются обучения не прошедшие проверки по requiredContentKeys и excludeContentKeys.
---@param id TutorialCategoryId идентификатор категории обучения
---@return TutorialId|nil[]
function tutorialLib.GetCategoryContent(id) end

---Возвращает информацию об категории обучения.
---@param id TutorialCategoryId идентификатор категории обучения
---@return TutorialLibGetCategoryInfoResult
function tutorialLib.GetCategoryInfo(id) end

---Возвращает найденное по sysName обучение. Если обучение с таким sysName нет - вернет nil. Если таких обучений несколько - вернет первое найденное.
---@param sysName string|nil -- системное имя обучения
---@return TutorialId|nil
function tutorialLib.GetTutorialBySysName(sysName) end

---Возвращает содержимое обучения и данные необходимые для его отображения.
---@param id TutorialId идентификатор обучения
---@return TutorialLibGetTutorialContentResult
function tutorialLib.GetTutorialContent(id) end

---Возвращает информацию об общих свойствах обучения.
---@param id TutorialId идентификатор обучения
---@return TutorialLibGetTutorialInfoResult
function tutorialLib.GetTutorialInfo(id) end

---Возвращает отображаемое название обучения.
---@param id TutorialId идентификатор обучения
---@return string|nil
function tutorialLib.GetTutorialName(id) end

---Запрос поиска обучения. Результатом является появление события EVENT_TUTORIAL_SEARCH_RESULT Поиск выполняется в обучениях по полям name, "text и shortText, кроме тех что имеют значение поля isUnlearnable равное true. Так же поиск выполняется по именам категорий, кроме тех что имею значение поля isHidden равное true.
---@param request string строка запроса
---@return нет
function tutorialLib.SearchTutorial(request) end
