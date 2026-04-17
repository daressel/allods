---@meta

--- CategoryContainerLib
--- Различные методы и события по работе с контейнерами главного игрока.

--- Тип контейнера с предметами, которые можно использовать (операции с рунами/разборка/очищение и др.).
--- Экипировка и руны
---@type integer
ITEM_CONT_EQUIPMENT = nil
--- Экипировка 2 слой ("драконий облик")
---@type integer
ITEM_CONT_EQUIPMENT_RITUAL = nil
--- Экипировка 2 слой ("драконий облик") - первый набор
---@type integer
ITEM_CONT_EQUIPMENT_RITUAL_1 = nil
--- Экипировка 2 слой ("драконий облик") - второй набор
---@type integer
ITEM_CONT_EQUIPMENT_RITUAL_2 = nil
--- Экипировка 2 слой ("драконий облик") - третий набор
---@type integer
ITEM_CONT_EQUIPMENT_RITUAL_3 = nil
--- Сумка
---@type integer
ITEM_CONT_INVENTORY = nil
--- Банк
---@type integer
ITEM_CONT_DEPOSITE = nil
--- Переполненная сумка
---@type integer
ITEM_CONT_INVENTORY_OVERFLOW = nil
--- Бестиарий
---@type integer
ITEM_CONT_BESTIARY = nil
--- Гардероб
---@type integer
ITEM_CONT_CHECKROOM = nil
--- Корабельные устройства
---@type integer
ITEM_CONT_DEVICE_BAG = nil
--- Святое оружие
---@type integer
ITEM_CONT_POWEREDLSWEAPON = nil
--- Не актуально
---@type integer
ITEM_CONT_GEMS = nil

---@class containerLibLib
containerLib = {}

--- Проверка на возможность переместить предмет.
---@param itemId ObjectId идентификатор предмета
---@param slotType integer тип контейнера места назначения
---@param slot integer|nil номер слота в контейнере. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то не проверяется
---@return any
function containerLib.CheckMoveItem(itemId, slotType, slot, count) end

--- Проверка на возможность переместить предмет.
---@param slotTypeFrom integer тип контейнера места источника
---@param slotFrom integer номер слота в контейнере источнике
---@param slotTypeTo integer тип контейнера места назначения
---@param slotTo integer|nil номер слота в контейнере назначения. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то не проверяется
---@return any
function containerLib.CheckMoveSlotItem(slotTypeFrom, slotFrom, slotTypeTo, slotTo, count) end

--- У главного игрока имеется несколько контейнеров с предметами. Некоторые из них всегда есть у игрока, а некоторые (ITEM_CONT_DEPOSITE, ITEM_CONT_BESTIARY) появляются со своим содержимым только в определеннык моменты времени. Для вторых этот метод закроет контейнер и его содержимое будет недоступно на клиенте. Для остальных конетйнеров этот метод ничего не делает.
---@param slotType integer тип контейнера с предметами
function containerLib.Close(slotType) end

--- Возвращает список (индексирован с 1) идентификаторов всех предметов в контейнере с тем же ресурсом что и у данного. Если таких предметов в контейнере нет - вернет nil.
---@param slotType integer тип контейнера с предметами
---@param id ObjectId идентификатор предмета
---@return table
function containerLib.GetAllResourceItemIds(slotType, id) end

--- Возвращает список (индексирован с 1) идентификаторов всех предметов в контейнере похожих на данный. Если таких предметов в контейнере нет - вернет nil.
---@param slotType integer тип контейнера с предметами
---@param id ObjectId идентификатор предмета
---@return table
function containerLib.GetAllSimilarItemIds(slotType, id) end

--- Возвращает идентификатор первого предмета в контейнере с тем же ресурсом что и у данного. Если такового предмета в контейнере нет - вернет nil.
---@param slotType integer тип контейнера с предметами
---@param id ObjectId идентификатор предмета
---@return ObjectId|nil
function containerLib.GetFirstResourceItemId(slotType, id) end

--- Возвращает идентификатор первого предмета в контейнере похожего на данный. Если таких предметов в контейнере нет - вернет nil.
---@param slotType integer тип контейнера с предметами
---@param id ObjectId идентификатор предмета
---@return ObjectId|nil
function containerLib.GetFirstSimilarItemId(slotType, id) end

--- Возвращает идентификатор предмета по его слоту. Если в указанном слоте контейнера нет предмета, то вернёт nil.
---@param slotType integer тип контейнера с предметами
---@param slot number номер слота в контейнере
---@return ObjectId|nil
function containerLib.GetItem(slotType, slot) end

--- Возвращает таблицу описывающую содержимое контейнера. Ключи - номера слотов (от 0 до containerLib.GetSize( slotType ) - 1), значения - идентификаторы предметов в соответствующих слотах. Соответственно таблица может содержать "дыры" и ее обход через ipairs/zpairs гарантированно приведет к ошибкам. Используйте итератор pairs или (если важен порядок) обход по индексам от 0 до containerLib.GetSize( slotType ) - 1.
---@param slotType integer тип контейнера с предметами
---@return table
function containerLib.GetItems(slotType) end

--- Возвращает информацию о слоте и контейнере, содержащем предмет. Если нет такого предмета в контейнерах игрока, то вернёт nil.
---@param itemId ObjectId идентификатор предмета
---@param slotType integer|nil тип контейнера для поиска. Если не задано - ищет во всех открытых контейнерах.
---@return any
function containerLib.GetItemSlot(itemId, slotType) end

--- Возвращает количество предметов в контейнере с тем же ресурсом что и у данного.
---@param slotType integer тип контейнера с предметами
---@param id ObjectId идентификатор предмета
---@return number
function containerLib.GetResourceItemStackCount(slotType, id) end

--- Возвращает количество предметов в контейнере похожих на данный.
---@param slotType integer тип контейнера с предметами
---@param id ObjectId идентификатор предмета
---@return number
function containerLib.GetSimilarItemStackCount(slotType, id) end

--- Возвращает размер контейнера главного игрока.
---@param slotType integer тип контейнера с предметами
---@return number
function containerLib.GetSize(slotType) end

--- Возможно ли открытие контейнера с помощью NPC, т.е. находимся ли мы в состоянии разговора с соответствующим персонажем.
---@param slotType integer тип контейнера с предметами
---@return boolean
function containerLib.IsInteracting(slotType) end

--- Проверяет наличие активных транзакций связанных с указанным предметом. При наличии таковых выполнение любых действий (исключая получение информации) со предметом запрещено.
---@param itemId ObjectId идентификатор экземпляра предмета
---@return true
function containerLib.IsItemEnabled(itemId) end

--- Проверяет наличие активных транзакций связанных с указанным слотом указанного контейнера. При наличии таковых выполнение любых действий (исключая получение информации) со слотом запрещено.
---@param slotType integer тип контейнера с предметами
---@param slot number номер слота в контейнере
---@return true
function containerLib.IsItemSlotEnabled(slotType, slot) end

--- У главного игрока имеется несколько контейнеров с предметами. Некоторые из них всегда есть у игрока, а некоторые (ITEM_CONT_DEPOSITE, ITEM_CONT_BESTIARY) появляются со своим содержимым только в определеннык моменты времени. Для вторых этот метод вернет true, если содержимое доступно на клиенте (контейнер открыт), иначе вернет false (контейнер закрыт). Для остальных конетйнеров всегда возвращает true (эти контейнеры всегда открыты).
---@param slotType integer тип контейнера с предметами
---@return boolean
function containerLib.IsOpen(slotType) end

--- Переместить предмет.
---@param itemId ObjectId идентификатор предмета
---@param slotType integer тип контейнера места назначения
---@param slot integer|nil номер слота в контейнере. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то переместится весь слот
function containerLib.MoveItem(itemId, slotType, slot, count) end

--- Переместить предмет.
---@param slotTypeFrom integer тип контейнера места источника
---@param slotFrom integer номер слота в контейнере источнике
---@param slotTypeTo integer тип контейнера места назначения
---@param slotTo integer|nil номер слота в контейнере назначения. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то переместится весь слот
function containerLib.MoveSlotItem(slotTypeFrom, slotFrom, slotTypeTo, slotTo, count) end

--- Попытка открыть контейнер (в том числе с помощью NPCчерез разговор с ним). Если контейнер уже открыт - функция ничего не делает.
---@param slotType integer тип контейнера с предметами
function containerLib.Open(slotType) end

-- Events

--- Уведомление об изменении контейнера главного игрока.
EVENT_CONTAINER_CHANGED = "EVENT_CONTAINER_CHANGED"

--- Событие о появлении предмета в слоте контейнера главного игрока по любой причине. Это может быть и появление нового предмета, и перетаскивание имеющегося в сумке и тестовый чит.
EVENT_CONTAINER_ITEM_ADDED = "EVENT_CONTAINER_ITEM_ADDED"

--- Уведомление об изменении какого-либо свойства предмета в слоте контейнера главного игрока.
EVENT_CONTAINER_ITEM_CHANGED = "EVENT_CONTAINER_ITEM_CHANGED"

--- Оповещение о начале эффекта для элемента в каком-либо контейнере.
EVENT_CONTAINER_ITEM_EFFECT = "EVENT_CONTAINER_ITEM_EFFECT"

--- Событие об исчезновении предмета из слота контейнера главного игрока.
EVENT_CONTAINER_ITEM_REMOVED = "EVENT_CONTAINER_ITEM_REMOVED"
