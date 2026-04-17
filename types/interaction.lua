---@meta

--- CategoryInteraction
--- События и функции Lua Api, относящиеся к взаимодествию аватара (персонажа игрока) с NPC.

--- Ошибка при изучении заклинания или умения у тренера:
---@type integer
LEARN_ERROR_LOW_LEVEL = nil
---@type integer
LEARN_ERROR_NO_CASH = nil
---@type integer
LEARN_ERROR_NO_PREVIOS_RANKS = nil
---@type integer
LEARN_ERROR_ALREADY_KNOWN = nil
---@type integer
LEARN_ERROR_PREVIOS_TRAINING_UNFINISHED = nil

--- Тип торговца.
--- не торговец
---@type integer
VENDOR_NO_VENDOR = nil
--- обычный торговец с предметами неясного назначения
---@type integer
VENDOR_GENERAL = nil
--- торговец оружием и броней
---@type integer
VENDOR_WEAPON_ARMOR = nil
--- торговец компонентами для крафтинга
---@type integer
VENDOR_CRAFTING_COMPONENTS = nil
--- торговец используемыми предметами (еда, бутылки, ступки и т.п.)
---@type integer
VENDOR_USABLE_ITEMS = nil
--- у торговца есть хотя бы один гильдейский предмет
---@type integer
VENDOR_GUILD = nil
--- у торговца есть мирра
---@type integer
VENDOR_MYRRH = nil
--- у торговца есть руны
---@type integer
VENDOR_RUNE = nil
--- торговец продает товары за астральные баджики
---@type integer
VENDOR_BADGE = nil

---@class interactionLib
interaction = {}

--- Попытаться купить вещь у NPC-торговца.
---@param objectId ObjectId Id предмета для покупки
---@param quantity number( количество предметов для покупки
function interaction.Buy(objectId, quantity) end

--- Попытаться купить вещь у NPC-торговца и поместить в определённый слот инвентаря.
---@param objectId ObjectId Id предмета для покупки
---@param quantity number( количество предметов для покупки
---@param slot number( номер слота инвентаря
function interaction.Buy(objectId, quantity, slot) end

--- Возвращает реплику NPC-собеседника. Ответы можно получить в  avatar.GetInteractorNextCues().
---@return nil
function interaction.GetInteractorCue() end

--- Возвращает идентификатор точки телепортации, в которой находится мастер телепорта, с которым сейчас разговаривает главный игрок.
---@return ObjectId|nil
function interaction.GetInteractorCurrentLocation() end

--- Возвращает информацию по собеседнику, если он есть. Возвращаемая информация такая же, как и в  object.GetInteractorInfo( id ).
---@return table|nil
function interaction.GetInteractorInfo() end

--- Возвращает список возможных ответов на реплику NPC-собеседника  avatar.GetInteractorCue(). Ответ представлен полной информацией о следующей реплике, приходящей от NPC, в случае выбора этого ответа.
---@return table
function interaction.GetInteractorNextCues() end

--- Возвращает список точек телепортации мастера телепорта, с которым сейчас разговаривает главный игрок.
---@return table
function interaction.GetInteractorTeleportLocations() end

--- Возвращает информацию о текущем собеседнике аватара. Собеседником может быть устройство или NPC, см.  CategoryObject.
---@return ObjectId
function interaction.GetInterlocutor() end

--- Возвращает список Id вещей вторичного рынка на продажу у NPC-торговца.
---@return VendorItem[]
function interaction.GetSecondhandList() end

--- Возвращает информацию о точке телепортации. Информацию можно получить для имеющихся точек телепортации главного игрока, а также точек телепортации мастера телепорта, с которым разговаривает главный игрок, включая точку, в которой стоит мастер.
---@param locationId ObjectId идентификатор точки телепорта
---@return table|nil
function interaction.GetTeleportLocationInfo(locationId) end

--- Возвращает список известных главному игроку точек телепортации от мастеров телепортов.
---@return table
function interaction.GetTeleportLocations() end

--- Возвращает список Id проданных вещей на выкуп у NPC-торговца.
---@return VendorItem[]
function interaction.GetVendorBuyback() end

--- Возвращает список Id вещей на продажу у NPC-торговца (исключая товары вторичного рынка).
---@return VendorItem[]
function interaction.GetVendorList() end

--- Возвращает true, если собеседник имеет реплику для разговора. Также можно получить информацию о реплике с помощью  avatar.GetInteractorCue().
---@return boolean
function interaction.HasInteractorCue() end

--- Возвращает true, если собеседник имеет квест на выдачу или может принять квест.
---@return boolean
function interaction.HasInteractorQuest() end

--- Возвращает true, если собеседник имеет в данный момент начальную реплику для разговора. Эта реплика повляется в самом начале разговора и, начиная от неё, игрок может продолжить разговор с собеседником (NPC).
---@return boolean
function interaction.IsInteractorRootCue() end

--- Возвращает true, если собеседник является учителем. Иначе false.
---@return boolean
function interaction.IsInteractorTrainer() end

--- Возвращает true, если собеседник является торговцем. Иначе false.
---@return boolean
function interaction.IsInteractorVendor() end

--- Проверка состояния разговора аватара с NPC
---@return boolean
function interaction.IsTalking() end

--- Проверяем валидность locationId.
---@param locationId ObjectId идентификатор точки телепорта
---@return boolean
function interaction.IsTeleportLocationValid(locationId) end

--- Попытка начала разговора с собеседником (спросить список заданий, торговец ли он и т.п.).
function interaction.RequestInteractions() end

--- Попытка запросить у торговца список имеющихся товаров.
function interaction.RequestVendor() end

--- Запрашивает начальную реплику NPC-собеседника. В ответ прийдёт EVENT_INTERACTION_STARTED.
function interaction.ReturnToStartCue() end

--- Отвечает на реплику NPC-собеседника  avatar.GetInteractorCue(). Ответ - индекс в списке ответов  avatar.GetInteractorNextCues().
---@param index number( индекс ответа
function interaction.SelectInteractorCue(index) end

--- Попытка начать взаимодействовать с NPC. В случае успеха придёт EVENT_TALK_STARTED.
---@param unitId ObjectId
function interaction.StartInteract(unitId) end

--- Окончание взаимодействия с NPC
function interaction.StopInteract() end

--- В ответ на этот запрос, мастер телепорта, с которым разговаривает главный игрок, телепортирует игрока в заданную точку. Идентификатор Точки телепортации должен быть взят из списка точек телепортации, имеющихся у мастера телепорта.
---@param locationId ObjectId идентификатор точки телепортации
function interaction.TeleportToLocation(locationId) end

--- Прервать торговлю с игроком.
function interaction.CancelExchange() end

--- Возвращает информацию об игроке, принявшем приглашение на торговлю.
---@return table|nil
function interaction.GetExchangeInvited() end

--- Возвращает информацию об игроке, начавшем торговлю.
---@return table|nil
function interaction.GetExchangeInviter() end

--- Возвращает количество слотов обменного стола при торговле с игроком.
---@return number
function interaction.GetExchangeSlotCount() end

--- Возвращает true, если главный игрок находится в состоянии торговли с другим игроком. В этом состоянии он находится сразу после приглашения в группу (сам пригласил или был приглашен) и до окончания или отмены торговли.
---@return boolean
function interaction.HasExchange() end

--- Пригласить игрока к торговле (обмену вещами).
---@param invitedName WString имя приглашенного игрока для обмена
function interaction.InviteToExchange(invitedName) end

--- Возвращает true, если главный игрок является инициатором торговли с другим игроком.
---@return boolean
function interaction.IsAvatarExchangeInviter() end

--- Возвращает true, если главный игрок находится в состоянии приглашения торговли с другим игроком (сам пригласил или был приглашен), и в данный момент приглашение на торговлю ещё не принято.
---@return boolean
function interaction.IsExchangeInInvitation() end

--- Возвращает true, если главный игрок находится в активном состоянии торговли с другим игроком (приглашение уже было принято и торговля идет), и торговля ещё не закончена.
---@return boolean
function interaction.IsExchangeInProgress() end

--- При торговле с игроком, убрать c обменного стола предмет.
---@param exchangeSlot integer номер слота обменного стола
function interaction.RemoveExchangeItem(exchangeSlot) end

--- Возвращает информацию о тех взаимодействиях с объектом, которые доступны главному игроку.
---@param objectId ObjectId идентификатор объекта (НПС или устройство)
---@return table|nil
function interaction.GetInteractorInfo(objectId) end

--- Возвращает true, если интерактивный объект выглядит как моб. Иначе false.
---@param id ObjectId идентификатор объекта
---@return boolean
function interaction.HasMobVisual(id) end

--- Возвращает true, если интерактивный объект имеет квесты на выдачу или приём. Иначе false.
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function interaction.HasQuest(id) end

--- Возвращает true, если интерактивный объект может завершить (и выдать награду) какую-либо тайну мира. Иначе false.
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function interaction.HasWorldSecret(id) end

--- Возвращает true, если интерактивный объект является торговцем. Иначе false.
---@param id ObjectId Id интерактивного объекта
---@return boolean
function interaction.IsVendor(id) end

--- Возвращает информацию о классе тренера. Класс тренера может отличаться от класса самого персонажа. В случае ошибки метод возвращает nil.
---@param unitId ObjectId
function interaction.GetTrainerClass(unitId) end

--- Возвращает true, если юнит является учителем. Иначе false.
---@param id ObjectId Id юнита. Если передан Id игрока, вернёт false.
---@return boolean
function interaction.IsTrainer(id) end

-- Events

--- Событие посылается в ответ на запрос наличия доступных заданий у собеседника  avatar.RequestInteractions(). Также приходит автоматически при начале разговора.
EVENT_INTERACTION_STARTED = "EVENT_INTERACTION_STARTED"

--- Уведомление о невозможности торговли по причине игнора.
EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED = "EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED"

--- Во время торговли с другим игроком произошла ошибка.
EVENT_ITEMS_EXCHANGE_ERROR = "EVENT_ITEMS_EXCHANGE_ERROR"

--- Торговля между игроками завершена.
EVENT_ITEMS_EXCHANGE_FINISHED = "EVENT_ITEMS_EXCHANGE_FINISHED"

--- Главному игроку предложено поторговать с другим игроком.
EVENT_ITEMS_EXCHANGE_INVITED = "EVENT_ITEMS_EXCHANGE_INVITED"

--- Событие приходит, если какой либо из участников торговли между окончательно согласился с условиями обмена или отказался от своего окончательного согласия.
EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED"

--- Событие приходит, если какой либо из участников торговли между игроками поменял предметы на столе обмена.
EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED"

--- Событие приходит, если какой либо из участников торговли между игроками изменил сумму денег на игровом столе.
EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED"

--- Событие приходит, если какой либо из участников торговли между предварительно согласился с условиями обмена или отказался от своего предварительного согласия.
EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED = "EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED"

--- Главный игрок не может положить предмет на обменный стол, так как слот уже занят.
EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY = "EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY"

--- Главным игроком инициирована торговля между игроками.
EVENT_ITEMS_EXCHANGE_STARTED = "EVENT_ITEMS_EXCHANGE_STARTED"

--- Изменилось состояние торговли между игроками. Состояний может быть несколько:
EVENT_ITEMS_EXCHANGE_STATE_CHANGED = "EVENT_ITEMS_EXCHANGE_STATE_CHANGED"

--- Аватар начал разговор с NPC. Приходит после вызова  avatar.StartInteract().
EVENT_TALK_STARTED = "EVENT_TALK_STARTED"

--- Аватар закончил разговор с NPC
EVENT_TALK_STOPPED = "EVENT_TALK_STOPPED"

--- Событие приходит, если нельзя выучить заклинание или умения у тренера. Возвращаются коды всех найденных ошибок. См. LEARN_ERROR_....
EVENT_TRAINER_LEARN_ERROR = "EVENT_TRAINER_LEARN_ERROR"

--- Событие посылается, если не хватает места для покупки.
EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE = "EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE"

--- Событие посылается, если не хватает репутации для покупки.
EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL = "EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL"

--- Событие посылается, если для покупки не хватает очков заработанных за участие в событии.
EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT = "EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT"

--- Событие посылается, если во время покупки предмета он уже был продан кому-то другому.
EVENT_VENDOR_ITEM_ALREADY_SOLD = "EVENT_VENDOR_ITEM_ALREADY_SOLD"

--- Уведомление о невозможности продать предмет (предмет не продается).
EVENT_VENDOR_ITEM_NOT_FOR_SALE = "EVENT_VENDOR_ITEM_NOT_FOR_SALE"

--- Событие посылается в ответ на запрос наличия доступных вещей на продажу у NPC-торговца avatar.RequestVendor().
EVENT_VENDOR_LIST_UPDATED = "EVENT_VENDOR_LIST_UPDATED"
