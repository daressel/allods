---@meta

--- CategorySpellLib
--- События и функции Lua API, относящиеся к заклинаниям(умениям).

--- Константы типа страницы спеллбука для интерфейса:
--- боевые спеллы
---@type integer
SPELLBOOK_PAGE_NORMAL = nil
--- спеллы Покровителя
---@type integer
SPELLBOOK_PAGE_HALO = nil
--- семейные спеллы
---@type integer
SPELLBOOK_PAGE_SPOUSE = nil
--- небоевые и прочие спеллы
---@type integer
SPELLBOOK_PAGE_OTHER = nil

---@class spellLibLib
spellLib = {}

--- Получить id спелла, переключающего специализацию (билд) аватара. Используется для получения информации об условиях переключения.
---@return QuestId
function spellLib.GetBuildSwitchSpell() end

--- Возвращает заклинание телепортации в оплот гильдии, если оно существует.
---@return SpellId|nil
function spellLib.GetTeleportSpell() end

--- Возвращает идентификатор спелла, используемого для передачи корабля. Для каста спеллу нужна цель - аватар, которому передаётся корабль.
function spellLib.GetLendShipSpellId() end

--- Возвращает идентификатор спелла, используемого для возврата одолженного корабля его хозяину.
function spellLib.GetReturnLendedShipSpellId() end

--- Возвращает информацию о возможности пуска заклинания (игнорируя текущее действие, кулдаун и ограничения цели).
---@param id SpellId Id умения
---@param ignoreCasterResources boolean|nil игнорировать проверку предикатов CasterResources, по-умолчанию false
---@return boolean
function spellLib.CanRunAvatar(id, ignoreCasterResources) end

--- Возвращает информацию о возможности пуска заклинания (игнорируя вообще всё, кроме неизменяемых свойств главного игрока(раса/пол/фракция/класс)).
---@param id SpellId Id умения
---@return boolean
function spellLib.CanRunAvatarEx(id) end

--- Возвращает список групп, к которым принадлежит заклинание.
---@param id SpellId Id умения
---@return table|nil
function spellLib.GetActionGroups(id) end

--- Возвращает список дополнительных описаний групп, к которым принадлежит заклинание.
---@param id SpellId Id умения
---@return table
function spellLib.GetActionGroupsDescriptions(id) end

--- Возвращает информацию о о AEMark типа AEMarkSector у спелла.
---@param id SpellId Id умения
---@return nil
function spellLib.GetAESectorProps(id) end

--- Возвращает информацию о таймерах повторного использования заклинания по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellLib.GetCooldown(id) end

--- Возвращает информацию о текущих значениях динамически меняющихся характеристик умения по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellLib.GetCurrentValues(id) end

--- Возвращает базовое текстовое описание заклинания по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellLib.GetDescription(id) end

--- Возвращает таблицу подстановочных значений для описания умения
---@param id SpellId Id умения
---@return nil
function spellLib.GetDescriptionParams(id) end

--- Ищет на аватаре экземпляр бафа максимальной длительности с ресурсом совпадающим с durationBuff спелла. В случае успеха возвращает id экземпляра бафа. Если такого бафа на аватаре нет или спелл в принципе не имеет такого бафа - возвращает nil.
---@param id SpellId Id умения
---@return ObjectId|nil
function spellLib.GetDurationBuff(id) end

--- Возвращает информацию о текстуре для иконки заклинания по его идентификатору.
---@param id SpellId Id умения
---@return TextureId|nil
function spellLib.GetIcon(id) end

--- Возвращает SpellId умения по идентификатору объекта умения, имеющегося в спеллбуке.
---@param objectId ObjectId Id объекта умения.
---@return SpellId
function spellLib.GetObjectSpell(objectId) end

--- Возвращает информацию о базовых значениях статических свойств умения по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellLib.GetProperties(id) end

--- Возвращает список бафов, требующихся для применения умения.
---@param id SpellId Id умения
---@return table
function spellLib.GetRequiredBuffs(id) end

--- Возвращает список предметов, требующихся для применения умения.
---@param id SpellId Id умения
---@return table
function spellLib.GetRequiredResources(id) end

--- Возвращает информацию о требованиях к использованию заклинания.
---@param id SpellId Id умения
---@return table|nil
function spellLib.GetRequirements(id) end

--- Возвращает информацию о динамическом состоянии заклинании по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellLib.GetState(id) end

--- Проверяет имеет ли спелл durationBuff (в ресурсе). Проверяет только ресурс, константно для заданного спелла. Не ищет какие-либо бафы на каких-либо объектах.
---@param id SpellId Id умения
---@return boolean
function spellLib.HasDurationBuff(id) end

--- Возвращает новый экземпляр ValuedObject для заклинания.
function GetValuedObject() end
