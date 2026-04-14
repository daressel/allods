---@meta

---@class questionLibLib
questionLib = {}

---@class QuestionLibGetInfoResult
---@field id ObjectId идентификатор вопроса
---@field isObserver boolean если true то игрок не участвует в голосовании, а только наблюдает за его ходом
---@field type string идентификатор типа вопроса
---@field showResults Number как нужно отображать результаты голосования
---@field clientData table или nil nil если нет информации; иначе таблица, аналогичная полю values события EVENT_CLIENT_MESSAGE
---@field questionData table описание данных из ресурса вопроса. Таблица с полями:
---@field questionCustomData table или nil nil если нет информации, иначе таблица, формат которой зависит от типа вопроса (см. CategoryQuestionType)
---@field remainingTimeMs number время в миллисекундах, оставшееся до потери вопросом актуальности; nil если ограничения по времени нет
---@field endTimeMs number дата окончания опроса в миллисекундах
---@field results table или nil результатом опроса("кто как проголосовал?"), представляет собой массив(индексация начинается 1), каждый элемент которого таблица с полями
---@field playerId ObjectId|nil идентификатор игрока, если есть
---@field playerName string|nil имя игрока, если есть(голосование может быть анонимным)
---@field clientData table таблица аналогичная полю values события EVENT_CLIENT_MESSAGE

---Извещает сервер, что ответа на вопрос не будет.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
---@return нет
function questionLib.Cancel(questionId) end

---Выдаёт информацию о вопросе с соответствующим идентификатором, на которые в данный момент ожидается ответ от игрока.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
---@return QuestionLibGetInfoResult
function questionLib.GetInfo(questionId) end

---Выдаёт список вопросов, на которые в данный момент ожидается ответ от игрока.
---@return table
function questionLib.GetQuestions() end

---Передаёт информацию об ответе на вопрос с соответствующим идентификатором, на которые в данный момент ожидается ответ от игрока.
---@param questionId ObjectId идентификатор вопроса, должен быть одним из списка, получаемого посредством questionLib.GetQuestions()
---@param result table таблица с информацией, набор и значения полей зависят от типа вопроса (см. поле type questionLib.GetInfo( questionId ) и CategoryQuestionType)
---@return нет
function questionLib.SendData(questionId, result) end
