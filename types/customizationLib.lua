---@meta

--- CategoryCustomizationLib
--- События и функции Lua API, относящиеся к кастомизации главным игроком каких-либо строений или объектов. Например, настройка монстров в личном приключении.

--- Типы монстров в личном приключении:
ENUM_BeastType_AE = "ENUM_BeastType_AE"
ENUM_BeastType_Pack = "ENUM_BeastType_Pack"
ENUM_BeastType_Solo = "ENUM_BeastType_Solo"
ENUM_BeastType_Boss = "ENUM_BeastType_Boss"
ENUM_BeastType_Endboss = "ENUM_BeastType_Endboss"
ENUM_BeastType_AE = "ENUM_BeastType_AE"
ENUM_BeastType_Pack = "ENUM_BeastType_Pack"
ENUM_BeastType_Solo = "ENUM_BeastType_Solo"
ENUM_BeastType_Boss = "ENUM_BeastType_Boss"
ENUM_BeastType_Endboss = "ENUM_BeastType_Endboss"

---@class customizationLibLib
customizationLib = {}

--- Возвращает информацию о кастомизируемом (активном) слоте в состоянии кастомизации.
---@return table|nil
function customizationLib.GetActiveSlotInfo() end

--- Во время кастомизации при работе с активным слотом помещает предмет из слота в контейнере игрока в кастомизационный слот.
---@param itemId ObjectId идентификатор предмета, который надо поместить в слот
function customizationLib.InstallItem(itemId) end

--- Во время кастомизации какого-либо помещения или объекта возвращает true.
---@return boolean
function customizationLib.IsActive() end

--- Во время кастомизации при работе с активным слотом убирает объект из кастомизационного слота (перемещает предмет из этого слота в контейнер игрока).
function customizationLib.UninstallItem() end

-- Events

--- Событие посылается каждый раз, когда главный игрок меняет активный слот кастомизации.
EVENT_CUSTOMIZATION_ACTIVE_SLOT_CHANGED = "EVENT_CUSTOMIZATION_ACTIVE_SLOT_CHANGED"

--- Событие посылается каждый раз, когда главный игрок меняет содержимое (ставит/снимает/меняет моба) активного слота кастомизации.
EVENT_CUSTOMIZATION_ACTIVE_SLOT_CONTENT_CHANGED = "EVENT_CUSTOMIZATION_ACTIVE_SLOT_CONTENT_CHANGED"

--- Событие посылается каждый раз, когда у главного игрока меняется состояние кастомизации (он начал/закончил кастомизировать какое-либо помещение или объект).
EVENT_CUSTOMIZATION_STATE_CHANGED = "EVENT_CUSTOMIZATION_STATE_CHANGED"
