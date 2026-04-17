---@meta

--- CategoryGuildTalents
--- События и функции Lua API, относящиеся к работе с гильдейскими талантами (и близкие к этому).

--- Константы типов таланатов гильдии.
ENUM_TalentType_GUILD = "ENUM_TalentType_GUILD"
ENUM_TalentType_BOSS = "ENUM_TalentType_BOSS"
ENUM_TalentType_GUILDHALL = "ENUM_TalentType_GUILDHALL"

---@class guildTalentsLib
guildTalents = {}

--- Выучить помеченные таланты и вехи.
function guildTalents.ApplyStoredTalents() end

--- Можно ли сбросить веху из поля талантов гильдии за альтвалюту.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return boolean
function guildTalents.CanDropTalent(field, row, column) end

--- Возвращает возможность и условия изучения таланта гильдии.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@param talentType integer|nil тип таланата, по-умолчанию ENUM_TalentType_GUILD
---@return table|nil
function guildTalents.CanLearnTalent(field, row, column, talentType) end

--- Сбрасывание выбранных на изучение вех.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function guildTalents.ClearStoredTalents(field, row, column) end

--- Cбросить веху из поля талантов гильдии за альтвалюту.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function guildTalents.DropTalent(field, row, column) end

--- Получить размер поля талантов.
---@return table
function guildTalents.GetFieldTalentTableSize() end

--- Цена забывания таланта.
---@return integer
function guildTalents.GetDropTalentCost() end

--- Получить информацию о поле талантов гильдии.
---@param field integer номер поля
---@return table
function guildTalents.GetFieldInfo(field) end

--- Возвращает количество выбранных на изучение вех.
---@return integer
function guildTalents.GetStoredTalentsCount() end

--- Получить информацию о таланте гильдии из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return table
function guildTalents.GetTalentInfo(field, row, column) end

--- Возвращает координаты всех абилок заданной группы/
---@param groupName string имя группы
---@return table
function guildTalents.GetTalentsByGroup(groupName) end

--- Установлен ли талант на изучение
---@param field int поле
---@param row int ряд
---@param column int колонка
---@return boolean
function guildTalents.IsStoredTalent(field, row, column) end

--- Пометить для изучения веху из поля талантов гильдии.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function guildTalents.StoreTalent(field, row, column) end

-- Events

--- Событие присылается, когда изменились таланты гильдии.
EVENT_GUILD_TALENTS_CHANGED = "EVENT_GUILD_TALENTS_CHANGED"
