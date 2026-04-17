---@meta

--- CategoryTalents
--- События и функции Lua API, относящиеся к работе с талантами (и близкие к этому).

---@class talentsLib
talents = {}

--- Выучить помеченные таланты и вехи.
function talents.ApplyStoredTalents() end

--- Можно ли проапдейтить (или выучить) талант из базовой таблицы талантов.
---@param layer integer номер строки
---@param line integer номер столбца
---@return boolean
function talents.CanUpdateBaseTalent(layer, line) end

--- Можно ли проапдейтить (или выучить) талант из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return boolean
function talents.CanUpdateFieldTalent(field, row, column) end

--- Сбросить помеченные таланты и вехи.
function talents.ClearStoredTalents() end

--- Включить/выключить бескорыстную помощь.
---@param enable boolean для включения: true, для выключения: false
function talents.EnableFreeKeys(enable) end

--- Получить номер активной специализации.
---@return number
function talents.GetActiveBuild() end

--- Получить информацию о таланте из базовой таблицы талантов.
---@param layer integer номер строки
---@param line integer номер столбца
---@return table
function talents.GetBaseTalentInfo(layer, line) end

--- Получить размер базовой таблицы талантов.
---@return integer
function talents.GetBaseTalentTableSize() end

--- Получить количество специализаций аватара. Может быть больше числа доступных специализаций в случае если их число когда-либо было временно увеличено а затем вновь уменьшилось. Сохраненные данные специализации будут доступны, но активировать ее будет нельзя.
---@return number
function talents.GetBuildsCount() end

--- Получить количество доступных специализаций аватара.
---@return number
function talents.GetBuildsUnlockedCount() end

--- Получить id спелла, переключающего специализацию (билд) аватара. Используется для получения информации об условиях переключения.
---@return QuestId
function talents.GetBuildSwitchSpell() end

--- Получить информацию о поле талантов.
---@param field integer номер поля (от 1)
---@return table
function talents.GetCommonFieldTalentInfo(field) end

--- Получить информацию о таланте из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return any
function talents.GetFieldTalentInfo(field, row, column) end

--- Получить размер поля талантов.
---@return integer
function talents.GetFieldTalentTableSize() end

--- Возвращает уровня игрока, с которого доступно распределение вех.
---@return number
function talents.GetRubyStartLevel() end

--- Получить информацию о количестве вложенных очков талантов.
---@return number
function talents.GetSpentTalentPoints() end

--- Получить номер специализации, данные о которой доступны для просмотра.
---@return number
function talents.GetViewedBuild() end

--- Задать номер активной специализации.
---@param index integer номер специализации аватара; доступный диапазон - от 0 до величины, на 1 меньшей результата avatar.GetBuildsCount()
function talents.SetActiveBuild(index) end

--- Задать номер специализации, данные о которой доступны для просмотра.
---@param index integer номер специализации аватара; доступный диапазон - от 0 до величины, на 1 меньшей результата avatar.GetBuildsCount()
function talents.SetViewedBuild(index) end

--- Пометить талант из базовой таблицы талантов для изучения.
---@param layer integer номер строки
---@param line integer номер столбца
function talents.StoreBaseTalent(layer, line) end

--- Пометить для изучения веху из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
function talents.StoreFieldTalent(field, row, column) end

-- Events

--- Событие присылается, когда меняется форма класса аватара.
EVENT_AVATAR_CLASS_FORM_CHANGED = "EVENT_AVATAR_CLASS_FORM_CHANGED"

--- Событие присылается, когда изменились таланты.
EVENT_TALENTS_CHANGED = "EVENT_TALENTS_CHANGED"
