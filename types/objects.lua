---@meta

--- CategoryObjects
--- События и функции Lua Api, относящиеся к объектам вокру главного игрока. В основном в этой категории модержатся методы получения списков объектов и информации по примитивным объектам (SOS, Track и т.п.), не принадлежащим более конкретным категориям (CategoryUnit, CategoryDevice и т.п.).

---@class objectsLib
objects = {}

--- Возвращает описание "отслеживаемого" объекта - Track - в зоне игрока. Такие объекты, например, могут обозначать хорунжего или т.п.
---@param objectId ObjectId идентификатор Track-а
---@return table|nil
function objects.GetTrackInfo(objectId) end

--- Получить список отслеживаемых объектов Track в зоне действия аватар.
---@return table
function objects.GetTracks() end

-- Events

--- Событие посылается, если в зоне действия аватара появился отслеживаемый объект Track.
EVENT_TRACK_ADDED = "EVENT_TRACK_ADDED"

--- Событие посылается, если отслеживаемый объект Track изменился(поле '''objectId''' в ответе функции  objects.GetTrackInfo( trackId )).
EVENT_TRACK_OBJECT_CHANGED = "EVENT_TRACK_OBJECT_CHANGED"

--- Событие посылается, если отслеживаемый объект Track изменил позицию.
EVENT_TRACK_POS_CHANGED = "EVENT_TRACK_POS_CHANGED"

--- Событие посылается, если в зоне действия аватара исчез отслеживаемый объект Track.
EVENT_TRACK_REMOVED = "EVENT_TRACK_REMOVED"
