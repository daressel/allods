---@meta

--- CategoryLuaBulletinBoard
--- Методы и события Lua API, относящиеся к работе с доской объявлений. Методы предоставляются библиотекой bulletinBoard.

---@class luaBulletinBoardLib
luaBulletinBoard = {}

--- Проверяет, можно ли разместить новое объявление на доске в указанном разделе.
---@param postTypeId PostTypeId идентификатор раздела
---@return table
function luaBulletinBoard.CanAddText(postTypeId) end

--- Возвращает информацию об указанном объявлении на доске. Если объявление не найдено (например, было удалено), возвращается nil.
---@param postId integer идентификатор объявления
---@return table
function luaBulletinBoard.GetPost(postId) end

--- Возвращает информацию о цене платного сообщения.
---@return table|nil
function luaBulletinBoard.GetSectionInfos() end

--- Возвращает информацию о доступных разделах доски объявлений.
---@return table
function luaBulletinBoard.GetSectionInfos() end

--- Возвращает текст объявления на доске.
---@param postId integer идентификатор объявления
---@return WString|nil
function luaBulletinBoard.GetText(postId) end

--- Возвращает признак, выполняется ли операция с доской объявлений: размещение нового, редактирование или удаление существующего объявления. Начинать новую операцию до окончания предыдущей нельзя.
---@return boolean
function luaBulletinBoard.IsOperationInProgress() end

--- Возвращает информацию о содержимом указанного раздела доски объявлений. Если информации еще нет на клиенте, то отправляется запрос на сервер и возвращается nil. При получении информации приходит событие об изменении доски объявлений.
---@param postTypeId PostTypeId идентификатор раздела доски объявлений
---@return table
function luaBulletinBoard.ReadSection(postTypeId) end

-- Events

--- Событие присылается, если изменился известный набор объявлений на доске.
EVENT_BULLETIN_BOARD_CHANGED = "EVENT_BULLETIN_BOARD_CHANGED"

--- Событие присылается, если изменилось состояние операции с доской объявлений.
EVENT_BULLETIN_BOARD_OPERATION_IN_PROGRESS_CHANGED = "EVENT_BULLETIN_BOARD_OPERATION_IN_PROGRESS_CHANGED"

--- Событие присылается, если на доске объявлений появилось объявление.
EVENT_BULLETIN_BOARD_POST_ADDED = "EVENT_BULLETIN_BOARD_POST_ADDED"

--- Событие присылается, если на доске объявлений изменилось поле объявление (уровень, онлайн, зона, время).
EVENT_BULLETIN_BOARD_POST_CHANGED = "EVENT_BULLETIN_BOARD_POST_CHANGED"
