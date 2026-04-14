---@meta

---@class customizationLibLib
customizationLib = {}

---@class CustomizationLibGetActiveSlotInfoResult
---@field slot number номер слота
---@field sysSlot sting строковое обозначение слота
---@field itemId ObjectId|nil идентификатор предмета, если он есть в слоте
---@field beastType number тип монстра
---@field sysBeastType string тип монстра

---Возвращает информацию о кастомизируемом (активном) слоте в состоянии кастомизации. ENUM_SlotName_... - содержит номер слота в общем пространстве множества слотов, используемых во всей системе. Можно использовать для хранения состояния, но точное множество значений в общем случае не известно. См.  ENUM_BeastType_....
---@return CustomizationLibGetActiveSlotInfoResult
function customizationLib.GetActiveSlotInfo() end

---Во время кастомизации при работе с активным слотом помещает предмет из слота в контейнере игрока в кастомизационный слот.
---@param itemId ObjectId идентификатор предмета, который надо поместить в слот
---@return нет
function customizationLib.InstallItem(itemId) end

---Во время кастомизации какого-либо помещения или объекта возвращает true.
---@return boolean
function customizationLib.IsActive() end

---Во время кастомизации при работе с активным слотом убирает объект из кастомизационного слота (перемещает предмет из этого слота в контейнер игрока).
---@return нет
function customizationLib.UninstallItem() end
