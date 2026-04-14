---@meta

---@class spellLibLib
spellLib = {}

---@class SpellLibCanRunAvatarResult
---@field self Activate

---@class SpellLibCanRunAvatarExResult
---@field self Activate

---@class SpellLibGetAESectorPropsResult
---@field angle number угол раствора сектора, в градусах
---@field centerObj VisObjectId|nil визобж для центра сектора
---@field fillerObj VisObjectId|nil визобж для заполнения сектора
---@field leftObj VisObjectId|nil визобж для левого края сектора
---@field rightObj VisObjectId|nil визобж для правого края сектора

---@class SpellLibGetCooldownResult
---@field durationMs integer время до повторного использования заклинания (всего)
---@field remainingMs integer время до повторного использования заклинания (осталось)
---@field ignoreGlobalCooldown boolean спелл игнорирует ГКД (может быть запущен при активном ГКД)
---@field debugName string|nil -- системная информация для отладочной версии(путь к файлу), отсутствует в FinalRelease версии клиента

---@class SpellLibGetCurrentValuesResult
---@field manaCost integer расход маны или энергии
---@field prepareDuration integer время подготовки в миллисекундах
---@field range number растояние до цели, на котором действует заклинание
---@field minRange number минимальное дистанция до цели, на которой возможно применение умения(если цель находится ближе, то применение не возможно)
---@field radius number радиус действия AOE заклинания от точки применения. если спелл не AE-шный, то возвращается 0.0
---@field predictedCooldown integer предположительная длительность кулдауна в миллисекундах
---@field debugName string|nil -- системная информация для отладочной версии(путь к файлу), отсутствует в FinalRelease версии клиента

---@class SpellLibGetDescriptionResult
---@field name WString -- название
---@field description ValuedText|nil -- описание с подставленными текущими значениями параметров
---@field sysName string -- системное имя спелла
---@field objectId ObjectId|nil -- Id объекта умения в книге умений (action Id). В остальных случаях nil
---@field debugName string|nil -- системная информация для отладочной версии(путь к файлу), отсутствует в FinalRelease версии клиента

---@class SpellLibGetDescriptionParamsResult
---@field key WString -- имя тега подстановки
---@field value ValuedText|float -- значение для тега подстановки

---@class SpellLibGetPropertiesResult
---@field launchWhenReady boolean true - заклинание посылается в цель (точку, в самого себя) сразу после процесса каста. false - заклинание можно подготовить для моментального запуска в цель (см. флаг prepared)
---@field prepareDuration integer время подготовки (каста) заклинания
---@field baseManaCostPercentage number расход маны в процентах от полной
---@field range number растояние до цели, на котором действует заклинание
---@field radius number радиус действия AOE заклинания от точки применения. если спелл не AE-шный, то возвращается 0.0
---@field minRange number минимальное дистанция до цели, на которой возможно применение умения(если цель находится ближе, то применение не возможно)
---@field targetType number
---@field sysSubElement string тип воздействия
---@field level integer уровень, начиная с которого можно изучить это умение
---@field rank integer ранг умения (начиная с 1)
---@field isHelpful boolean позитивное заклинание. можно кастовать в друзей, нельзя во врагов
---@field isHarmful boolean неготивное заклинание. можно кастовать во врагов, нельзя в друзей
---@field isChanneled boolean true, если это channel спелл
---@field isFairySpell boolean заклинание, предоставляемое покровителем
---@field uiSpellBookPageType int тип страницы в спеллбуке
---@field typeAEMark integer тип AE-марки спелла (0 = AEMarkNone, 1 = AEMarkDecal, 2 = AEMarkSector, 3 = AEMarkShipAOE)
---@field sysNameAEMark string / nil для АЕ спеллов имя AEMarkDecal, которую нужно визуализировать (nil для не AE спеллов или спелов с АЕ маркой отличного от AEMarkDecal типа)
---@field debugName string|nil -- системная информация для отладочной версии(путь к файлу), отсутствует в FinalRelease версии клиента

---@class SpellLibGetRequiredBuffsResult
---@field buffId BuffId ид ресурса бафа
---@field stackCount integer требуемое число стаков бафа

---@class SpellLibGetRequirementsResult
---@field casterConditions RequirementsTable список условий на кастующем
---@field casterResources RequirementsTable список ресурсов (условий присутствия ресурса) на кастующем
---@field targetConditions RequirementsTable список условий на цели

---@class SpellLibGetStateResult
---@field enabled boolean если false, то спел не удастся, но его можно попытаться сделать
---@field autocastOn boolean автоматическая подготовка заклинания, true - включена, false - выключена
---@field prepared boolean true - приготовлено ли заклинание. false, если не приготовлено, или подготовка вообще не требуется (launchWhenReady == true).
---@field isActive boolean true, если в данный момент заклинание активировано (включено)
---@field debugName string|nil -- системная информация для отладочной версии(путь к файлу), отсутствует в FinalRelease версии клиента

---Возвращает информацию о возможности пуска заклинания (игнорируя текущее действие, кулдаун и ограничения цели).
---@param id SpellId Id умения
---@param ignoreCasterResources boolean|nil игнорировать проверку предикатов CasterResources, по-умолчанию false
---@return SpellLibCanRunAvatarResult
function spellLib.CanRunAvatar(id, ignoreCasterResources) end

---Возвращает информацию о возможности пуска заклинания (игнорируя вообще всё, кроме неизменяемых свойств главного игрока(раса/пол/фракция/класс)).
---@param id SpellId Id умения
---@return SpellLibCanRunAvatarExResult
function spellLib.CanRunAvatarEx(id) end

---Возвращает список групп, к которым принадлежит заклинание.
---@param id SpellId Id умения
---@return table|nil
function spellLib.GetActionGroups(id) end

---Возвращает список дополнительных описаний групп, к которым принадлежит заклинание.
---@param id SpellId Id умения
---@return string[]
function spellLib.GetActionGroupsDescriptions(id) end

---Возвращает информацию о о AEMark типа AEMarkSector у спелла.
---@param id SpellId Id умения
---@return SpellLibGetAESectorPropsResult
function spellLib.GetAESectorProps(id) end

---Возвращает информацию о таймерах повторного использования заклинания по его идентификатору.
---@param id SpellId Id умения
---@return SpellLibGetCooldownResult
function spellLib.GetCooldown(id) end

---Возвращает информацию о текущих значениях динамически меняющихся характеристик умения по его идентификатору.
---@param id SpellId Id умения
---@return SpellLibGetCurrentValuesResult
function spellLib.GetCurrentValues(id) end

---Возвращает базовое текстовое описание заклинания по его идентификатору.
---@param id SpellId Id умения
---@return SpellLibGetDescriptionResult
function spellLib.GetDescription(id) end

---Возвращает таблицу подстановочных значений для описания умения
---@param id SpellId Id умения
---@return SpellLibGetDescriptionParamsResult
function spellLib.GetDescriptionParams(id) end

---Ищет на аватаре экземпляр бафа максимальной длительности с ресурсом совпадающим с durationBuff спелла. В случае успеха возвращает id экземпляра бафа. Если такого бафа на аватаре нет или спелл в принципе не имеет такого бафа - возвращает nil. durationBuff - специальный бафф связанный со спеллом оставшееся время действия которого надлежит показывать на иконке спелла в панели действий. Например время жизни механизмов инженера и тп.
---@param id SpellId Id умения
---@return ObjectId|nil
function spellLib.GetDurationBuff(id) end

---Возвращает информацию о текстуре для иконки заклинания по его идентификатору.
---@param id SpellId Id умения
---@return texture: TextureId|nil
function spellLib.GetIcon(id) end

---Возвращает SpellId умения по идентификатору объекта умения, имеющегося в спеллбуке. Такое умение можно использовать, a не только получить описание. Для исползуемых умений назначается Id объекта умения. Этот же Id - action Id.
---@param objectId ObjectId Id объекта умения.
---@return spellId: SpellId
function spellLib.GetObjectSpell(objectId) end

---Возвращает информацию о базовых значениях статических свойств умения по его идентификатору.
---@param id SpellId Id умения
---@return SpellLibGetPropertiesResult
function spellLib.GetProperties(id) end

---Возвращает список бафов, требующихся для применения умения.
---@param id SpellId Id умения
---@return SpellLibGetRequiredBuffsResult
function spellLib.GetRequiredBuffs(id) end

---Возвращает список предметов, требующихся для применения умения.
---@param id SpellId Id умения
---@return ObjectId[]
function spellLib.GetRequiredResources(id) end

---Возвращает информацию о требованиях к использованию заклинания.
---@param id SpellId Id умения
---@return SpellLibGetRequirementsResult
function spellLib.GetRequirements(id) end

---Возвращает информацию о динамическом состоянии заклинании по его идентификатору.
---@param id SpellId Id умения
---@return SpellLibGetStateResult
function spellLib.GetState(id) end

---Возвращает новый экземпляр ValuedObject для заклинания.
function spellLib.GetValuedObject() end

---Проверяет имеет ли спелл durationBuff (в ресурсе). Проверяет только ресурс, константно для заданного спелла. Не ищет какие-либо бафы на каких-либо объектах. durationBuff - специальный бафф связанный со спеллом оставшееся время действия которого надлежит показывать на иконке спелла в панели действий. Например время жизни механизмов инженера и тп.
---@param id SpellId Id умения
---@return boolean
function spellLib.HasDurationBuff(id) end
