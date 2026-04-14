---@meta

---@class auctionLib
auction = {}

---@class AuctionGetAuctionInfoResult
---@field id ObjectId id аукциона
---@field itemId ObjectId id предмета, выставленного на аукцион
---@field bidderName string имя игрока, поставившего на аукционе последним
---@field currentBid number последняя ставка
---@field sellerName string имя владельца аукциона
---@field startPrice number стартовая цена
---@field buyoutPrice number цена окончательного выкупа
---@field participationStatus string отношение главного игрока к аукциону
---@field timeLeftSeconds сколько времени осталось в секундах
---@field timeLeft table сколько времени осталось

---@class AuctionGetAuctionStateResult
---@field bidInProgress boolean true, если ставка в процессе передачи
---@field discardInProgress boolean true, если отмена аукциона в процессе
---@field discarded boolean true, если аукцион уже отменён

---@class AuctionGetPropertiesResult
---@field pawnFactorPercent integer залог в процентах
---@field bidStepInPercent integer шаг ставки в процентах
---@field discardingFineInPercent integer стоимость отмены аукциона в процентах
---@field taxInPercent integer такса за аукцион в процентах
---@field searchPageSize integer размер страницы поиска
---@field bidIncreaseTimeSec integer интервал наращивания ставки в секундах

---Попытаться сделать ставку на аукционе. Результат - EVENT_AUCTION_BID_RESULT.
---@param id ObjectId id аукциона
---@param price number ставка
---@return нет
function auction.Bid(id, price) end

---Попытаться выкупить предмет на аукционе по назначенной владельцем окончательной цене. Результат - EVENT_AUCTION_BID_RESULT.
---@param id ObjectId id аукциона
---@return нет
function auction.Buyout(id) end

---Возвращает true, если для предмета c таким id можно создать аукцион.
---@param itemId ObjectId id предмета, который выставляется на аукцион; предмет должен находится в одном из контейнеров (например в инвентаре)
---@return boolean
function auction.CanCreateForItem(itemId) end

---Попытается создать аукцион с заданными параметрами. Время действия задано енумом - AUCTION_CREATETIME__.... Новый аукцион не создается, пока не закончено создание предыдущего. См. auction.IsCreationInProgress(); Результат создания - EVENT_AUCTION_CREATION_RESULT.
---@param itemId ObjectId id предмета, который выставляется на аукцион
---@param startPrice number стартовая цена (в меди, должна быть в диапазоне 1 - 999999999999)
---@param buyoutPrice number окончательная цена выкупа с прекращением аукциона (в меди, должна быть в диапазоне 1 - 999999999999 либо -1, тогда нет досрочного выкупа)
---@param timeLength number время действия аукциона
---@return нет
function auction.CreateForItem(itemId, startPrice, buyoutPrice, timeLength) end

---Попытаться отменить аукцион. Результат - EVENT_AUCTION_DISCARD_RESULT.
---@param id ObjectId id аукциона
---@return нет
function auction.Discard(id) end

---Возвращает информацию об аукционе. Статус участника - "ENUM_AuctionDescriptorParticipationStatus_..."
---@param id ObjectId идентификатор аукциона
---@return AuctionGetAuctionInfoResult
function auction.GetAuctionInfo(id) end

---Возвращает список аукционов на указанной странице, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт пустую таблицу.
---@return ObjectId[]
function auction.GetAuctions() end

---Возвращает количество аукционов, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт 0.
---@return integer
function auction.GetAuctionsCount() end

---Возвращает номер текущей страницы списка аукционов, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт 0. В случае успеха, страницы нумеруются с 1.
---@return integer
function auction.GetAuctionsPage() end

---Возвращает количество страниц в списке всех аукционов, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт 0.
---@return integer
function auction.GetAuctionsPageCount() end

---Возвращает информацию о состоянии аукциона.
---@param id ObjectId идентификатор аукциона
---@return AuctionGetAuctionStateResult
function auction.GetAuctionState(id) end

---Возвращает "приоритетный" уровень предмета при продаже на аукционе. '''Приоритетный уровень предмета''' - это уровень, на который удобнее всего ориентироваться игроку при покупке предмета. В зависимости от некоторых условий приоритетным уровнем предмета будет являться либо '''уровень предмета''', либо '''требуемый уровень предмета'''.
---@param id ObjectId идентификатор предмета
---@return integer|nil
function auction.GetItemForegroundLevel(id) end

---Возвращает информацию об аукционах. Если она еще не получена с сервера, то вернет nil и запросит сервер. В ответ прийдет: EVENT_AUCTION_PROPERTIES. Если будет получена ошибка, то можно снова запросить сервер, но через некоорое время (сейчас 10 секунд). Если придет успешное сообщение, то можно снова вызвать auction.GetProperties(). В этом случае запросы на сервер больше отсылаться не будут.
---@return AuctionGetPropertiesResult
function auction.GetProperties() end

---Возвращает true, если было инициировано создание аукциона с помощью auction.CreateForItem(...), а ответ EVENT_AUCTION_CREATION_RESULT ещё не пришёл.
---@return boolean
function auction.IsCreationInProgress() end

---Возвращает true, если был инициирован поиск аукционов с помощью  auction.Search, а ответ  EVENT_AUCTION_SEARCH_RESULT ещё не пришёл.
---@return boolean
function auction.IsSearchInProgress() end

---Проверяет, является ли допустимой маска для поиска по имени в фильтре поиска на аукционе. См. также  auction.Search.
---@param name string|nil маска для поиска по имени (nil означает, что имя не используется, пустое)
---@return boolean
function auction.IsSearchNameValid(name) end

---Попытается найти все аукционы с заданными параметрами. Фильтр поиска задается в отдельной таблице. Нужно указать поле для сортировки, направление сортировки и желательную страницу результата. Поле сортировки задается енумом  AUCTION_ORDERFIELD_.... Некоторые поля фильтра требуют строковый псевдоним какого-либо ресурса (itemClass, raretyMin, raretyMax). Проверить валидность маски для поиска по имени можно функцией  auction.IsSearchNameValid. Дополнительные подробности:  LuaApiDetails (закрытая ссылка) Новый поиск не начнётся, пока не закончен старый. См.  auction.IsSearchInProgress(). Результат поиска -  EVENT_AUCTION_SEARCH_RESULT. Список аукционов передается на клиент постранично и метод  auction.GetAuctions() возвращает только список из указанной при поиске страницы  auction.GetAuctionsPage(). Количество страниц -  auction.GetAuctionsPageCount().
---@param filter table фильр поиска. Описан таблицей с полями, каждое из которых может быть пустым (см. ниже)
---@param orderField number поле сортировке
---@param asc boolean направление сортировки. true - сортировать по возрастанию
---@param page integer номер страницы для показа, начиная с 1
---@param name string|nil маска для поиска по имени
---@param itemClass string|nil псевдоним класса предмета
---@param dressSlot number|nil слот одежды
---@param rarityMin string|nil псевдоним минимального качества предмета
---@param rarityMax string|nil псевдоним максимального качества предмета
---@param levelMin integer|nil минимальный уровень предмета
---@param levelMax integer|nil максимальный уровень предмета
---@param bidMin number|nil минимальная последняя ставка
---@param bidMax number|nil максивальная последняя ставка
---@param buyoutMin number|nil минимальная цена выкупа
---@param buyoutMax number|nil максивальная цена выкупа
---@param onlyMyAuctions boolean|nil показывать только аукционы, созданные главным игроком
---@param onlyAuctionsWithMyBids boolean|nil показывать только аукционы с последней ставкой от главного игрока
---@param rootCategory ItemCategoryId|nil идентификатор корневой категории
---@param childCategory ItemCategoryId|nil идентификатор терминальной категории
---@return нет
function auction.Search(filter, orderField, asc, page, name, itemClass, dressSlot, rarityMin, rarityMax, levelMin, levelMax, bidMin, bidMax, buyoutMin, buyoutMax, onlyMyAuctions, onlyAuctionsWithMyBids, rootCategory, childCategory) end
