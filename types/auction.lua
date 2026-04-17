---@meta

--- CategoryAuction
--- Методы и события для работы с аукционом.

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionBidResultMsgResult".
--- удачно
ENUM_AuctionBidResultMsgResult_SUCCESS = "ENUM_AuctionBidResultMsgResult_SUCCESS"
--- произошла какая-то ошибка
ENUM_AuctionBidResultMsgResult_ERROR = "ENUM_AuctionBidResultMsgResult_ERROR"
--- не хватает денег для ставки
ENUM_AuctionBidResultMsgResult_NOMONEY = "ENUM_AuctionBidResultMsgResult_NOMONEY"
--- информация об этом аукционе устарела
ENUM_AuctionBidResultMsgResult_OLDVERSION = "ENUM_AuctionBidResultMsgResult_OLDVERSION"
--- игрок не может выкупать вещь у себя самого
ENUM_AuctionBidResultMsgResult_SAMEUSER = "ENUM_AuctionBidResultMsgResult_SAMEUSER"
--- лот пропал, возможно, он был выкуплен либо снят с продажи
ENUM_AuctionBidResultMsgResult_NOTFOUND = "ENUM_AuctionBidResultMsgResult_NOTFOUND"

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionCreateResultMsg".
ENUM_AuctionCreateResultMsgResult_SUCCESS = "ENUM_AuctionCreateResultMsgResult_SUCCESS"
ENUM_AuctionCreateResultMsgResult_ERROR = "ENUM_AuctionCreateResultMsgResult_ERROR"
ENUM_AuctionCreateResultMsgResult_NOITEM = "ENUM_AuctionCreateResultMsgResult_NOITEM"
ENUM_AuctionCreateResultMsgResult_NOMONEY = "ENUM_AuctionCreateResultMsgResult_NOMONEY"

--- Время действия аукциона, указанное при создании:
---@type integer
AUCTION_CREATETIME_HOURS12 = nil
---@type integer
AUCTION_CREATETIME_HOURS24 = nil
---@type integer
AUCTION_CREATETIME_HOURS36 = nil
---@type integer
AUCTION_CREATETIME_HOURS48 = nil

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionDescriptorParticipationStatus".
ENUM_AuctionDescriptorParticipationStatus_NONE = "ENUM_AuctionDescriptorParticipationStatus_NONE"
ENUM_AuctionDescriptorParticipationStatus_OWNER = "ENUM_AuctionDescriptorParticipationStatus_OWNER"
ENUM_AuctionDescriptorParticipationStatus_WINNER = "ENUM_AuctionDescriptorParticipationStatus_WINNER"

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionDiscardResultMsgResult".
ENUM_AuctionDiscardResultMsgResult_SUCCESS = "ENUM_AuctionDiscardResultMsgResult_SUCCESS"
ENUM_AuctionDiscardResultMsgResult_ERROR = "ENUM_AuctionDiscardResultMsgResult_ERROR"
ENUM_AuctionDiscardResultMsgResult_NOMONEY = "ENUM_AuctionDiscardResultMsgResult_NOMONEY"
ENUM_AuctionDiscardResultMsgResult_OLDVERSION = "ENUM_AuctionDiscardResultMsgResult_OLDVERSION"

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionGetParamsResultMsgStatus".
--- удачно
ENUM_AuctionGetParamsResultMsgStatus_SUCCESS = "ENUM_AuctionGetParamsResultMsgStatus_SUCCESS"
--- произошла какая-то ошибка
ENUM_AuctionGetParamsResultMsgStatus_ERROR = "ENUM_AuctionGetParamsResultMsgStatus_ERROR"

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionGetResultMsgResult".
ENUM_AuctionGetResultMsgResult_SUCCESS = "ENUM_AuctionGetResultMsgResult_SUCCESS"
ENUM_AuctionGetResultMsgResult_NOTFOUND = "ENUM_AuctionGetResultMsgResult_NOTFOUND"
ENUM_AuctionGetResultMsgResult_ERROR = "ENUM_AuctionGetResultMsgResult_ERROR"

--- Столбец для сортировки результатов поиска аукционов:
---@type integer
AUCTION_ORDERFIELD_NAME = nil
---@type integer
AUCTION_ORDERFIELD_CLASS = nil
---@type integer
AUCTION_ORDERFIELD_SLOT = nil
---@type integer
AUCTION_ORDERFIELD_RARETY = nil
---@type integer
AUCTION_ORDERFIELD_LEVEL = nil
---@type integer
AUCTION_ORDERFIELD_TYPE = nil
---@type integer
AUCTION_ORDERFIELD_BID = nil
---@type integer
AUCTION_ORDERFIELD_BUYOUT = nil
---@type integer
AUCTION_ORDERFIELD_LEFTTIME = nil
---@type integer
AUCTION_ORDERFIELD_NONE = nil

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AuctionSearchResultMsgResult".
ENUM_AuctionSearchResultMsgResult_SUCCESS = "ENUM_AuctionSearchResultMsgResult_SUCCESS"
ENUM_AuctionSearchResultMsgResult_NOLANG = "ENUM_AuctionSearchResultMsgResult_NOLANG"
ENUM_AuctionSearchResultMsgResult_ERROR = "ENUM_AuctionSearchResultMsgResult_ERROR"

---@class auctionLib
auction = {}

--- Попытаться сделать ставку на аукционе.
---@param id ObjectId id аукциона
---@param price number ставка
function auction.Bid(id, price) end

--- Попытаться выкупить предмет на аукционе по назначенной владельцем окончательной цене.
---@param id ObjectId id аукциона
function auction.Buyout(id) end

--- Возвращает true, если для предмета c таким id можно создать аукцион.
---@param itemId ObjectId id предмета, который выставляется на аукцион; предмет должен находится в одном из контейнеров (например в инвентаре)
---@return boolean
function auction.CanCreateForItem(itemId) end

--- Попытается создать аукцион с заданными параметрами. Время действия задано енумом - AUCTION_CREATETIME__....
---@param itemId ObjectId id предмета, который выставляется на аукцион
---@param startPrice number стартовая цена (в меди, должна быть в диапазоне 1 - 999999999999)
---@param buyoutPrice number окончательная цена выкупа с прекращением аукциона (в меди, должна быть в диапазоне 1 - 999999999999 либо -1, тогда нет досрочного выкупа)
---@param timeLength integer время действия аукциона
function auction.CreateForItem(itemId, startPrice, buyoutPrice, timeLength) end

--- Попытаться отменить аукцион.
---@param id ObjectId id аукциона
function auction.Discard(id) end

--- Возвращает информацию об аукционе.
---@param id ObjectId идентификатор аукциона
---@return table|nil
function auction.GetAuctionInfo(id) end

--- Возвращает список аукционов на указанной странице, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт пустую таблицу.
---@return table
function auction.GetAuctions() end

--- Возвращает количество аукционов, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт 0.
---@return number
function auction.GetAuctionsCount() end

--- Возвращает номер текущей страницы списка аукционов, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт 0. В случае успеха, страницы нумеруются с 1.
---@return number
function auction.GetAuctionsPage() end

--- Возвращает количество страниц в списке всех аукционов, найденных запросом auction.Search(...). Если запрос не был произведён, вернёт 0.
---@return number
function auction.GetAuctionsPageCount() end

--- Возвращает информацию о состоянии аукциона.
---@param id ObjectId идентификатор аукциона
---@return table|nil
function auction.GetAuctionInfo(id) end

--- Возвращает "приоритетный" уровень предмета при продаже на аукционе.
---@param id ObjectId идентификатор предмета
---@return number
function auction.GetItemForegroundLevel(id) end

--- Возвращает информацию об аукционах.
---@return table|nil
function auction.GetProperties() end

--- Возвращает true, если было инициировано создание аукциона с помощью auction.CreateForItem(...), а ответ EVENT_AUCTION_CREATION_RESULT ещё не пришёл.
---@return boolean
function auction.IsCreationInProgress() end

--- Возвращает true, если был инициирован поиск аукционов с помощью  auction.Search, а ответ  EVENT_AUCTION_SEARCH_RESULT ещё не пришёл.
---@return boolean
function auction.IsSearchInProgress() end

--- Проверяет, является ли допустимой маска для поиска по имени в фильтре поиска на аукционе. См. также  auction.Search.
---@param name WString|nil маска для поиска по имени (nil означает, что имя не используется, пустое)
---@return boolean
function auction.IsSearchNameValid(name) end

--- Попытается найти все аукционы с заданными параметрами. Фильтр поиска задается в отдельной таблице. Нужно указать поле для сортировки, направление сортировки и желательную страницу результата.
---@param filter table фильр поиска. Описан таблицей с полями, каждое из которых может быть пустым (см. ниже)
---@param orderField integer поле сортировке
---@param asc boolean направление сортировки. true - сортировать по возрастанию
---@param page integer номер страницы для показа, начиная с 1
function auction.Search(filter, orderField, asc, page) end

-- Events

--- Событие приходит в ответ на запрос auction.Bid(id, price).
EVENT_AUCTION_BID_RESULT = "EVENT_AUCTION_BID_RESULT"

--- Событие приходит в ответ на запрос auction.CreateForItem( ... ).
EVENT_AUCTION_CREATION_RESULT = "EVENT_AUCTION_CREATION_RESULT"

--- Событие приходит в ответ на запрос auction.Discard( id ).
EVENT_AUCTION_DISCARD_RESULT = "EVENT_AUCTION_DISCARD_RESULT"

--- Событие приходит в ответ на запрос auction.GetProperties().
EVENT_AUCTION_PROPERTIES = "EVENT_AUCTION_PROPERTIES"

--- Событие приходит в ответ на запрос auction.Search( ... ).
EVENT_AUCTION_SEARCH_RESULT = "EVENT_AUCTION_SEARCH_RESULT"

--- Событие приходит автоматически, если было необходимо обновить информацию об аукционе в результате auction.Bid( id ) или auction.Discard( id ) (сервер вернул код ошибки - OLD_VERSION).
EVENT_AUCTION_UPDATE_RESULT = "EVENT_AUCTION_UPDATE_RESULT"
