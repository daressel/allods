---@meta

---@class objectsLib
objects = {}

---@class ObjectsGetTrackInfoResult
---@field id ObjectId идентификатор Track-а
---@field objectId ObjectId|nil идентификатор отслеживаемого объекта, может отсутствовать
---@field playerName string имя объекта (например, игрока)
---@field text string описание объекта. Может быть шаблоном строки
---@field sysName string техническая спецификация Track-а
---@field characterClass CharacterClassId|nil класс персонажа, если доступен
---@field level integer|0 уровень персонажа
---@field durationMs integer сколько миллисекунд полностью длится отслеживание
---@field remainingMs integer сколько миллисекунд осталось до окончания отслеживания
---@field image TextureId|nil текстура с иконкой объекта

---Возвращает описание "отслеживаемого" объекта - Track - в зоне игрока. Такие объекты, например, могут обозначать хорунжего или т.п. См. также  GamePosition - позиция объекта,  MutationInfo - информация о мутации.
---@param objectId ObjectId идентификатор Track-а
---@return ObjectsGetTrackInfoResult
function objects.GetTrackInfo(objectId) end

---Получить список отслеживаемых объектов Track в зоне действия аватар.
---@return ObjectId[]
function objects.GetTracks() end
