---@meta

---@class remortLib
remort = {}

---@class RemortGetAbilitiesForSharingResult
---@field abilityId AbilityId|nil -- идентификатор ресурса умения
---@field spellId SpellId|nil -- идентификатор ресурса заклинания
---@field isSelected Boolean -- выбрано(расшарено) в данный момент

---@class RemortGetClassAbilitiesForSharingResult
---@field abilityId AbilityId|nil -- идентификатор ресурса умения
---@field spellId SpellId|nil -- идентификатор ресурса заклинания
---@field isSelected Boolean -- выбрано(расшарено) в данный момент

---@class RemortGetRemortsListResult
---@field name string имя персонажа
---@field avatarServerId integer серверный идентификатор персонажа
---@field isActive boolean это активный в данный момент персонаж
---@field isPrimary boolean это главный персонаж
---@field level integer уровень персонажа
---@field sysClassName string|nil внутрисистемное имя класса персонажа, нелокализуемая строка
---@field sysRaceName string|nil внутрисистемное имя расы персонажа, нелокализуемая строка

---@class RemortGetRequirementsResult
---@field switchConditions RequirementsTable список условий для перехода в другое тело
---@field createConditions RequirementsTable список условий для создания альтернативного тела
---@field resetConditions RequirementsTable список условий для сброса параметров имеющегося альтернативного тела

---Возвращает true, если можно получить список альтернативных персонажей, на которых может переключиться главный игрок.
---@return boolean
function remort.CanGetRemortsList() end

---Расшаривает умения и заклинания главного игрока для использования альтом.
---@return нет
function remort.ChooseSharedAbilities() end

---Возвращает список умений, которые может расшарить главный игрок для использования своим альтом (реморт).
---@return RemortGetAbilitiesForSharingResult
function remort.GetAbilitiesForSharing() end

---Возвращает список умений, который в принципе может расшарить игрок с указанным классом для использования своим альтом (реморт).
---@param classId CharacterClassId идентификатор ресурса класса игрока
---@return RemortGetClassAbilitiesForSharingResult
function remort.GetClassAbilitiesForSharing(classId) end

---Возвращает информацию о требованиях расы при создании реморта.
---@return table|nil, если нет ошибки, то таблица с ключом типа string и значением RequirementsTable
function remort.GetCreateRemortRequirements() end

---Возвращает имя основного персонажа, если игрок является альтернативным персонажем.
---@param unitId ObjectId идентификатор игрока
---@return string|nil
function remort.GetMainName(unitId) end

---Возвращает список альтернативных персонажей, на которых может переключиться главный игрок. Можно вызывать только после прихода  EVENT_REMORT_LIST_GAINED.
---@return RemortGetRemortsListResult
function remort.GetRemortsList() end

---Возвращает информацию о требованиях к использованию некоторых действий, связанных с ремортом.
---@return RemortGetRequirementsResult
function remort.GetRequirements() end

---Возвращает информацию о требованиях расы при пересоздании реморта.
---@return table|nil, если нет ошибки, то таблица с ключом типа string и значением RequirementsTable
function remort.GetResetRemortRequirements() end

---Возвращает количество умений, которые может расшарить главный игрок для использования своим альтом (реморт).
---@return integer
function remort.GetSharedAbilitiesCount() end

---Возвращает true, если игрок является альтернативным персонажем.
---@param unitId ObjectId идентификатор игрока
---@return boolean
function remort.IsAlt(unitId) end

---Переключиться на другого  альтернативного персонажа. Можно вызывать только после прихода  EVENT_REMORT_LIST_GAINED.
---@param name string имя персонажа
---@param anonymous boolean true, если хотим переключиться анонимно
---@return нет
function remort.SwitchRemort(name, anonymous) end
