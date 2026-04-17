---@meta

--- CategoryFamily
--- События и функции Lua API, относящиеся к браку, семье.

---@class familyLib
family = {}

--- Возвращает информацию о семейном заклинании.
---@param spellId SpellId идентификатор ресурса заклинания
---@return table|nil
function family.GetSpellInfo(spellId) end

--- Возвращает идентификатор супруга, если у игрока имеется семья, и информация о супруге доступна.
---@param unitId ObjectId идентификатор игрока
---@return ObjectId|nil
function family.GetSpouseId(unitId) end

--- Возвращает имя супруга, если у главного игрока имеется семья.
---@param unitId ObjectId идентификатор игрока
---@return WString|nil
function family.GetSpouseName(unitId) end

--- Возвращает true, если у игрока имеется семья.
---@param unitId ObjectId идентификатор игрока
---@return boolean
function family.IsExist(unitId) end

--- Проверяет является ли данный игрок супругом аватара.
---@param id ObjectId идентификатор игрока или его имя
---@return boolean
function family.IsSpouse(id) end

-- Events

--- Присылается в случае, если игрок вступил в брак.
EVENT_FAMILY_CREATED = "EVENT_FAMILY_CREATED"

--- Присылается в случае, если игрок развёлся (разрушил брак).
EVENT_FAMILY_DESTROYED = "EVENT_FAMILY_DESTROYED"

--- Присылается в случае, если изменился опыт, накопленный семейным заклинанием главного игрока.
EVENT_FAMILY_SPELL_EXPERIENCE_CHANGED = "EVENT_FAMILY_SPELL_EXPERIENCE_CHANGED"

--- Присылается в случае, если изменился список семейных заклинания главного игрока.
EVENT_FAMILY_SPELLS_CHANGED = "EVENT_FAMILY_SPELLS_CHANGED"

--- Событие присылается при изменение координат игрока, состоящего в браке с основным игроком.
EVENT_SPOUSE_POSITION_UPDATED = "EVENT_SPOUSE_POSITION_UPDATED"
