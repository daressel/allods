---@meta

---@class containerLibLib
containerLib = {}

---@class ContainerLibCheckMoveItemResult
---@field boolean true если предмет может быть перемещен, иначе false
---@field boolean true если предмет при перемещении изменится время жизни предмета, иначе false/nil

---@class ContainerLibCheckMoveSlotItemResult
---@field boolean true если предмет может быть перемещен, иначе false
---@field boolean true если предмет при перемещении изменится время жизни предмета, иначе false/nil

---Проверка на возможность переместить предмет. Проверка завершится с ошибкой если
---@param itemId ObjectId идентификатор предмета
---@param slotType number тип контейнера места назначения
---@param slot integer|nil номер слота в контейнере. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то не проверяется
---@return ContainerLibCheckMoveItemResult
function containerLib.CheckMoveItem(itemId, slotType, slot, count) end

---Проверка на возможность переместить предмет. Проверка завершится с ошибкой если
---@param slotTypeFrom number тип контейнера места источника
---@param slotFrom integer номер слота в контейнере источнике
---@param slotTypeTo number тип контейнера места назначения
---@param slotTo integer|nil номер слота в контейнере назначения. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то не проверяется
---@return ContainerLibCheckMoveSlotItemResult
function containerLib.CheckMoveSlotItem(slotTypeFrom, slotFrom, slotTypeTo, slotTo, count) end

---У главного игрока имеется несколько контейнеров с предметами. Некоторые из них всегда есть у игрока, а некоторые (ITEM_CONT_DEPOSITE, ITEM_CONT_BESTIARY) появляются со своим содержимым только в определеннык моменты времени. Для вторых этот метод закроет контейнер и его содержимое будет недоступно на клиенте. Для остальных конетйнеров этот метод ничего не делает. Список контейнеров см. в  ITEM_CONT_.... См.  containerLib.IsOpen( slotType )
---@param slotType number тип контейнера с предметами
---@return нет
function containerLib.Close(slotType) end

---Возвращает список (индексирован с 1) идентификаторов всех предметов в контейнере с тем же ресурсом что и у данного. Если таких предметов в контейнере нет - вернет nil. Типы контейнеров:  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@param id number|ItemId идентификатор предмета
---@return table[1] of ObjectId|nil
function containerLib.GetAllResourceItemIds(slotType, id) end

---Возвращает список (индексирован с 1) идентификаторов всех предметов в контейнере похожих на данный. Если таких предметов в контейнере нет - вернет nil. Предметы считается похожими если у них совпадают
---@param slotType number тип контейнера с предметами
---@param id number идентификатор предмета
---@return table[1] of ObjectId|nil
function containerLib.GetAllSimilarItemIds(slotType, id) end

---Возвращает идентификатор первого предмета в контейнере с тем же ресурсом что и у данного. Если такового предмета в контейнере нет - вернет nil. Типы контейнеров:  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@param id number|ItemId идентификатор предмета
---@return ObjectId|nil
function containerLib.GetFirstResourceItemId(slotType, id) end

---Возвращает идентификатор первого предмета в контейнере похожего на данный. Если таких предметов в контейнере нет - вернет nil. Предметы считается похожими если у них совпадают
---@param slotType number тип контейнера с предметами
---@param id number идентификатор предмета
---@return ObjectId|nil
function containerLib.GetFirstSimilarItemId(slotType, id) end

---Возвращает идентификатор предмета по его слоту. Если в указанном слоте контейнера нет предмета, то вернёт nil. Слот должен быть валидным. Если такого слота в контейнере не существует - будет выдана ошибка. См.  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@param slot number номер слота в контейнере
---@return ObjectId|nil
function containerLib.GetItem(slotType, slot) end

---Возвращает таблицу описывающую содержимое контейнера. Ключи - номера слотов (от 0 до containerLib.GetSize( slotType ) - 1), значения - идентификаторы предметов в соответствующих слотах. Соответственно таблица может содержать "дыры" и ее обход через ipairs/zpairs гарантированно приведет к ошибкам. Используйте итератор pairs или (если важен порядок) обход по индексам от 0 до containerLib.GetSize( slotType ) - 1. Внимание! Категорически запрещается вычислять размер контейнера как размер таблицы возвращаемой данным API. Используйте только  containerLib.GetSize( slotType ). Список контейнеров см. в  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@return table
function containerLib.GetItems(slotType) end

---Возвращает информацию о слоте и контейнере, содержащем предмет. Если нет такого предмета в контейнерах игрока, то вернёт nil. Имеющиеся контейнеры игрока см. в  ITEM_CONT_....
---@param itemId ObjectId идентификатор предмета
---@param slotType number|nil тип контейнера для поиска. Если не задано - ищет во всех открытых контейнерах.
---@return В случае если предмет найден функция возвращает 2 значения:
function containerLib.GetItemSlot(itemId, slotType) end

---Возвращает количество предметов в контейнере с тем же ресурсом что и у данного. Типы контейнеров:  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@param id number|ItemId идентификатор предмета
---@return number
function containerLib.GetResourceItemStackCount(slotType, id) end

---Возвращает количество предметов в контейнере похожих на данный. Предметы считается похожими если у них совпадают
---@param slotType number тип контейнера с предметами
---@param id number идентификатор предмета
---@return integer
function containerLib.GetSimilarItemStackCount(slotType, id) end

---Возвращает размер контейнера главного игрока. Внимание!  containerLib.GetItems( slotType ) может вернуть пустой или не полный список, если контейнер не полон. Точный размер контейнера надо узнавать только по  containerLib.GetSize( slotType ). Внимание! Некоторые контейнеры (например переполненная сумка) имеют плавающий размер по количеству содержащихся предметов и проверка размера требуется перед каждой операцией с предметами по номеру слота. Список контейнеров см. в  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@return integer
function containerLib.GetSize(slotType) end

---Возможно ли открытие контейнера с помощью NPC, т.е. находимся ли мы в состоянии разговора с соответствующим персонажем. Если контейнер не требует разговора для открытия или не требует открытия (всегда открыт), то вернет true. Список контейнеров см. в  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@return boolean
function containerLib.IsInteracting(slotType) end

---Проверяет наличие активных транзакций связанных с указанным предметом. При наличии таковых выполнение любых действий (исключая получение информации) со предметом запрещено. Предмет должен быть валиден. Если предмет валиден, но не существует в контейнере игрока (например предмет это ревард в описании какого-либо события, квеста и тп), то данная функция вернет true.
---@param itemId ObjectId идентификатор экземпляра предмета
---@return boolean: true
function containerLib.IsItemEnabled(itemId) end

---Проверяет наличие активных транзакций связанных с указанным слотом указанного контейнера. При наличии таковых выполнение любых действий (исключая получение информации) со слотом запрещено. Слот должен быть валидным. Если такого слота в контейнере не существует - будет выдана ошибка. См.  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@param slot number номер слота в контейнере
---@return boolean: true
function containerLib.IsItemSlotEnabled(slotType, slot) end

---У главного игрока имеется несколько контейнеров с предметами. Некоторые из них всегда есть у игрока, а некоторые (ITEM_CONT_DEPOSITE, ITEM_CONT_BESTIARY) появляются со своим содержимым только в определеннык моменты времени. Для вторых этот метод вернет true, если содержимое доступно на клиенте (контейнер открыт), иначе вернет false (контейнер закрыт). Для остальных конетйнеров всегда возвращает true (эти контейнеры всегда открыты). Список контейнеров см. в  ITEM_CONT_.... См.  containerLib.Close( slotType ).
---@param slotType number тип контейнера с предметами
---@return boolean
function containerLib.IsOpen(slotType) end

---Переместить предмет. Если будет провалена какая-либо из  проверок, то функция  завершится с ошибкой. См.  ITEM_CONT_....
---@param itemId ObjectId идентификатор предмета
---@param slotType number тип контейнера места назначения
---@param slot integer|nil номер слота в контейнере. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то переместится весь слот
---@return нет
function containerLib.MoveItem(itemId, slotType, slot, count) end

---Переместить предмет. Если будет провалена какая-либо из  проверок, то функция  завершится с ошибкой. См.  ITEM_CONT_....
---@param slotTypeFrom number тип контейнера места источника
---@param slotFrom integer номер слота в контейнере источнике
---@param slotTypeTo number тип контейнера места назначения
---@param slotTo integer|nil номер слота в контейнере назначения. Если указан nil, то слот подберётся автоматически
---@param count integer|nil количество перемещаемых предметов. Если указан nil, то переместится весь слот
---@return нет
function containerLib.MoveSlotItem(slotTypeFrom, slotFrom, slotTypeTo, slotTo, count) end

---Попытка открыть контейнер (в том числе с помощью NPCчерез разговор с ним). Если контейнер уже открыт - функция ничего не делает. Список контейнеров см. в  ITEM_CONT_....
---@param slotType number тип контейнера с предметами
---@return нет
function containerLib.Open(slotType) end
