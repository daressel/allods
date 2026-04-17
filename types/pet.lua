---@meta

--- CategoryPet
--- События и функции Lua Api, относящиеся к петам.

---@class petLib
pet = {}

--- Возвращает индекс активного заклинания пета аватара.
---@return number
function pet.GetPetActiveSpell() end

--- Возвращает текущий тип поведения пета аватара. Типы см. avatar.SetPetAggroMode( mode )
---@return number
function pet.GetPetAggroMode() end

--- Возвращает текущий тип движения пета аватара. Типы см. avatar.SetPetMoveMode( mode )
---@return number
function pet.GetPetMoveMode() end

--- Возвращает список идентификаторов ресурсов переключаемых заклинаний пета аватара.
---@return table
function pet.GetPetSpells() end

--- Возвращает true, если активный пет главного игрока находится в состоянии боя. Иначе возвращает false.
---@return boolean
function pet.IsPetInCombat() end

--- Агрит пета аватара на цель.
function pet.PetAttack() end

--- Устанавливает активное заклинание для пета аватара.
---@param index integer индекс заклинания
function pet.SetPetActiveSpell(index) end

--- Возвращает информацию о пете персонажа, если персонаж - активный игрок или член его группы.
---@param unitId ObjectId
function pet.GetActivePet(unitId) end

--- Возвращает хозяина, которому подчинен объект (пет, ассистент, турель и т.п.).
---@param unitId ObjectId идентификатор игрока
function pet.GetFollowerMaster(unitId) end

--- Возвращает список юнитов, подчинённых персонажу (петы, ассистенты, турель и т.п.).
---@param unitId ObjectId идентификатор игрока
function pet.GetFollowers(unitId) end

--- Возвращает имя моба-пета игрока. Если персонаж не является петом (который может иметь имя) игрока - возвращается nil. Работает только для мобов.
---@param unitId ObjectId
---@return WString|nil
function pet.GetPetName(unitId) end

--- Возвращает информацию о владельца пета.
---@param unitId ObjectId
function pet.GetPetOwner(unitId) end

--- Возвращает true, если указанный юнит - чей-то пет.
---@param unitId ObjectId
function pet.IsPet(unitId) end

--- Установливает для пета аватара тип поведения:
function SetPetAggroMode() end

--- Установливает для пета аватара тип движения:
function SetPetMoveMode() end

-- Events

--- Событие посылается каждый раз, когда у главного игрока меняется активный пет.
EVENT_ACTIVE_PET_CHANGED = "EVENT_ACTIVE_PET_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется активный пет. Близкий аналог EVENT_ACTIVE_PET_CHANGED.
EVENT_ACTIVE_PET_EXIST_CHANGED = "EVENT_ACTIVE_PET_EXIST_CHANGED"

--- Событие посылается каждый раз, когда у активного пета главного игрока меняется список или активное заклинание.
EVENT_ACTIVE_PET_SPELLS_CHANGED = "EVENT_ACTIVE_PET_SPELLS_CHANGED"

--- Событие посылается каждый раз, когда у активного пета главного игрока меняется внутреннее состояние (тип движения, атаки или состояние боя).
EVENT_ACTIVE_PET_STATE_CHANGED = "EVENT_ACTIVE_PET_STATE_CHANGED"

--- Событие посылается каждый раз, когда у члена группы главного игрока меняется активный пет.
EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED = "EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED"

--- Событие посылается каждый раз, когда у какого-либо пета, находящегося в области видимости главного игрока, меняется имя или пол.
EVENT_PET_INFO_CHANGED = "EVENT_PET_INFO_CHANGED"

--- Событие посылается каждый раз, когда у какого-либо игрока меняется список подчинённых юнитов (петы, ассистенты, турели и т.п.).
EVENT_UNIT_FOLLOWERS_LIST_CHANGED = "EVENT_UNIT_FOLLOWERS_LIST_CHANGED"
