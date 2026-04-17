---@meta

--- CategoryFaction
--- События и функции Lua API, относящиеся к работе с фракциями.

--- Варианты выбора фракции прайденом
--- Лига
ENUM_PridenFactionChoice_League = "ENUM_PridenFactionChoice_League"
--- Империя
ENUM_PridenFactionChoice_Empire = "ENUM_PridenFactionChoice_Empire"

---@class factionLib
faction = {}

--- Получить дополнительные данные о фракции
---@param factionId FactionId
---@return table
function faction.GetFactionInfo(factionId) end

--- Получить у аватара информацию о репутации с фракцией.
---@param factionId FactionId фракция
---@return table
function faction.GetReputationInfo(factionId) end

--- Получить значение репутации соответствующее уровню репутации.
---@param reputationLevel integer уровень репутации
---@return number
function faction.GetReputationValue(reputationLevel) end

--- Получить время(когда?) автоматической отправки группы в активность. Время возвращается в формате LuaFullDateTime.
---@param eventId ObjectId идентификатор активности в которую собирается группа
---@return table
function faction.GetAutoDepartTime(eventId) end

--- Получить информацию о достижениях участников текущего или только что закончившегося инстанс-ивента. Информация доступна автоматически сразу после завершения инстанс-ивента либо может быть получена запросом  matchMaking.ListenEventProgress() (закрытая ссылка). В обоих случаях приходит сообщение  EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED.
---@return table|nil
function faction.GetEventProgressInfo() end

--- Получить информацию о текущих боевых ролях персонажей в группе.
---@param eventId ObjectId|nil идентификатор активности в которую собирается группа, nil - если нужно узнать роли в текущей активности, в которой находится игрок
---@return table
function faction.GetMembersRoles(eventId) end

--- Возвращает информацию о бонусах более слабой фракции на шарде.
---@return table|nil
function faction.GetWeakFactionBonus() end

--- Возвращает информацию о более слабой фракции на шарде, которой выдаются какие-то дополнительные бонусы.
---@return FactionId|nil
function faction.GetWeakFactionId() end

--- Получить фракцию юнита.
---@param unitId ObjectId
---@return FactionId
function faction.GetFactionId(unitId) end

-- Events

--- Событие посылается при старте изменения фракции (прайденов).
EVENT_PRIDEN_FACTION_CHOICE = "EVENT_PRIDEN_FACTION_CHOICE"

--- Уведомление об изменении уровня репутации.
EVENT_REPUTATION_LEVEL_CHANGED = "EVENT_REPUTATION_LEVEL_CHANGED"

--- Уведомление об изменении значения репутации.
EVENT_REPUTATION_VALUE_CHANGED = "EVENT_REPUTATION_VALUE_CHANGED"

--- Событие присылается при изменинии фракции юнита.
EVENT_UNIT_FACTION_CHANGED = "EVENT_UNIT_FACTION_CHANGED"
