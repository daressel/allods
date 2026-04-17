---@meta

--- CategoryClassSpecific
--- События и функции Lua Api, относящиеся к специальным способностям каких-либо игровых классов (сталкер, псионик, воин и т.п.).

---@class classSpecificLib
classSpecific = {}

--- Возвращает начальную длительность барьеров (паладина) в миллисекундах.
---@return number
function classSpecific.GetBarriersDelay() end

--- Возвращает информацию о барьерах (паладина).
---@return table
function classSpecific.GetBarriersInfo() end

--- Главный герой псионик может установить псионический контакт с несколькими целями. Каждый псионический контакт определенного типа может быть установлен с одной целью.
function classSpecific.GetPsionicContacts() end

--- Метод возвращает список стрел в колчане сталкера.
function classSpecific.GetStalkerCartridge() end

--- Метод возвращает информацию о геймдизайнерской переменной и её значение у главного игрока.
---@param variableId VariableId или идентификатор ресурса переменной или алиас
---@return table|nil
function classSpecific.GetVariableInfo(variableId) end

--- У игрока могут быть некоторые гейммеханические переменные (например, количество Сил Льда у мага). Этот метод возвращает список идентификаторов этих переменных.
---@return table
function classSpecific.GetVariables() end

--- Метод возвращает величину боевого духа война.
function classSpecific.GetWarriorCombatAdvantage() end

--- Псионики могут писать и просматривать классовый канал чата. Этот метод возвращает true, если главный игрок имеет доступ к такому каналу.
function classSpecific.HasPsionicChannel() end

--- Согласиться или отказаться от оживления главного инрока в ответ на EVENT_RESSURECT_REQUESTED.
---@param accept boolean true, если главный игрок согласен на оживление. Иначе false.
function classSpecific.ResurrectReply(accept) end

-- Events

--- Событие приходит при любом изменении состояния барьеров (паладина).
EVENT_AVATAR_BARRIERS_CHANGED = "EVENT_AVATAR_BARRIERS_CHANGED"

--- Событие посылается каждый раз, когда меняется доступ в классовый канал чата псиоников.
EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED = "EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED"

--- Событие посылается каждый раз, когда у псионика (основного игрока) появляется псионический контакт.
EVENT_AVATAR_PSIONIC_CONTACT_ADDED = "EVENT_AVATAR_PSIONIC_CONTACT_ADDED"

--- Событие посылается каждый раз, когда у псионика (основного игрока) меняется состояние (цель или длительность (durationMs, но не remainingMs)) определенного псионического контакта.
EVENT_AVATAR_PSIONIC_CONTACT_CHANGED = "EVENT_AVATAR_PSIONIC_CONTACT_CHANGED"

--- Событие посылается каждый раз, когда у псионика (основного игрока) исчезает псионический контакт.
EVENT_AVATAR_PSIONIC_CONTACT_REMOVED = "EVENT_AVATAR_PSIONIC_CONTACT_REMOVED"

--- Событие приходит периодически, когда псионик определяет, что около него есть вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка). Периодичность события определяется серверной механикой.
EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED = "EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED"

--- Событие посылается каждый раз, когда псионик определяет, что его поселектил вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка).
EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET = "EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET"

--- Событие посылается каждый раз, когда псионик читает мысли другого игрока или NPC. Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
EVENT_AVATAR_PSIONIC_READ_THOUGHT = "EVENT_AVATAR_PSIONIC_READ_THOUGHT"

--- Событие посылается каждый раз, когда псионик читает мысли другого игрока, но не может их понять (противоположная фракция). Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT = "EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT"

--- Событие посылается каждый раз, когда у сталкера (основного игрока) меняется что-либо в колчане.
EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED = "EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED"

--- Событие посылается каждый раз, когда у основного игрока-война (Warrior) меняется боевой дух.
EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED = "EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED"

--- Этот запрос посылается, когда кто-то пытается оживить главного игрока, и игрок не успел ответить avatar.ResurrectReply( accept ).
EVENT_RESURRECT_REJECTED = "EVENT_RESURRECT_REJECTED"

--- Этот запрос посылается, когда кто-то пытается оживить главного игрока. В ответ игрок должен ответить avatar.ResurrectReply( accept ). Если игрок не успеет, то прийдёт EVENT_RESURRECT_REJECTED.
EVENT_RESURRECT_REQUESTED = "EVENT_RESURRECT_REQUESTED"

--- Событие присылается при изменении значения геймдизайнерской переменной главного игрока.
EVENT_VARIABLE_VALUE_CHANGED = "EVENT_VARIABLE_VALUE_CHANGED"
