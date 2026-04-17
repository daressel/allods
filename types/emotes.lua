---@meta

--- CategoryEmotes
--- События и функции Lua API, относящиеся к проигрыванию эмоции персонажем главного игрока.

---@class emotesLib
emotes = {}

--- Привязывает запуск эмоции главного игрока к слоту экшен панели.
---@param emoteId ObjectId Id эмоции, привязываемой к слоту
---@param index integer индекс слота от 0 до max
function emotes.BindEmoteToActionPanel(emoteId, index) end

--- Сбрасывает эмоцию у главного игрока.
function emotes.ClearMood() end

--- Вернуть информацию об эмоции.
---@param index ObjectId id эмоции
---@return table|nil
function emotes.GetEmoteInfo(index) end

--- Возвращает список Id эмоций.
---@return table
function emotes.GetEmotes() end

--- Если у указанного игрока выставлено какое-либо настроение, то метод возвращает идентификатор эмоции, с помощью которой выставлено это настроение.
---@param unitId ObjectId идентификатор игрока, для которого надо получить эмоцию настроения
---@return ObjectId|nil
function emotes.GetMoodEmoteId(unitId) end

-- Events

--- Событие посылается каждый раз, когда изменилось состояние эмоций. В данный момент оно происходит при изменении возможности запуска (emoteInfo.canRun).
EVENT_EMOTES_CHANGED = "EVENT_EMOTES_CHANGED"

--- Приходит, если у какого-либо игрока изменилось настроение.
EVENT_UNIT_MOOD_CHANGED = "EVENT_UNIT_MOOD_CHANGED"
