---@meta

--- CategoryQuestionType
--- Типы вопросов, задаваемым игроку через унифицированный механизм, реализованный в CategoryQuestionLib.

---@class questionTypeLib
questionType = {}

--- Выдаёт информацию о вопросе с соответствующим идентификатором, на которые в данный момент ожидается ответ от игрока.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
---@return table
function questionType.GetInfo(questionId) end
