---@meta

---@class familyLib
family = {}

---@class FamilyGetSpellInfoResult
---@field experience integer накопленный опыт
---@field level integer уровень заклинания (зависит от накопленного опыта)
---@field levelExperience integer опыт, необходимый для получения текущего уровня
---@field nextLevelExperience integer опыт, необходимый для получения следующего уровня

---Возвращает информацию о семейном заклинании.
---@param spellId SpellId идентификатор ресурса заклинания
---@return FamilyGetSpellInfoResult
function family.GetSpellInfo(spellId) end

---Возвращает идентификатор супруга, если у игрока имеется семья, и информация о супруге доступна.
---@param unitId ObjectId идентификатор игрока
---@return ObjectId|nil
function family.GetSpouseId(unitId) end

---Возвращает имя супруга, если у главного игрока имеется семья.
---@param unitId ObjectId идентификатор игрока
---@return string|nil
function family.GetSpouseName(unitId) end

---Возвращает true, если у игрока имеется семья.
---@param unitId ObjectId идентификатор игрока
---@return boolean
function family.IsExist(unitId) end

---Проверяет является ли данный игрок супругом аватара.
---@param id ObjectId|string идентификатор игрока или его имя
---@return boolean
function family.IsSpouse(id) end
