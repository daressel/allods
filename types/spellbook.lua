---@meta

--- CategorySpellbook
--- События и функции Lua Api, относящиеся к кники умений.

--- Типы урона (действия заклинаний или атаки).
ENUM_SubElement_PHYSICAL = "ENUM_SubElement_PHYSICAL"
ENUM_SubElement_FIRE = "ENUM_SubElement_FIRE"
ENUM_SubElement_COLD = "ENUM_SubElement_COLD"
ENUM_SubElement_LIGHTNING = "ENUM_SubElement_LIGHTNING"
ENUM_SubElement_HOLY = "ENUM_SubElement_HOLY"
ENUM_SubElement_SHADOW = "ENUM_SubElement_SHADOW"
ENUM_SubElement_ASTRAL = "ENUM_SubElement_ASTRAL"
ENUM_SubElement_POISON = "ENUM_SubElement_POISON"
ENUM_SubElement_DISEASE = "ENUM_SubElement_DISEASE"
ENUM_SubElement_ACID = "ENUM_SubElement_ACID"

---@class spellbookLib
spellbook = {}

--- Сбрасывает подготовленное заклинание.
---@param spellId SpellId идентификатор заклинания
function spellbook.DropSpell(spellId) end

--- Возвращает список Id пассивных умений. Список активных умений и заклинаний можно получить, используя avatar.GetSpellBook().
---@return table
function spellbook.GetAbilities() end

--- Возвращает информацию об абилке по идентификатору её ресурса.
---@param id AbilityId Id ресурса умения
---@return nil
function spellbook.GetAbilityInfo(id) end

--- Возвращает подменяющее заклинание абилке по идентификатору её ресурса.
---@param id AbilityId идентификатор ресурса умения
---@return SpellId|nil
function spellbook.GetAbilityReplacementSpell(id) end

--- Возвращает подменяющее заклинание абилке по идентификатору её ресурса.
---@param id AbilityId идентификатор ресурса умения
---@return SpellId[]|nil
function spellbook.GetAbilityReplacementSpells(id) end

--- Возвращает заклинания из указанной группы, принадлежащие указанному классу.
---@param actionGroupId ActionGroupId идентификатор ресурса группы заклинаний
---@param characterClassId CharacterClassId идентификатор ресурса класса игрока
---@return table
function spellbook.GetActionGroupSpells(actionGroupId, characterClassId) end

--- Выдаёт информацию о бонусе к статам аватара при использовании заклинаний из группы actionGroupId.
---@param actionGroupId ActionGroupId Id группы заклинаний
---@return table|nil
function spellbook.GetActionGroupStatBonus(actionGroupId) end

--- Возвращает список Id умений и заклинаний аватара. пассивные умения можно получить, используя avatar.GetAbilities().
---@return table
function spellbook.GetSpellBook() end

--- Проверка наличия спелла у аватара. Смотрит в спеллбук, если спелл является специальным и не выдается в спеллбук, то вернет false.
---@return boolean
function spellbook.HasSpell() end

--- Начинает подготавливать заклинание.
---@param spellId SpellId идентификатор заклинания
function spellbook.PrepareSpell(spellId) end

--- Начинает сотворение заклинания в указанную точку на карте. См. также  GamePosition.
---@param spellId SpellId идентификатор заклинания
---@param position table
function spellbook.RunAESpell(spellId, position) end

--- Начинает сотворение заклинания на цель по умолчанию.
---@param spellId SpellId идентификатор заклинания
function spellbook.RunSpell(spellId) end

--- Возвращает таблицу с информацией о бонусах, даваемых предметом к группам заклинаний.
---@param itemId ObjectId идентификатор предмета
---@return tables[]|nil
function spellbook.GetActionGroupsInfo(itemId) end

--- Возвращает информацию о возможности пуска заклинания (игнорируя текущее действие, кулдаун и ограничения цели).
---@param id SpellId Id умения
---@param ignoreCasterResources boolean|nil игнорировать проверку предикатов CasterResources, по-умолчанию false
---@return boolean
function spellbook.CanRunAvatar(id, ignoreCasterResources) end

--- Возвращает информацию о возможности пуска заклинания (игнорируя вообще всё, кроме неизменяемых свойств главного игрока(раса/пол/фракция/класс)).
---@param id SpellId Id умения
---@return boolean
function spellbook.CanRunAvatarEx(id) end

--- Возвращает список групп, к которым принадлежит заклинание.
---@param id SpellId Id умения
---@return table|nil
function spellbook.GetActionGroups(id) end

--- Возвращает список дополнительных описаний групп, к которым принадлежит заклинание.
---@param id SpellId Id умения
---@return table
function spellbook.GetActionGroupsDescriptions(id) end

--- Возвращает информацию о о AEMark типа AEMarkSector у спелла.
---@param id SpellId Id умения
---@return nil
function spellbook.GetAESectorProps(id) end

--- Возвращает информацию о таймерах повторного использования заклинания по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellbook.GetCooldown(id) end

--- Возвращает информацию о текущих значениях динамически меняющихся характеристик умения по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellbook.GetCurrentValues(id) end

--- Возвращает базовое текстовое описание заклинания по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellbook.GetDescription(id) end

--- Возвращает таблицу подстановочных значений для описания умения
---@param id SpellId Id умения
---@return nil
function spellbook.GetDescriptionParams(id) end

--- Ищет на аватаре экземпляр бафа максимальной длительности с ресурсом совпадающим с durationBuff спелла. В случае успеха возвращает id экземпляра бафа. Если такого бафа на аватаре нет или спелл в принципе не имеет такого бафа - возвращает nil.
---@param id SpellId Id умения
---@return ObjectId|nil
function spellbook.GetDurationBuff(id) end

--- Возвращает информацию о текстуре для иконки заклинания по его идентификатору.
---@param id SpellId Id умения
---@return TextureId|nil
function spellbook.GetIcon(id) end

--- Возвращает SpellId умения по идентификатору объекта умения, имеющегося в спеллбуке.
---@param objectId ObjectId Id объекта умения.
---@return SpellId
function spellbook.GetObjectSpell(objectId) end

--- Возвращает информацию о базовых значениях статических свойств умения по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellbook.GetProperties(id) end

--- Возвращает список бафов, требующихся для применения умения.
---@param id SpellId Id умения
---@return table
function spellbook.GetRequiredBuffs(id) end

--- Возвращает список предметов, требующихся для применения умения.
---@param id SpellId Id умения
---@return table
function spellbook.GetRequiredResources(id) end

--- Возвращает информацию о требованиях к использованию заклинания.
---@param id SpellId Id умения
---@return table|nil
function spellbook.GetRequirements(id) end

--- Возвращает информацию о динамическом состоянии заклинании по его идентификатору.
---@param id SpellId Id умения
---@return nil
function spellbook.GetState(id) end

--- Проверяет имеет ли спелл durationBuff (в ресурсе). Проверяет только ресурс, константно для заданного спелла. Не ищет какие-либо бафы на каких-либо объектах.
---@param id SpellId Id умения
---@return boolean
function spellbook.HasDurationBuff(id) end

-- Events

--- Событие посылается, когда в книге умений появилось новое пассивное умение (абилка).
EVENT_ABILITIES_ELEMENT_ADDED = "EVENT_ABILITIES_ELEMENT_ADDED"

--- Событие посылается каждый раз, когда изменилось состояние умения или заклинания, не привязанного к книге заклинаний.
EVENT_DEFAULT_SPELL_CHANGED = "EVENT_DEFAULT_SPELL_CHANGED"

--- Оповещение о начале эффекта для спелла не привязанного к книге заклинаний.
EVENT_DEFAULT_SPELL_EFFECT = "EVENT_DEFAULT_SPELL_EFFECT"

--- Оповещение о начале эффекта для элемента в книге умений.
EVENT_GLOBAL_COOLDOWN = "EVENT_GLOBAL_COOLDOWN"

--- Событие посылается каждый раз, когда изменилось состояние панели действий (SpellBook).
EVENT_SPELLBOOK_CHANGED = "EVENT_SPELLBOOK_CHANGED"

--- Событие посылается, когда в книге умений (SpellBook) появилось новое умение.
EVENT_SPELLBOOK_ELEMENT_ADDED = "EVENT_SPELLBOOK_ELEMENT_ADDED"

--- Событие посылается каждый раз, когда изменилось состояние элемента (умения или заклинания) в книге умений (SpellBook). К созданию/удалению элемента это не относится, при этом изменяется книга целиком.
EVENT_SPELLBOOK_ELEMENT_CHANGED = "EVENT_SPELLBOOK_ELEMENT_CHANGED"

--- Оповещение о начале эффекта для элемента в книге умений.
EVENT_SPELLBOOK_ELEMENT_EFFECT = "EVENT_SPELLBOOK_ELEMENT_EFFECT"
