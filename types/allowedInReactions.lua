---@meta

--- CategoryAllowedInReactions
--- События и функции Lua Api, которые всегда доступны для встроенных аддонов, а в пользовательских аддонах доступны только в обработчиках реакций мышиных кликов.

---@class allowedInReactionsLib
allowedInReactions = {}

--- Проверка, можно ли использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function allowedInReactions.CheckCanUseItem(itemId, isSendEvent) end

--- Проверка, можно ли использовать предмет в контейнере игрока на точку на ландшафте.
---@param itemId ObjectId идентификатор предмета
---@param position table
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function allowedInReactions.CheckCanUseItemOnPoint(itemId, position, isSendEvent) end

--- Сбрасывает подготовленное заклинание.
---@param spellId SpellId идентификатор заклинания
function allowedInReactions.DropSpell(spellId) end

--- Начинает подготавливать заклинание.
---@param spellId SpellId идентификатор заклинания
function allowedInReactions.PrepareSpell(spellId) end

--- Начинает сотворение заклинания в указанную точку на карте. См. также  GamePosition.
---@param spellId SpellId идентификатор заклинания
---@param position table
function allowedInReactions.RunAESpell(spellId, position) end

--- Начинает сотворение заклинания на цель по умолчанию.
---@param spellId SpellId идентификатор заклинания
function allowedInReactions.RunSpell(spellId) end

--- Попытка выполнить одно из действий устройства. Список действий можно узнать через функцию  GetUsableDeviceInfo.
---@param index number( индекс действия
function allowedInReactions.RunUsableDeviceAction(index) end

--- Попытка выполнить одно из действий устройства на точку местности. Список действий можно узнать через функцию  GetUsableDeviceInfo.
---@param index integer индекс действия
---@param pos GamePosition точка применения действия
function allowedInReactions.RunUsableDeviceActionPoint(index, pos) end

--- Попытка аватара сделать указанного юнита своей целью.
---@param unitId ObjectId
function allowedInReactions.SelectTarget(unitId) end

--- Попытка установить фразу для добивания.
---@param message WString фраза
function allowedInReactions.SetFatalityPhrase(message) end

--- Попытка изменить активный набор ритуальных вещей. Результатом успешной попытки будет событие  EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED.
---@param preset integer набор
function allowedInReactions.SetRitualActivePreset(preset) end

--- Попытка использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
function allowedInReactions.UseItem(itemId) end

--- Попытка использовать предмет в контейнере игрока на точку на ландшафте.
---@param itemId ObjectId идентификатор предмета
---@param position table
function allowedInReactions.UseItemOnPoint(itemId, position) end
