---@meta

---@class bulletinBoardLib
bulletinBoard = {}

---@class BulletinBoardCanAddTextResult
---@field isCanAdd boolean можно ли создавать новые объявления, если нельзя, то причина уточняется в последующих полях
---@field isMsgLimitReached boolean true, если достигнут предел сообщений для данного персонажа
---@field sysCause string одна из причин, описываемых данным перечислением, либо "ENUM_ ActionFailCause_NoFail", если ошибка вызвана иными причинами
---@field isInNotPredicate boolean true, если причина невозможности добавления определяется предикатом с противоположным значением sysCause

---@class BulletinBoardGetPostResult
---@field postId integer идентификатор объявления
---@field isPremium boolean true, если это платное сообщение
---@field name string имя персонажа
---@field guild string название гильдии персонажа (если есть)
---@field isOnline boolean находится ли персонаж в игре
---@field level integer уровень персонажа
---@field raceClass table LuaRaceClassInfoPart|nil раса-класс персонажа
---@field sex table LuaSexInfoPart|nil описание пола персонажа
---@field zoneName string название зоны, где находится персонаж
---@field text string текст объявления, если уже был получен
---@field lifeTimeMs number|nil время существования объявления в миллисекундах или nil, в случае ошибки
---@field lifeTime table|nil время существования объявления или nil, в случае ошибки. Таблица с полями:
---@field remainingTimeMs number|nil оставшееся время существования объявления в миллисекундах или nil, если ограничений по времени нет
---@field remainingTime table|nil оставшееся время существования объявления или nil, если ограничений по времени нет. Таблица с полями:

---@class BulletinBoardGetPostPriceInfoResult
---@field currencyId CurrencyId денежная единица
---@field currencyValue integer цена одного объявления

---@class BulletinBoardGetSectionInfosResult
---@field postTypeId PostTypeId идентификатор раздела доски объявлений
---@field sysName string служебное название раздела (для уникальной обработки)
---@field name string локализованное название раздела
---@field description string локализованное описание раздела
---@field lengthLimit integer максимальный размер одного объявления в символах

---Проверяет, можно ли разместить новое объявление на доске в указанном разделе.
---@param postTypeId PostTypeId идентификатор раздела
---@return BulletinBoardCanAddTextResult
function bulletinBoard.CanAddText(postTypeId) end

---Возвращает информацию об указанном объявлении на доске. Если объявление не найдено (например, было удалено), возвращается nil.
---@param postId integer идентификатор объявления
---@return BulletinBoardGetPostResult
function bulletinBoard.GetPost(postId) end

---Возвращает информацию о цене платного сообщения.
---@return BulletinBoardGetPostPriceInfoResult
function bulletinBoard.GetPostPriceInfo() end

---Возвращает информацию о доступных разделах доски объявлений.
---@return BulletinBoardGetSectionInfosResult
function bulletinBoard.GetSectionInfos() end

---Возвращает текст объявления на доске.
---@param postId integer идентификатор объявления
---@return text: WString|nil
function bulletinBoard.GetText(postId) end

---Возвращает признак, выполняется ли операция с доской объявлений: размещение нового, редактирование или удаление существующего объявления. Начинать новую операцию до окончания предыдущей нельзя.
---@return boolean
function bulletinBoard.IsOperationInProgress() end

---Возвращает информацию о содержимом указанного раздела доски объявлений. Если информации еще нет на клиенте, то отправляется запрос на сервер и возвращается nil. При получении информации приходит событие об изменении доски объявлений.
---@param postTypeId PostTypeId идентификатор раздела доски объявлений
---@return таблица со списком объявлений или nil, если информация недоступна, таблица индексирована [0..], значения таблицы:
function bulletinBoard.ReadSection(postTypeId) end
