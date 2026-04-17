---@meta

--- CategoryQuestionLib
--- События и функции Lua API, относящиеся к вопросам, задаваемым игроку через унифицированный механизм.

---@class questionLibLib
questionLib = {}

--- Извещает сервер, что ответа на вопрос не будет.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
function questionLib.Cancel(questionId) end

--- Выдаёт информацию о вопросе с соответствующим идентификатором, на которые в данный момент ожидается ответ от игрока.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
---@return table
function questionLib.GetInfo(questionId) end

--- Выдаёт список вопросов, на которые в данный момент ожидается ответ от игрока.
---@return table
function questionLib.GetQuestions() end

--- Передаёт информацию об ответе на вопрос с соответствующим идентификатором, на которые в данный момент ожидается ответ от игрока.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
---@param result table таблица с информацией, набор и значения полей зависят от типа вопроса (см. поле type questionLib.GetInfo( questionId ) и CategoryQuestionType)
function questionLib.SendData(questionId, result) end

-- Events

--- Уведомление о появлении нового вопроса.
EVENT_QUESTION_ADDED = "EVENT_QUESTION_ADDED"

--- Уведомление об удалении вопроса.
EVENT_QUESTION_REMOVED = "EVENT_QUESTION_REMOVED"

--- Уведомление о появлении новых результатов массового опроса.
EVENT_QUESTION_RESULTS_CHANGED = "EVENT_QUESTION_RESULTS_CHANGED"
