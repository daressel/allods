---@meta

---Событие посылается, когда в книге умений появилось новое пассивное умение (абилка). На этапе загрузки персонажа событие не посылается.
---@class EventAbilitiesElementAddedParams
---@field id AbilityId Id ресурса пассивного умения
---@field silent boolean не выводить нотификацию если true

---Событие присылается при уничтожении RunTime аккаунта по причине дисконнекта, чтобы была возможность показать сообщение об этом игроку прежде, чем клиент схлопнется. Нужно для запуска из ИЦ, т.к. клиент, запущенный из ИЦ никогда не выходит в логин-скрин, а тупо схлопывается. Логин происходит из ИЦ, клиент не способен повторить эту авторизацию, нужен перезапуск из ИЦ.
---@class EventAccountHasDestroyedParams

---Уведомление о неудачном исполнении эксплойта.
---@class EventActionFailedExploitParams
---@field sysId string строковый код ошибки вида "ENUM_ActionFailCause_..."
---@field isInNotPredicate boolean true, если причина ошибки на самом деле противоположна полученному коду ошибки sysId
---@field name string имя предмета, необходимого для каста
---@field name string имя баффа в списке баффов, необходимого для каста
---@field dress number тип одежды/оружия, необходимый для каста
---@field name string имя класса, необходимого для каста
---@field race number раса, необходимая для каста, поле устарело (OBSOLETE)
---@field sysRace string (enum "ENUM_CreatureRace_..."), где значения перечисления:

---Уведомление о неудачном исполнении действия, не являющего заклинанием или эксплойтом.
---@class EventActionFailedOtherParams
---@field sysId string строковый код ошибки
---@field isInNotPredicate boolean true, если причина ошибки на самом деле противоположна полученному коду ошибки sysId
---@field name string имя предмета, необходимого для каста
---@field sysName string служебное название ресурса
---@field name string имя баффа в списке баффов, необходимого для каста
---@field dress number тип одежды/оружия, необходимый для каста
---@field name string имя класса, необходимого для каста
---@field race number раса, необходимая для каста, поле устарело (OBSOLETE)
---@field sysRace string раса существа

---Уведомление о неудачном исполнении заклинания.
---@class EventActionFailedSpellParams
---@field sysId string строковый код ошибки вида "ENUM_ActionFailCause_..."
---@field unitId ObjectId идентификатор юнитам, вызвавшего ошибку
---@field spellId SpellId идентификатор исполняемого заклинания
---@field isInNotPredicate boolean true, если причина ошибки на самом деле противоположна полученному коду ошибки sysId
---@field name string|nil имя предмета, необходимого для каста
---@field number integer|nil необходимое количество предметов
---@field dress number|nil тип одежды/оружия, необходимый для каста
---@field itemClass string|nil имя класса предмета, необходимого для каста
---@field race number|nil раса, необходимая для каста, поле устарело (OBSOLETE)
---@field sysRace string|nil где значения перечисления:
---@field psionicContactType number|nil тип контакта (PSIONIC_CONTACT_NORMAL, PSIONIC_CONTACT_CRUDE)
---@field sysPsionicContactType string|nil строковое значение типа ("ENUM_Normal", "ENUM_Crude")
---@field number integer|nil необходимое количество
---@field name string|nil имя
---@field name string|nil имя фракции
---@field reputationLevel number|nil уровень репутации, если требуется
---@field mobs string[] таблица имён подходящих мобов

---Событие посылается каждый раз, когда изменилось состояние панели действий (ActionPanel).
---@class EventActionPanelChangedParams

---Событие посылается каждый раз, когда изменилось состояние элемента на панели действий (ActionPanel). К созданию/удалению элемента это не относится, при этом изменяется панель целиком. При изменении каких-либо эффектов приходит  EVENT_ACTION_PANEL_ELEMENT_EFFECT.
---@class EventActionPanelElementChangedParams

---Оповещение о начале эффекта для элемента на панели управления. Типы эффектов: ''' EFFECT_TYPE_...'''. Для некоторых из них в сообщении передаются дополнительные поля. Всё остальное, что не касается эффектов, при изменении присылает EVENT_ACTION_PANEL_ELEMENT_CHANGED. Событие ГКД:  EVENT_GLOBAL_COOLDOWN '''Внимание! Для событий COOLDOWN учитывается только КД самого спелла и КД группы спеллов (разные ранги, умения за слезы и тп). ГКД не учитывается! При начале и окончании ГКД данное событие не приходит'''
---@class EventActionPanelElementEffectParams
---@field effect number тип начавшегося эффекта
---@field index integer индекс элемента на панели управления
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах
---@field prepared boolean текущее значение флага prepared
---@field isActive boolean true, спелл стал активным

---Уведомление о прерывании текущего действия.
---@class EventProcessTerminatedParams
---@field sysId string строковый код ошибки вида "ENUM_ActionFailCause_..."

---Событие присылается при окончании действия юнитом.
---@class EventActionProgressFinishParams

---Событие присылается во время заморозки action.
---@class EventActionProgressFreezeParams
---@field progress number обновление времени действия action

---Событие присылается при запуске действия юнитом.
---@class EventActionProgressStartParams
---@field duration number время действия "действия"
---@field progress number прошло времени (так как событие может прийти с задержкой)
---@field name string название действия
---@field launchWhenReady boolean если true то действие сработает сразу после окончания подготовки, если false, то действие можно приготовить и удерживать его запуск
---@field spellId SpellId|nill если известен спелл, то присылается идентификатор спелла
---@field isPrecast boolean|nil если известен спелл, то присылается признак, что у спелла есть время прекаста
---@field isChannel boolean|nil если известен спелл, то присылается признак, что у спелла есть механика чаннелинга

---Событие присылается во время действия action.
---@class EventActionProgressUpdateParams
---@field progress number обновление времени действия action
---@field name string название действия

---Уведомление об особых результатах выполнения заклинания.
---@class EventActionResultSpecialSpellParams
---@field sysId string строковый код ошибки вида "ENUM_ACTION_RESULT_SPECIAL_...", значения:
---@field unitId ObjectId идентификатор юнита, ставшего непосредственной причиной данного уведомление
---@field targetId ObjectId|nil идентификатор объекта в которого выпущено заклинание(ENUM_ACTION_RESULT_SPECIAL_LAUNCHED)
---@field spellId SpellId идентификатор заклинания

---Событие посылается каждый раз, когда у главного игрока меняется активное ездовое животное (он садится на него или слазит с него).
---@class EventActiveMountChangedParams

---Событие посылается каждый раз, когда у главного игрока поменялся скин ездового животного.
---@class EventActiveMountSkinChangedParams

---Событие посылается каждый раз, когда у главного игрока кардинально поменялось время жизни ездового животного (сколько времени осталось до исчезновения этого животного из конюшни). Событие приходит, только если время меняется скачком на большую величину по каким-то причинам на сервере. Стандартные периодические изменения на одну секунду не вызывают  это событие.
---@class EventActiveMountTimeLeftChangedParams

---Событие посылается каждый раз, когда у главного игрока меняется активный пет.
---@class EventActivePetChangedParams

---Событие посылается каждый раз, когда у главного игрока меняется активный пет. Близкий аналог EVENT_ACTIVE_PET_CHANGED. Если вы не понимаете разницу между данным событием и EVENT_ACTIVE_PET_CHANGED, то данное событие использовать не следует.
---@class EventActivePetExistChangedParams

---Событие посылается каждый раз, когда у активного пета главного игрока меняется список или активное заклинание.
---@class EventActivePetSpellsChangedParams

---Событие посылается каждый раз, когда у активного пета главного игрока меняется внутреннее состояние (тип движения, атаки или состояние боя).
---@class EventActivePetStateChangedParams

---Событие присылается при изменении показателей состояния аддона. Основным показателем состояния является '''статус состояния аддона''' - количество ассертов возбуждаемых исполнением кода скрипта аддона. В зависимости от количества и частоты возбуждаемых ассертов статус состояния может принимать значения в диапазоне  ENUM_ADDON_HEALTH_STATUS_... Отслеживания состояния аддонов необходимо в следствии того, что некоторые из них имеют ошибки в коде, создающие чрезмерную спам-нагрузку на интерфейс клиента.
---@class EventAddonHealthChangedParams
---@field sysName string системное имя аддона
---@field status number статус состояния аддона

---Уведомление об изменении состояния аддона. Список возможных состояний смотри в  AddonState
---@class EventAddonLoadStateChangedParams
---@field name string Системное имя аддона
---@field state AddonState Новое состояние аддона
---@field isUserAddon boolean Является ли аддон пользовательским

---Событие присылается когда система фиксирует критически большое ухудшение производительность клиента из-за конкретного аддона.
---@class EventAddonReducePerfomanceParams
---@field sysName string системное имя аддона
---@field timeMs number среднее время обработки события аддоном (в миллисекундах)
---@field deltaFps number приблизительное количество кадров в секунду которые отнимает аддон
---@field maxDeltaFps number максимальное количество кадров в секунду которые отнимал аддон

---Присылается, если сервер не смог осуществить какую-то операцию с другим игроком.
---@class EventAddresseeNotFoundParams
---@field name string имя другого игрока
---@field sysRequestType string (enum "ENUM_RequestAddressByNameType_...")- тип запроса
---@field sysCause string (enum "ENUM_RequestAddressByNameFailCause_...")- причина ошибки

---Событие присылается при клике в террейн при активном AEMark. См. также  GamePosition.
---@class EventAemarkPointClickedParams
---@field [any] GamePosition

---Событие посылается, когда игрок меняет статус AFK
---@class EventAfkStateChangedParams
---@field id ObjectId Id игрока, меняющего статус AFK
---@field isAfk boolean новый статус AFK

---Использование умения алхиии завершилось или было прервано.
---@class EventAlchemyCanceledParams
---@field isSuccess boolean false, если действие было прервано (например аватар двинулся\прыгнул или убит); true если действие завершилось нормально

---Алхимический компонент удачно положен/вынут в алхимический слот с помощью avatar.PutAlchemyItemToSlot(itemId, slot).
---@class EventAlchemyItemPlacedParams
---@field slot integer номер слота
---@field placed boolean true если положен, false если вынут

---Событие приходит, если игрок пытается положить в ступку предмет, но он не является алхимическим.
---@class EventAlchemyNotAlchemyItemParams

---Событие приходит, когда не удалось добавить компонент в ступку из-за того что в сумке недостаточно таких предметов.
---@class EventAlchemyNotAvailableResourcesParams
---@field itemId ObjectId идентификатор предмета который пытались положить
---@field slot number номер слота в который пытались положить

---Событие приходит, если не хватает компонент для алхимии.
---@class EventAlchemyNotEnoughComponentsParams

---Завершён первый этап алхимической реакции. Дополнительные подробности: LuaApiDetails (закрытая ссылка)
---@class EventAlchemyReactionFinishedParams

---Изменился список алхимических рецептов главного игрока.
---@class EventAlchemyRecipesChangedParams

---Изменился уровень умения алхимии главного игрока.
---@class EventAlchemyScoreChangedParams

---Умение алхиии начало действие после использования алхимического инструмента. Теперь можно положить ингредиенты, используя avatar.PutAlchemyItemToSlot( itemId, slot ).
---@class EventAlchemyStartedParams

---Событие приходит при добавлении целей (смены статуса на активные)
---@class EventAllodsGoalAddedParams

---Событие приходит при изменении списка текущих целей аватара. Список целей можно получить при помощи функции  common.GetAllodsGoals()
---@class EventAllodsGoalChangedParams

---Событие приходит при завершении целей (смены статуса на завершённые)
---@class EventAllodsGoalCompletedParams

---Уведомление об изменении метора главного игрока, у которого главный игрок состоит в учениках.
---@class EventApprenticeMentorChangedParams

---Событие посылается каждый раз, когда игрок переместился в другой астральный хаб.
---@class EventAstralHubChangedParams

---Событие посылается каждый раз, когда игрок игрок попадает или уходит с астрального острова.
---@class EventAstralIslandChangedParams

---Событие посылается каждый раз, когда изменилось время коллапса астрального острова, на котором находится главный игрок.
---@class EventAstralIslandTimeChangedParams

---Событие посылается, если изменилась доступность астрального объекта в хабе.
---@class EventAstralObjectEnabledChangedParams
---@field objectId ObjectId идентификатор объекта

---Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает астральный объект.
---@class EventAstralObjectsChangedParams
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся объектов
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших объектов

---Событие посылается каждый раз, когда изменяется список точек проведения астральных ивентов .
---@class EventAstralPoisChangedParams

---Событие посылается каждый раз, когда игрок переместился в другой астральный сектор.
---@class EventAstralSectorChangedParams

---Событие возвращающее результат проверки группы на возможность совершения прыжка в выбранный сектор астрала до выбранной POI.
---@class EventAstralSectorCheckJumpResultParams
---@field id ObjectId идентификатор выбранной POI
---@field sectorId AstralSectorId сектор астрала которому принадлежит выбранная POI
---@field isSuccess boolean true, если прыжек доступен. Проверка завершилась успешно
---@field failEntries table|nil если isSuccess == true, то nil. Список причин провала проверки (индексирован с 1), каждый элемент которого таблица с полями:
---@field failType string тип неудовлетворенного требования "ENUM_FailType_..."
---@field names table список имен аватаров (индексирован с 1) не удовлетворяющих требованию failType

---Событие, если астральный моб изменил агрессивность по отношению к главному игроку.
---@class EventAstralUnitAggroChangedParams
---@field id ObjectId Id астрального юнита

---Событие присылается при изменении координат астрального моба.
---@class EventAstralUnitPosChangedParams
---@field unitId ObjectId Id астрального юнита

---Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или астральный монстр.
---@class EventAstralUnitsChangedParams
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся монстров
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших монстров

---Событие посылается каждый раз, когда в астральном хабе корабль аватара подобрал обломки.
---@class EventAstralWreckLootTakenParams
---@field count integer количество обломков

---Событие посылается при изменении информации о доступных секторах для прыжка (быстрое путешествие).
---@class EventAstrolabeInfoChangedParams
---@field id ObjectId идентификатор корабля

---Оповещение об изменении спелла астролябии на корабле.
---@class EventAstrolabeSpellChangedParams
---@field id SpellId идентификатор ресурса спелла

---Оповещение о начале эффекта для спелла астролябии на корабле. Параметры как в  EVENT_SPELLBOOK_ELEMENT_EFFECT.
---@class EventAstrolabeSpellEffectParams

---Уведомление о неудачной немагической атаке. Более подробная информация - функция avatar.GetAttackResult (закрытая ссылка) библиотеки "avatar".
---@class EventAttackResultParams

---Событие приходит в ответ на запрос auction.Bid(id, price). Возвращаемые значения см. в "ENUM_AuctionBidResultMsgResult_...".
---@class EventAuctionBidResultParams
---@field id ObjectId id аукциона
---@field sysResult string код результата

---Событие приходит в ответ на запрос auction.CreateForItem( ... ). Возвращаемые значения см. в "ENUM_AuctionCreateResultMsg_...".
---@class EventAuctionCreationResultParams
---@field sysResult string код результата

---Событие приходит в ответ на запрос auction.Discard( id ). Возвращаемые значения см. в "ENUM_AuctionDiscardResultMsgResult_...".
---@class EventAuctionDiscardResultParams
---@field id ObjectId id аукциона
---@field sysResult string код результата

---Событие приходит в ответ на запрос auction.GetProperties(). Возвращаемые значения см. в "ENUM_AuctionGetParamsResultMsgStatus_...".
---@class EventAuctionPropertiesParams
---@field id ObjectId id аукциона
---@field sysResult string код результата

---Событие приходит в ответ на запрос auction.Search( ... ). Возвращаемые значения см. в "ENUM_AuctionSearchResultMsgResult_...". В случае успеха можно получить список найденных аукционов на текущей странице с помощью auction.GetAuctions().
---@class EventAuctionSearchResultParams
---@field sysResult string код результата
---@field totalPagesCount integer количество страниц в аукционе

---Событие приходит автоматически, если было необходимо обновить информацию об аукционе в результате auction.Bid( id ) или auction.Discard( id ) (сервер вернул код ошибки - OLD_VERSION). Возвращаемые значения см. в "ENUM_AuctionGetResultMsgResult_...".
---@class EventAuctionUpdateResultParams
---@field id ObjectId id аукциона
---@field sysResult string код результата

---Присылается при обновлении информации о доступности орденов для вступления.
---@class EventAvailableOrdersChangedParams

---Событие приходит, если главный игрок был добавлен в чей-то список друзей.
---@class EventAvatarAddedToFriendListParams
---@field name string имя добавившего

---Событие посылается при изменении состояния жизни аватара.
---@class EventAvatarAliveChangedParams
---@field alive boolean жив ли аватар

---Событие приходит при любом изменении состояния барьеров (паладина).
---@class EventAvatarBarriersChangedParams

---Событие посылается каждый раз, когда у главного игрока меняется привязанное транспортное средство (вызвал в ангаре/отозвал и т.п.).
---@class EventAvatarBindedTransportChangedParams

---Событие посылается в случае невозможности снять бафф с аватара с помощью avatar.RemoveBuff( buffIndex ).
---@class EventAvatarBuffRemovingFailedParams

---Событие присылается, когда меняется форма класса аватара.
---@class EventAvatarClassFormChangedParams

---Событие присылается при переходе аватара в другую зону. Уведомляет о более мелких (клиентских) подзонах чем  EVENT_AVATAR_ZONE_CHANGED. Замечание. Данное событие - клиентское, в отличие от серверного  EVENT_AVATAR_ZONE_CHANGED, подробности см. в последнем.
---@class EventAvatarClientZoneChangedParams

---Событие посылается при создании игрока.
---@class EventAvatarCreatedParams

---Событие посылается каждый раз, когда меняется количество Очков Судьбы у персонажа игрока.
---@class EventAvatarDestinyPointsChangedParams
---@field total integer всего полученно/потеряно Очков Судьбы
---@field bonus integer сколько из этих Очков Судьбы было получено в качестве бонуса из бонусного пула

---Событие присылается при изменении направления аватара более чем на 3 градуса.
---@class EventAvatarDirChangedParams
---@field dir number угол в радианах от 0 до +-3.14

---Игрок зашел в процедурный данж.
---@class EventAvatarEnterProceduralDungeonParams

---Событие посылается каждый раз, когда изменился опыт персонажа игрока.
---@class EventAvatarExperienceChangedParams
---@field currentExp integer опыт персонажа
---@field currentLevelExp integer опыт для получения текущего уровня персонажа
---@field nextLevelExp integer опыт для получения следующего уровня персонажа
---@field extraExp integer накопленный бонусный опыт, который может быть переведен в текущий(currentExp) при помощи "Фолианта знаний"

---Событие о добавлении персонажа в список друзей.
---@class EventAvatarFriendAddedParams
---@field name string имя персонажа

---Событие приходит при изменении имени реморта друга.
---@class EventAvatarFriendAltNameChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name string имя персонажа
---@field altName string имя реморта персонажа

---Событие приходит при изменении описания друга.
---@class EventAvatarFriendDescriptionChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока

---Событие приходит при неудачной операции со списком друзей/игнорирования.
---@class EventAvatarFriendIgnoreListsErrorParams
---@field sysError string код ошибки

---Событие приходит при изменении изменились базовых полей описания друга.
---@class EventAvatarFriendInfoChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name string имя друга

---Событие приходит при изменении уровня друга.
---@class EventAvatarFriendLevelChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name string имя персонажа
---@field level integer новый уровень персонажа

---Событие приходит при изменении списка друзей.
---@class EventAvatarFriendListChangedParams

---Событие приходит при завершении загрузки списка друзей с сервера.
---@class EventAvatarFriendListLoadedParams

---Событие приходит при изменении настроения друга.
---@class EventAvatarFriendMoodChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока

---Событие приходит при изменении состояния взаимности друга.
---@class EventAvatarFriendMutualChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name string имя персонажа
---@field isMutual boolean состояние взаимности персонажа

---Событие приходит при изменении состояния онлайн друга.
---@class EventAvatarFriendOnlineChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name string имя персонажа
---@field isOnline boolean находится ли персонаж в онлайне
---@field sysStatus string онлайн состояние персонажа

---Уведомление об удалении персонажа из списка друзей.
---@class EventAvatarFriendRemovedParams
---@field name string имя персонажа

---Событие приходит при изменении пола друга.
---@class EventAvatarFriendSexChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока

---Событие приходит при изменении карты, на которой находится друг.
---@class EventAvatarFriendZoneChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name string имя персонажа
---@field mapId ObjectId|nil идентификатор карты, на которой находится персонаж, если она известна

---Уведомление о добавлении персонажа в список игнорирования.
---@class EventAvatarIgnoreAddedParams
---@field id ObjectId идентификатор элемента из списка игнорирования
---@field name string имя персонажа

---Событие приходит при изменении описания игнорируемого игрока.
---@class EventAvatarIgnoreDescriptionChangedParams
---@field id ObjectId идентификатор элемента списка друзей главного игрока

---Событие приходит при изменении списка игнорирования.
---@class EventAvatarIgnoreListChangedParams

---Событие приходит при завершении загрузки игнор листа с сервера.
---@class EventAvatarIgnoreListLoadedParams

---Уведомление об удалении персонажа из списка игнорирования.
---@class EventAvatarIgnoreRemovedParams
---@field name string имя персонажа

---Сообщение приходит, когда главный игрок теряет предмет. В сообщеннии приходит ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText. Внимание! сообщение приходит только в UIState.
---@class EventAvatarItemDroppedParams
---@field itemObject ValuedObject объект, содержащий информацию о предмете
---@field actionType string откуда взялся предмет

---Сообщение приходит, когда главный игрок получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText. Внимание! сообщение приходит только в UIState.
---@class EventAvatarItemTakenParams
---@field itemObject ValuedObject объект, содержащий информацию о предмете
---@field actionType string откуда взялся предмет

---Сообщение приходит, когда согрупник или соотрядник главного игрока получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText. Внимание! сообщение приходит только в UIState.
---@class EventAvatarItemTakenByGroupmateParams
---@field playerId ObjectId|nil идентификатор согрупника, если возможно его получить
---@field itemObject ValuedObject объект, содержащий информацию о предмете
---@field actionType string откуда взялся предмет

---Игрок вышел из процедурного данжа.
---@class EventAvatarLeaveProceduralDungeonParams

---Событие присылается, если игрок отменил выход из миссии (с помощью mission.CancelLogout()). -- Без параметров
---@class EventAvatarLogoutCancelledParams

---Событие присылается при переходе аватара на другую карту. -- Без параметров
---@class EventAvatarMapChangedParams

---Событие присылается когда становится доступна информация о местонахождении аватара. Только после этого события можно пытаться вызывать функции связанные с картой.
---@class EventAvatarMapInfoAvailableParams

---Событие присылается, если изменились модификаторы карты на карте главного игрока.
---@class EventAvatarMapModifiersChangedParams

---Уведомление о выполнении достижения аватаром.
---@class EventAvatarMedalFinishedParams
---@field id Number идентификатор достижения

---Событие посылается каждый раз, когда изменилось количество денег у игрока.
---@class EventAvatarMoneyChangedParams

---Сообщение приходит, когда главный игрок потерял деньги. Внимание! сообщение приходит только в UIState.
---@class EventAvatarMoneyDroppedParams
---@field money integer количество денег
---@field actionType string почему потеряны деньги

---Сообщение приходит, когда главный игрок получает деньги. Внимание! сообщение приходит только в UIState.
---@class EventAvatarMoneyTakenParams
---@field money integer количество денег
---@field actionType string откуда получены деньги

---Сообщение приходит, когда согрупник или соотрядник главного игрока получает деньги. Внимание! сообщение приходит только в UIState.
---@class EventAvatarMoneyTakenByGroupmateParams
---@field playerId ObjectId|nil идентификатор согрупника, если возможно его получить
---@field money integer количество денег
---@field actionType string откуда взялся предмет

---Событие присылается при изменении координат аватара. -- Без параметров
---@class EventAvatarPosChangedParams

---Приходит, если главный игрок получил один из типов опыта для развития. Это может быть обычный опыт (experience), репутация с какой-либо фракцией, слава за PvP сражения. См.  ENUM_DevelopmentTrack_...,  ENUM_DevelopmentSource_....
---@class EventAvatarProgressGainedParams
---@field type number тип опыта
---@field sysType string строковое представление типа опыта
---@field source number тип источника опыта
---@field sysSource string строковое представление типа источника опыта
---@field total number полученное количество опыта
---@field bonus number сколько из этого опыта было получено за бонусные очки
---@field level number уровень
---@field value number текущее значение
---@field isPvPExperience boolean этот опыт был получен за PvP
---@field factionId FactionId фракция

---Событие посылается каждый раз, когда меняется доступ в классовый канал чата псиоников.
---@class EventAvatarPsionicChannelChangedParams

---Событие посылается каждый раз, когда у псионика (основного игрока) появляется псионический контакт.
---@class EventAvatarPsionicContactAddedParams
---@field type number тип контакта

---Событие посылается каждый раз, когда у псионика (основного игрока) меняется состояние (цель или длительность (durationMs, но не remainingMs)) определенного псионического контакта.
---@class EventAvatarPsionicContactChangedParams
---@field type number тип контакта

---Событие посылается каждый раз, когда у псионика (основного игрока) исчезает псионический контакт.
---@class EventAvatarPsionicContactRemovedParams
---@field type number тип контакта

---Событие приходит периодически, когда псионик определяет, что около него есть вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка). Периодичность события определяется серверной механикой. Октант направления на врага возвращается числом от 0 до 7. Размер октанта - одна восьмая окружности. Середина нулевого октанта - направление на север. Далее номера октантов увеличиваются по часовой стрелке. То есть:
---@class EventAvatarPsionicDangerSenseLocatedParams
---@field octant integer номер октанта, в котором замечен враг
---@field hidden boolean true, если враг невидим

---Событие посылается каждый раз, когда псионик определяет, что его поселектил вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка).
---@class EventAvatarPsionicDangerSenseTargetParams
---@field unitId ObjectId id игрока, поселектившего псионика

---Событие посылается каждый раз, когда псионик читает мысли другого игрока или NPC. Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
---@class EventAvatarPsionicReadThoughtParams
---@field unitId ObjectId id юнита, у которого прочитали мысль
---@field thought string сама мысль

---Событие посылается каждый раз, когда псионик читает мысли другого игрока, но не может их понять (противоположная фракция). Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
---@class EventAvatarPsionicUnreadableThoughtParams
---@field unitId ObjectId id юнита, у которого прочитали мысль
---@field factionName string имя фракции (того игрока, мысль которого прочитал псионик)

---Событие посылается каждый раз, когда у сталкера (основного игрока) меняется что-либо в колчане.
---@class EventAvatarStalkerCartridgeBeltChangedParams

---Событие посылается при появлении барьеров дамага у лучника.
---@class EventAvatarStalkerDamagePoolAddedParams

---Событие посылается при изменении состояния барьеров дамага у лучника.
---@class EventAvatarStalkerDamagePoolChangedParams

---Событие посылается при исчезновении барьеров дамага у лучника.
---@class EventAvatarStalkerDamagePoolRemovedParams

---Приходит, если изменилась возможность распределять пункты характеристик.
---@class EventAvatarStatsCanImproveChangedParams

---Изменение статов аватара: базовых, брони, сопротивляемости.
---@class EventAvatarStatsChangedParams

---Событие приходит при смене таргета игроком.
---@class EventAvatarTargetChangedParams
---@field isTargetDead boolean|nil true, когда таргет поменялся в результате его смерти, иначе nil

---Событие с рекомендацией сервера об изменении цели аватара на указанную.
---@class EventAvatarTargetRecommendedParams
---@field targetId ObjectId рекомендуемая цель

---Событие посылается при изменении основной цели основной цели (это не опечатка) аватара.
---@class EventAvatarTargetTargetChangedParams

---Событие посылается каждый раз, когда у главного игрока меняется транспортное средство (появляется, исчезает).
---@class EventAvatarTransportChangedParams

---Уведомление о получении какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
---@class EventAvatarUnlockAddedParams
---@field unlockId ObjectId идентификатор анлока
---@field unlockName string название анлока
---@field unlockEndTime Number|nil дата окончания действия анлока, если анлок временный, иначе nil

---Уведомление о изменении состояния анлока.
---@class EventAvatarUnlockChangedParams
---@field id ObjectId идентификатор анлока

---Уведомление о потере какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
---@class EventAvatarUnlockRemovedParams
---@field unlockId ObjectId идентификатор анлока
---@field unlockName string название анлока

---Уведомление об изменении состояний залоченности для аватара. Например, может измениться доступность слота для экипировки и т.д.
---@class EventAvatarUnlocksChangedParams

---Событие присылается при смене (получении, потере) используемого устройства.
---@class EventAvatarUsedObjectChangedParams

---Событие посылается при изменении режима движения игрока (шагом/бегом).
---@class EventAvatarWalkModeChangedParams

---Событие посылается каждый раз, когда у основного игрока-война (Warrior) меняется боевой дух.
---@class EventAvatarWarriorCombatAdvantageChangedParams

---Событие посылается при появлении барьера дамага у воина.
---@class EventAvatarWarriorDamagePoolAddedParams

---Событие посылается при изменении состояния барьера дамага у воина.
---@class EventAvatarWarriorDamagePoolChangedParams
---@field value number текущее значение дамага в барьере воина
---@field limit number предельное значение дамага в барьере воина

---Событие посылается при исчезновении барьера дамага у воина.
---@class EventAvatarWarriorDamagePoolRemovedParams

---Событие присылается раз в секунду после того, как если игрок пытается выйти из миссии (mission.Logout()), но находится в бою. В этом случае выход будет отложен на некоторое время.
---@class EventAvatarWillBeRemovedParams
---@field delay integer количество секунд до окончательного выхода из миссии.

---Серверное событие о переходе персонажа в другую зону. Для более подробного уведомления (но только при наличии UI) следует использовать (клиентское):  EVENT_AVATAR_CLIENT_ZONE_CHANGED. Внимание. Серверные координаты могут отличаться от клиентских, поэтому клиентская информация о текущей зоне во время прихода этого события может не соответствовать таковой на сервере. В частности, для функции FunctionCartographerGetCurrentZoneInfo. Например, возвращаемая этой функцией информация может не меняться при приходе EVENT_AVATAR_ZONE_CHANGED и наоборот, ее смена не означает, что будет прислано серверное уведомление.
---@class EventAvatarZoneChangedParams

---Посылается каждый раз, когда появляется информация о новой контрольной точке баттлграунда.
---@class EventBattlegroundCheckpointAddedParams
---@field id ObjectId id появившейся контрольной точки

---Посылается каждый раз, когда информация о контрольной точке баттлграунда становится недоступной (контрольная точка по каким-либо причинам удаляется).
---@class EventBattlegroundCheckpointRemovedParams
---@field id ObjectId id контрольной точки

---Посылается каждый раз, когда изменяется информация о контрольных точках баттлграунда (добавляются-удаляются, меняется состояние и т.п.).
---@class EventBattlegroundCheckpointsChangedParams

---Посылается каждый раз, когда меняется состояние контрольной точки баттлграунда.
---@class EventBattlegroundCheckpointStateChangedParams
---@field checkpointId ObjectId id контрольной точки, чьё состояние изменилось

---Событие посылается в момент выстрела (тика) из лучемета. В этот момент уже известно, есть попадания или нет. Если нет, то targets = nil.
---@class EventBeamCannonShotStartedParams
---@field id ObjectId id устройства (тип устройства USDEV_BEAM_CANNON)
---@field targets ObjectId[] таблица (индексированная с 1) id целей. Если попаданий нет то nil.

---Оповещение об изменении возможности телепортации обратно от побратима к начальной позиции.
---@class EventBestFriendReturnStateChangedParams

---Событие приходит, если изменилось состояние спелла для телепортации к побратиму.
---@class EventBestFriendTeleportSpellChangedParams
---@field id SpellId идентификатор ресурса спелла

---Оповещение о начале эффекта для спелла телепортации к побратиму. Параметры как в  EVENT_SPELLBOOK_ELEMENT_EFFECT.
---@class EventBestFriendTeleportSpellEffectParams

---Оповещение об изменении возможности телепортации к побратиму.
---@class EventBestFriendTeleportStateChangedParams

---Уведомление о том, что изменилась, добавлена или удалена информация о бонусе (та её часть, которая не требует  rules.BillingInfoUpdate()).
---@class EventBillinginfoBonusChangedParams
---@field bonusId BillingBonusId id бонуса, про который событие

---Уведомление о том, что пришёл ответ на запрос об обновлении информации о бонусах (см. rules.BillingInfoUpdate()).
---@class EventBillinginfoBonusStatusChangedParams
---@field status String удачно ли выполнен запрос или по какой причине неудача

---Событие вызывается при изменении состояния пользовательского биндинга клавиш (при работе через библиотеку binding).
---@class EventBindingChangedParams

---Приходит, если изменился дополнительный бонус к прогрессу персонажа. См.  ENUM_DevelopmentTrack_....
---@class EventBonusPoolChangedParams
---@field type number тип бонуса
---@field sysType string строковое представление типа бонуса

---Приходит, если изменился список дополнительных бонусов к прогрессу персонажа.
---@class EventBonusPoolsChangedParams

---Уведомление о результате взаимодействия с сундучком.
---@class EventBoxOperationResultParams
---@field sysResult string код результата

---Событие посылается, когда пользователь нажимает на ссылку в WidgetBrowser'е, которая приводит к скачиванию файла.
---@class EventBrowserDownloadLinkParams
---@field url string адресная строка
---@field widget WidgetSafe виджет, сгенерировавший событие
---@field sender string имя виджета, сгенерировавшего событие

---Событие посылается, когда пользователь нажимает на ссылку в WidgetBrowser'е, которая должна быть открыта в новой вкладке/окне.
---@class EventBrowserExternalLinkParams
---@field url string адресная строка
---@field widget WidgetSafe виджет, сгенерировавший событие
---@field sender string имя виджета, сгенерировавшего событие

---Событие присылается, если изменился известный набор объявлений на доске.
---@class EventBulletinBoardChangedParams

---Событие присылается, если изменилось состояние операции с доской объявлений.
---@class EventBulletinBoardOperationInProgressChangedParams
---@field postId integer идентификатор объявления

---Событие присылается, если на доске объявлений появилось объявление.
---@class EventBulletinBoardPostAddedParams
---@field id integer идентификатор объявления

---Событие присылается, если на доске объявлений изменилось поле объявление (уровень, онлайн, зона, время).
---@class EventBulletinBoardPostChangedParams
---@field id integer идентификатор объявления

---Событие присылается периодически, при изменении стоимости вызова искры, когда главный игрок находится в состоянии воскрешения (умер и находится на кладбище, ожидая свою искру). Вызов искры инициируется с помощью avatar.CallSpark(). Этот вызов стоит определенное количество мирро (avatar.GetCurrencyId( "myrrh" )), которое меняется с течением времени и по другим обстоятельствам.
---@class EventCallSparkCostChangedParams

---Событие присылается, если не получилось вызвать искру главного игрока, находящегося на кладбище. Вызов искры инициирует avatar.CallSpark(). Скорее всего не хватает валюты-мирро (avatar.GetCurrencyId( "myrrh" )).
---@class EventCallSparkFailedParams

---Событие посылается каждый раз, когда у камеры меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
---@class EventCameraDirectionChangedParams

---Присылается в ответ на запрос guild.CanCreateGuildHereRequest( inventorySlot ).
---@class EventCanCreateGuildHereResponseParams
---@field success boolean можно ли создать гильдию в данном месте

---Событие посылается в момент попадания выстрела из пушки в цель (или просто окончании полета снаряда).
---@class EventCannonShotFinishedParams
---@field id ObjectId id устройства
---@field target ObjectId id цели (интерактивный объект)

---Событие посылается в момент начала каста выстрела из пушки.
---@class EventCannonShotPreparationStartedParams
---@field id ObjectId id устройства (пушки)
---@field preparationTimeMs integer время подготовки выстрела

---Событие посылается в момент выстрела из пушки. В этот момент уже известно, попала пушка в цель или нет. Если промазала, то target = nil.
---@class EventCannonShotStartedParams
---@field id ObjectId id устройства (тип устройства USDEV_CANNON)
---@field target ObjectId id цели (интерактивный объект)

---Событие посылается при изменении цели пушки управляемой игроком(любого орудия с активным прицелом).
---@class EventCannonTargetChangeParams
---@field target number

---Событие посылается, если не удалось привязать Widget3D к определенному объекту.
---@class EventCannotAttachWidget3dParams
---@field objectId ObjectId Id объекта (юнит или устройство)

---Событие, уведомляющее о невозможности выхода из игры в бою. -- Параметры нет
---@class EventCantLeaveGameInCombatParams

---Сообщение о невозможности полутить исчезнувший объект. Например, кто-то уже полутил сундук или моба до того, как сервер успел сообщить об этом на другой клиент.
---@class EventCantLootDisappearedLootBagParams

---Уведомление о невозможности отправить сообщение в чат. Сообщения нельзя отсылать чаще, чем через определенный интервал времени для предотвращения спама.
---@class EventCantSendChatByDelayParams
---@field delayMs integer допустимый интервал между сообщениями в чат в миллисекундах

---В режиме парикмахерской, камера закончила движение после вызова сhangeRoom.SetCameraPath(...).
---@class EventChangeRoomCharacterSceneCameraReadyParams

---Событие приходит, если необходимо открыть интерфейс парикмахерской.
---@class EventChangeRoomStartedParams

---В режиме парикмахерской, камера может назумливаться на лицо персонажа. При изменении состояния назумленности (на лицо, на максимум, в середине) или возможности назумливаться приходит это сообщение.
---@class EventChangeRoomZoomTriggerChangedParams

---Событие посылается при изменении состояния смены класса - когда требуется выбрать замены для вещей на соответствующие новому классу и когда такая необходимость отпадает.
---@class EventCharacterClassChangerChangedParams

---Событие посылается когда аватар лишен права писать сообщения в чат.
---@class EventChatAvatarMutedParams
---@field reason string причина
---@field durationMinutes integer продолжительность в минутах
---@field time table таблица с информацией о времени отправки сообщения (локальное время сервера). Поля:
---@field h integer час
---@field m integer минута
---@field s integer секунда

---Событие посылается для каждого нового сообщения, пришедшего в чат. Если сообщение является эхом (включено в настройках по умолчанию), то это то сообщение, которое мы изначально попытались отправить. Событие содержит сокращенную информацию о событии - только текст. Полее подробная информация в событии:  EVENT_CHAT_MESSAGE_WITH_OBJECTS '''Внимание!''' В пользовательских аддонах есть ограничение: событие может не приходить на турнирах.
---@class EventChatMessageParams
---@field sender string имя отправителя (игрока или моба)
---@field shard string название сервера отправителя
---@field senderUniqueId UniqueId|nil уникальный идентификатор персонажа-отправителя
---@field senderId ObjectId идентификатор персонажа-отправителя или nil, если данная информация недоступна (например, если игрок не отреплицирован)
---@field chatType number тип сообщения
---@field isEcho boolean является ли сообщение эхом
---@field recipient string имя получателя
---@field isAlive boolean жив игрок (может действовать) или нет (мертв или в числилище)
---@field msg string текст сообщения
---@field spamWeight integer спам-вес сообщения. если меньше 100, то не спам, иначе - спам

---Событие, которое приходит при невозможности отослать сообщение в чат, поскольку сообщение подпадает под критерии флуда (множетво одинаковых сообщений, следующих с высокой частотой).
---@class EventChatMessageIsFloodParams
---@field cooldownMs integer время (в миллисекундах), которое должно пройти до момента, когда сообщение может быть послано в чат.

---Событие, которое приходит при невозможности доставить сообщение в чат.
---@class EventChatMessageRejectedParams
---@field sysReason string причина неудачной отправки сообщения.
---@field time table таблица с информацией о времени прихода сообщения. Поля:
---@field h integer часы
---@field m integer минуты
---@field s integer секунды
---@field expiredTime nil|table Если ограничения нет, то nil, иначе таблица с полями о том, сколько времени осталось:
---@field d integer дней
---@field h integer часов
---@field m integer минут
---@field s integer секунд

---Событие посылается для каждого нового сообщения, пришедшего в чат. Если сообщение является эхом (включено в настройках по умолчанию), то это то сообщение, которое мы изначально попытались отправить. Событие приходит вместе с  EVENT_CHAT_MESSAGE и содержит более полную информацию - текст и предметы. '''Внимание!''' В пользовательских аддонах есть ограничение: событие может не приходить на турнирах.
---@class EventChatMessageWithObjectsParams
---@field sender string имя отправителя (игрока или моба)
---@field shard string название сервера отправителя
---@field senderUniqueId UniqueId|nil уникальный идентификатор персонажа-отправителя
---@field senderId ObjectId|nil идентификатор персонажа-отправителя или nil, если данная информация недоступна (например, если игрок не отреплицирован)
---@field recipientUniqueId UniqueId|nil уникальный идентификатор персонажа-получателя или nil, если данная информация недоступна
---@field recipientId ObjectId|nil идентификатор персонажа-получателя или nil, если данная информация недоступна
---@field chatType number тип сообщения
---@field isEcho boolean является ли сообщение эхом
---@field time table таблица с информацией о времени отправки сообщения (локальное время сервера). Поля:
---@field h integer час
---@field m integer минута
---@field s integer секунда
---@field recipient string имя получателя
---@field isAlive boolean жив игрок (может действовать) или нет (мертв или в числилище)
---@field messages таблица, индексированная [0..], содержащая таблицы с информацией о фрагментах сообщения:
---@field text string|nil если не nil, то текстовый фрагмент
---@field spamWeight integer|nil спам-вес для текстового фрагмента сообщения, если меньше 100, то не спам, иначе - спам
---@field item ValuedObject|nil если не nil, то подстановочный объект, содержащий информацию о предмете
---@field medal ValuedObject|nil если не nil, то подстановочный объект, содержащий информацию о достижении

---Ошибка при работе с именноваными каналами.
---@class EventChatNamedErrorParams
---@field sysResult string строковый код ошибки

---Событие посылается для в случае отсылки личного сообщения игроку, который в данный момент находится в игре под своим альтернативным персонажем.
---@class EventChatSentToAltParams
---@field altName string имя альтернативного персонажа, который на самом деле получит сообщение

---Событие посылается, когда игрок запросил  checkroomLib.Open() или  checkroomLib.Close() и произошла передача на клиент или было убрано с клиента содержимое гардероба.
---@class EventCheckroomChangedParams

---Событие возникающее при добавлении одежды в гардероб. В случаи неудачного добавление одежды в гардероб вместо данного события возникает  EVENT_EQUIP_FAILED.
---@class EventCheckroomItemAddedParams
---@field itemId ObjectId идентификатор добавленного предмета

---Событие посылается, приходит при изменении полей предмета в гардеробе. Например, при надевании или снимании.
---@class EventCheckroomItemChangedParams
---@field itemId ObjectId идентификатор гардеробного предмета

---Событие посылается при изменении состояния устройства. Например, устройство кто-то стал использовать.
---@class EventChestLooterChangedParams
---@field deviceId number id устройства

---Уведомление об окончании показа 2D-изображение на весь экран, если такое было показано и для него имелось время автоматического скрытия. См.  EVENT_CLIENT_IMAGE_SHOW
---@class EventClientImageHideAllParams

---Уведомление о приходе на клиент события, для которого необходимо показать 2D-изображение на весь экран. Для некоторых изображений будет указано время, через которое необходимо скрыть изображение. См.  EVENT_CLIENT_IMAGE_HIDE_ALL.
---@class EventClientImageShowParams
---@field objectId ObjectId|nil интерактивный объект, от которого пришло сообщение, если такая информация доступна
---@field name string название изображения
---@field description string описание изображения
---@field sysId string|nil системное строковое описание, если указано
---@field timeoutMs integer|nil количество миллисекунд, через которое необходимо автоматически скрыть изображение
---@field image TextureId|nil идентификатор текстуры изображения

---Уведомление о приходе на клиент текстового сообщения. Строковый код типа берётся из ресурса. Задается непосредственно в эффектах типа ClientData (серверный тип: gameMechanics.world.ClientData) в расширении InterfaceAction. Рекомендуемый шаблон sysId:
---@class EventClientMessageParams

---Событие посылается, если изменилось некоторое условие, заданное дизанерами. Информацию см.  avatar.IsConditionValid( alias ).
---@class EventConditionEventParams
---@field alias string строковое обозначение события
---@field isValid boolean true, условие выполняется

---Уведомление об изменении контейнера главного игрока. Тип контейнера в  ITEM_CONT_....
---@class EventContainerChangedParams
---@field slotType number тип контейнера

---Событие о появлении предмета в слоте контейнера главного игрока по любой причине. Это может быть и появление нового предмета, и перетаскивание имеющегося в сумке и тестовый чит. Так же см. EVENT_AVATAR_ITEM_TAKEN. Тип контейнера в  ITEM_CONT_....
---@class EventContainerItemAddedParams
---@field ownerId ObjectId идентификатор владельца
---@field slotType number тип контейнера
---@field slot integer индекс слота в сумке [0..]
---@field itemId ObjectId идентификатор предмета
---@field sysName string внутреннее имя предмета
---@field isNewItem boolean true, если предмет был действительно добавлен в контейнер, а не просто был перемещен внутри него

---Уведомление об изменении какого-либо свойства предмета в слоте контейнера главного игрока. При появлении предмета в слоте приходит  EVENT_CONTAINER_ITEM_ADDED. При исчезновении предмета из слота приходит  EVENT_CONTAINER_ITEM_REMOVED. Тип контейнера в  ITEM_CONT_....
---@class EventContainerItemChangedParams
---@field ownerId ObjectId идентификатор владельца
---@field slotType number тип контейнера
---@field slot integer индекс слота в хранилище
---@field itemId ObjectId идентификатор предмета

---Оповещение о начале эффекта для элемента в каком-либо контейнере. Типы эффектов: ''' EFFECT_TYPE_...'''. Для некоторых из них в сообщении передаются дополнительные поля (см.''' EFFECT_TYPE_...''' ). Тип контейнера в  ITEM_CONT_.... Событие ГКД:  EVENT_GLOBAL_COOLDOWN '''Внимание! Для событий COOLDOWN учитывается только КД самого спелла и КД группы спеллов (разные ранги, умения за слезы и тп). ГКД не учитывается! При начале и окончании ГКД данное событие не приходит'''
---@class EventContainerItemEffectParams
---@field effect number тип начавшегося эффекта
---@field itemId ObjectId id итема
---@field slot integer слот, в котором лежит данный итем
---@field slotType number тип контейнера, в слоте которого лежит данный итем
---@field duration integer общая продолжительность
---@field remaining integer оставшееся время

---Событие об исчезновении предмета из слота контейнера главного игрока. Также см.  EVENT_AVATAR_ITEM_DROPPED. Тип контейнера в  ITEM_CONT_....
---@class EventContainerItemRemovedParams
---@field ownerId ObjectId идентификатор владельца
---@field slotType number тип контейнера
---@field slot integer индекс слота в сумке [0..]
---@field itemId ObjectId идентификатор предмета
---@field sysName string внутреннее имя предмета
---@field isRemovedItem boolean true, если предмет был действительно удален из контейнера, а не просто был перемещен внутри него

---Событие присылается, если необходимо начать отслеживание точки применения контекстного дейтсвия. Дополнительные подробности: LuaApiDetails (закрытая ссылка)
---@class EventContextActionPointStartedParams
---@field id ObjectId идентификатор контекстного действия

---Событие присылается при изменении контекстных действий. Мог измениться список контекстных действий или флаг  enabled какого-либо контекстного действия.
---@class EventContextActionsChangedParams

---Событие присылается при изменении координат цели прицела главного игрока.
---@class EventCrosshairTargetPosChangedParams
---@field objectId ObjectId Id юнита

---Изменился список игровых альтернативных валют, имеющихся у игрока.
---@class EventCurrenciesChangedParams

---Присылается, если закончился процесс обмена валют. Нужно скрыть интерфейс обмена.
---@class EventCurrencyExchangeFinishedParams

---Присылается, если изменились параметры сервиса обмена валют.
---@class EventCurrencyExchangeInfoChangedParams

---Присылается, если начался процесс обмена валют. Нужно показать интерфейс обмена.
---@class EventCurrencyExchangeStartedParams

---Событие присылается при попытке что-либо приобрести при недостаточном количестве игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
---@class EventCurrencyNotEnoughParams
---@field id CurrencyId идентификатор альтернативной валюты.

---Событие присылается при изменении количества игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
---@class EventCurrencyValueChangedParams
---@field id CurrencyId идентификатор альтернативной валюты.
---@field delta integer число на которое изменилось значение валюты (может быть как положительным, так и отрицательным)
---@field sysName string внутреннее имя альтернативной валюты

---Событие посылается каждый раз, когда сменяется текущий квест. Например когда текущим назначается другой квест или когда текущий квест завершается или сбрасывается.
---@class EventCurrentQuestChangedParams
---@field questId QuestId или nil id квеста, ставшего текущим; если nil, значит текщего квеста нет

---Текстовая эмоция (/emote) от другого игрока.
---@class EventCustomEmoteParams
---@field id ObjectId от кого пришло сообщение
---@field targetId ObjectId цель сообщения или nil
---@field text string текстовое сообщение
---@field isAlive boolean жив игрок (может действовать) или нет (мертв или в чистилище)

---Событие посылается каждый раз, когда главный игрок меняет активный слот кастомизации.
---@class EventCustomizationActiveSlotChangedParams

---Событие посылается каждый раз, когда главный игрок меняет содержимое (ставит/снимает/меняет моба) активного слота кастомизации.
---@class EventCustomizationActiveSlotContentChangedParams

---Событие посылается каждый раз, когда у главного игрока меняется состояние кастомизации (он начал/закончил кастомизировать какое-либо помещение или объект).
---@class EventCustomizationStateChangedParams

---Посылается каждый раз, когда выбор личного приключения для атаки закончен.
---@class EventDungeonChoiceFinishedParams

---Посылается каждый раз, когда стартовал выбор личного приключения для атаки.
---@class EventDungeonChoiceStartedParams

---Событие посылается каждый раз, когда изменилось состояние умения или заклинания, не привязанного к книге заклинаний.
---@class EventDefaultSpellChangedParams

---Оповещение о начале эффекта для спелла не привязанного к книге заклинаний. Типы эффектов: ''' EFFECT_TYPE_...'''. Для некоторых из них в сообщении передаются дополнительные поля.
---@class EventDefaultSpellEffectParams
---@field effect number тип начавшегося эффекта
---@field id SpellId Id ресурса умения ( этот параметр НЕ УБИРАТЬ )
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах
---@field prepared boolean текущее значение флага prepared
---@field isActive boolean true, спелл стал активным
---@field objectId ObjectId|nil идентификатор предмета к которому привязан данный спелл

---Уведомление об изменении состояния хранилища.
---@class EventDepositeBoxChangedParams

---Событие посылается каждый раз, когда у одного из действий используемого устройства (например, выстрел огнём у пушки) изменилась эффективность. Эффективность действия определяется внутренней логикой клиента. Если действие стало "неэффективеным", то это означает, что его применение в данный момент времени нецелесообразно, так как не принесет ожидаемого положительного результата. Например, можно выстрелить из пушки даже если цель находится слишком далеко, но снаряд не долетит до дели и такое действие будет "неэффективным". По умолчанию принято считать что действие всегда эффективно, до тех пор пока не придет событие утверждающее обратное.
---@class EventDeviceActionEffectivenessChangedParams
---@field id ObjectId Id устройства
---@field action integer номер экшена
---@field isEffective boolean false, если действие стало не эффективно

---Событие посылается каждый раз, когда у используемого устройства (например, рули, пушки на корабле) изменилось активное действие.
---@class EventDeviceActiveActionChangedParams
---@field id ObjectId Id устройства

---Событие посылается каждый раз, когда у одного экшена используемого устройства (например, выстрел огнём из пушки) закончился кулдаун.
---@class EventDeviceCooldownFinishedParams
---@field id ObjectId Id устройства
---@field action integer номер экшена

---Событие посылается каждый раз, когда у какого-либо дейсвия используемого устройства (например, поворот вправо у руля) меняется состояние доступности. См. avatar.GetUsableDeviceInfo().
---@class EventDeviceCooldownsEnableChangedParams
---@field id ObjectId Id устройства

---Событие посылается каждый раз, когда у одного экшена используемого устройства (например, выстрел огнём у пушки) начинается кулдаун.
---@class EventDeviceCooldownStartedParams
---@field id ObjectId Id устройства
---@field action integer номер экшена

---Событие присылается при нанесение повреждения устройству. См. EVENT_UNIT_DAMAGE_RECEIVED. Для срабатывания данного события требуется указание идентификатора объекта ObjectId(number) в качестве параметра функции  common.RegisterEventHandler( eventFunction, sysEventName, params, requireMainThread ).
---@class EventDeviceDamageReceivedParams

---Событие присылается при изменение статуса смерти устройства (готово или уже использовано).
---@class EventDeviceDeadChangedParams
---@field deviceId ObjectId идентификатор устройства

---Событие посылается каждый раз, когда используемое устройство (например, рули, пушки на корабле) включается или выключается.
---@class EventDeviceOfflineChangedParams
---@field id ObjectId Id устройства

---Событие посылается каждый раз, когда поюзанное устройство (например, рули, пушки на корабле) выключенно. Содержит причину.
---@class EventDeviceOfflineReasonParams
---@field id ObjectId Id устройства
---@field sysReason string причина, по которой девайс выключен

---Приходит, если изменился список заданий, связанных с устройством.
---@class EventDeviceRelatedQuestsChangedParams
---@field deviceId ObjectId идентификатор устройства

---Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает устройство (например улей или доска объявлений).
---@class EventDevicesChangedParams
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся устройств
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших устройств

---Событие посылается при попытке повернуть руль на нулевой скорости.
---@class EventDeviceZeroSpeedParams
---@field id ObjectId Id руля (устройства)

---Выключён режим крафтинга (создания вещей).
---@class EventDiceCraftCanceledParams
---@field skillId SkillId Id умения (скила)

---Одна из команд, используемых для крафтинга, завершилась неудачей, состояние крафтинга не изменилось.
---@class EventDiceCraftCmdFailedParams
---@field skillId SkillId Id умения (скила)
---@field cmdType string какая именно команда не выполнена

---Завершёно созание вещи, режим крафтинга (создание вещей) остаётся включен.
---@class EventDiceCraftFinishedParams
---@field skillId SkillId Id умения (скила)

---Событие приходит, если не хватает компонент.
---@class EventDiceCraftNotEnoughComponentsParams
---@field skillId SkillId Id умения (скила)

---Включён режим выбора рецептов крафтинга (создание вещей) - приходит когда включается крафтинг или мини-игра крафтинга завершилась без выхода из крафтинга (если мини-игра завершилась выходом из крафтинга - приходит EVENT_DICE_CRAFT_CANCELED).
---@class EventDiceCraftPreparedParams
---@field skillId SkillId Id умения (скила)
---@field isInitial boolean true, если событие пришло при включении режима крафтинга; false - при завершении мини-игры
---@field tool ObjectId Id инструмента, использованного для старта мини-игры

---Изменился список рецептов.
---@class EventDiceCraftRecipesChangedParams
---@field skillId SkillId Id умения (скила)

---Изменился уровень умения крафтинга.
---@class EventDiceCraftScoreChangedParams
---@field skillId SkillId Id умения (скила)

---Изменилось содержимое одного из слотов (добавлен/убран/заменён предмет).
---@class EventDiceCraftSlotChangedParams
---@field skillId SkillId Id умения (скила)
---@field slot integer номер слота
---@field itemId ObjectId или nil nil если слот пуст; иначе идентификатор предмета

---Обновилась информация о состоянии текущго сеанса крафтинга (был очередной реролл).
---@class EventDiceCraftStatusChangedParams
---@field skillId SkillId Id умения (скила)
---@field rerollsLeft integer число оставшихся попыток реролла
---@field dices table текущая раскладка нароллившихся дайсов, ключи таблицы - номера слотов, значения таблицы - соответствующие им нароллившиеся значения
---@field isCurced boolean true, если предметы будут проклатыми

---Событие, которое приходит при попытке дизассемблинга. number - поле дополнительной информацией по конкртеной ошибке. В данный момент есть для следующих sysResult:
---@class EventDisassemblingResultParams
---@field skillId SkillId|nil идентификатор умения, с помощью которого пытались дизассемблировать, если доступно
---@field sysResult string результат дизассемблинга
---@field value integer|nil дополнительное числовое значение, если есть

---Запрос на роспуск гильдии от игрока. Приходит, например, при выполнении слеш-команды роспуска гильдии. Ожидаемая обработка - запрос игроку на подтверждение роспуска и отдача команды серверу на собственно роспуск.
---@class EventDisbandGuildRequestParams

---Произошло отключение от сервера
---@class EventDisconnectParams

---Уведомление об окончании ролла:
---@class EventDistributionFinishedParams
---@field rollId ObjectId уникальный идентификатор ролла

---Уведомление об появлении нового цели в режиме Domination.
---@class EventDominationObjectiveAddedParams
---@field id Number идентификатор цели

---Уведомление об изменении состояния активности цели в режиме Domination.
---@class EventDominationObjectiveDisabledParams
---@field id Number идентификатор цели
---@field disabled boolean состояние активности цели

---Уведомление об изменении владельца цели в режиме Domination.
---@class EventDominationObjectiveOwnerChangedParams
---@field id Number идентификатор цели
---@field owner Number команда доминирующая над данной целью
---@field actualOwner Number команда контролирующая данную цель

---Уведомление об изменении прогресса захвата цели в режиме Domination.
---@class EventDominationObjectiveProgressChangedParams
---@field id Number идентификатор цели
---@field progress number текущий прогресс захвата цели

---Уведомление об изменении количества очков необходимых для захвата цели в режиме Domination.
---@class EventDominationObjectiveProgressToCaptureChangedParams
---@field id Number идентификатор цели
---@field progressToCapture number текущее количество очков необходимых для захвата цели

---Уведомление об изменении радиуса захвата цели в режиме Domination.
---@class EventDominationObjectiveRadiusChangedParams
---@field id Number идентификатор цели
---@field radius number радиус окрестности в которой надо находиться для захвата цели

---Уведомление об удалении нового цели в режиме Domination. Информацию по удаленной цели функцией dominationsLib.GetObjectiveInfo( id ) получить невозможно.
---@class EventDominationObjectiveRemovedParams
---@field id Number идентификатор цели

---Уведомление об изменении состояния цели в режиме Domination.
---@class EventDominationObjectiveStateChangedParams
---@field id Number идентификатор цели
---@field state Number текущее состояние цели

---Уведомление об изменении списока персонажей одной из команд находящихся вблизи данной цели в режиме Domination.
---@class EventDominationObjectiveTeamChangedParams
---@field id Number идентификатор цели
---@field team Number команда список персонажей которой изменился

---Уведомление об изменении даты предыдущего захвата цели в режиме Domination.
---@class EventDominationObjectiveTimeSwitchedChangedParams
---@field id Number идентификатор цели
---@field timeSwitched Number дата предыдущего захвата цели

---Уведомление об изменении прогнозируемого времени захвата цели в режиме Domination.
---@class EventDominationObjectiveTimeToCaptureChangedParams
---@field id Number идентификатор цели
---@field timeToCapture Number прогнозируемое время захвата в текущих условиях

---Инициация перехода игрока в варп.
---@class EventDoWarpParams

---Присылается при изменении значения CommandPoints пета друида.
---@class EventDruidPetCommandPointsChangedParams

---Уведомление о завершении эффекта на виджете с указанием его  типа. Уведомление посылается только в том случае, если
---@class EventEffectFinishedParams
---@field wtOwner WidgetSafe виджет, переданный в функции PlayEffect
---@field effectType number тип эффекта ET_*.

---Уведомление о завершении цепочки эффектов на виджете с указанием её  типа. Уведомление посылается только в том случае, если
---@class EventEffectSequenceFinishedParams
---@field wtOwner WidgetSafe виджет, переданный в функции PlayEffectSequence
---@field effectType number тип эффекта ET_*.
---@field label string|nil метка переданная в PlayEffectSequence (при наличии)

---Уведомление о завершении шага цепочки эффектов на виджете с указанием её  типа. Уведомление посылается только в том случае, если
---@class EventEffectSequenceStepParams
---@field wtOwner WidgetSafe виджет, переданный в функции PlayEffectSequence
---@field effectType number тип эффекта ET_*.
---@field step integer номер завершенного шага цепочки (соответствует индексу описателя шага в PlayEffectSequence)
---@field label string|nil метка переданная в PlayEffectSequence (при наличии)

---Событие посылается каждый раз, когда изменилось состояние эмоций. В данный момент оно происходит при изменении возможности запуска (emoteInfo.canRun).
---@class EventEmotesChangedParams

---Событие присылается при претерпении урона (класс паладин, спелл "претерпеть боль").
---@class EventEndureBarrierDamageParams
---@field damage integer кол-во урона, который удалось перетерпеть

---Событие о провале попытки экипировать предмет. Приходит либо itemId либо slot.
---@class EventEquipFailedParams
---@field sysCode string код ошибки ("ENUM_DressResult_...")
---@field itemId ObjectId|nil идентификатор предмета, если есть такая информация
---@field slot integer|nil индекс слота в инвентаре [0..], если есть такая информация
---@field slotType number тип контейнера, в котором лежит предмет

---Событие посылается, когда поменялся текущий активный набор ритуальных вещей  enum DUMMY_TYPE.
---@class EventEquipmentActivePresetChangedParams
---@field value number тип контейнера с экипировкой

---Событие посылается, когда главному или инспектируемому игроку становятся доступны ритуальные вещи (контейнер, действия и т.п.).
---@class EventEquipmentDressEnableChangedParams
---@field unitId ObjectId идентификатор игрока, у которого изменилось состояние
---@field type number тип контейнера с экипировкой

---Событие вызывается при ошибке обращения к GameCenter API, как то открытие чата или окна оплаты.
---@class EventErrorGameCenterRequestParams

---Событие приходит при любом изменении информации о бонусе от покровителя.
---@class EventFairyBonusChangedParams

---Присылается в случае, если игрок вступил в брак.
---@class EventFamilyCreatedParams
---@field unitId ObjectId идентификатор игрока

---Присылается в случае, если игрок развёлся (разрушил брак).
---@class EventFamilyDestroyedParams
---@field unitId ObjectId идентификатор игрока

---Присылается в случае, если изменился опыт, накопленный семейным заклинанием главного игрока.
---@class EventFamilySpellExperienceChangedParams
---@field spellId SpellId идентификатор ресурса заклинания

---Присылается в случае, если изменился список семейных заклинания главного игрока.
---@class EventFamilySpellsChangedParams

---Событие присылается в ответ на выполнение функции avatar.SetFatalityPhrase
---@class EventFatalityPhraseResultParams
---@field failCause string ActionFailCause результата выполнения функции
---@field result string причина ошибки
---@field substring string часть строки, в которой была ошибка

---Событие посылается каждый раз, когда изменяется режим следования за объектом (включился/выключился/сменился объект).
---@class EventFollowModeChangedParams
---@field followObjectId ObjectId или nil идентификатор объекта, за которым следует аватар, если событие послано при включении режима следования или смене объекта; nil - при выключении

---Уведомление о неудачном исполнении фуражирования.
---@class EventForagingFailedParams

---Событие приходит, если был начат крафт (форж/рефорж) итемов. Пользователю необходимо показать диалог для форжа/рефоржа.
---@class EventForgeCraftDialogParams

---Присылается когда изменяется диапазон FPS (кадров в секунду). Дополнительные подробности:  LuaApiDetails (закрытая ссылка)
---@class EventFpsRangeChangedParams
---@field rangeIndex integer индекс диапазона, куда попадает FPS (от нуля до rangeMax)
---@field rangeMax integer максимальный индекс диапазона (fps может меняться до максимума)

---Событие посылается при изменении режима полноэкранности игры.
---@class EventFullscreenChangedParams
---@field value boolean true, если теперь игра в полноэкранном режиме

---Событие об изменении предмета (например, изменилось количество в стеке).
---@class EventGameItemChangedParams
---@field itemId ObjectId идентификатор предмета

---Событие об изменении проклятости предмета. Одновременно, приходит событие  EVENT_GAME_ITEM_CHANGED.
---@class EventGameItemCursedChangedParams
---@field itemId ObjectId идентификатор предмета

---Присылается в случае некой ошибки на сервере.
---@class EventGeneralErrorParams
---@field sysCause string (enum "ENUM_ActionFailCause_...")- причина ошибки

---Оповещение о начале эффекта для элемента в книге умений. Типы эффектов: ''' EFFECT_TYPE_...'''. Для некоторых из них в сообщении передаются дополнительные поля.
---@class EventGlobalCooldownParams
---@field effect number тип начавшегося эффекта
---@field id number номер события. Гарантируется что событие с бОльшим номером содержит более актуальную информацию. Для случая нескольких событий в кадре (порядок прихода не определен)
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах

---Приходит, если было прислано сообщение от гейммастеров.
---@class EventGlobalNoticeParams
---@field msg string сообщение

---Приходит, если изменился список глобальных рейтов к прогрессу персонажа.
---@class EventGlobalRatesChangedParams

---Уведомление о результатах ролла при Greed/Need ролле:
---@class EventGreedNeedRollsParams
---@field rollId ObjectId уникальный идентификатор ролла
---@field results таблица список игроков принимавших участие в ролле и их ролл (индексируется [0...])
---@field looterId ObjectId|nil уникальный идентификатор игрока, если он найден
---@field looterName string имя игрока
---@field roll integer число, выпавшее игроку

---Уведомление о сделанном выборе при Greed/Need ролле:
---@class EventGreedNeedSelectedParams
---@field rollId ObjectId уникальный идентификатор ролла
---@field looterId ObjectId|nil уникальный идентификатор игрока, сделавшего выбор, если он найден
---@field looterName string имя игрока, сделавшего выбор
---@field choice number выбор

---По каким-то причинам вступление в группу не сработало.
---@class EventGroupAcceptErrorParams

---Событие на появление группы. Присылается не только на действительное создание группы, но и при вхождении игрока в состав уже существующей.
---@class EventGroupAppearedParams

---Событие на изменение состава группы (включая создание и роспуск).
---@class EventGroupChangedParams

---Уведомление о смене агрегатного состояния группы: группа -> отряд, отряд -> группа.
---@class EventGroupConvertedParams

---Прямой отказ персонажа вступить в группу.
---@class EventGroupDeclineParams
---@field declinerName string имя персонажа, приславшего отказ (другая информация о нем может быть недоступна)

---Уведомление о невозможности пригласить персонажа в группу.
---@class EventGroupDeclineBusyParams
---@field declinerName string имя персонажа, от которого пришел отказ (другая информация о нем может быть недоступна)

---Уведомление о невозможности пригласить персонажа в группу по причине игнора.
---@class EventGroupDeclineIgnoredParams
---@field declinerName string имя персонажа, от которого пришел отказ

---Событие на исчезновение группы. Присылается не только на роспуск группы, но и при выходе игрока из состава существующей.
---@class EventGroupDisappearedParams

---Событие о приглашении в группу.
---@class EventGroupInviteParams
---@field inviterName string имя приглашающего (другая информация о нем может быть недоступна)
---@field inviterShardName string имя шарда приглашающего

---Присылается в случае исчезновения приглашения в группу. Оно может истечь по времени, быть принято или отклонено.
---@class EventGroupInviteEndParams

---Событие, которое приходит при невозможности пригласить игрока в группу.
---@class EventGroupInviteFailedParams
---@field name string имя адресата
---@field sysReason string причина неудачной отправки сообщения

---Уведомление о смене качества итемов для текущей схемы дележа лута в группе.
---@class EventGroupItemQualityChangedParams

---Событие, которое приходит при неудачной попытке выгнать игрока из группы.
---@class EventGroupKickFailedParams
---@field name string имя адресата
---@field sysReason string причина неудачной отправки сообщения

---Уведомление о смене лидера группы главного игрока.
---@class EventGroupLeaderChangedParams

---Уведомление о смене схемы дележа лута в группе.
---@class EventGroupLootSchemeChangedParams

---Событие приходит при появлении нового члена группы.
---@class EventGroupMemberAddedParams
---@field name string имя нового согрупника
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

---Событие на изменение состояния члена группы (онлайн-офлайн, лидер).
---@class EventGroupMemberChangedParams
---@field name string имя персонажа
---@field uniqueId UniqueId или nil постоянный идентификатор аватара (не меняется при релогинах), чьё состояние изменилось (см. group.GetMembers() и group.GetMemberInfo(id), поле uniqueId в обоих случаях); nil если это наёмник-моб
---@field id ObjectId или nil идентификатор члена группы; nil, если его нет поблизости (порвалась связь, в другой зоне и т.д.)

---Событие приходит при выходе члена группы из ее состава.
---@class EventGroupMemberRemovedParams
---@field name string имя вышедшего согрупника
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

---Присылается в случае, если какой-либо игрок вступил в гильдию главного игрока.
---@class EventGuildAcceptedParams
---@field invitee string имя вступившего игрока
---@field inviter string имя приглашавшего игрока
---@field guild string название гильдии

---Присылается в случае, если атака на чужой гильдейский аллод провалилась.
---@class EventGuildAllodAttackFailedParams
---@field allodId ObjectId|nil идентификатор аллода, если информация найдена
---@field allod string название аллода
---@field attacker string имя атакующей гильдии
---@field deffender string имя защищающейся гильдии

---Присылается в случае, если атака на чужой гильдейский аллод удалась.
---@class EventGuildAllodAttackSuccessfulParams
---@field allodId ObjectId|nil идентификатор аллода, если информация найдена
---@field allod string название аллода
---@field attacker string имя атакующей гильдии
---@field deffender string имя защищающейся гильдии

---Присылается в случае, если изменился владелец гильдейского аллода.
---@class EventGuildAllodOwnerChangedParams
---@field allodId ObjectId|nil идентификатор аллода, если информация найдена
---@field allod string название аллода
---@field newOwner string имя гильдии - нового владельца аллода
---@field oldOwner string имя гильдии - старого владельца аллода

---Оповещение об окончании кулдауна телепортации на гильдейский аллод.
---@class EventGuildAllodTeleportCooldownFinishedParams
---@field allodId ObjectId идентификатор аллода

---Оповещение о начале кулдауна телепортации на гильдейский аллод.
---@class EventGuildAllodTeleportCooldownStartedParams
---@field allodId ObjectId идентификатор аллода
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах

---Присылается в случае неудачной попытки приглашения в гильдию (игрок уже в гильдии).
---@class EventGuildAlreadyInGuildParams
---@field declinerName string имя приглашаемого игрока

---Присылается, если главный игрок попал в гильдию (в новую, или в существующую при входе в игру). Если же, требуется реагировать только на вступление в новую гильдию, то вместо этого события, лучше пользоваться EVENT_GUILD_CREATED и EVENT_GUILD_ACCEPTED.
---@class EventGuildAppearedParams

---Присылается, если изменилось влияние гильдии главного игрока.
---@class EventGuildAuthorityChangedParams

---Серверное событие с гильдейской банковской историей аватара. Приходит после вызова функции  guild.GetAvatarHistory().
---@class EventGuildAvatarHistoryParams
---@field moneyChange integer величина транзакции в меди
---@field comment string комментарий при проведении операции
---@field time LuaFullDateTime время транзакции
---@field changeReason number причина транзакции
---@field sysChangeReason string причина транзакции

---Событие возникает при обновление данных об истории операций казны гильдии, является итогом вызова guild.GetHistory( page, orderBy, rearOrder )).
---@class EventGuildBankHistoryChangedParams

---Присылается, если изменилось минимальное ограничение на транзакцию в гильдейскомм банке.
---@class EventGuildBankMinimumTransactionChangedParams

---Событие возникает при изменении баланса казны гильдии.
---@class EventGuildBankMoneyChangedParams

---Присылается, если завершилась операция в гильдейском банке. См.  "ENUM_GuildBankOperation_...".
---@class EventGuildBankOperationResultParams
---@field success boolean true, если операция завершилась успешно
---@field sysOperationType string тип операции, которая завершилась

---Присылается при измении списока выбранных способностей босса гильдии.
---@class EventGuildBossAbilitiesChangedParams

---Присылается в случае если изменился босс гильдии.
---@class EventGuildBossChangedParams

---Присылается в случае, если изменился опыт босса гильдии.
---@class EventGuildBossExperienceChangedParams
---@field experience integer опыт босса гильдии

---Присылается в случае, если изменилась сила босса гильдии.
---@class EventGuildBossGearScoreChangedParams
---@field gearScore integer сила босса гильдии

---Присылается при измении списка заданий для прогресса босса гильдии.
---@class EventGuildBossQuestsChangedParams

---Присылается при измении статуса заданий для прогресса босса гильдии.
---@class EventGuildBossQuestsStatusChangedParams

---Присылается при измении списока выбранных заклинаний босса гильдии.
---@class EventGuildBossSpellsChangedParams

---Присылается при измении состояния босса гильдии.
---@class EventGuildBossStateChangedParams

---Событие посылается каждый раз, когда у гилдии появляется новый баф. Если апдейтится старый, то ничего не приходит.
---@class EventGuildBuffAddedParams
---@field buffId ObjectId идентификатор бафа

---Событие посылается каждый раз, когда у гилдии игрока меняется набор бафов.
---@class EventGuildBuffsChangedParams

---Присылается в случае невозможности вступить в гильдию (после вызова guild.Accept()).
---@class EventGuildCantAcceptParams

---Присылается в случае, если была создана гильдия, в создании которой участвовал главный игрок.
---@class EventGuildCreatedParams
---@field guildName string название гильдии
---@field leaderName string имя лидера гильдии (создавшего гильдию)

---Присылается, если изменилось количество гильдейских валют в гильдии главного игрока.
---@class EventGuildCurrenciesChangedParams

---Присылается в случае неудачной попытки приглашения в гильдию.
---@class EventGuildDeclineParams
---@field declinerName string имя приглашаемого игрока

---Присылается в случае неудачной попытки приглашения в гильдию (игрок занят).
---@class EventGuildDeclineBusyParams
---@field declinerName string имя приглашаемого игрока

---Уведомление о невозможности приглашения в гильдию по причине игнора.
---@class EventGuildDeclineIgnoredParams
---@field declinerName string имя приглашаемого игрока

---Присылается, если изменилось описание гильдии главного игрока.
---@class EventGuildDescriptionChangedParams

---Присылается, если игрок вышел из гильдии.
---@class EventGuildDisappearedParams

---Присылается запрос на подтверждение открытия прогресса гильдии. Необходимо ответить  guild.EnableProgressReply().
---@class EventGuildEnableProgressRequestParams
---@field timeoutMs integer таймаут в миллисекундах. По истечении таймаута запрос будет отклонён

---Присылается в случае невозможности выполнить указанную операцию с гильдией.
---@class EventGuildFailedParams
---@field sysCause string строковое описание причины

---Присылается при измении прогресса оплота гильдии.
---@class EventGuildHallExperienceChangedParams
---@field value Number(int) -- новое значение прогресса

---Присылается при измении дневного прогресса оплота гильдии.
---@class EventGuildHallExperienceDailyChangedParams
---@field value Number(int) -- новое значение дневного прогресса

---Присылается при измении списка заданий для прогресса оплота гильдии.
---@class EventGuildHallQuestsChangedParams

---Присылается при измении статуса заданий для прогресса оплота гильдии.
---@class EventGuildHallQuestsStatusChangedParams

---Присылается при измении состояния оплота гильдии.
---@class EventGuildHallStateChangedParams

---Присылается в случае получения приглашения в гильдию.
---@class EventGuildInviteParams
---@field inviterName string имя приглашающего игрока
---@field guildName string имя гильдии

---Событие возникает при обновление данных об истории операций с предметами гильдии, является итогом вызова guild.GetItemsHistory( page, orderBy, rearOrder )).
---@class EventGuildItemsHistoryChangedParams

---Присылается при попытке получить историю операций с предметами гильдии.
---@class EventGuildItemsOperationResultParams
---@field success boolean true, если операция завершилась успешно

---Присылается в случае изменения лидера гильдии главного игрока.
---@class EventGuildLeaderChangedParams

---Присылается, если изменился уровень гильдии главного игрока.
---@class EventGuildLevelChangedParams

---Присылается в случае изменения списка членов гильдии главного игрока. Также приходят соответствующие  EVENT_GUILD_MEMBER_ADDED и  EVENT_GUILD_MEMBER_REMOVED.
---@class EventGuildListChangedParams

---Присылается, если в гильдию главного игрока добавлен игрок. Также приходит  EVENT_GUILD_LIST_CHANGED.
---@class EventGuildMemberAddedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии

---Присылается, если изменилось влияние у члена гильдии главного игрока. Также присылается  EVENT_GUILD_MEMBER_CHANGED.
---@class EventGuildMemberAuthorityChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии
---@field delta integer на сколько изменилось

---Присылается, если у члена гильдии изменился баланс в гильдейском банке.
---@class EventGuildMemberBalanceChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)

---Присылается, если изменились параметры члена гильдии главного игрока.
---@class EventGuildMemberChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии

---Присылается, если изменилось влияние, набранное за день, у члена гильдии главного игрока. Также присылается  EVENT_GUILD_MEMBER_CHANGED.
---@class EventGuildMemberDayAuthorityChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии
---@field delta integer на сколько изменилось

---Присылается в случае, если какой-либо игрок вышел или его вывели из гильдии главного игрока. Также см.  EVENT_GUILD_MEMBER_REMOVED.
---@class EventGuildMemberKickedParams
---@field kicked string имя вышедшего из гильдии игрока
---@field kicker string имя выкинувшего игрока (или сам kicked, или офицер/глава гильдии)

---Присылается, если изменилось преданность члена гильдии главного игрока. Также присылается  EVENT_GUILD_MEMBER_CHANGED.
---@class EventGuildMemberLoyaltyChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии
---@field delta integer на сколько изменилось

---Присылается, если изменилось влияние, набранное за месяц, у члена гильдии главного игрока. Также присылается  EVENT_GUILD_MEMBER_CHANGED.
---@class EventGuildMemberMonthAuthorityChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии
---@field delta integer на сколько изменилось

---Присылается когда меняется онлайн-статус члена гильдии (см. поле onlineStatus функции  guild.GetMemberInfo( memberId )).
---@class EventGuildMemberOnlineStatusChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии

---Присылается, если изменился ранг члена гильдии.
---@class EventGuildMemberRankChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии

---Присылается, если из списка гильдии главного игрока удален игрок. Это может быть вызвано, как реальным выводом, так и обновлением информации с сервера. Также приходит  EVENT_GUILD_LIST_CHANGED. Для получения сообщении о реальном выводе игрока из гильдии см.  EVENT_GUILD_MEMBER_KICKED.
---@class EventGuildMemberRemovedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии

---Присылается когда выдаются или отнимаются права у игрока на использовании гильдейсткой символики.
---@class EventGuildMemberSymbolicsParams
---@field mount ObjectId|nil идентификатор ресурса выдающего маунта
---@field smile ObjectId|nil идентификатор ресурса выдающего эмотикон
---@field lifestyle ObjectId|nil идентификатор ресурса выдающего визуал
---@field ability ObjectId|nil идентификатор ресурса выдающего косметическую способность
---@field granted boolean true если права выданы, false если отобраны
---@field member string имя игрока
---@field guild string название гильдии

---Присылается, если изменилось право на ношение накидки у члена гильдии главного игрока. Также присылается  EVENT_GUILD_MEMBER_CHANGED.
---@class EventGuildMemberTabardChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии

---Присылается, если изменилось влияние, набранное за неделю , у члена гильдии главного игрока. Также присылается  EVENT_GUILD_MEMBER_CHANGED.
---@class EventGuildMemberWeekAuthorityChangedParams
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name string имя члена гильдии
---@field delta integer на сколько изменилось

---Присылается, если изменилась новость гильдии.
---@class EventGuildMessageChangedParams

---Присылается, если изменилось набранное за месяц влияние гильдии главного игрока.
---@class EventGuildMonthAuthorityChangedParams

---Приходит при изменении имени гильдии, в которой состоит аватар игрока.
---@class EventGuildNameChangedParams

---Присылается в случае попытки создать гильдию с недоступным именем.
---@class EventGuildNameNotAvailableParams
---@field name string имя, с которым не удалось создать гильдию
---@field sysNameErrorKind string причина, по которой имя недопустимо
---@field notAllowedSubstring string если ошибка произошла из-за недопустимой подстроки, то ее значение

---Приходит при изменении флага "гильдию требуется переименовать" у гильдии, в которой состоит аватар игрока.
---@class EventGuildNeedRenameChangedParams

---Присылается, если изменилсся пул бонусного авторитета гильдии главного игрока.
---@class EventGuildSeasonAuthorityBonusPoolChangedParams

---Присылается, если изменилось сезонное влияние гильдии главного игрока.
---@class EventGuildSeasonAuthorityChangedParams

---Присылается, если изменился сезонный уровень гильдии главного игрока.
---@class EventGuildSeasonLevelChangedParams

---Присылается, если изменилось "несгораемое" сезонное влияние гильдии главного игрока.
---@class EventGuildSeasonSecureAuthorityChangedParams

---Присылается когда произошли изменения в уникальной символике гильдии.
---@class EventGuildSymbolicsChangedParams

---Присылается, если изменился список знаков отличия для наград гильдии главного игрока.
---@class EventGuildTabardsChangedParams

---Событие присылается, когда изменились таланты гильдии.
---@class EventGuildTalentsChangedParams

---Присылается в случае смены гильдийской текстуры.
---@class EventGuildTextureChangedParams

---Присылается, если изменился уровень гильдии главного игрока.
---@class EventGuildUnlockedLevelChangedParams

---Уведомление о смене корпуса активного корабля.
---@class EventHangarActiveHullChangedParams

---Уведомление о смене активного корабля.
---@class EventHangarActiveShipChangedParams

---Уведомление об изменении списка доступных для выбора корпусов у активного корабля кораблей.
---@class EventHangarActiveShipHullsChangedParams

---Уведомление об изменении списка доступных для выбора скинов корпуса активного корабля.
---@class EventHangarActiveShipSkinsChangedParams

---Уведомление о смене скина корпуса активного корабля.
---@class EventHangarActiveSkinChangedParams

---Уведомление о получении списка имеющихся устройств, после запроса НПС в ангаре.
---@class EventHangarDevicesReceivedParams

---Приходит информация о требуемом ремонте корабля. Требуется ответ hangar.RepairReply( positive ), чтобы начать или отменить ремонт. Ремонт происходит тиками одинаковой длительности. Чтобы пропустить определенное количество тиков, игрок должен заплатить определенное количество ресурсов.
---@class EventHangarRepairQuestionParams
---@field moneyToAdd integer сколько надо добавить денег
---@field tickCountToFullRepair integer количество тиков до полной починки
---@field maxTickCount integer количество тиков до всей возможной починки на имеюихся ресурсах
---@field shipRepairPerTick integer процент корабля, который будет отремонтирован [0..100] за один тик
---@field tickTimeMs integer время тика в миллисекундах
---@field itemId ObjectId идентификатор итема, который нужен и сколько его потратится
---@field itemsPerTick number количество предметов, тратящихся за один тик. Может быть дробным. При трате округляется в большую сторону.
---@field totalRepairTime table сколько времени займет ремонт на всех имеющихся ресурсах, поля таблицы:
---@field fullRepairTime table сколько времени займет вообще весь ремонт, поля таблицы:

---Уведомление об изменении списка доступных для выбора кораблей.
---@class EventHangarShipsChangedParams

---Уведомление о получении списка имеющихся устройств для замены, после запроса слота в ангаре.
---@class EventHangarSlotDevicesReceivedParams

---Уведомление об изменении одного из спеллов, используемых для работы с кораблём в ангаре, например в случае, когда изменилась возможность использовать этот спелл.
---@class EventHangarSpellChangedParams
---@field id SpellId Id ресурса спелла

---Оповещение о начале эффекта для одного из спеллов, используемых для работы с кораблём в ангаре. Аналогично  EVENT_SPELLBOOK_ELEMENT_EFFECT.
---@class EventHangarSpellEffectParams

---Событие присылается при появлении у юнита пула анти-хила.
---@class EventHealAbsorbPoolAppearedParams
---@field unitId ObjectId юнит, у которого появился пул анти-хила

---Событие присылается при изменении у юнита пула анти-хила.
---@class EventHealAbsorbPoolChangedParams
---@field unitId ObjectId юнит, у которого изменился пул анти-хила
---@field healAbsorb number текущее значение пула анти-хила

---Событие присылается при исчезании у юнита пула анти-хила.
---@class EventHealAbsorbPoolDisappearedParams
---@field unitId ObjectId юнит, у которого исчез пул анти-хила

---Уведомление о лечении юнита. Для срабатывания данного события требуется указание идентификатора объекта ObjectId(number) в качестве параметра функции  common.RegisterEventHandler( eventFunction, sysEventName, params, requireMainThread ).
---@class EventHealingReceivedParams
---@field unitId ObjectId идентификатор вылеченного юнита
---@field healerId ObjectId идентификатор лекаря, если информация о нём ещё доступна
---@field heal integer на сколько единиц юнит был вылечен
---@field healthLevel integer уровень лечения
---@field isCritical boolean был ли крит при лечении
---@field isGlancing boolean было ли лечение ослабленным
---@field resisted integer величина лечения, которая поглощена из-за сложности ран
---@field runeResisted integer величина лечения, которая поглощена рунической сложностью ран
---@field absorbed integer величина лечения, которая поглощена другими причинами (например, дебуффами).
---@field overload integer величина избыточного лечения, которую не получила цель, т.к. упёрлась в лимит здоровья
---@field lethality number величина сложности ран цели в момент лечения
---@field spellId SpellId / nil Id спелла, которым лечили, если лечили спеллом.
---@field abilityId AbilityId / nil Id абилки, которой лечили, если лечили абилкой.
---@field buffId BuffId / nil Id буффа, которым лечили, если лечили буффом.
---@field isFall boolean true, если здоровье изменено из-за падения

---Оповещение об окончании кулдауна на HearthStone.
---@class EventHearthstoneCooldownFinishedParams

---Оповещение о старте кулдауна на HearthStone.
---@class EventHearthstoneCooldownStartedParams
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах

---Оповещение о появлении HearthStone.
---@class EventHearthstoneCreatedParams

---Оповещение об исчезновении HearthStone.
---@class EventHearthstoneDestroyedParams

---Оповещение об изменении локатора HearthStone.
---@class EventHearstoneLocatorChangedParams

---Событие присылается при изменении количества скрытой игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
---@class EventHiddenCurrencyValueChangedParams
---@field id CurrencyId идентификатор альтернативной валюты.
---@field delta integer число на которое изменилось значение валюты (может быть как положительным, так и отрицательным)
---@field sysName string внутреннее имя альтернативной валюты

---Уведомление о конце выбора текста для IME.
---@class EventImeSelectFinishedParams

---Уведомление о начале выбора текста для IME.
---@class EventImeSelectStartedParams

---Событие присылается при изменении объекта под курсором.
---@class EventIngameUnderCursorChangedParams
---@field state string может принимать следующие значения:
---@field unitId ObjectId идентификатор юнита под курсором
---@field deviceId ObjectId идентификатор устройства под курсором
---@field canUse boolean можно ли использовать устройство в текущий момент (в частности, учитывается расстояние до него)
---@field unitId ObjectId идентификатор астрального юнита под курсором
---@field deviceType number тип корабельного устройства
---@field type number тип хаба {HT_NONE, HT_UNKNOWN, HT_OUR, HT_ENEMYSHIP, HT_PORTAL, HT_ALLOD, HT_ISLAND}
---@field name string|nil название хаба, если это HT_PORTAL

---Результат вызова информации о достижениях другого игрока.
---@class EventInspectAvatarMedalsResultParams

---Событие посылается при окончании инспекции объекта.
---@class EventInspectFinishedParams

---Событие посылается, если при осмотре главным игроком другого игрока у осматриваемого игрока изменился активный маунт.
---@class EventInspectMountChangedParams

---Событие посылается при изменении уровня умения главного игрока осматривать других игроков.
---@class EventInspectSkillChangedParams

---Событие посылается при начале инспекции объекта. Объектом может быть игрок, дружественный аватару, и являющийся целью аватара. При потере цели инспекция сбрасыватся EVENT_INSPECT_FINISHED.
---@class EventInspectStartedParams

---Событие посылается в ответ на запрос наличия доступных заданий у собеседника  avatar.RequestInteractions(). Также приходит автоматически при начале разговора.
---@class EventInteractionStartedParams

---Настало время скрыть/показать интерфейс.
---@class EventInterfaceToggleParams
---@field hide boolean true - скрыть, false - показать
---@field hideCursor boolean true - скрыть курсор вместе с остальным интерфейсом, false - не скрывать курсор вместе с интерфейсом
---@field lockInfut boolean true - блокируется управление камерой, false - не блокируется
---@field useCinemaStripes boolean требуется ли отображение черных полос сверху и снизу экрана
---@field toggleTarget Number что должно быть скрыто/показано

---Событие об изменении содержимого инвентаря главного персонажа.
---@class EventInventoryChangedParams

---Уведомление о смене гемов в дереве талантов души.
---@class EventInventoryGemsChangedParams

---Уведомление о добалении слота для гемов в дереве талантов души.
---@class EventInventoryGemsSlotAddedParams
---@field slot integer индекс слота

---Уведомление о удалении слота для гемов в дереве талантов души.
---@class EventInventoryGemsSlotRemovedParams
---@field slot integer индекс слота

---Событие об изменении содержимого  "переполненной сумки" главного персонажа.
---@class EventInventoryOverflowChangedParams

---Событие, сообщающее о появлении нового слота в "переполненной сумке" главного персонажа.
---@class EventInventoryOverflowSlotAddedParams
---@field slot integer индекс слота в сумке [0..]

---Событие, сообщающее о пропажи слота в "переполненной сумке" главного персонажа.
---@class EventInventoryOverflowSlotRemovedParams
---@field slot integer индекс слота в сумке [0..]

---Событие об изменении размера инвентаря главного персонажа.
---@class EventInventorySizeChangedParams

---Событие об изменении содержимого слота инвентаря главного персонажа.
---@class EventInventorySlotChangedParams
---@field tabIndex number индекс вкладки инвентаря
---@field slotIndex number индекс слота во вкладке
---@field itemId ObjectId идентификатор предмета

---Событие посылается каждый раз, когда изменяются значения смертей и их лимитов для острова.
---@class EventIslandDeathLimitChangedParams

---Событие приходит, если была попытка использовать/надеть/снять предмет, но он не доступен для использования (персонаж мертв или предмет и так находится в процессе переодевания).
---@class EventItemDisabledParams
---@field itemId ObjectId идентификатор предмета

---Событие возникает при успешном перемещении предмета.
---@class EventItemMovedParams
---@field itemId ObjectId идентификатор предмета
---@field from Number тип контейнера ОТКУДА был перемещен предмет
---@field to Number тип контейнера КУДА был перемещен предмет

---Событие посылается , когда игрок запросил avatar.RequestQuestsForItem( itemId ).
---@class EventItemQuestsReceivedParams
---@field slot integer слот, для предмета которого получены квесты
---@field itemId ObjectId или nil id предмета, для которого получены квесты; nil если предмет по какой-либо причине не может быть найден в своём слоте

---Приходит, если изменился список заданий, связанных с предметом.
---@class EventItemRelatedQuestsChangedParams
---@field itemId ObjectId идентификатор предмета

---Событие о завершении сервером операции с предметом. Некоторые операции с предметом не могут производиться до завершения предыдущих операций, это событие служит для определения момента, когда можно проводить следующее действие такого рода. Информация о новом состоянии предмета на клиенте может запаздывать и в момент прихода сообщения может быть устаревшей, т.е. при необходимости надо ждать  EVENT_GAME_ITEM_CHANGED.
---@class EventItemServerCmdFinishedParams
---@field itemId ObjectId идентификатор предмета, с которым завершилась операция
---@field isSuccess boolean если true, то операция завершилась удачно

---Уведомление о невозможности торговли по причине игнора.
---@class EventItemsExchangeDeclineIgnoredParams
---@field declinerName string имя персонажа, от которого пришел отказ

---Во время торговли с другим игроком произошла ошибка.
---@class EventItemsExchangeErrorParams
---@field inviter string имя игрока, инициировавшего торговлю
---@field invited string имя игрока, приглашенного торговать
---@field error string описание ошибки

---Торговля между игроками завершена.
---@class EventItemsExchangeFinishedParams
---@field state int состояние завершения торговли

---Главному игроку предложено поторговать с другим игроком.
---@class EventItemsExchangeInvitedParams

---Событие приходит, если какой либо из участников торговли между окончательно согласился с условиями обмена или отказался от своего окончательного согласия.
---@class EventItemsExchangeOfferFinalConfirmedChangedParams
---@field offerId ObjectId идентификатор игрока

---Событие приходит, если какой либо из участников торговли между игроками поменял предметы на столе обмена.
---@class EventItemsExchangeOfferItemsChangedParams
---@field offerId ObjectId идентификатор игрока, поменявшего предметы

---Событие приходит, если какой либо из участников торговли между игроками изменил сумму денег на игровом столе.
---@class EventItemsExchangeOfferMoneyChangedParams
---@field offerId ObjectId идентификатор игрока

---Событие приходит, если какой либо из участников торговли между предварительно согласился с условиями обмена или отказался от своего предварительного согласия.
---@class EventItemsExchangeOfferPrimaryConfirmedChangedParams
---@field offerId ObjectId идентификатор игрока

---Главный игрок не может положить предмет на обменный стол, так как слот уже занят.
---@class EventItemsExchangeSlotIsBusyParams

---Главным игроком инициирована торговля между игроками.
---@class EventItemsExchangeStartedParams

---Изменилось состояние торговли между игроками. Состояний может быть несколько:
---@class EventItemsExchangeStateChangedParams

---Не удалось совершить действие связанное с LFG
---@class EventLfgActionFailParams
---@field cause Number причина сбоя

---Событие посылается при изменении возможности для игрока отправится на текущую целевую локацию, т.е. стали выполнены все предикаты для отправки в локацию, либо наоборот, какой-то из предикатов перестал выполняться.
---@class EventLfgDepartAvailableChangedParams
---@field available boolean возможность отправки на текущую целевую локацию

---Событие посылается при изменении доступности для игрока целевой локации, т.е. локация стала доступна, либо наоборот не доступна по условиям входа.
---@class EventLfgDestinationAvailableChangedParams
---@field destination LfgDestinationId идентификатор целевой локации

---Событие посылается при смене цели(пункт назначения) для сбора группы.
---@class EventLfgDestinationChangedParams
---@field destination LfgDestinationId пункт назначения

---Событие посылается при когда изменился список открытых активностей в LFG.
---@class EventLfgDestinationsListChangedParams

---Посылается каждый раз, когда для какой-либо LFG-ативности меняется информация о количестве посещений за сегодняшний день аватаром.
---@class EventLfgDestinationVisitsChangedParams
---@field destination LfgDestinationId пункт назначения

---Игрок запустил LFG, подал заявку на подбор группы
---@class EventLfgJoinParams
---@field destination LfgDestinationId пункт назначения
---@field roles Number[] список вакантных ролей в группе

---Игрок ушел из LFG, отказался от подбора группы.
---@class EventLfgLeaveParams

---Событие посылается при начале голосования.
---@class EventLfgVoteParams
---@field initiator string имя игрока, активировавшего опрос
---@field type Number предмет опроса
---@field destination LfgDestinationId|nil пункт назначения
---@field endTimeMs Number время окончания опроса
---@field roles Number[] список вакантных ролей в группе

---Событие посылается при сорванном голосования.
---@class EventLfgVoteTerminateParams

---Уведомление о приходе на клиент текстового сообщения в лобби. Строковый код типа берётся из ресурса. Задается непосредственно в эффектах типа ClientData (серверный тип: gameMechanics.world.ClientData) в расширении InterfaceAction. Рекомендуемый шаблон sysId:
---@class EventLobbyClientMessageParams

---Присылается при изменении раскладки клавиатуры.
---@class EventLocaleChangedParams

---Событие посылается каждый раз, когда появился какой-нибудь контейнер с лутом.
---@class EventLootBagAppearedParams

---Событие посылается на изменение контейнера с лутом. Если одновременно изменились несколько элементов, то событие присылается только раз.
---@class EventLootBagChangedParams

---Событие посылается на исчезновение контейнера с лутом.
---@class EventLootBagDisappearedParams

---Событие посылается на исчезновение объекта в контейнера с лутом.
---@class EventLootBagItemDisappearedParams

---Событие посылается на исчезновение денег в контейнере с лутом.
---@class EventLootBagMoneyDisappearedParams

---Событие посылается на открытие/закрытие сумки с лутом.
---@class EventLootBagOpenStateChangedParams
---@field customFilter integer фильтр, переданный из скрипта при использовании предмета

---Событие посылается при селекте контейнера с лутом. (В настоящий момент только на клик в неселекченный труп - т.е. в момент селекта - моба с лутом.)
---@class EventLootBagSelectedParams

---Событие посылается каждый раз, когда игрок приносит чужой сундук в свою сокровищницу.
---@class EventLootChestCapturedParams
---@field playerId ObjectId Id игрока захватившего сундук
---@field isEnemyChest boolean является ли сундук вражеским

---Событие посылается каждый раз, когда игрок бросает сундук на корабле.
---@class EventLootChestDroppedParams
---@field playerId ObjectId Id игрока бросившего сундук
---@field isEnemyChest boolean является ли сундук вражеским

---Событие посылается каждый раз, когда игрок возвращает сундук в сокровищницу.
---@class EventLootChestReturnedParams
---@field playerId ObjectId Id игрока возвратившего сундук
---@field isEnemyChest boolean является ли сундук вражеским

---Событие посылается каждый раз, когда игрок поднимает сундук на корабле.
---@class EventLootChestTakenParams
---@field playerId ObjectId Id игрока поднявшего сундук
---@field isEnemyChest boolean является ли сундук вражеским

---Уведомление о начале ролла при Master ролле. Приходит всем, кроме мастера (мастеру приходит EVENT_LOOT_TO_DISTRIBUTE).
---@class EventLootDistributionStartedParams
---@field itemObject ValuedObject объект, содержащий информацию о предмете

---Сообщение приходит при начале дележа при Greed/Need ролле:
---@class EventLootForGreedNeedParams
---@field rollId ObjectId уникальный идентификатор ролла
---@field itemId ObjectId уникальный идентификатор айтема
---@field count integer количество данного айтема в стеке

---Уведомление о появлении/исчезновении лута в юните-трупе. Используется для вывешивания лут-марок над трупиками.
---@class EventLootMarkParams

---Сообщение приходит, когда меняется информация о текущем варианте выпадения лута на астральных островах.
---@class EventLootselectorChangedParams

---Уведомление о начале ролла при Master ролле (приходит только мастеру):
---@class EventLootToDistributeParams
---@field rollId ObjectId уникальный идентификатор ролла
---@field itemId ObjectId уникальный идентификатор итема
---@field looters таблица UniqueId (not nil) список кросс-серверных уникальных идентификаторов игроков, принимающих участие в ролле (индексируется [0...])

---Событие присылается, когда заканчивается лотерея "Лото". -- Без параметров См. также:
---@class EventLotteryEndParams

---Событие присылается, когда меняется состояние лотереи. Подробнее о состояниях: EnumLotteryState
---@class EventLotteryStateChangedParams

---Событие приходит при открытии (активации) почтового ящика.
---@class EventMailboxActivatedParams

---Уведомление об изменении состояния почтового ящика. Например, при изменении статуса готовности или списка писем в нем.
---@class EventMailboxChangedParams

---Уведомление об изменении состояния почтового ящика на сервере. Означает, что данные на клиенте устарели и должны быть обновлены (см.  mailBox.RequestMails( startIndex, count ) и  mailBox.RequestMailInfo( mailId ) (закрытая ссылка)), до обновления функции  mailBox.GetMails() и  mailBox.GetMail( mailId ) будут возвращать nil.
---@class EventMailboxChangedOnServerParams

---Событие приходит при закрытии (деактивации) почтового ящика.
---@class EventMailboxClosedParams

---Событие приходит при попадании письма в почтовый ящик.
---@class EventMailboxNewMailArrivedParams
---@field totalCount integer общее количество писем в почтовом ящике
---@field unreadCount integer количество непрочтённых писем в почтовом ящике

---Уведомление о непрочитанных письмах. Присылается при входе в игру и при добавлении новых непрочитанных писем.
---@class EventMailboxNewUnreadMessageParams
---@field oldUnreadMessages integer прежнее количество непрочитанных писем
---@field unreadMessages integer текущее количество непрочитанных писем

---Уведомление о статусе исполнения команды, касающейся почтового ящика на сервере. Содержит в себе код ошибки или удачного завершения. Использовать только для сообщений об ошибках, для других целей есть  EVENT_MAILBOX_CHANGED_ON_SERVER.
---@class EventMailboxServerOperationResultParams
---@field sysResult string статус завершения операции

---Событие с результатом создания письма.
---@class EventMailCreateResultParams
---@field sysResult string результат создания письма, текстовый енум. Not fully implemented yet.
---@field recipientName string имя адресата

---Событие с результатом попытки удаления письма.
---@class EventMailDeleteResultParams
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

---Событие с результатом извлечения предметов из письма.
---@class EventMailExtractItemsResultParams
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

---Событие с результатом извлечения денег из письма.
---@class EventMailExtractMoneyResultParams
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

---Событие с результатом попытки возврата письма отправителю.
---@class EventMailReturnResultParams
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

---Уведомление об изменении содержимого писем. В частности, при получении недостающей информации с сервера. Присылается список всех измененных за кадр писем (cобытие приходит не чаще раза за кадр).
---@class EventMailsChangedParams

---Событие присылается при измениние маны юнита другим юнитом.
---@class EventManaReceivedParams
---@field unitId ObjectId юнит, у которого изменилась мана
---@field casterId ObjectId юнит, который изменил ману, если информация о нём ещё доступна
---@field addedMana integer величина изменения маны (отрицательная - выжгли, положительная - добавили)
---@field spellId SpellId / nil Id ресурса заклинания, которым изменили ману.
---@field abilityId AbilityId / nil Id абилки, если изменили абилкой.
---@field buffId BuffId / nil Id буффа, если изменили буффом.
---@field isFall boolean true, если мана изменена из-за падения
---@field isExploit boolean true, если мана изменена из-за эксплойта

---Событие возникает при изменение состояния каналов в текущей игровой локации.
---@class EventMapChannelsInfoChangedParams

---Уведомление о невозможности зайти в полностью заполненный инстанс.
---@class EventMapInstanceFullParams
---@field mapName string название инстанса

---Событие присылается при окончании отсчета времени до выброса из инстанса.
---@class EventMapInstanceKickTimerFinishedParams

---Событие присылается при начале отсчета времени до выброса из инстанса.
---@class EventMapInstanceKickTimerStartedParams

---Посылается каждый раз, когда меняется время автоматической отправки группы в активность.
---@class EventMatchMakingAutoDepartTimeChangedParams
---@field eventId ObjectId идентификатор активности в которую собирается группа

---Посылается когда меняется информация о сражении, в котором аватар принимает участие.
---@class EventMatchMakingCurrentBattleChangedParams

---Посылается каждый раз, когда в списке инстанс-ивентов появляется новый элемент. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
---@class EventMatchMakingEventAddedParams
---@field eventId ObjectId id добавленного инстанс-ивента

---Посылается когда у аватара появляется или теряется способность участвовать в каком-либо инстанс-ивенте.
---@class EventMatchMakingEventAvailabilityChangedParams
---@field eventId ObjectId id инстанс-ивента, чья доступность изменилась

---Посылается когда у инстанс-ивента появляется или пропадает откат бонуса
---@class EventMatchMakingEventDoubleBonusChangedParams
---@field eventId ObjectId id инстанс-ивента, чей бонус изменился

---Посылается каждый раз, когда получена новая информация о прогрессе текущего инстанс-ивента (либо по завершении инстанс-ивента, либо после включения получения информации о прогрессе текущего инстанс-ивента, см. matchMaking.ListenEventProgress( needListen ) (закрытая ссылка)).
---@class EventMatchMakingEventProgressAddedParams

---Посылается при изменении статуса заверщённости текущего инстанс-ивента (предполагается, что принудительная телепортация из инстанса случится несколько позже и за это время игрок может просмотреть статистику по ивенту). Посылается только если включено слежение за прогрессом ивента (matchMaking.ListenEventProgress(true) (закрытая ссылка)), поэтому при каждом включении слежения за прогрессом (после получения сообщения EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED) текущее состояние нужно проверять дополнительно (matchMaking.GetEventProgressInfo(), поле completed).
---@class EventMatchMakingEventProgressCompletedChangedParams

---Посылается при изменении длительности текущего инстанс-ивента. Посылается только если включено слежение за прогрессом ивента (matchMaking.ListenEventProgress(true) (закрытая ссылка)), поэтому при каждом включении слежения за прогрессом (после получения сообщения EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED) текущее состояние нужно проверять дополнительно (matchMaking.GetEventProgressInfo(), поле durationMs).
---@class EventMatchMakingEventProgressDurationChangedParams

---Посылается каждый раз, когда изменяется информация о достижениях одного из участников текущего инстанс-ивента (т.е. для  matchMaking.GetEventProgressInfo() меняются поля таблицы members: kills, totalDamageDone, totalHealDone).
---@class EventMatchMakingEventProgressMemberChangedParams

---Посылается каждый раз, когда изменяется список с достижениями участников текущего инстанс-ивента (добавляются или удаляются участники).
---@class EventMatchMakingEventProgressMembersChangedParams

---Посылается каждый раз, когда удаляется информация о прогрессе текущего инстанс-ивента, скорее всего в результате соответствующего вызова matchMaking.ListenEventProgress( needListen ) (закрытая ссылка).
---@class EventMatchMakingEventProgressRemovedParams

---Посылается каждый раз, когда изменяется номер текущего раунда, длительности раундов или времена начала раундов (т.е. поля round, durationsByRound и startTimesByRound результата функции  matchMaking.GetEventProgressInfo())
---@class EventMatchMakingEventProgressRoundsChangedParams

---Посылается каждый раз, когда аватар присоединяется к очереди на какой-либо инстанс-ивент.
---@class EventMatchMakingEventQueueAddedParams
---@field eventId ObjectId id инстанс-ивента

---Посылается каждый раз, когда аватар выходит из очереди на какой-либо инстанс-ивент.
---@class EventMatchMakingEventQueueRemovedParams
---@field eventId ObjectId id инстанс-ивента

---Посылается, когда аватар удаляется сразу из всех очередей на инстанс-ивенты, в которых он находился (например в случае приглашения на инстанс-ивент).
---@class EventMatchMakingEventQueuesRemovedParams

---Посылается каждый раз, когда из списка инстанс-ивентов удаляется какой-либо элемент. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
---@class EventMatchMakingEventRemovedParams
---@field eventId ObjectId id удалённого инстанс-ивента

---Посылается когда у аватара появляется или теряется способность участвовать в инстанс-ивентах.
---@class EventMatchMakingEventsAvailabilityChangedParams
---@field isAvailable boolean true если способность появилась, иначе false

---Событие посылается всякий раз, когда каким-либо образом меняется информация о списке существующих в игре инстанс-ивентов (список стал доступен, список стал недоступен, добавлены или удалены элементы списка).
---@class EventMatchMakingEventsChangedParams

---Событие посылается, когда приглашение телепортироваться на инстанс-ивент теряет силу либо из-за отказа игрока или кого-то из членов группы, в составе которой игрок стоит в очереди на инстанс-ивент, либо из-за того, что игрок или его согрупник не отреагировал на приглашение за отведённое ему время.
---@class EventMatchMakingEventTeleportRejectedParams
---@field eventId ObjectId Id инстанс-ивента, приглашение на который потеряло силу
---@field isTimeout boolean если true, то приглашение потеряло силу из-за истечения времени, если false, то из-за отказа игрока или кого-то из членов группы

---Событие посылается, когда подходит очередь игрока на участие в инстанс-ивенте. Если до истечения таймаута ответ не послан, приглашение считается отвергнутым. Ответ (принять/отказаться) посылается через  matchMaking.InstancedEventTeleportReply( accept ) (закрытая ссылка).
---@class EventMatchMakingEventTeleportRequestParams
---@field eventId ObjectId Id инстанс-ивента, на который пришло приглашение
---@field timeoutMs integer время ожидания ответа (в ms), если ответа в течение этого времени нет, то приглашение считается отвергнутым
---@field isDelayedInvite boolean true, если аватар не может быть телепортирован сразу после согласия (например получил приглашение во время боя); в этом случае если согласие дано, аватар будет телепортирован в инстанс-ивент только по истечении timeoutMs; поведение при игнорировании приглашения (см. описание поля timeoutMs) от значения isDelayedInvite не зависит

---Посылается каждый раз, когда для какого-либо инстанс-ивента меняется информация о количестве посещений за сегодняшний день основным игроком.
---@class EventMatchMakingEventVisitsChangedParams
---@field eventId ObjectId id добавленного инстанс-ивента

---Посылается каждый раз, когда каким-либо образом (добавляется-удаляется-меняется) изменяется оценка времени ожидания присоединения к какому-либо инстанс-ивенту. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
---@class EventMatchMakingJoinTimeChangedParams
---@field eventId ObjectId id инстанс-ивента, для которого изменилась оценка времени ожидания присоединения

---Посылается каждый раз, когда меняется роль хотя бы одного персонажа в группе.
---@class EventMatchMakingMembersRolesChangedParams
---@field eventId ObjectId|nil идентификатор активности в которую собирается группа, nil - если поменялись роли в текущей активности в которой находится игрок

---Посылается каждый раз, когда изменяется иноформация о достижениях команд-участников текущего инстанс-ивента ( matchMaking.GetEventProgressInfo(), поле achievements).
---@class EventMatchMakingProgressAchievementsChangedParams

---Посылается, когда изменяется список ресурсов, начисленных какому-либо из участников инстанс-ивента в качестве достижений (в списке появился новый ресурс или изменилось количество какого-либо уже присутствующего в списке ресурса). Посылается не чаще 1 раза в секунду.
---@class EventMatchMakingProgressMembersAchievementsChangedParams

---Уведомление об появлении нового активного достижения.
---@class EventMedalAddedParams
---@field id Number идентификатор достижения

---Уведомление об изменении прогресса достижения.
---@class EventMedalProgressChangedParams
---@field id Number идентификатор достижения

---Уведомление об удалении активного достижения.
---@class EventMedalRemovedParams
---@field id Number идентификатор достижения

---Уведомление об изменении списка активных достижений.
---@class EventMedalsChangedParams

---Событие приходит в ответ на запрос medalsLib.SearchMedals( name, limit ). В ответе перечислены идентификаторы ресурсов рангов найденных достижений.
---@class EventMedalsSearchResultsParams

---Уведомление о выполнении достижения членом группы или отряда аватара, но не самим аватаром.
---@class EventMemberMedalFinishedParams
---@field id Number идентификатор достижения
---@field avatarName string имя персонажа выполнившего достижение

---Уведомление о появлении у ментора нового ученика.
---@class EventMentorApprenticeAddedParams
---@field mentorId ObjectId идентификатор (субъекта менторских взаимоотношений) ментора
---@field mentorPlayerId ObjectId идентификатор (субъекта менторских взаимоотношений) добавленного ученика

---Уведомление об исчезновении ученика у ментора.
---@class EventMentorApprenticeRemovedParams
---@field mentorId ObjectId идентификатор (субъекта менторских взаимоотношений) ментора
---@field mentorPlayerId ObjectId идентификатор (субъекта менторских взаимоотношений) удаленного ученика

---Сообщение приходит, если у субъекта менторских взаимоотношений изменилась награда, полученная с ученика.
---@class EventMentorApprenticeRewardChangedParams
---@field mentorId ObjectId идентификатор субъекта менторских взаимоотношений - ментора
---@field apprenticeId ObjectId идентификатор субъекта менторских взаимоотношений - ученика

---Уведомление об изменении метора, которым является главный игрок.
---@class EventMentorChangedParams

---Уведомление об изменении какого-то кулдауна менторской системы.
---@class EventMentorCooldownsChangedParams

---Уведомление об изменении общей информации о менторстве (флаги возможности/желания стать ментором/учеником).
---@class EventMentorDataChangedParams

---Сообщение приходит, если у ментора поменялась общая информация (изменился субъект менторских взаимоотношений и надо обновить его поля).
---@class EventMentorInfoChangedParams
---@field mentorId ObjectId идентификатор ментора

---Уведомление об изменении сообщения ментора.
---@class EventMentorMessageChangedParams
---@field mentorId ObjectId идентификатор ментора

---Сообщение приходит, если у субъекта менторских взаимоотношений изменились какие-то поля.
---@class EventMentorPlayerInfoChangedParams
---@field mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений

---Событие приходит, если было начато улучшение мета-предметов. Пользователю необходимо показать диалог для получения параметров для  avatar.UpgradeMetaItem().
---@class EventMetaDialogParams

---Событие приходит, если необходимо закрыть диалог улучшения мета-предметов. Пользователю необходимо корректно вызывать  avatar.ShowMetaUpgradeDialog().
---@class EventMetaUpgradeBreakParams

---Уведомление о результатах попытки улучшения мета-предмета.
---@class EventMetaUpgradeResultParams
---@field sysCause string результат попытки улучшения, в случае удачи приходит "ENUM_ActionFailCause_NoFail"
---@field isLucky boolean сработал ли шанс моментального/двойного улучшения
---@field improvementIncrease number степень улучшения (в промежутке [0, 99])
---@field upgradeChanceBehavior string поведение при срабатывании шанса моментального/двойного улучшения
---@field upgradeVector string что улучшается: качество или уровень
---@field sourceId ObjectId идентификатор улучшаемого предмета
---@field enchancerId ObjectId идентификатор предмета-улучшителя
---@field agentId ObjectId идентификатор предмета реагента
---@field agentCount integer количество использованных предметов-реагентов
---@field resultId ObjectId идентификатор полученного предмета

---Уведомление, что был освобожден слот с портретом. Скрипт обязан очистить (заменить на валидные) текстуры фонового слоя для всех виджетов, которые использовали данный слот. См. также:  mission.FreePortrait и mission.SetPortraitBackgroundTexture.
---@class EventMissionFreePortraitSlotParams
---@field slot integer слот с портретом

---Событие, информирующее о инициализации загрузки миссии (все аддоны готовы к использованию). После этого события приходят ещё и  EVENT_ADDON_LOAD_STATE_CHANGED.
---@class EventMissionInitializedParams

---Событие, информирующее о прогрессе загрузки миссии.
---@class EventLoadingProgressParams
---@field sysStage string фаза загрузки
---@field current integer текущее количество загруженных ресурсов
---@field total integer общее количество ресурсов, которые необходимо загрузить
---@field firstTime boolean true, если событие присылается первый раз после начала очередной загрузки
---@field finished boolean завершена ли загрузка
---@field fraction number текущий общий прогресс загрузки в долях единицы: [0..1]
---@field mapName string название карты
---@field mapDescription string описание карты
---@field mapImage TextureId идентификатор текстуры с изображением для данной карты

---Уведомление об появлении игрового события.
---@class EventMissionRuleAddedParams
---@field ruleId RuleId идентификатор ресурса события

---Уведомление об изменении игрового события.
---@class EventMissionRuleChangedParams
---@field ruleId RuleId идентификатор ресурса события

---Уведомление об изменении счётчика игрового события.
---@class EventMissionRuleCounterChangedParams
---@field ruleId ObjectId идентификатор игрового события

---Уведомление об ичезновении игрового события.
---@class EventMissionRuleRemovedParams
---@field ruleId RuleId идентификатор ресурса события

---Уведомление об изменении информации об игровых событиях.
---@class EventMissionRulesChangedParams

---Событие присылается при окончании действия мобом.
---@class EventMobActionProgressFinishParams
---@field id ObjectId идентификатор моба

---Событие присылается при заморозке прогресса действия моба.
---@class EventMobActionProgressFreezeParams
---@field id ObjectId идентификатор моба
---@field progress number обновление времени действия action

---Событие присылается при запуске действия мобом.
---@class EventMobActionProgressStartParams
---@field id ObjectId идентификатор моба
---@field duration number время действия "действия"
---@field progress number прошло времени (так как событие может прийти с задержкой)
---@field name string название действия
---@field spellId SpellId|nill если известен спелл, то присылается идентификатор спелла
---@field isPrecast boolean|nil если известен спелл, то присылается признак, что у спелла есть время прекаста
---@field isChannel boolean|nil если известен спелл, то присылается признак, что у спелла есть механика чаннелинга

---Уведомление об эвейде моба.
---@class EventMobEvadedParams
---@field unitId ObjectId идентификатор моба

---Приходит, если изменился список заданий процедурного данжа, связанных с мобом.
---@class EventMobRelatedGoalsChangedParams
---@field unitId ObjectId идентификатор моба

---Приходит, если изменился список заданий, связанных с мобом.
---@class EventMobRelatedQuestsChangedParams
---@field unitId ObjectId идентификатор моба

---Событие посылается каждый раз, когда изменилось состояние движение аватара в точку (начали/закончили режим движения в точку, изменилась точка назначения).
---@class EventMoveByClickChangedParams

---Событие присылается при изменении модификатора зоны мутации.
---@class EventMutationZoneMapModifiersChangedParams

---Событие присылается при изменении заполненности игровой зоны мутации.
---@class EventMutationZonePopulationChangedParams

---Событие посылается, когда изменяется информация о стоимости постановки флагов атаки на сектор.
---@class EventMwarFlagCostsChangedParams

---Событие приходит, когда изменяется информация о рейтинге гильдий для Доминиона (начала транслироваться на клиент или перестала транслироваться на клиент, или обновилась).
---@class EventMwarLadderChangedParams

---Посылается, когда меняется информация о том, в очереди на какое сражение Доминиона стоит аватар.
---@class EventMwarQueueChangedParams

---Событие приходит, когда изменяется информация о сторонах сражения Доминиона (начала транслироваться на клиент или перестала транслироваться на клиент, или обновилась во время работающей трансляции).
---@class EventMwarRatingProgressChangedParams

---Событие присылается, если изменилась возможность автонавигации.
---@class EventNavigateEnabledChangedParams

---Событие посылается, когда навигационный сканер получил информацию об астрале в текущем сканируемом хабе сканера.
---@class EventNavigationScanerHubPveInfoParams

---Событие посылается, когда навигационный сканер получил информацию об игроках в текущем сканируемом хабе сканера.
---@class EventNavigationScanerHubPvpInfoParams

---Событие посылается, когда навигационный сканер начал сканировать хаб и уже получил базовую информацию об этом хабе.
---@class EventNavigationScanerHubStartedParams

---Событие посылается, когда навигационный сканер получил информацию о следах кораблей игроков в хабе главного игрока.
---@class EventNavigationScanerHubTrailsInfoParams

---Событие посылается каждый раз, когда меняется статус device.HasNavigatorFollowedMarker(). Работает только для активного (используемого главным игроком) устройства навигатора.
---@class EventNavigatorFollowedChangedParams

---Событие посылается каждый раз, когда меняется список сундуков во вражеской сокровищнице, увиденных с помощью специального предмета через навигатор корабля главного игрока.
---@class EventNavigatorTargetChestsChangedParams

---Присылается при изменении значения BloodPool некроманта.
---@class EventNecromancerBloodPoolChangedParams

---Уведомление об открытии новой репутации.
---@class EventNewReputationAppearedParams
---@field factionId FactionId фракция

---Уведомление об открытии страницы с полным текстом новости в окне нотификации новостей.
---@class EventNewsPostLoadedParams
---@field ruleId ObjectId или nil если у новости нет привязки к игровому событию, то nil; иначе идентификатор игрового события (во внутриигровом календаре), которому соответствует новость

---Уведомление о выборе новости в окне нотификации новостей (для перехода на соответствующее событие во внутриигровом календаре).
---@class EventNewsPostSelectedParams
---@field ruleId ObjectId или nil идентификатор игрового события (во внутриигровом календаре), которому соответствует новость; если у новости нет привязки к игровому событию, то nil

---Событие посылается каждый раз, когда у объекта появляется новый баф. Если обновляются параметры существующего, то приходит  EVENT_OBJECT_BUFF_CHANGED. Для срабатывания данного события требуется активация персонального эвента по носителю бафа, смотри  common.RegisterEventHandler,  common.EnablePersonalEvent.
---@class EventObjectBuffAddedParams
---@field objectId ObjectId идентификатор объекта на который повесили баф
---@field buffName string имя бафа
---@field buffId ObjectId идентификатор бафа
---@field sysName string системное название бафа
---@field resourceId buffId идентификатор ресурса бафа
---@field isNeedVisualize boolean нужно ли отображать данный бафф
---@field interfacePriority ENUM_UIBuffPriority интерфейсный приоритет

---Событие посылается каждый раз, когда у объекта изменяются свойства существующего бафа, а именно:
---@class EventObjectBuffChangedParams
---@field objectId ObjectId идентификатор объекта на который повесили баф
---@field buffName string имя бафа
---@field buffId ObjectId идентификатор бафа
---@field sysName string системное название бафа
---@field resourceId buffId идентификатор ресурса бафа
---@field isNeedVisualize boolean нужно ли отображать данный бафф
---@field interfacePriority ENUM_UIBuffPriority интерфейсный приоритет

---Событие посылается каждый раз, когда у объекта появляется новый бафф для которого требуется визуализация прогресса (бафф имеет группу castbar). Поля идентичны  EVENT_OBJECT_BUFF_ADDED Связанные события и функции:
---@class EventObjectBuffProgressAddedParams

---Событие посылается каждый раз, когда у объекта изменяются свойства бафа для которого требуется визуализация прогресса (бафф имеет группу castbar). Поля идентичны  EVENT_OBJECT_BUFF_CHANGED Связанные события и функции:
---@class EventObjectBuffProgressChangedParams

---Событие посылается каждый раз, когда у объекта пропадает бафф для которого требуется визуализация прогресса (бафф имеет группу castbar). Поля идентичны  EVENT_OBJECT_BUFF_REMOVED Связанные события и функции:
---@class EventObjectBuffProgressRemovedParams

---Событие посылается каждый раз, когда у объекта пропадает баф. Нельзя использовать buffId из данного события для получения информации о бафе. После отправки события экземпляр бафа уничтожается и его id инвалидируется. Для срабатывания данного события требуется активация персонального эвента по носителю бафа, смотри  common.RegisterEventHandler,  common.EnablePersonalEvent.
---@class EventObjectBuffRemovedParams
---@field objectId ObjectId идентификатор объекта у которого пропал баф
---@field buffName string имя бафа
---@field buffId ObjectId идентификатор бафа
---@field sysName string внутреннее имя бафа (может быть использовано для специальной обработки), соответствующее поле в базе для бафа - "sysUIScriptName"
---@field resourceId buffId идентификатор ресурса бафа
---@field isNeedVisualize boolean нужно ли отображать данный бафф
---@field interfacePriority ENUM_UIBuffPriority интерфейсный приоритет

---Событие посылается не чаще одного раза в кадр, если в данном кадре у объекта изменился набор буфов. Подразумевается именно добавление или удаление бафов, но не изменение свойств существующих. Для срабатывания данного события требуется активация персонального эвента по носителю бафа, смотри  common.RegisterEventHandler,  common.EnablePersonalEvent. '''ВНИМАНИЕ!''' НЕ рекомендуется по данному событию полностью обновлять информацию о всех бафах объекта DEPRECATED: Событие не рекомендуется к использованию и помечено к удалению
---@class EventObjectBuffsChangedParams
---@field objectId ObjectId

---Событие посылается не чаще одного раза в кадр, если в данном кадре у какого-либо из объектов вокруг игрока меняется информация о каком либо буфе. Является агрегированной версией  EVENT_OBJECT_BUFF_CHANGED
---@class EventObjectBuffsElementChangedParams
---@field objects tables[] индексированная по ObjectId таблица таблиц:
---@field key ObjectId идентификатор объекта
---@field value boolean[] таблица, индексированная по идентификаторам изменившихся бафов
---@field key ObjectId идентификатор бафа
---@field value boolean всегда содержит true  у проиндексированных элементов

---Событие посылается при изменение состояния интерактивного объекта бой/не бой.
---@class EventObjectCombatStatusChangedParams
---@field objectId ObjectId идентификатор объекта
---@field inCombat boolean состояние бой/не бой

---Событие посылается при окончании отслеживания объекта на карте с помощью специального умения.
---@class EventObjectDetectFinishedParams
---@field objectId ObjectId Id объекта (юнит или устройство)

---Событие посылается, если у отслеживаемого объекта изменился список детекторов.
---@class EventObjectDetectorListChangedParams
---@field objectId ObjectId Id объекта (юнит или устройство)

---Событие посылается при начале отслеживания объекта на карте.
---@class EventObjectDetectStartedParams
---@field objectId ObjectId Id объекта (юнит или устройство)

---Событие посылается каждый раз, когда изменилось состояние диминишинга у объекта.
---@class EventObjectDiminishingChangedParams

---Событие посылается каждый раз, когда изменилось состояние одной из групп диминишинга.
---@class EventObjectDiminishingGroupChangedParams
---@field objectId ObjectId идентификатор объекта
---@field group Number группа диминишинга
---@field level number уровень диминишинга(от 0 до 3, где 0 - полное отсутствие диминишинга, 3 - полное сопротивление контролям из данной группы)

---Событие присылается при изменении процентного значения здоровья интерактивных объектов и числового значения здоровья для персонажа игрока Для срабатывания данного события требуется указание идентификатора объекта ObjectId(number) в качестве параметра функции  common.RegisterEventHandler( eventFunction, sysEventName, params, requireMainThread ).
---@class EventObjectHealthChangedParams
---@field id ObjectId идентификатор объекта
---@field healthDelta integer|nil на сколько изменилась точная величина здоровья, если такая информация доступна для этого объекта
---@field healthLimitDelta integer|nil на сколько изменилась максимальная величина здоровья, если такая информация доступна для этого объекта
---@field healthPercentsDelta integer|nil на сколько изменилась относительная величина здоровья, если такая информация доступна для этого объекта
---@field additionalDelta integer|nil на сколько изменилась точная величина дополнительного здоровья (поглощение), если такая информация доступна для этого объекта
---@field additionalPercentsDelta integer|nil на сколько изменилась относительная величина дополнительного здоровья (поглощение), если такая информация доступна для этого объекта
---@field isInvulnerableChanged boolean поменялся ли isInvulnerable (состояние неуязвимости)

---Событие присылается при изменении процентного значения маны интерактивных объектов и числового значения маны для персонажа игрока
---@class EventObjectManaChangedParams
---@field id ObjectId идентификатор объекта
---@field manaDelta integer|nil на сколько изменилась точная величина маны, если такая информация доступна для этого объекта
---@field manaLimitDelta integer|nil на сколько изменилась максимальная величина маны, если такая информация доступна для этого объекта
---@field manaPercentsDelta integer|nil на сколько изменилась относительная величина маны, если такая информация доступна для этого объекта

---Сообщение об изменении имени объекта. У мобов (включая астральных) может приходить в случае изменения их ресурса (морфинга в другого моба).
---@class EventObjectNameChangedParams
---@field id ObjectId идентификатор объекта

---Сообщение об изменении возможности выделить объект в цель.
---@class EventObjectSelectableChangedParams
---@field objectId ObjectId идентификатор объекта

---Событие присылается при изменения здоровья и состояния неуязвимости объектов
---@class EventObjectsHealthChangedParams

---Событие посылается каждый раз, когда у объекта удаляется информация о специфических параметрах UI для данного объекта.
---@class EventObjectUiinfoRemovedParams
---@field objectId ObjectId

---Уведомление об изменении значения опций. Текущие значения больше недействительны и необходимо полное обновление. Для обновления необходимо использовать функцию  options.Update().
---@class EventOptionChangedParams
---@field sysCustomId string идентификатор пользовательской опции

---Присылается при изменении значение достижений. Запрос производится через FunctionOrderRequestRatingAchivements, FunctionOrderRequestPrestigeAchivements.
---@class EventOrderAchievementsChangedParams

---Присылается при изменении возможности голосования.
---@class EventOrderCanVoteChangedParams
---@field canVote boolean true если можно голосовать

---Присылается, когда у аватара появляется или пропал орден.
---@class EventOrderChangedParams

---Присылается при изменении информации об ордене. Запрос производится через FunctionOrderRequestOrderInfo.
---@class EventOrderInfoChangedParams

---Присылается в ответ на голосование за бонусы.
---@class EventOrderVoteAnswerParams
---@field isOk boolean индикатор успешности голосования
---@field result string результат голосования

---Событие посылается каждый раз, когда у члена группы главного игрока меняется активный пет.
---@class EventPartyMemberActivePetChangedParams
---@field playerId ObjectId идентификатор члена группы

---Событие присылается при изменение координат игрока, состоящего в группе с основным игроком.
---@class EventPartyMemberPositionUpdatedParams
---@field id ObjectId Id игрока

---Событие посылается каждый раз, когда персонаж становится/перестаёт быть пассажиром, к примеру, на двухместном маунте.
---@class EventPassangerStateChangedParams
---@field passangerState boolean является ли персонаж пассажиром, к примеру, на двухместном маунте.

---Событие посылается каждый раз, когда у какого-либо пета, находящегося в области видимости главного игрока, меняется имя или пол.
---@class EventPetInfoChangedParams
---@field id ObjectId id пета

---Событие присылается при клике игроком в интерактивный объект или мимо него в основном 3D-окне. Сообщение содержить информацию о текущей схеме управления, которая задается глобальными переменными: "use_move_by_click" и "simplified_move".
---@class EventPickObjectParams
---@field objectId ObjectId идентификатор объекта или nil, если кликнули мимо объекта
---@field simplified boolean схема управления: основная ("WSAD")/упрощенная ("simplified_move")
---@field moveByClick boolean в схеме управления включено движение по клику мыши
---@field primary boolean способ выбора объекта (основная/альтернативная кнопки мыши)
---@field dblClick boolean клик/двойной клик мыши
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)

---Событие, которое приходит после выполнения слеш-команды (в чате) /played. Возвращает время, проведённое в игре
---@class EventPlayedCommandResponseParams
---@field time table сколько времени игрок провёл в игре, поля таблицы:

---Событие присылается при изменении уровня астрального анлока игрока.
---@class EventPlayerAstralUnlockChangedParams
---@field playerId ObjectId идентификатор игрока

---Приходит, если изменился текущий рейтинг экипировки персонажа. Приходит только  для главного и инспектируемого игроков.
---@class EventPlayerGearScoreChangedParams
---@field playerId ObjectId идентификатор игрока

---Приходит, если изменилось состояние величия игрока.
---@class EventPlayerGreatChangedParams
---@field playerId ObjectId идентификатор игрока

---Событие присылается при изменении титула основного игрока или любого игрока, находящегося в области видимости.
---@class EventPlayerTitleChangedParams
---@field id ObjectId (not nil) -- идентификатор юнита

---Событие присылается при изменении списка доступных титулов персонажа, находящегося в области видимости.
---@class EventPlayerTitlesChangedParams
---@field id ObjectId (not nil) -- идентификатор персонажа

---Уведомление об изменении игрового окна. См. также:  common.GetPosConverterParams().
---@class EventPosConverterChangedParams

---Событие посылается при открытии/закрытии контейнера прокачанного оружия.
---@class EventPoweredlsweaponsChangedParams

---Событие возникающее при добавлении предмета в прокаченое оружие. В случаи неудачного добавление предмета в прокаченое оружие вместо данного события возникает  EVENT_EQUIP_FAILED.
---@class EventPoweredlsweaponsItemAddedParams
---@field itemId ObjectId идентификатор добавленного предмета
---@field slot integer номер слота

---Событие присылается при изменении бонусной стадии премиума.
---@class EventPremiumBonusStageChangedParams
---@field stage number бонусная стадия премиума

---Событие присылается при изменении состояния премиума premiumLib.GetInfo().
---@class EventPremiumChangedParams

---Событие присылается при изменении стадии премиума.
---@class EventPremiumStageChangedParams
---@field stage number стадия премиума

---Событие посылается при старте изменения фракции (прайденов).
---@class EventPridenFactionChoiceParams
---@field isLevelUp boolean спецфлаг для донатного левелапа прайдена после выбора фракции
---@field noDiscard boolean если true то запрещено отвергать выбор, интерфейс выбора не должен закрываться без принятия решения

---Появилось новое задание для процедурного данжа.
---@class EventProceduralDungeonGoalAddedParams
---@field goal ObjectId идентификатор задания

---Изменился счетчик в задании процедурного данжа.
---@class EventProceduralDungeonGoalCountChangedParams
---@field goal ObjectId идентификатор задания

---Изменился список заданий для игрока в процедурном данже.
---@class EventProceduralDungeonGoalsChangedParams

---Изменилось состояние задания процедурного данжа.
---@class EventProceduralDungeonGoalStateChangedParams
---@field goal ObjectId идентификатор задания

---Изменился список ключевых точек для игрока в процедурном данже.
---@class EventProceduralDungeonPointsChangedParams

---Появился новый сценарий для процедурного данжа.
---@class EventProceduralDungeonScenarioAddedParams
---@field id ObjectId идентификатор сценария

---Изменилось состояние сценария процедурного данжа.
---@class EventProceduralDungeonScenarioStateChangedParams
---@field id ObjectId идентификатор сценария

---Событие посылается, когда главный игрок может пользоваться новой профессией (в данный момент, это способность носить вещи определенного класса). На этапе загрузки персонажа событие не посылается.
---@class EventProficiencyAddedParams

---Событие посылается, когда главный игрок больше не может пользоваться профессией (в данный момент, это способность носить вещи определенного класса).
---@class EventProficiencyRemovedParams

---Событие посылается один раз в кадр, если произошло изменение проецированной 2D координаты (или других параметров) некоторых объектов из списка проецируемых объектов.
---@class EventProjectedObjectsChangedParams

---Событие присылается при изгнании из барьера урона (класс паладин, спелл "изгнать боль").
---@class EventPurgeBarrierDamageParams
---@field damage integer размер изгнанного из барьера урона

---Событие посылается при удалении задания сервером из журнала заданий (например, при отсутствии условий выполнения задания).
---@class EventQuestAbandonedParams
---@field name string название задания

---Событие посылается при невозможности взять квест.
---@class EventQuestAcceptErrorParams
---@field result number

---Событие посылается каждый раз, когда меняется книга заданий.
---@class EventQuestBookChangedParams

---Событие приходит при изменении лимитов журнала заданий: изменении максимально допустимого количества обычных и ежедневных заданий.
---@class EventQuestBookLimitsChangedParams

---Событие посылается каждый раз, когда игрок попытался сдать уже выполненное задание квестгиверу, и сервер подтвердил, что задание выполнено и сдано (принято ютом).
---@class EventQuestCompletedParams
---@field questId QuestId -- идентификатор задания

---Событие посылается каждый раз, когда игрок удаляет задание из журнала задний (отказывается от выполнения этого задания).
---@class EventQuestDiscardedParams
---@field name string название задания

---Событие посылается при провале квеста.
---@class EventQuestFailedParams
---@field questId QuestId -- идентификатор задания

---Событие посылается, когда с сервера приходит ответ на запрошенную игроком подсказку "какой следующий квест делать" (вызовом avatar.FindNextQuest( mode )).
---@class EventQuestFindNextResultParams
---@field questId QuestId или nil -- если в ответ на запрос сервер выдан квест-подсказка, то идентификатор выданного квеста; если подходящий квест не найден, то nil

---Событие посылается при отказе сервера принять задание из-за нехватки места в инвентаре.
---@class EventQuestFinishFailedNoSpaceParams
---@field questId QuestId идентификатор задания
---@field pocket integer|nil номер переполненного кармана, если переполнен карман

---Уведомление о появлении нового вопроса.
---@class EventQuestionAddedParams
---@field id ObjectId идентификатор появившегося вопроса

---Уведомление об удалении вопроса.
---@class EventQuestionRemovedParams
---@field id ObjectId идентификатор удалённого вопроса

---Уведомление о появлении новых результатов массового опроса.
---@class EventQuestionResultsChangedParams
---@field id ObjectId идентификатор опроса

---Оповещение о смене маркера у объекта-квестодателя. Объект может быть NPC или устройством.
---@class EventQuestMarkUpdatedParams
---@field objectId ObjectId идентификатор интерактивного объекта

---Событие посылается каждый раз, когда произошло изменение состояния одного из подзаданий квеста.
---@class EventQuestObjectiveUpdatedParams
---@field questId QuestId идентификатор ресурса квеста
---@field objectiveId ObjectId идентификатор счетчика квеста
---@field objectiveNumber integer (OBSOLETE) номер подзадания в списке objectives, возвращаемого функцией GetQuestProgress

---Событие посылается при окончании квеста, когда он становится готов к сдаче, или наоборот.
---@class EventQuestReadyToReturnChangedParams
---@field questId QuestId -- идентификатор задания

---Событие посылается каждый раз, когда игрок получил и принял задание.
---@class EventQuestReceivedParams
---@field questId QuestId --идентификатор задания

---Событие посылается каждый раз, когда произошло обновление наград за выполнение задания. Награды при этом могут не измениться.
---@class EventQuestRewardUpdatedParams
---@field questId QuestId --идентификатор задания

---Событие посылается, когда другой игрок хочет поделиться своим квестом с группой.
---@class EventQuestShareInvitationParams
---@field shareId ObjectId уникальный идентификатор предложения

---Событие посылается в результате предложения задания от другого игрока.
---@class EventQuestShareInvitationResultParams
---@field questName string название отменяемого задание
---@field sharerName string имя игрока, предлагавшего задание
---@field sharerId ObjectId Id игрока, предлагавшего задание
---@field result int результат

---Событие посылается в случае отмены предложения задания от другого игрока из-за таймаута.
---@class EventQuestShareInvitationTimeoutParams
---@field questName string название отменяемого задание
---@field sharerName string имя игрока, предлагавшего задание

---Событие посылается при отказе сервера начать задание из-за нехватки места в списке квестов (уже взято максимальное количество квестов).
---@class EventQuestStartFailedLogFullParams
---@field questId QuestId идентификатор задания

---Событие посылается при отказе сервера начать задание из-за нехватки места в инвентаре.
---@class EventQuestStartFailedNoSpaceParams
---@field questId QuestId идентификатор задания
---@field pocket integer|nil номер переполненного кармана, если переполнен карман

---Событие посылается если время квестового таймера истекло.
---@class EventQuestTimerFinishedParams
---@field questId QuestId -- идентификатор задания

---Событие посылается если был запущен квестовый таймер или изменилась его продолжительность.
---@class EventQuestTimerUpdatedParams
---@field questId QuestId -- идентификатор задания
---@field durationMs integer продолжительность таймера
---@field timeLeftMs integer оставшееся время таймера

---Событие посылается каждый раз, когда произошло изменение в списке целей задания.
---@class EventQuestUpdatedParams
---@field questId QuestId --идентификатор задания

---Присылается в случае неудачной попытки приглашения в рейд (игрок уже в рейде).
---@class EventRaidAlreadyInParams
---@field declinerName string имя приглашаемого игрока

---Событие на появление рейда. Присылается не только на действительное создание рейда, но и при вхождении игрока в состав уже существующего.
---@class EventRaidAppearedParams

---Присылается в случае невозможности вступить в рейд (после вызова raid.Accept()).
---@class EventRaidCantAcceptParams

---Присылается в случае невозможности попасть на локацию, так как игрок не вступил в рейд.
---@class EventRaidCantEnterMapParams
---@field mapName string|nil название локации, если возможно получить

---Событие на изменение состава рейда (включая создание и роспуск).
---@class EventRaidChangedParams

---Присылается в случае неудачной попытки приглашения в рейд.
---@class EventRaidDeclineParams
---@field declinerName string имя приглашаемого игрока

---Присылается в случае неудачной попытки приглашения в рейд (игрок занят).
---@class EventRaidDeclineBusyParams
---@field declinerName string имя приглашаемого игрока

---Уведомление о невозможности приглашения в рейд по причине игнора.
---@class EventRaidDeclineIgnoredParams
---@field declinerName string имя приглашаемого игрока

---Событие на исчезновение рейда. Присылается не только на роспуск рейда, но и при выходе игрока из состава существующего.
---@class EventRaidDisappearedParams

---Присылается при попытке войти в инст, когда в инст не пустят.
---@class EventRaidEnterVarsMapUnavaliableParams
---@field mapName string имя карты
---@field variables VariableId[] список боссов, из-за которых не пустят в инст

---Присылается при попытке войти в инст, когда прогресс инста не соответствует прогрессу сохранения.
---@class EventRaidEnterVarsMapWarningParams
---@field mapName string имя карты
---@field variables VariableId[] список боссов, из-за который происходит расхождение

---Присылается в случае невозможности выполнить указанную операцию с рейдом.
---@class EventRaidFailedParams
---@field sysReason string строковое описание причины

---Присылается в случае получения приглашения в рейд.
---@class EventRaidInviteParams
---@field inviterName string имя приглашающего игрока
---@field inviterShardName string имя шарда приглашающего игрока

---Присылается в случае исчезновения приглашения в рейд. Оно может истечь по времени, быть принято или отклонено.
---@class EventRaidInviteEndParams

---Присылается в случае изменения лидера рейда.
---@class EventRaidLeaderChangedParams

---Присылается в случае изменения помощника лидера рейда.
---@class EventRaidLeaderHelperChangedParams
---@field oldLeaderHelper UniqueId уникальный идентификатор аватара, который был помощником лидера рейда (или nil - если до этого не назначался)
---@field newLeaderHelper UniqueId уникальный идентификатор аватара, который стал помощником лидера рейда (или nil - если теперь помощника лидера рейда нет)

---Присылается в случае изменения ответственного за лут рейда.
---@class EventRaidLootMasterChangedParams
---@field oldLootMaster UniqueId уникальный идентификатор аватара, который был ответственным за лут рейда (или nil - если до этого не назначался)
---@field newLootMaster UniqueId уникальный идентификатор аватара, который стал ответственным за лут рейда (или nil - если теперь ответственного за лут рейда нет)

---Присылается в случае появления игрока в отряде.
---@class EventRaidMemberAddedParams
---@field name string имя игрока
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

---Присылается в случае изменения один или более параметров члена рейда
---@class EventRaidMemberChangedParams
---@field name string имя аватара, который изменился
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

---Событие присылается при изменение координат игрока, состоящего в отряде с основным игроком.
---@class EventRaidMemberPositionUpdatedParams
---@field id ObjectId Id игрока

---Присылается в случае удаления или ухода игрока из отряда.
---@class EventRaidMemberRemovedParams
---@field name string имя игрока
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

---Предложение о сохранении в этой карте. Присылается в случае захода в существующий рейдовый инстанс. Ответ: raid.MapSaveResponse( response ).
---@class EventRaidSaveMapQuestionParams
---@field timeoutMs integer таймаут на ответ в миллисекундах
---@field mapName string|nil название локации, если возможно получить

---Событие посылается каждый раз, когда у транспортного средства игрока до взрыва реактора осталось определённое время.
---@class EventReactorCountdownParams
---@field timeMs integer оставшееся время в миллисекундах

---Событие посылается каждый раз, когда у транспортного средства игрока отменено самоуничтожение реактора.
---@class EventReactorCountdownCancelledParams

---Событие посылается при завершении опроса о готовности группы или рейда.
---@class EventReadyCheckEndedParams

---Событие посылается каждый раз, когда меняется состояние готовности игрока в группе или рейде (для текущего активного опроса). На начало и окончание опроса приходят отдельные события, данное событие в этих случаях не приходит.
---@class EventReadyCheckInfoChangedParams

---Событие посылается при начале опроса о готовности группы или рейда.
---@class EventReadyCheckStartedParams
---@field initiatorId UniqueId уникальынй идентификатор игрока игрока, активировавшего опрос

---Событие присылается, если игрок готов к окончательному воскрешению из чистилища. Искра уже пришла к нему.
---@class EventReadyForFinallyRespawnParams

---Завершён reforge крафт вещи, можно запрашивать доступные варианты.
---@class EventReforgeResultParams

---Reforge-крафт вещи завершён неудачно, выбранный вариант итема НЕ получен.
---@class EventReforgeResultFailParams

---Завершён reforge крафт вещи, выбранный вариант итема получен.
---@class EventReforgeResultReadyParams
---@field itemId ObjectId идентификатор полученного итема

---Событие присылается при уменьшении барьера (класс паладин, спелл "уменьшить боль").
---@class EventReliefBarrierDamageParams
---@field damage integer кол-во урона, на которое был уменьшен барьер

---Событие о запросе на расшаривание умений для альта главного игрока.
---@class EventRemortAbilitySharingRequestParams

---В окне создания реморта, камера закончила движение после вызова  remortCreation.SetCameraPath(...).
---@class EventRemortCharacterSceneCameraReadyParams

---Пришел список ремортов для переключения главного игрока на один из них.
---@class EventRemortListGainedParams

---Пришел запрос на создание реморта. Необходимо показать диалог создания реморта.
---@class EventRemortShowCreationDialogParams

---Событие приходит при обновлении информации о вариациях персонажей.
---@class EventRemortVariationsInfoChangedParams

---В режиме создания реморта, камера может назумливаться на лицо персонажа. При изменении состояния назумленности или возможности назумливаться приходит это сообщение. См.  remortCreation.IsZoomEnabled(),  remortCreation.IsZoomOnFace(),  remortCreation.ToggleZoom().
---@class EventRemortZoomTriggerChangedParams

---Уведомление об удалении открытой репутации.
---@class EventReputationDisappearedParams
---@field factionId FactionId фракция

---Уведомление об изменении уровня репутации.
---@class EventReputationLevelChangedParams
---@field factionId FactionId фракция

---Уведомление об изменении значения репутации.
---@class EventReputationValueChangedParams
---@field factionId FactionId фракция
---@field delta integer числовое изменение репутации (может быть как положительным, так и отрицательным числом)

---Событие присылается при воскрешении главного игрока с кладбища. Воскрешение с кладбище происходит втоматически или вызовом искры.
---@class EventRespawnFromGraveyardParams

---Событие присылается при перемещении главного игрока на кладбище и начале ожидания возвращения своей искры. Возвращение на кладбище инициируется avatar.Respawn().
---@class EventRespawnStartedParams

---Этот запрос посылается, когда кто-то пытается оживить главного игрока, и игрок не успел ответить avatar.ResurrectReply( accept ).
---@class EventResurrectRejectedParams
---@field resurrecterName string имя юнита, пытавшегося оживить игрока.
---@field unitId ObjectId Id юнита, пытавшегося оживить игрока, если он есть в реплике.

---Этот запрос посылается, когда кто-то пытается оживить главного игрока. В ответ игрок должен ответить avatar.ResurrectReply( accept ). Если игрок не успеет, то прийдёт EVENT_RESURRECT_REJECTED.
---@class EventResurrectRequestedParams
---@field resurrecterName string имя юнита, пытающегося оживить игрока.
---@field unitId ObjectId Id юнита, пытающегося оживить игрока.
---@field timeOutMs integer сколько миллисекунд действует это приглашение

---Результат попытки пригласить игрока вернуться в игру. Содержит статус ENUM_CreateRevivalRollResultStatus.
---@class EventRevivalRollResultParams
---@field status String статус; строковая константа

---Обновился список игроков которым можно выслать предложение вернуться в игру.
---@class EventRevivalsChangedParams

---Уведомление о результате взаимодействия с руной.
---@class EventRuneOperationResultParams
---@field sysResult string код результата

---Событие посылается, если изменился список объектов насканеных навигатором корабля главного игрока.
---@class EventScannedHubObjectsChangedParams

---Событие посылается раз в секунду. Работает в MainMenu и Mission стейтах.
---@class EventSecondTimerParams
---@field timeMs integer сколько миллисекунд прошло после начала отсчета (1 января 1970 года)
---@field elapsedMs integer сколько миллисекунд прошло после последнего события EVENT_SECOND_TIMER

---Оповещение о раскрытии всех компонент тайны мира. Теперь главное задание тайны мира можно сдать.
---@class EventSecretClosedParams
---@field id ObjectId (not nil) -- идентификатор тайны мира

---Оповещение о завершении компоненты тайны мира. Сдан завершающий квест по этой компоненте.
---@class EventSecretComponentClosedParams
---@field id ObjectId (not nil) -- идентификатор тайны мира
---@field componentIndex integer индекс завершенной компоненты

---Оповещение о завершении тайны мира. Задание сдано, награда получена.
---@class EventSecretFinishedParams
---@field id ObjectId (not nil) -- идентификатор тайны мира

---Оповещение о изменении статуса тайны мира, которую может принять интерактивный объект. Происходит, если интерактивный объект есть в реплике и изменился статус (не сделан/сделана/сдана) какой-то тайны мира. В этом случае, например, можно поменять знак над головой этого объекта.
---@class EventSecretFinisherStatusChangedParams
---@field id ObjectId (not nil) -- идентификатор интерактивного объекта

---Оповещение об открытии новой тайны мира.
---@class EventSecretOpenedParams
---@field id ObjectId (not nil) -- идентификатор тайны мира

---Оповещение об изменении тайн мира. Например при изменении фракции.
---@class EventSecretsChangedParams

---Событие посылается каждый раз, когда у щита корабля меняется регенерирование.
---@class EventShieldRegenInProgressChangedParams
---@field id ObjectId Id устройства

---Событие посылается каждый раз, когда у щита корабля меняется сила (само значение или максимальная величина).
---@class EventShieldStrengthChangedParams
---@field id ObjectId Id устройства
---@field strengthDelta integer изменение силы

---Уведомление об изменении в процессе кастомизации корабля в ангаре главного игрока.
---@class EventShipCustomizingChangedParams

---Уведомление о получении конце кастомизации корабля в ангаре главного игрока.
---@class EventShipCustomizingFinishedParams

---Уведомление о получении начале кастомизации корабля в ангаре главного игрока. Начиная с этого момента можно заменять визуальные украшения корабля прямо на самом корабле.
---@class EventShipCustomizingStartedParams

---Событие посылается в момент нанесения урона кораблю. Поля attacker, defender, damageSource могут быть равны nil, если за время до получения события соответствующий корабль или астральный монстр успел исчезнуть (вышел за пределы видимости, разрушился). Кроме того attacker может быть равен nil, если стрелял не корабль и не астральный монстр. attacker и defender может быть как кораблем, так и астральным монстром. Сторона, по кторой попали, представлена в SHIP_SIDE_....
---@class EventShipDamageReceivedParams
---@field attacker ObjectId id корабля или астрального монстра, с которого стреляли.
---@field defender ObjectId id корабля или астрального монстра, в который попали.
---@field damageSource ObjectId id интерактивного объекта, который произвел выстрел (пушка).
---@field attackerPlayer ObjectId id игрока, который произвел выстрел.
---@field totalDamage number
---@field hullDamage number
---@field shieldDamage number
---@field deviceDamage number
---@field isCritical boolean true - нанесен критический урон
---@field isGlancing boolean true - нанесен уменьшенный урон
---@field isLethal boolean true - нанесен окончательный урон и объект погиб
---@field side number|nil сторона корабля, в которую попали
---@field angle number|nil угол обстрела по горизонтали, для вычисления повреждения щита
---@field cannonPenetration number|nil процент пробития щита снарядом
---@field spellId SpellId (ResourceId) / nil Id спелла, если били спеллом.
---@field abilityId AbilityId (ResourceId) / nil Id абилки, если били абилкой.
---@field buffId BuffId (ResourceId) / nil Id буффа, если били буффом.
---@field mapModifierId MapModifierId (ResourceId) / nil модификатор карты, если повреждения от модификатора карты

---Сообщение приходит, когда по каким-либо причинам необходимо показать информацию по определенным предметам. В сообщеннии приходит список ValuedObject-ов - объектов, в которых содержится информация о предметах. Эти объекты можно добавлять в какой либо ValuedText. Внимание! сообщение приходит только в UIState.
---@class EventShowItemsInfoParams
---@field items ValuedObject[] индексированный с 0 список объектов, содержащий информацию о предметах
---@field reason number причина, из-за которой необходимо показать информацию

---Настало время показать субтитры в катсцене.
---@class EventShowSubtitlesParams
---@field text string текст субтитры
---@field delayMs integer время демонстрации субтитры

---Главный игрок изучил скилл.
---@class EventSkillAddedParams
---@field skillId SkillId Id ресурса скилла

---Изменился опыт, накопленный на уровне скилла.
---@class EventSkillImprovementChangedParams
---@field skillId SkillId идентификатор ресурса скилла

---Главный игрок забыл скилл.
---@class EventSkillRemovedParams
---@field skillId SkillId Id ресурса скилла (можно получить avatar.GetSkillInfo( skillId ))

---Изменился список скиллов главного героя.
---@class EventSkillsChangedParams

---Изменился уровень скилла главного игрока.
---@class EventSkillScoreChangedParams
---@field skillId SkillId идентификатор ресурса скилла

---Событие, которое приходит при невозможности выполнить слеш-команду (в чате).
---@class EventSlashCommandFailedParams
---@field name string имя адресата
---@field sysReason sysString причина неудачной отправки сообщения:

---Уведомление посылается при любом изменении префикса слеш-команды, в т.ч. при установке пустого префикса после префикса "say" (команда по-умолчанию), хотя действия для последних двух случаев идентичны.
---@class EventSlashCommandPrefixChangedParams

---Событие присылается при исчезновении в зоне главного игрока объекта SOS, запущеного другим игроком той же фракции.
---@class EventSosFinishedParams
---@field id ObjectId идентификатор объекта SOS

---Событие присылается при появлении в зоне главного игрока объекта SOS, запущеного другим игроком той же фракции.
---@class EventSosStartedParams
---@field id ObjectId идентификатор объекта SOS

---Уведомление об изменении накопленного количества опыта души.
---@class EventSoulProgressExperienceChangedParams
---@field currentValue integer текущее значение опыта души
---@field deltaValue integer изменение значения опыта души
---@field currentLevel integer текущее значение уровня души
---@field deltaLevel integer изменение значения уровня души

---Уведомление о смене активных талантов души.
---@class EventSoulProgressTalentsChangedParams

---Событие посылается каждый раз, когда изменилось состояние панели действий (SpellBook).
---@class EventSpellbookChangedParams

---Событие посылается, когда в книге умений (SpellBook) появилось новое умение. На этапе загрузки персонажа событие не посылается.
---@class EventSpellbookElementAddedParams

---Событие посылается каждый раз, когда изменилось состояние элемента (умения или заклинания) в книге умений (SpellBook). К созданию/удалению элемента это не относится, при этом изменяется книга целиком.
---@class EventSpellbookElementChangedParams

---Оповещение о начале эффекта для элемента в книге умений. Типы эффектов: ''' EFFECT_TYPE_...'''. Для некоторых из них в сообщении передаются дополнительные поля. Событие ГКД:  EVENT_GLOBAL_COOLDOWN '''Внимание! Для событий COOLDOWN учитывается только КД самого спелла и КД группы спеллов (разные ранги, умения за слезы и тп). ГКД не учитывается! При начале и окончании ГКД данное событие не приходит'''
---@class EventSpellbookElementEffectParams
---@field effect number тип начавшегося эффекта
---@field id SpellId Id ресурса умения ( этот параметр НЕ УБИРАТЬ )
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах
---@field prepared boolean текущее значение флага prepared
---@field isActive boolean true, спелл стал активным
---@field objectId ObjectId|nil идентификатор предмета к которому привязан данный спелл

---Событие присылается, когда AOE спелл никого не задел
---@class EventSpellLandedNoTargetParams

---Событие присылается при изменение координат игрока, состоящего в браке с основным игроком.
---@class EventSpousePositionUpdatedParams
---@field id ObjectId Id игрока

---Событие посылается каждый раз, когда у главного игрока меняется количество еды для ездовых животных.
---@class EventStableFoodChangedParams

---Событие посылается каждый раз, когда у главного игрока появилось ездовое животное в конюшне.
---@class EventStableMountAddedParams
---@field id ObjectId идентификатор ездового животного

---Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялись характеристики (опыт, максимум здоровья, максимум времени насыщения и т.п.).
---@class EventStableMountChangedParams
---@field id ObjectId идентификатор ездового животного

---Событие посылается каждый раз, когда одно из ездовых животных главного игрока проголодалось.
---@class EventStableMountHungryParams
---@field id ObjectId идентификатор ездового животного

---Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялся уровень.
---@class EventStableMountLevelChangedParams
---@field id ObjectId идентификатор ездового животного
---@field level integer новый уровень

---Событие посылается каждый раз, когда у главного игрока исчезает ездовое животное из конюшни. Плучаемый идентификатор уже не валиден и по нему нельзя получить информацию об исчезнувшем животном.
---@class EventStableMountRemovedParams
---@field id ObjectId идентификатор ездового животного

---Событие посылается каждый раз, когда у главного игрока меняется список ездовых животных в конюшне.
---@class EventStableMountsChangedParams

---Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялись свойства скинов (доступность).
---@class EventStableMountSkinsChangedParams
---@field id ObjectId идентификатор ездового животного

---Событие посылается каждый раз, когда у одного из ездовых животных главного игрока меняются ативные(выбранные) таланты в результате вызова функции mount.SelectTalents( mountId, talents )
---@class EventStableMountTalentsChangedParams
---@field id ObjectId идентификатор ездового животного

---Событие посылается каждый раз, когда у главного игрока меняется количество слотов в конюшне.
---@class EventStableSlotsCountChangedParams

---Уведомление о неудачном взятии предмета в инвентори.
---@class EventTakeItemsFailedParams
---@field cause number код результата

---Событие присылается, когда изменились таланты.
---@class EventTalentsChangedParams

---Аватар начал разговор с NPC. Приходит после вызова  avatar.StartInteract().
---@class EventTalkStartedParams

---Аватар закончил разговор с NPC
---@class EventTalkStoppedParams

---Событие присылается при изменении координат цели главного игрока.
---@class EventTargetPosChangedParams
---@field unitId ObjectId Id юнита

---Появилось новое предложение в таргетных продажах.
---@class EventTargetSalesAddedParams
---@field id ObjectId идентификатор

---Произошли какие-то изменения в таргетных продажах.
---@class EventTargetSalesChangedParams

---Сообщение приходит, когда одногруппник собирается телепортироваться. Ответить нужно avatar.TeleportOfferReply( accept ). На ответ отводится определённое время.
---@class EventTeleportOfferRequestParams
---@field requesterId ObjectId идентификатор одногруппника, приславшего запрос
---@field timeoutMs integer врямя в миллисекундах, за которое надо дать ответ

---Событие посылается, если в зоне действия аватара появился отслеживаемый объект Track.
---@class EventTrackAddedParams
---@field id ObjectId идентификатор объекта

---Событие посылается, если отслеживаемый объект Track изменился(поле '''objectId''' в ответе функции  objects.GetTrackInfo( trackId )).
---@class EventTrackObjectChangedParams
---@field id ObjectId идентификатор трека

---Событие посылается, если отслеживаемый объект Track изменил позицию.
---@class EventTrackPosChangedParams
---@field id ObjectId идентификатор объекта

---Событие посылается, если в зоне действия аватара исчез отслеживаемый объект Track.
---@class EventTrackRemovedParams
---@field id ObjectId идентификатор объекта

---Событие приходит, если нельзя выучить заклинание или умения у тренера. Возвращаются коды всех найденных ошибок. См. LEARN_ERROR_.... Список ошибок может быть пуст, если произошла неизвестная системная ошибка.
---@class EventTrainerLearnErrorParams

---Изменился целевой сектор для астрального прыжка.
---@class EventTransportAccelerationTargetChangedParams
---@field id ObjectId Id транспорта

---Событие посылается каждый раз, когда у транспортного средства меняется скорость поворота.
---@class EventTransportAngularVelocityChangedParams
---@field id ObjectId Id транспортного средства

---Событие присылается, если на кораблечто-то сломалось. Получает его команда этого корабля и чужие навигаторы, следящие за этим кораблём. Содержит код поломки ENUM_CriticalMalfunctionType_CMT....
---@class EventTransportCriticalMalfunctionParams
---@field id ObjectId идентификатор корабля
---@field sysType string (enum ENUM_CriticalMalfunctionType_CMT...)- тип урона

---Событие посылается каждый раз, когда у транспортного средства меняется список устройств.
---@class EventTransportDevicesChangedParams
---@field id ObjectId Id транспортного средства

---Событие посылается каждый раз, когда у транспортного средства меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
---@class EventTransportDirectionChangedParams
---@field id ObjectId Id транспортного средства

---Событие посылается каждый раз, когда у транспортного средства меняется какая-либо состовляющая энергии.
---@class EventTransportEnergyChangedParams
---@field id ObjectId Id транспортного средства

---Событие посылается каждый раз, когда у транспортного средства меняется скорость движения по горизонтали (вперёд).
---@class EventTransportHorizontalVelocityChangedParams
---@field id ObjectId Id транспортного средства

---Событие посылается каждый раз, когда у транспортного средства меняется "Инсайт".
---@class EventTransportInsightChangedParams
---@field id ObjectId Id транспортного средства
---@field delta integer на сколько изменился

---Событие присылается при окончании просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор отзумился от чужого корабля). Теперь у ранее просматриваемого транспорта недоступна информация по устройствам. Также см.  EVENT_TRANSPORT_OBSERVING_STARTED.
---@class EventTransportObservingFinishedParams

---Событие присылается при началe просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор назумился на другой корабль). Теперь у просматриваемого транспорт доступна информация по устройствам. Также см. avatar.GetObservedTransport(), avatar.GetObservedAstralUnit(),  EVENT_TRANSPORT_OBSERVING_FINISHED
---@class EventTransportObservingStartedParams

---Событие присылается при изменении координат транспорта.
---@class EventTransportPosChangedParams
---@field id ObjectId Id транспорта

---Событие посылается в случае, если транспорт необходимо переименовать
---@class EventTransportRenameReplyParams
---@field hasName boolean true - у корабля уже есть имя. Идёт запрос на переименование. Иначе требуется задать самое первое имя корабля.
---@field oldName string старое имя корабля

---Событие посылается в случае, если была попытка переименования транспорта  hangar.Rename( name ).
---@class EventTransportRenameReplyResultParams
---@field success boolean true, если переименовывание прошло успешно. false, если имя невалидно, нужно попробовать другое имя.
---@field sysNameErrorKind string причина, по которой имя недопустимо
---@field name string имя корабля, в случае ошибки то, на которое пытались сменить

---Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает корабль.
---@class EventTransportsChangedParams
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся кораблей
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших кораблей

---Событие посылается каждый раз, когда у транспортного средства меняется сила щита с определенной стороны. Сторона представлена SHIP_SIDE_XXX.
---@class EventTransportShieldChangedParams
---@field id ObjectId Id транспортного средства
---@field side number сторона.
---@field strengthDelta integer на сколько изменилась суммарная сила щитов по представленной стороне. Величина отрицательна, если по щитам был нанесён урон, и положительная, если сила щитов восстановилась.

---Событие посылается каждый раз, когда изменилась базовая информация по какому-то кораблю. См.  transport.GetShipInfo( id ).
---@class EventTransportShipInfoChangedParams
---@field objectId ObjectId Id транспортного средства

---Событие посылается каждый раз, когда у транспортного средства меняется скорость движения по вертикали.
---@class EventTransportVerticalVelocityChangedParams
---@field id ObjectId Id транспортного средства

---Событие посылается каждый раз, когда игрок пытается вернуть сундук в полную сокровищницу.
---@class EventTreasuryFullParams

---Уведомление об инициировании показа обучения.
---@class EventTutorialRequestParams
---@field id TutorialId идентификатор обучения

---Срабатывает при выдаче результатов поиска обучения. Результат вызова tutorialLib.SearchTutorial( request ).
---@class EventTutorialSearchResultParams
---@field id TutorialId идентификатор обучения
---@field request string исходный запрос
---@field tutorials TutorialId[] список идентификаторов обучения удовлетворяющих запросу
---@field categories TutorialCategoryId[] список идентификаторов категорий обучения удовлетворяющих запросу

---Событие приходит после перезагрузки аддонов с помощью команды reload_addons.
---@class EventUiReloaded:Params

---Событие о провале попытки снять предмет.
---@class EventUnequipFailedParams
---@field slot integer индекс слота в инвентаре [0..]
---@field sysCode string код ошибки

---Сообщение об изменении информации о классе юнита.
---@class EventUnitClassChangedParams
---@field unitId ObjectId идентификатор юнита

---Событие присылается при нанесение повреждения юниту. Тип повреждения -  "ENUM_SubElement_...". Для срабатывания данного события требуется указание идентификатора объекта ObjectId(number) в качестве параметра функции  common.RegisterEventHandler( eventFunction, sysEventName, params, requireMainThread ). Замечание. Если повреждений нет, то может быть несколько факторов, повлиявших на это (вовсе не обязательно, что такой фактор только один). Замечание. Если повреждений нет и не один из факторов не сработал, то можно считать, что урон был полностью поглощен (full absorb).
---@class EventUnitDamageReceivedParams
---@field source ObjectId идентификатор того, кто наносит повреждения
---@field sourceName string имя того, кто наносит повреждения
---@field target ObjectId идентификатор того, кто получает повреждения. Этот объект может уже исчезнуть и надо проверять его на существование (см. object.IsExist())
---@field amount number количество нанесенных повреждений
---@field ability string имя спелла или умения
---@field sysSubElement string тип повреждения
---@field lethal boolean / nil этот удар был финальным. Юнит умер.
---@field spellId SpellId (ResourceId) / nil Id спелла, если били спеллом.
---@field abilityId AbilityId (ResourceId) / nil Id абилки, если били абилкой.
---@field buffId BuffId (ResourceId) / nil Id буффа, если били буффом.
---@field mapModifierId MapModifierId (ResourceId) / nil модификатор карты, если повреждения от модификатора карты
---@field isFall boolean повреждение от падения
---@field isExploit boolean повреждения от эксплойта
---@field isDodge boolean / nil увернулась ли цель от удара
---@field isMiss boolean / nil был ли промах
---@field isCritical boolean / nil был ли нанесён Critical Damage (увеличенное повреждение)
---@field isGlancing boolean / nil был ли нанесён glancing damage (уменьшенное повреждение)
---@field shieldBlock integer величина заблокированного урона, если был Shield Block, иначе 0
---@field parry integer величина парированного урона, если был Parry, иначе 0
---@field resist integer величина зарезистенного урона, если был резист, иначе 0
---@field barrier integer величина урона, поглощеного барьером, если последний сработал, иначе 0
---@field absorb integer неотрицательная величина урона, поглощённого бафами
---@field toMount integer неотрицательная величина урона, поглощённого маунтом
---@field multipliersAbsorb integer величина, на которую уменьшился урон из-за множителей урона на цели (может быть отрицательной если урон увеличился)
---@field runesAbsorb integer неотрицательная величина урона, отражённого защитными рунами
---@field damageSource string типа источника дамага, возможные значения:
---@field overallAbsorbedDamage integer величина всего поглощенного урона (урон ушёл в какую-то сущность)
---@field overallPreventedDamage integer величина всего предотвращённого урона (урон вообще не попал в игрока)
---@field sourceTags CombatTagId|nil[] список усиливающих и ослабляющих эффектов на том, кто наносит повреждения
---@field targetTags CombatTagId|nil[] список усиливающих и ослабляющих эффектов на том, кто получает повреждения

---Событие присылается при изменение статуса смерти юнита (юнит умер или ожил).
---@class EventUnitDeadChangedParams
---@field unitId ObjectId идентификатор юнита

---Событие об изменении экипировки юнита (главный игрок или игрок, инспектируемый главным).
---@class EventUnitEquipmentChangedParams
---@field unitId ObjectId идентификатор юнита
---@field slotType number тип контейнера

---Событие присылается при изменинии фракции юнита.
---@class EventUnitFactionChangedParams

---Событие присылается при изменении покровителя.
---@class EventUnitFairyChangedParams
---@field unitId ObjectId идентификатор объекта

---Событие присылается при изменении ранга покровителя - номера или статуса временный/постоянный.
---@class EventUnitFairyRankChangedParams
---@field unitId ObjectId идентификатор объекта, чей покровитель поменял ранг

---Приходит, если изменилось состояние проигрывания фаталити на каком-то юните.
---@class EventUnitFatalityChangedParams
---@field id ObjectId идентификатор юнита

---Событие посылается каждый раз, когда у какого-либо игрока меняется список подчинённых юнитов (петы, ассистенты, турели и т.п.).
---@class EventUnitFollowersListChangedParams
---@field id ObjectId идентификатор игрока, у которого изменился список подчинённых юнитов

---Присылается в случае изменения гильдии какого-либо игрока.
---@class EventUnitGuildChangedParams
---@field unitId ObjectId идентификатор игрока

---Событие посылается каждый раз, когда у игрока меняется слава.
---@class EventUnitHonorValueChangedParams
---@field unitId ObjectId идентификатор игрока

---Событие присылается при изменении уровня.
---@class EventUnitLevelChangedParams
---@field unitId ObjectId
---@field amount integer

---Событие присылается при изменении процентного значения маны юнита и числового значение для аватара. Важно! События приходит только если аватар в группе или рейде с ГГ.
---@class EventUnitManaChangedParams
---@field unitId ObjectId

---Событие присылается при измениние маны юнита. Для срабатывания данного события требуется указание идентификатора объекта ObjectId(number) в качестве параметра функции  common.RegisterEventHandler( eventFunction, sysEventName, params, requireMainThread ).
---@class EventUnitManaPercentageChangedParams

---Событие присылается, если NPC или моб прислал текстовое сообщение.
---@class EventUnitMessageParams
---@field id ObjectId|nil id юнита если есть, иначе nil
---@field name string имя юнита
---@field message string текстовое сообщение от NPC
---@field isWhisper boolean является ли сообщение личным

---Приходит, если у какого-либо игрока изменилось настроение.
---@class EventUnitMoodChangedParams
---@field unitId ObjectId идентификатор игрока

---Событие посылается каждый раз, когда у игрока меняется текущее здоровье ездового животного.
---@class EventUnitMountHealthChangedParams
---@field unitId ObjectId идентификатор игрока
---@field health integer точная величина здоровья маунта, если такая информация доступна (иначе - 0)

---Событие присылается при изменении координат юнита. В данный момент такое событие приходит только для юнитов, задетекченных специальным умением главного игрока.
---@class EventUnitPosChangedParams
---@field unitId ObjectId Id юнита

---Событие посылается при изменении PvP флага какого-либо юнита (игрока или моба). У моба может поменяться только unit.GetPvPFlagInfo(id).isOn.
---@class EventUnitPvpFlagChangedParams
---@field unitId ObjectId Id юнита

---Приходит, если изменилось количество Гнева у юнита.
---@class EventUnitRageChangedParams
---@field unitId ObjectId идентификатор юнита

---Событие присылается при возможном изменение состояния юнита (враждебное/дружественное/нейтральное). Присылается одновременно с событиями  EVENT_UNIT_FACTION_CHANGED (при смене фракции юнита),  EVENT_UNIT_PVP_FLAG_CHANGED (при смене пвп флага) и  EVENT_GROUP_CHANGED (при изменении состава группы).
---@class EventUnitRelationChangedParams
---@field unitId ObjectId Id юнита

---Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает юнит.
---@class EventUnitsChangedParams
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся юнитов
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших юнитов

---Событие присылается при изменении потэганности моба. Моб становится потэганным, когда какой-нибудь игрок вступает с ним в бой. После этого, в случае скоропостижной смерти моба, весь лут достаётся этому игроку вне зависимости от того, кто ещё участвовал в жестоком убийстве. См. unit.IsTagged( unitId ), unit.IsTaggedByMainPlayer( unitId ).
---@class EventUnitTagChangedParams
---@field unitId ObjectId (not nil) -- идентификатор моба

---Событие присылается, если игрок в группе (или аватар) взял лут (деньги).
---@class EventUnitTookMoneyParams
---@field ownerId ObjectId идентификатор игрока, взявшего предмет
---@field mobId ObjectId / nil идентификатор моба, с которого были взяты деньги (nil, если моб далеко)
---@field money integer количество взятых денег

---Приходит, если изменился ветеранский ранг игрока.
---@class EventUnitVeteranRankChangedParams
---@field unitId ObjectId идентификатор игрока

---Приходит, если изменилось количество Воли у юнита.
---@class EventUnitWillChangedParams
---@field unitId ObjectId идентификатор юнита

---Событие посылается при изменении PvP-типа зоны для игрока.
---@class EventUnitZonePvpTypeChangedParams
---@field unitId ObjectId Id игрока

---Событие, которое приходит при невозможности распознать слеш-команду (в чате).
---@class EventUnknownSlashCommandParams
---@field text string строка, которую не удалось разобрать как слеш-команду

---Уведомление об изменении спелла вытаскивания игрока, если он застрял.
---@class EventUnstuckSpellEffectParams
---@field id SpellId Id ресурса спелла

---Оповещение о начале эффекта для спелла вытаскивания игрока, если он застрял. Параметры как в  EVENT_SPELLBOOK_ELEMENT_EFFECT.
---@class EventUnstuckSpellChangedParams

---Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает корабельное устройство.
---@class EventUsableDevicesChangedParams
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся устройств
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших устройств

---Уведомление о сделанном снимке экрана, удачном или неудачном.
---@class EventUserScreenshotParams
---@field success boolean успешно или нет сделан снимок экрана
---@field filePath string полный путь до файла со снимком экрана
---@field fileName string (краткое) имя файла со снимком экрана
---@field isPostpone boolean было ли снятие скриншота отложено на несколько кадров

---Уведомление, что был кликнут ValuedObject - объект представляющий игровой объект в UI тексте.
---@class EventValuedObjectClickedParams
---@field object ValuedObject кликнутый объект в тексте
---@field cursorPosX integer X позиция курсора, в которой произошёл клик
---@field cursorPosY integer Y позиция курсора, в которой произошёл клик
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)
---@field mouseButton number какая кнопка мыши была нажата
---@field widget WidgetSafe виджет в котором находится ValuedObject

---Уведомление, что ValuedObject - объект представляющий игровой объект в UI тексте, был дважды кликнут (даблклик).
---@class EventValuedObjectDoubleClickedParams
---@field object ValuedObject кликнутый объект в тексте
---@field cursorPosX integer X позиция курсора, в которой произошёл клик
---@field cursorPosY integer Y позиция курсора, в которой произошёл клик
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)
---@field mouseButton number какая кнопка мыши была нажата
---@field widget WidgetSafe виджет в котором находится ValuedObject

---Уведомление, что был на ValuedObject (объект представляющий игровой объект в UI тексте) был наведён или был убран с него курсор мыши.
---@class EventValuedObjectMouseoverParams
---@field object ValuedObject кликнутый объект в тексте
---@field cursorPosX integer X позиция курсора, в которой произошёл клик
---@field cursorPosY integer Y позиция курсора, в которой произошёл клик
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)
---@field mouseButton number какая кнопка мыши была нажата
---@field widget WidgetSafe виджет в котором находится ValuedObject
---@field isActive boolean true, если курсор мыши был наведён на объект. Если курсор был убран с объекта, то false

---Событие присылается при появлении у гдавного игрока значения геймдизайнерской переменной.
---@class EventVariableAddedParams
---@field id VariableId идентификатор переменной
---@field sysName string псевдоним переменной

---Событие присылается при исчезновении у главного игрока значения геймдизайнерской переменной.
---@class EventVariableRemovedParams
---@field id VariableId идентификатор переменной

---Событие присылается при изменении значения геймдизайнерской переменной главного игрока.
---@class EventVariableValueChangedParams
---@field id VariableId идентификатор переменной
---@field sysName string псевдоним переменной
---@field delta number число на которое изменилось значение переменной (может быть как положительным, так и отрицительным)

---Событие посылается, если не хватает места для покупки. Если была попытка покупки в определенный слот, то проверяется не пуст ли он, и, если не пустой, то можно ли увеличить количество товара в нём на заданную величину. Если слот не был задан, то значит подходящего слота вообще нет.
---@class EventVendorBuyNotEnoughPlaceParams

---Событие посылается, если не хватает репутации для покупки.
---@class EventVendorBuyReputationIsTooSmallParams

---Событие посылается, если для покупки не хватает очков заработанных за участие в событии.
---@class EventVendorBuyRequiredAchievementParams

---Событие посылается, если во время покупки предмета он уже был продан кому-то другому.
---@class EventVendorItemAlreadySoldParams

---Уведомление о невозможности продать предмет (предмет не продается). Замечание. Попытка продажи такого предмета, вообще говоря, ошибочна.
---@class EventVendorItemNotForSaleParams
---@field itemId ObjectId идентификатор предмета, который не удалось продать

---Событие посылается в ответ на запрос наличия доступных вещей на продажу у NPC-торговца avatar.RequestVendor(). Также приходит при изменении ассортимента NPC-торговца.
---@class EventVendorListUpdatedParams

---Событие, которое приходит после выполнения слеш-команды (в чате) /veteran. Возвращает прогресс ветеранского ранга и табличку всех рангов.
---@class EventVeteranranksCommandResponseParams
---@field value integer текущий прогресс
---@field rewards table таблица рангов, индексация [0..]
---@field value integer значение прогресса, для достижения ранга
---@field name string название ранга

---Событие посылается при изменении счётчика убитых противников в PvP.
---@class EventVictimTrackerChangedParams

---Добавилось новое колесо лута
---@class EventWheeloflootAddedParams
---@field wheelId number идентификатор колеса лута

---Изменилось колесо лута
---@class EventWheeloflootChangedParams
---@field wheelId number идентификатор колеса лута

---Пришёл ответ на запрос предметов колеса лута.
---@class EventWheeloflootItemsParams
---@field wheelId number идентификатор колеса лута
---@field slots number[] предметы в слотах разрола
---@field prizes number[] предметы призов

---Удалилось колесо лута
---@class EventWheeloflootRemovedParams
---@field wheelId number идентификатор колеса лута

---Событие, которое приходит при невозможности доставить сообщение целевому игроку. См.  "ENUM_EnumRequestAddressByNameFailCause_..."
---@class EventWhisperFailedParams
---@field name string имя адресата
---@field sysReason string причина неудачной отправки сообщения

---Событие приходит при отмене системой drag&drop. Скрипт должен выполнить все необходимые логические и визуальные операции, отменяющие перетаскивание.
---@class EventDndDragCancelledParams

---Событие приходит во время drag&drop при изменении виджета под курсором (выборка ведется по стандартному алгоритму PICK, то есть среди доступных для кликов). Скрипт должен выполнить все необходимые визуальные операции, показывающие и перемещающие курсор, а также объекты под ним. Событие приходит как вход в контрол, так и на выход из него.
---@class EventDndDragOverParams
---@field srcWidget WidgetSafe перетаскиваемый виджет
---@field srcId integer идентификатор DNDId перетаскиваемого виджета
---@field targetWidget WidgetSafe|nil виджет под курсором, nil если такового нет (считаются только доступные для кликов виджеты, MainScreenControl3D игнорируется)
---@field targetId integer идентификатор DNDId связанный с виджетом под курсором. Если виджета под курсором нет или он не зарегистрирован в drag&drop, то DND_INVALID_ID
---@field enter boolean вошли или вышли из объекта под курсором

---Событие приходит при перемещении курсора во время drag&drop. Замечание. Событие может прийти после окончания drag&drop, если оно было отправлено в очередь до уведомления системы об окончании перетаскивания. Эту ситуацию надо проверять дополнительно.
---@class EventDndDragToParams
---@field srcWidget WidgetSafe перетаскиваемый виджет
---@field srcId integer идентификатор DNDId перетаскиваемого виджета
---@field posX integer координата курсора по X (реальная)
---@field posY integer координата курсора по Y (реальная)
---@field outside boolean находится ли курсор за пределами окна приложения
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)

---Событие приходит при попытке системы завершить drag&drop. Для подтверждения окончания перетаскивания скрипт должен вызвать функцию DNDConfirmDropAttempt. При завершении drag&drop скрипт должен в этом же обработчике события выполнить и все необходимые логические и визуальные операции, заканчивающие перетаскивание.
---@class EventDndDropAttemptParams
---@field srcWidget WidgetSafe перетаскиваемый виджет
---@field srcId integer идентификатор DNDId перетаскиваемого виджета
---@field targetWidget WidgetSafe|nil виджет под курсором, nil если такового нет (считаются только доступные для кликов виджеты, MainScreenControl3D игнорируется)
---@field targetId integer идентификатор DNDId связанный с виджетом под курсором. Если виджета под курсором нет или он не зарегистрирован в drag&drop, то DND_INVALID_ID
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)

---Событие приходит при попытке системы начать drag&drop. Для подтверждения начала перетаскивания скрипт должен вызвать функцию DNDConfirmPickAttempt.
---@class EventDndPickAttemptParams
---@field srcWidget WidgetSafe окно, которое пытаются начать перетаскивать
---@field srcId integer идентификатор, зарегистрированный для окна, которое пытаются начать перетаскивать
---@field posX integer координата курсора по X (реальная)
---@field posY integer координата курсора по Y (реальная)
---@field kbFlags number состояние модификаторов клавиатуры (ссылка ниже)

---Присылается при изменении видимости контрола (с учётом видимости всех его родителей), только для тех виджетов, которым такое поведение было установлено с помощью функции  SetOnShowNotification( self, notify ).
---@class EventWidgetShowChangedParams
---@field widget Widget виджет, чья видимость изменилась
---@field addonName string имя аддона, которому принадлежит виджет

---Уведомление об изменении информации о Волшебной лампе.
---@class EventWishmasterChangedParams

---Уведомление о результатах и возможностях улучшения Волшебной лампы.
---@class EventWishmasterMultiplyingParams
---@field resourceId WishmasterResourceId идентификатор Волшебной лампы

---@alias EventName
---| "EVENT_ABILITIES_ELEMENT_ADDED"
---| "EVENT_ACCOUNT_HAS_DESTROYED"
---| "EVENT_ACTION_FAILED_EXPLOIT"
---| "EVENT_ACTION_FAILED_OTHER"
---| "EVENT_ACTION_FAILED_SPELL"
---| "EVENT_ACTION_PANEL_CHANGED"
---| "EVENT_ACTION_PANEL_ELEMENT_CHANGED"
---| "EVENT_ACTION_PANEL_ELEMENT_EFFECT"
---| "EVENT_PROCESS_TERMINATED"
---| "EVENT_ACTION_PROGRESS_FINISH"
---| "EVENT_ACTION_PROGRESS_FREEZE"
---| "EVENT_ACTION_PROGRESS_START"
---| "EVENT_ACTION_PROGRESS_UPDATE"
---| "EVENT_ACTION_RESULT_SPECIAL_SPELL"
---| "EVENT_ACTIVE_MOUNT_CHANGED"
---| "EVENT_ACTIVE_MOUNT_SKIN_CHANGED"
---| "EVENT_ACTIVE_MOUNT_TIME_LEFT_CHANGED"
---| "EVENT_ACTIVE_PET_CHANGED"
---| "EVENT_ACTIVE_PET_EXIST_CHANGED"
---| "EVENT_ACTIVE_PET_SPELLS_CHANGED"
---| "EVENT_ACTIVE_PET_STATE_CHANGED"
---| "EVENT_ADDON_HEALTH_CHANGED"
---| "EVENT_ADDON_LOAD_STATE_CHANGED"
---| "EVENT_ADDON_REDUCE_PERFOMANCE"
---| "EVENT_ADDRESSEE_NOT_FOUND"
---| "EVENT_AEMARK_POINT_CLICKED"
---| "EVENT_AFK_STATE_CHANGED"
---| "EVENT_ALCHEMY_CANCELED"
---| "EVENT_ALCHEMY_ITEM_PLACED"
---| "EVENT_ALCHEMY_NOT_ALCHEMY_ITEM"
---| "EVENT_ALCHEMY_NOT_AVAILABLE_RESOURCES"
---| "EVENT_ALCHEMY_NOT_ENOUGH_COMPONENTS"
---| "EVENT_ALCHEMY_REACTION_FINISHED"
---| "EVENT_ALCHEMY_RECIPES_CHANGED"
---| "EVENT_ALCHEMY_SCORE_CHANGED"
---| "EVENT_ALCHEMY_STARTED"
---| "EVENT_ALLODS_GOAL_ADDED"
---| "EVENT_ALLODS_GOAL_CHANGED"
---| "EVENT_ALLODS_GOAL_COMPLETED"
---| "EVENT_APPRENTICE_MENTOR_CHANGED"
---| "EVENT_ASTRAL_HUB_CHANGED"
---| "EVENT_ASTRAL_ISLAND_CHANGED"
---| "EVENT_ASTRAL_ISLAND_TIME_CHANGED"
---| "EVENT_ASTRAL_OBJECT_ENABLED_CHANGED"
---| "EVENT_ASTRAL_OBJECTS_CHANGED"
---| "EVENT_ASTRAL_POIS_CHANGED"
---| "EVENT_ASTRAL_SECTOR_CHANGED"
---| "EVENT_ASTRAL_SECTOR_CHECK_JUMP_RESULT"
---| "EVENT_ASTRAL_UNIT_AGGRO_CHANGED"
---| "EVENT_ASTRAL_UNIT_POS_CHANGED"
---| "EVENT_ASTRAL_UNITS_CHANGED"
---| "EVENT_ASTRAL_WRECK_LOOT_TAKEN"
---| "EVENT_ASTROLABE_INFO_CHANGED"
---| "EVENT_ASTROLABE_SPELL_CHANGED"
---| "EVENT_ASTROLABE_SPELL_EFFECT"
---| "EVENT_ATTACK_RESULT"
---| "EVENT_AUCTION_BID_RESULT"
---| "EVENT_AUCTION_CREATION_RESULT"
---| "EVENT_AUCTION_DISCARD_RESULT"
---| "EVENT_AUCTION_PROPERTIES"
---| "EVENT_AUCTION_SEARCH_RESULT"
---| "EVENT_AUCTION_UPDATE_RESULT"
---| "EVENT_AVAILABLE_ORDERS_CHANGED"
---| "EVENT_AVATAR_ADDED_TO_FRIEND_LIST"
---| "EVENT_AVATAR_ALIVE_CHANGED"
---| "EVENT_AVATAR_BARRIERS_CHANGED"
---| "EVENT_AVATAR_BINDED_TRANSPORT_CHANGED"
---| "EVENT_AVATAR_BUFF_REMOVING_FAILED"
---| "EVENT_AVATAR_CLASS_FORM_CHANGED"
---| "EVENT_AVATAR_CLIENT_ZONE_CHANGED"
---| "EVENT_AVATAR_CREATED"
---| "EVENT_AVATAR_DESTINY_POINTS_CHANGED"
---| "EVENT_AVATAR_DIR_CHANGED"
---| "EVENT_AVATAR_ENTER_PROCEDURAL_DUNGEON"
---| "EVENT_AVATAR_EXPERIENCE_CHANGED"
---| "EVENT_AVATAR_FRIEND_ADDED"
---| "EVENT_AVATAR_FRIEND_ALT_NAME_CHANGED"
---| "EVENT_AVATAR_FRIEND_DESCRIPTION_CHANGED"
---| "EVENT_AVATAR_FRIEND_IGNORE_LISTS_ERROR"
---| "EVENT_AVATAR_FRIEND_INFO_CHANGED"
---| "EVENT_AVATAR_FRIEND_LEVEL_CHANGED"
---| "EVENT_AVATAR_FRIEND_LIST_CHANGED"
---| "EVENT_AVATAR_FRIEND_LIST_LOADED"
---| "EVENT_AVATAR_FRIEND_MOOD_CHANGED"
---| "EVENT_AVATAR_FRIEND_MUTUAL_CHANGED"
---| "EVENT_AVATAR_FRIEND_ONLINE_CHANGED"
---| "EVENT_AVATAR_FRIEND_REMOVED"
---| "EVENT_AVATAR_FRIEND_SEX_CHANGED"
---| "EVENT_AVATAR_FRIEND_ZONE_CHANGED"
---| "EVENT_AVATAR_IGNORE_ADDED"
---| "EVENT_AVATAR_IGNORE_DESCRIPTION_CHANGED"
---| "EVENT_AVATAR_IGNORE_LIST_CHANGED"
---| "EVENT_AVATAR_IGNORE_LIST_LOADED"
---| "EVENT_AVATAR_IGNORE_REMOVED"
---| "EVENT_AVATAR_ITEM_DROPPED"
---| "EVENT_AVATAR_ITEM_TAKEN"
---| "EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE"
---| "EVENT_AVATAR_LEAVE_PROCEDURAL_DUNGEON"
---| "EVENT_AVATAR_LOGOUT_CANCELLED"
---| "EVENT_AVATAR_MAP_CHANGED"
---| "EVENT_AVATAR_MAP_INFO_AVAILABLE"
---| "EVENT_AVATAR_MAP_MODIFIERS_CHANGED"
---| "EVENT_AVATAR_MEDAL_FINISHED"
---| "EVENT_AVATAR_MONEY_CHANGED"
---| "EVENT_AVATAR_MONEY_DROPPED"
---| "EVENT_AVATAR_MONEY_TAKEN"
---| "EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE"
---| "EVENT_AVATAR_POS_CHANGED"
---| "EVENT_AVATAR_PROGRESS_GAINED"
---| "EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED"
---| "EVENT_AVATAR_PSIONIC_CONTACT_ADDED"
---| "EVENT_AVATAR_PSIONIC_CONTACT_CHANGED"
---| "EVENT_AVATAR_PSIONIC_CONTACT_REMOVED"
---| "EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED"
---| "EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET"
---| "EVENT_AVATAR_PSIONIC_READ_THOUGHT"
---| "EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT"
---| "EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED"
---| "EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED"
---| "EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED"
---| "EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED"
---| "EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED"
---| "EVENT_AVATAR_STATS_CHANGED"
---| "EVENT_AVATAR_TARGET_CHANGED"
---| "EVENT_AVATAR_TARGET_RECOMMENDED"
---| "EVENT_AVATAR_TARGET_TARGET_CHANGED"
---| "EVENT_AVATAR_TRANSPORT_CHANGED"
---| "EVENT_AVATAR_UNLOCK_ADDED"
---| "EVENT_AVATAR_UNLOCK_CHANGED"
---| "EVENT_AVATAR_UNLOCK_REMOVED"
---| "EVENT_AVATAR_UNLOCKS_CHANGED"
---| "EVENT_AVATAR_USED_OBJECT_CHANGED"
---| "EVENT_AVATAR_WALK_MODE_CHANGED"
---| "EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED"
---| "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED"
---| "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED"
---| "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED"
---| "EVENT_AVATAR_WILL_BE_REMOVED"
---| "EVENT_AVATAR_ZONE_CHANGED"
---| "EVENT_BATTLEGROUND_CHECKPOINT_ADDED"
---| "EVENT_BATTLEGROUND_CHECKPOINT_REMOVED"
---| "EVENT_BATTLEGROUND_CHECKPOINTS_CHANGED"
---| "EVENT_BATTLEGROUND_CHECKPOINT_STATE_CHANGED"
---| "EVENT_BEAM_CANNON_SHOT_STARTED"
---| "EVENT_BEST_FRIEND_RETURN_STATE_CHANGED"
---| "EVENT_BEST_FRIEND_TELEPORT_SPELL_CHANGED"
---| "EVENT_BEST_FRIEND_TELEPORT_SPELL_EFFECT"
---| "EVENT_BEST_FRIEND_TELEPORT_STATE_CHANGED"
---| "EVENT_BILLINGINFO_BONUS_CHANGED"
---| "EVENT_BILLINGINFO_BONUS_STATUS_CHANGED"
---| "EVENT_BINDING_CHANGED"
---| "EVENT_BONUS_POOL_CHANGED"
---| "EVENT_BONUS_POOLS_CHANGED"
---| "EVENT_BOX_OPERATION_RESULT"
---| "EVENT_BROWSER_DOWNLOAD_LINK"
---| "EVENT_BROWSER_EXTERNAL_LINK"
---| "EVENT_BULLETIN_BOARD_CHANGED"
---| "EVENT_BULLETIN_BOARD_OPERATION_IN_PROGRESS_CHANGED"
---| "EVENT_BULLETIN_BOARD_POST_ADDED"
---| "EVENT_BULLETIN_BOARD_POST_CHANGED"
---| "EVENT_CALL_SPARK_COST_CHANGED"
---| "EVENT_CALL_SPARK_FAILED"
---| "EVENT_CAMERA_DIRECTION_CHANGED"
---| "EVENT_CAN_CREATE_GUILD_HERE_RESPONSE"
---| "EVENT_CANNON_SHOT_FINISHED"
---| "EVENT_CANNON_SHOT_PREPARATION_STARTED"
---| "EVENT_CANNON_SHOT_STARTED"
---| "EVENT_CANNON_TARGET_CHANGE"
---| "EVENT_CANNOT_ATTACH_WIDGET_3D"
---| "EVENT_CANT_LEAVE_GAME_IN_COMBAT"
---| "EVENT_CANT_LOOT_DISAPPEARED_LOOT_BAG"
---| "EVENT_CANT_SEND_CHAT_BY_DELAY"
---| "EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY"
---| "EVENT_CHANGE_ROOM_STARTED"
---| "EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED"
---| "EVENT_CHARACTER_CLASS_CHANGER_CHANGED"
---| "EVENT_CHAT_AVATAR_MUTED"
---| "EVENT_CHAT_MESSAGE"
---| "EVENT_CHAT_MESSAGE_IS_FLOOD"
---| "EVENT_CHAT_MESSAGE_REJECTED"
---| "EVENT_CHAT_MESSAGE_WITH_OBJECTS"
---| "EVENT_CHAT_NAMED_ERROR"
---| "EVENT_CHAT_SENT_TO_ALT"
---| "EVENT_CHECKROOM_CHANGED"
---| "EVENT_CHECKROOM_ITEM_ADDED"
---| "EVENT_CHECKROOM_ITEM_CHANGED"
---| "EVENT_CHEST_LOOTER_CHANGED"
---| "EVENT_CLIENT_IMAGE_HIDE_ALL"
---| "EVENT_CLIENT_IMAGE_SHOW"
---| "EVENT_CLIENT_MESSAGE"
---| "EVENT_CONDITION_EVENT"
---| "EVENT_CONTAINER_CHANGED"
---| "EVENT_CONTAINER_ITEM_ADDED"
---| "EVENT_CONTAINER_ITEM_CHANGED"
---| "EVENT_CONTAINER_ITEM_EFFECT"
---| "EVENT_CONTAINER_ITEM_REMOVED"
---| "EVENT_CONTEXT_ACTION_POINT_STARTED"
---| "EVENT_CONTEXT_ACTIONS_CHANGED"
---| "EVENT_CROSSHAIR_TARGET_POS_CHANGED"
---| "EVENT_CURRENCIES_CHANGED"
---| "EVENT_CURRENCY_EXCHANGE_FINISHED"
---| "EVENT_CURRENCY_EXCHANGE_INFO_CHANGED"
---| "EVENT_CURRENCY_EXCHANGE_STARTED"
---| "EVENT_CURRENCY_NOT_ENOUGH"
---| "EVENT_CURRENCY_VALUE_CHANGED"
---| "EVENT_CURRENT_QUEST_CHANGED"
---| "EVENT_CUSTOM_EMOTE"
---| "EVENT_CUSTOMIZATION_ACTIVE_SLOT_CHANGED"
---| "EVENT_CUSTOMIZATION_ACTIVE_SLOT_CONTENT_CHANGED"
---| "EVENT_CUSTOMIZATION_STATE_CHANGED"
---| "EVENT_DUNGEON_CHOICE_FINISHED"
---| "EVENT_DUNGEON_CHOICE_STARTED"
---| "EVENT_DEFAULT_SPELL_CHANGED"
---| "EVENT_DEFAULT_SPELL_EFFECT"
---| "EVENT_DEPOSITE_BOX_CHANGED"
---| "EVENT_DEVICE_ACTION_EFFECTIVENESS_CHANGED"
---| "EVENT_DEVICE_ACTIVE_ACTION_CHANGED"
---| "EVENT_DEVICE_COOLDOWN_FINISHED"
---| "EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED"
---| "EVENT_DEVICE_COOLDOWN_STARTED"
---| "EVENT_DEVICE_DAMAGE_RECEIVED"
---| "EVENT_DEVICE_DEAD_CHANGED"
---| "EVENT_DEVICE_OFFLINE_CHANGED"
---| "EVENT_DEVICE_OFFLINE_REASON"
---| "EVENT_DEVICE_RELATED_QUESTS_CHANGED"
---| "EVENT_DEVICES_CHANGED"
---| "EVENT_DEVICE_ZERO_SPEED"
---| "EVENT_DICE_CRAFT_CANCELED"
---| "EVENT_DICE_CRAFT_CMD_FAILED"
---| "EVENT_DICE_CRAFT_FINISHED"
---| "EVENT_DICE_CRAFT_NOT_ENOUGH_COMPONENTS"
---| "EVENT_DICE_CRAFT_PREPARED"
---| "EVENT_DICE_CRAFT_RECIPES_CHANGED"
---| "EVENT_DICE_CRAFT_SCORE_CHANGED"
---| "EVENT_DICE_CRAFT_SLOT_CHANGED"
---| "EVENT_DICE_CRAFT_STATUS_CHANGED"
---| "EVENT_DISASSEMBLING_RESULT"
---| "EVENT_DISBAND_GUILD_REQUEST"
---| "EVENT_DISCONNECT"
---| "EVENT_DISTRIBUTION_FINISHED"
---| "EVENT_DOMINATION_OBJECTIVE_ADDED"
---| "EVENT_DOMINATION_OBJECTIVE_DISABLED"
---| "EVENT_DOMINATION_OBJECTIVE_OWNER_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_PROGRESS_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_PROGRESS_TO_CAPTURE_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_RADIUS_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_REMOVED"
---| "EVENT_DOMINATION_OBJECTIVE_STATE_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_TEAM_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_TIME_SWITCHED_CHANGED"
---| "EVENT_DOMINATION_OBJECTIVE_TIME_TO_CAPTURE_CHANGED"
---| "EVENT_DO_WARP"
---| "EVENT_DRUID_PET_COMMAND_POINTS_CHANGED"
---| "EVENT_EFFECT_FINISHED"
---| "EVENT_EFFECT_SEQUENCE_FINISHED"
---| "EVENT_EFFECT_SEQUENCE_STEP"
---| "EVENT_EMOTES_CHANGED"
---| "EVENT_ENDURE_BARRIER_DAMAGE"
---| "EVENT_EQUIP_FAILED"
---| "EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED"
---| "EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED"
---| "EVENT_ERROR_GAME_CENTER_REQUEST"
---| "EVENT_FAIRY_BONUS_CHANGED"
---| "EVENT_FAMILY_CREATED"
---| "EVENT_FAMILY_DESTROYED"
---| "EVENT_FAMILY_SPELL_EXPERIENCE_CHANGED"
---| "EVENT_FAMILY_SPELLS_CHANGED"
---| "EVENT_FATALITY_PHRASE_RESULT"
---| "EVENT_FOLLOW_MODE_CHANGED"
---| "EVENT_FORAGING_FAILED"
---| "EVENT_FORGE_CRAFT_DIALOG"
---| "EVENT_FPS_RANGE_CHANGED"
---| "EVENT_FULLSCREEN_CHANGED"
---| "EVENT_GAME_ITEM_CHANGED"
---| "EVENT_GAME_ITEM_CURSED_CHANGED"
---| "EVENT_GENERAL_ERROR"
---| "EVENT_GLOBAL_COOLDOWN"
---| "EVENT_GLOBAL_NOTICE"
---| "EVENT_GLOBAL_RATES_CHANGED"
---| "EVENT_GREED_NEED_ROLLS"
---| "EVENT_GREED_NEED_SELECTED"
---| "EVENT_GROUP_ACCEPT_ERROR"
---| "EVENT_GROUP_APPEARED"
---| "EVENT_GROUP_CHANGED"
---| "EVENT_GROUP_CONVERTED"
---| "EVENT_GROUP_DECLINE"
---| "EVENT_GROUP_DECLINE_BUSY"
---| "EVENT_GROUP_DECLINE_IGNORED"
---| "EVENT_GROUP_DISAPPEARED"
---| "EVENT_GROUP_INVITE"
---| "EVENT_GROUP_INVITE_END"
---| "EVENT_GROUP_INVITE_FAILED"
---| "EVENT_GROUP_ITEM_QUALITY_CHANGED"
---| "EVENT_GROUP_KICK_FAILED"
---| "EVENT_GROUP_LEADER_CHANGED"
---| "EVENT_GROUP_LOOT_SCHEME_CHANGED"
---| "EVENT_GROUP_MEMBER_ADDED"
---| "EVENT_GROUP_MEMBER_CHANGED"
---| "EVENT_GROUP_MEMBER_REMOVED"
---| "EVENT_GUILD_ACCEPTED"
---| "EVENT_GUILD_ALLOD_ATTACK_FAILED"
---| "EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL"
---| "EVENT_GUILD_ALLOD_OWNER_CHANGED"
---| "EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_FINISHED"
---| "EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_STARTED"
---| "EVENT_GUILD_ALREADY_IN_GUILD"
---| "EVENT_GUILD_APPEARED"
---| "EVENT_GUILD_AUTHORITY_CHANGED"
---| "EVENT_GUILD_AVATAR_HISTORY"
---| "EVENT_GUILD_BANK_HISTORY_CHANGED"
---| "EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED"
---| "EVENT_GUILD_BANK_MONEY_CHANGED"
---| "EVENT_GUILD_BANK_OPERATION_RESULT"
---| "EVENT_GUILD_BOSS_ABILITIES_CHANGED"
---| "EVENT_GUILD_BOSS_CHANGED"
---| "EVENT_GUILD_BOSS_EXPERIENCE_CHANGED"
---| "EVENT_GUILD_BOSS_GEAR_SCORE_CHANGED"
---| "EVENT_GUILD_BOSS_QUESTS_CHANGED"
---| "EVENT_GUILD_BOSS_QUESTS_STATUS_CHANGED"
---| "EVENT_GUILD_BOSS_SPELLS_CHANGED"
---| "EVENT_GUILD_BOSS_STATE_CHANGED"
---| "EVENT_GUILD_BUFF_ADDED"
---| "EVENT_GUILD_BUFFS_CHANGED"
---| "EVENT_GUILD_CANT_ACCEPT"
---| "EVENT_GUILD_CREATED"
---| "EVENT_GUILD_CURRENCIES_CHANGED"
---| "EVENT_GUILD_DECLINE"
---| "EVENT_GUILD_DECLINE_BUSY"
---| "EVENT_GUILD_DECLINE_IGNORED"
---| "EVENT_GUILD_DESCRIPTION_CHANGED"
---| "EVENT_GUILD_DISAPPEARED"
---| "EVENT_GUILD_ENABLE_PROGRESS_REQUEST"
---| "EVENT_GUILD_FAILED"
---| "EVENT_GUILD_HALL_EXPERIENCE_CHANGED"
---| "EVENT_GUILD_HALL_EXPERIENCE_DAILY_CHANGED"
---| "EVENT_GUILD_HALL_QUESTS_CHANGED"
---| "EVENT_GUILD_HALL_QUESTS_STATUS_CHANGED"
---| "EVENT_GUILD_HALL_STATE_CHANGED"
---| "EVENT_GUILD_INVITE"
---| "EVENT_GUILD_ITEMS_HISTORY_CHANGED"
---| "EVENT_GUILD_ITEMS_OPERATION_RESULT"
---| "EVENT_GUILD_LEADER_CHANGED"
---| "EVENT_GUILD_LEVEL_CHANGED"
---| "EVENT_GUILD_LIST_CHANGED"
---| "EVENT_GUILD_MEMBER_ADDED"
---| "EVENT_GUILD_MEMBER_AUTHORITY_CHANGED"
---| "EVENT_GUILD_MEMBER_BALANCE_CHANGED"
---| "EVENT_GUILD_MEMBER_CHANGED"
---| "EVENT_GUILD_MEMBER_DAY_AUTHORITY_CHANGED"
---| "EVENT_GUILD_MEMBER_KICKED"
---| "EVENT_GUILD_MEMBER_LOYALTY_CHANGED"
---| "EVENT_GUILD_MEMBER_MONTH_AUTHORITY_CHANGED"
---| "EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED"
---| "EVENT_GUILD_MEMBER_RANK_CHANGED"
---| "EVENT_GUILD_MEMBER_REMOVED"
---| "EVENT_GUILD_MEMBER_SYMBOLICS"
---| "EVENT_GUILD_MEMBER_TABARD_CHANGED"
---| "EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED"
---| "EVENT_GUILD_MESSAGE_CHANGED"
---| "EVENT_GUILD_MONTH_AUTHORITY_CHANGED"
---| "EVENT_GUILD_NAME_CHANGED"
---| "EVENT_GUILD_NAME_NOT_AVAILABLE"
---| "EVENT_GUILD_NEED_RENAME_CHANGED"
---| "EVENT_GUILD_SEASON_AUTHORITY_BONUS_POOL_CHANGED"
---| "EVENT_GUILD_SEASON_AUTHORITY_CHANGED"
---| "EVENT_GUILD_SEASON_LEVEL_CHANGED"
---| "EVENT_GUILD_SEASON_SECURE_AUTHORITY_CHANGED"
---| "EVENT_GUILD_SYMBOLICS_CHANGED"
---| "EVENT_GUILD_TABARDS_CHANGED"
---| "EVENT_GUILD_TALENTS_CHANGED"
---| "EVENT_GUILD_TEXTURE_CHANGED"
---| "EVENT_GUILD_UNLOCKED_LEVEL_CHANGED"
---| "EVENT_HANGAR_ACTIVE_HULL_CHANGED"
---| "EVENT_HANGAR_ACTIVE_SHIP_CHANGED"
---| "EVENT_HANGAR_ACTIVE_SHIP_HULLS_CHANGED"
---| "EVENT_HANGAR_ACTIVE_SHIP_SKINS_CHANGED"
---| "EVENT_HANGAR_ACTIVE_SKIN_CHANGED"
---| "EVENT_HANGAR_DEVICES_RECEIVED"
---| "EVENT_HANGAR_REPAIR_QUESTION"
---| "EVENT_HANGAR_SHIPS_CHANGED"
---| "EVENT_HANGAR_SLOT_DEVICES_RECEIVED"
---| "EVENT_HANGAR_SPELL_CHANGED"
---| "EVENT_HANGAR_SPELL_EFFECT"
---| "EVENT_HEAL_ABSORB_POOL_APPEARED"
---| "EVENT_HEAL_ABSORB_POOL_CHANGED"
---| "EVENT_HEAL_ABSORB_POOL_DISAPPEARED"
---| "EVENT_HEALING_RECEIVED"
---| "EVENT_HEARTHSTONE_COOLDOWN_FINISHED"
---| "EVENT_HEARTHSTONE_COOLDOWN_STARTED"
---| "EVENT_HEARTHSTONE_CREATED"
---| "EVENT_HEARTHSTONE_DESTROYED"
---| "EVENT_HEARSTONE_LOCATOR_CHANGED"
---| "EVENT_HIDDEN_CURRENCY_VALUE_CHANGED"
---| "EVENT_IME_SELECT_FINISHED"
---| "EVENT_IME_SELECT_STARTED"
---| "EVENT_INGAME_UNDER_CURSOR_CHANGED"
---| "EVENT_INSPECT_AVATAR_MEDALS_RESULT"
---| "EVENT_INSPECT_FINISHED"
---| "EVENT_INSPECT_MOUNT_CHANGED"
---| "EVENT_INSPECT_SKILL_CHANGED"
---| "EVENT_INSPECT_STARTED"
---| "EVENT_INTERACTION_STARTED"
---| "EVENT_INTERFACE_TOGGLE"
---| "EVENT_INVENTORY_CHANGED"
---| "EVENT_INVENTORY_GEMS_CHANGED"
---| "EVENT_INVENTORY_GEMS_SLOT_ADDED"
---| "EVENT_INVENTORY_GEMS_SLOT_REMOVED"
---| "EVENT_INVENTORY_OVERFLOW_CHANGED"
---| "EVENT_INVENTORY_OVERFLOW_SLOT_ADDED"
---| "EVENT_INVENTORY_OVERFLOW_SLOT_REMOVED"
---| "EVENT_INVENTORY_SIZE_CHANGED"
---| "EVENT_INVENTORY_SLOT_CHANGED"
---| "EVENT_ISLAND_DEATH_LIMIT_CHANGED"
---| "EVENT_ITEM_DISABLED"
---| "EVENT_ITEM_MOVED"
---| "EVENT_ITEM_QUESTS_RECEIVED"
---| "EVENT_ITEM_RELATED_QUESTS_CHANGED"
---| "EVENT_ITEM_SERVER_CMD_FINISHED"
---| "EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED"
---| "EVENT_ITEMS_EXCHANGE_ERROR"
---| "EVENT_ITEMS_EXCHANGE_FINISHED"
---| "EVENT_ITEMS_EXCHANGE_INVITED"
---| "EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED"
---| "EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED"
---| "EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED"
---| "EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED"
---| "EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY"
---| "EVENT_ITEMS_EXCHANGE_STARTED"
---| "EVENT_ITEMS_EXCHANGE_STATE_CHANGED"
---| "EVENT_LFG_ACTION_FAIL"
---| "EVENT_LFG_DEPART_AVAILABLE_CHANGED"
---| "EVENT_LFG_DESTINATION_AVAILABLE_CHANGED"
---| "EVENT_LFG_DESTINATION_CHANGED"
---| "EVENT_LFG_DESTINATIONS_LIST_CHANGED"
---| "EVENT_LFG_DESTINATION_VISITS_CHANGED"
---| "EVENT_LFG_JOIN"
---| "EVENT_LFG_LEAVE"
---| "EVENT_LFG_VOTE"
---| "EVENT_LFG_VOTE_TERMINATE"
---| "EVENT_LOBBY_CLIENT_MESSAGE"
---| "EVENT_LOCALE_CHANGED"
---| "EVENT_LOOT_BAG_APPEARED"
---| "EVENT_LOOT_BAG_CHANGED"
---| "EVENT_LOOT_BAG_DISAPPEARED"
---| "EVENT_LOOT_BAG_ITEM_DISAPPEARED"
---| "EVENT_LOOT_BAG_MONEY_DISAPPEARED"
---| "EVENT_LOOT_BAG_OPEN_STATE_CHANGED"
---| "EVENT_LOOT_BAG_SELECTED"
---| "EVENT_LOOT_CHEST_CAPTURED"
---| "EVENT_LOOT_CHEST_DROPPED"
---| "EVENT_LOOT_CHEST_RETURNED"
---| "EVENT_LOOT_CHEST_TAKEN"
---| "EVENT_LOOT_DISTRIBUTION_STARTED"
---| "EVENT_LOOT_FOR_GREED_NEED"
---| "EVENT_LOOT_MARK"
---| "EVENT_LOOTSELECTOR_CHANGED"
---| "EVENT_LOOT_TO_DISTRIBUTE"
---| "EVENT_LOTTERY_END"
---| "EVENT_LOTTERY_STATE_CHANGED"
---| "EVENT_MAILBOX_ACTIVATED"
---| "EVENT_MAILBOX_CHANGED"
---| "EVENT_MAILBOX_CHANGED_ON_SERVER"
---| "EVENT_MAILBOX_CLOSED"
---| "EVENT_MAILBOX_NEW_MAIL_ARRIVED"
---| "EVENT_MAILBOX_NEW_UNREAD_MESSAGE"
---| "EVENT_MAILBOX_SERVER_OPERATION_RESULT"
---| "EVENT_MAIL_CREATE_RESULT"
---| "EVENT_MAIL_DELETE_RESULT"
---| "EVENT_MAIL_EXTRACT_ITEMS_RESULT"
---| "EVENT_MAIL_EXTRACT_MONEY_RESULT"
---| "EVENT_MAIL_RETURN_RESULT"
---| "EVENT_MAILS_CHANGED"
---| "EVENT_MANA_RECEIVED"
---| "EVENT_MAP_CHANNELS_INFO_CHANGED"
---| "EVENT_MAP_INSTANCE_FULL"
---| "EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED"
---| "EVENT_MAP_INSTANCE_KICK_TIMER_STARTED"
---| "EVENT_MATCH_MAKING_AUTO_DEPART_TIME_CHANGED"
---| "EVENT_MATCH_MAKING_CURRENT_BATTLE_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_ADDED"
---| "EVENT_MATCH_MAKING_EVENT_AVAILABILITY_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_DOUBLE_BONUS_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_DURATION_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBER_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBERS_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_REMOVED"
---| "EVENT_MATCH_MAKING_EVENT_PROGRESS_ROUNDS_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_QUEUE_ADDED"
---| "EVENT_MATCH_MAKING_EVENT_QUEUE_REMOVED"
---| "EVENT_MATCH_MAKING_EVENT_QUEUES_REMOVED"
---| "EVENT_MATCH_MAKING_EVENT_REMOVED"
---| "EVENT_MATCH_MAKING_EVENTS_AVAILABILITY_CHANGED"
---| "EVENT_MATCH_MAKING_EVENTS_CHANGED"
---| "EVENT_MATCH_MAKING_EVENT_TELEPORT_REJECTED"
---| "EVENT_MATCH_MAKING_EVENT_TELEPORT_REQUEST"
---| "EVENT_MATCH_MAKING_EVENT_VISITS_CHANGED"
---| "EVENT_MATCH_MAKING_JOIN_TIME_CHANGED"
---| "EVENT_MATCH_MAKING_MEMBERS_ROLES_CHANGED"
---| "EVENT_MATCH_MAKING_PROGRESS_ACHIEVEMENTS_CHANGED"
---| "EVENT_MATCH_MAKING_PROGRESS_MEMBERS_ACHIEVEMENTS_CHANGED"
---| "EVENT_MEDAL_ADDED"
---| "EVENT_MEDAL_PROGRESS_CHANGED"
---| "EVENT_MEDAL_REMOVED"
---| "EVENT_MEDALS_CHANGED"
---| "EVENT_MEDALS_SEARCH_RESULTS"
---| "EVENT_MEMBER_MEDAL_FINISHED"
---| "EVENT_MENTOR_APPRENTICE_ADDED"
---| "EVENT_MENTOR_APPRENTICE_REMOVED"
---| "EVENT_MENTOR_APPRENTICE_REWARD_CHANGED"
---| "EVENT_MENTOR_CHANGED"
---| "EVENT_MENTOR_COOLDOWNS_CHANGED"
---| "EVENT_MENTOR_DATA_CHANGED"
---| "EVENT_MENTOR_INFO_CHANGED"
---| "EVENT_MENTOR_MESSAGE_CHANGED"
---| "EVENT_MENTOR_PLAYER_INFO_CHANGED"
---| "EVENT_META_DIALOG"
---| "EVENT_META_UPGRADE_BREAK"
---| "EVENT_META_UPGRADE_RESULT"
---| "EVENT_MISSION_FREE_PORTRAIT_SLOT"
---| "EVENT_MISSION_INITIALIZED"
---| "EVENT_LOADING_PROGRESS"
---| "EVENT_MISSION_RULE_ADDED"
---| "EVENT_MISSION_RULE_CHANGED"
---| "EVENT_MISSION_RULE_COUNTER_CHANGED"
---| "EVENT_MISSION_RULE_REMOVED"
---| "EVENT_MISSION_RULES_CHANGED"
---| "EVENT_MOB_ACTION_PROGRESS_FINISH"
---| "EVENT_MOB_ACTION_PROGRESS_FREEZE"
---| "EVENT_MOB_ACTION_PROGRESS_START"
---| "EVENT_MOB_EVADED"
---| "EVENT_MOB_RELATED_GOALS_CHANGED"
---| "EVENT_MOB_RELATED_QUESTS_CHANGED"
---| "EVENT_MOVE_BY_CLICK_CHANGED"
---| "EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED"
---| "EVENT_MUTATION_ZONE_POPULATION_CHANGED"
---| "EVENT_MWAR_FLAG_COSTS_CHANGED"
---| "EVENT_MWAR_LADDER_CHANGED"
---| "EVENT_MWAR_QUEUE_CHANGED"
---| "EVENT_MWAR_RATING_PROGRESS_CHANGED"
---| "EVENT_NAVIGATE_ENABLED_CHANGED"
---| "EVENT_NAVIGATION_SCANER_HUB_PVE_INFO"
---| "EVENT_NAVIGATION_SCANER_HUB_PVP_INFO"
---| "EVENT_NAVIGATION_SCANER_HUB_STARTED"
---| "EVENT_NAVIGATION_SCANER_HUB_TRAILS_INFO"
---| "EVENT_NAVIGATOR_FOLLOWED_CHANGED"
---| "EVENT_NAVIGATOR_TARGET_CHESTS_CHANGED"
---| "EVENT_NECROMANCER_BLOOD_POOL_CHANGED"
---| "EVENT_NEW_REPUTATION_APPEARED"
---| "EVENT_NEWS_POST_LOADED"
---| "EVENT_NEWS_POST_SELECTED"
---| "EVENT_OBJECT_BUFF_ADDED"
---| "EVENT_OBJECT_BUFF_CHANGED"
---| "EVENT_OBJECT_BUFF_PROGRESS_ADDED"
---| "EVENT_OBJECT_BUFF_PROGRESS_CHANGED"
---| "EVENT_OBJECT_BUFF_PROGRESS_REMOVED"
---| "EVENT_OBJECT_BUFF_REMOVED"
---| "EVENT_OBJECT_BUFFS_CHANGED"
---| "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED"
---| "EVENT_OBJECT_COMBAT_STATUS_CHANGED"
---| "EVENT_OBJECT_DETECT_FINISHED"
---| "EVENT_OBJECT_DETECTOR_LIST_CHANGED"
---| "EVENT_OBJECT_DETECT_STARTED"
---| "EVENT_OBJECT_DIMINISHING_CHANGED"
---| "EVENT_OBJECT_DIMINISHING_GROUP_CHANGED"
---| "EVENT_OBJECT_HEALTH_CHANGED"
---| "EVENT_OBJECT_MANA_CHANGED"
---| "EVENT_OBJECT_NAME_CHANGED"
---| "EVENT_OBJECT_SELECTABLE_CHANGED"
---| "EVENT_OBJECTS_HEALTH_CHANGED"
---| "EVENT_OBJECT_UIINFO_REMOVED"
---| "EVENT_OPTION_CHANGED"
---| "EVENT_ORDER_ACHIEVEMENTS_CHANGED"
---| "EVENT_ORDER_CAN_VOTE_CHANGED"
---| "EVENT_ORDER_CHANGED"
---| "EVENT_ORDER_INFO_CHANGED"
---| "EVENT_ORDER_VOTE_ANSWER"
---| "EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED"
---| "EVENT_PARTY_MEMBER_POSITION_UPDATED"
---| "EVENT_PASSANGER_STATE_CHANGED"
---| "EVENT_PET_INFO_CHANGED"
---| "EVENT_PICK_OBJECT"
---| "EVENT_PLAYED_COMMAND_RESPONSE"
---| "EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED"
---| "EVENT_PLAYER_GEAR_SCORE_CHANGED"
---| "EVENT_PLAYER_GREAT_CHANGED"
---| "EVENT_PLAYER_TITLE_CHANGED"
---| "EVENT_PLAYER_TITLES_CHANGED"
---| "EVENT_POS_CONVERTER_CHANGED"
---| "EVENT_POWEREDLSWEAPONS_CHANGED"
---| "EVENT_POWEREDLSWEAPONS_ITEM_ADDED"
---| "EVENT_PREMIUM_BONUS_STAGE_CHANGED"
---| "EVENT_PREMIUM_CHANGED"
---| "EVENT_PREMIUM_STAGE_CHANGED"
---| "EVENT_PRIDEN_FACTION_CHOICE"
---| "EVENT_PROCEDURAL_DUNGEON_GOAL_ADDED"
---| "EVENT_PROCEDURAL_DUNGEON_GOAL_COUNT_CHANGED"
---| "EVENT_PROCEDURAL_DUNGEON_GOALS_CHANGED"
---| "EVENT_PROCEDURAL_DUNGEON_GOAL_STATE_CHANGED"
---| "EVENT_PROCEDURAL_DUNGEON_POINTS_CHANGED"
---| "EVENT_PROCEDURAL_DUNGEON_SCENARIO_ADDED"
---| "EVENT_PROCEDURAL_DUNGEON_SCENARIO_STATE_CHANGED"
---| "EVENT_PROFICIENCY_ADDED"
---| "EVENT_PROFICIENCY_REMOVED"
---| "EVENT_PROJECTED_OBJECTS_CHANGED"
---| "EVENT_PURGE_BARRIER_DAMAGE"
---| "EVENT_QUEST_ABANDONED"
---| "EVENT_QUEST_ACCEPT_ERROR"
---| "EVENT_QUEST_BOOK_CHANGED"
---| "EVENT_QUEST_BOOK_LIMITS_CHANGED"
---| "EVENT_QUEST_COMPLETED"
---| "EVENT_QUEST_DISCARDED"
---| "EVENT_QUEST_FAILED"
---| "EVENT_QUEST_FIND_NEXT_RESULT"
---| "EVENT_QUEST_FINISH_FAILED_NO_SPACE"
---| "EVENT_QUESTION_ADDED"
---| "EVENT_QUESTION_REMOVED"
---| "EVENT_QUESTION_RESULTS_CHANGED"
---| "EVENT_QUEST_MARK_UPDATED"
---| "EVENT_QUEST_OBJECTIVE_UPDATED"
---| "EVENT_QUEST_READY_TO_RETURN_CHANGED"
---| "EVENT_QUEST_RECEIVED"
---| "EVENT_QUEST_REWARD_UPDATED"
---| "EVENT_QUEST_SHARE_INVITATION"
---| "EVENT_QUEST_SHARE_INVITATION_RESULT"
---| "EVENT_QUEST_SHARE_INVITATION_TIMEOUT"
---| "EVENT_QUEST_START_FAILED_LOG_FULL"
---| "EVENT_QUEST_START_FAILED_NO_SPACE"
---| "EVENT_QUEST_TIMER_FINISHED"
---| "EVENT_QUEST_TIMER_UPDATED"
---| "EVENT_QUEST_UPDATED"
---| "EVENT_RAID_ALREADY_IN"
---| "EVENT_RAID_APPEARED"
---| "EVENT_RAID_CANT_ACCEPT"
---| "EVENT_RAID_CANT_ENTER_MAP"
---| "EVENT_RAID_CHANGED"
---| "EVENT_RAID_DECLINE"
---| "EVENT_RAID_DECLINE_BUSY"
---| "EVENT_RAID_DECLINE_IGNORED"
---| "EVENT_RAID_DISAPPEARED"
---| "EVENT_RAID_ENTER_VARS_MAP_UNAVALIABLE"
---| "EVENT_RAID_ENTER_VARS_MAP_WARNING"
---| "EVENT_RAID_FAILED"
---| "EVENT_RAID_INVITE"
---| "EVENT_RAID_INVITE_END"
---| "EVENT_RAID_LEADER_CHANGED"
---| "EVENT_RAID_LEADER_HELPER_CHANGED"
---| "EVENT_RAID_LOOT_MASTER_CHANGED"
---| "EVENT_RAID_MEMBER_ADDED"
---| "EVENT_RAID_MEMBER_CHANGED"
---| "EVENT_RAID_MEMBER_POSITION_UPDATED"
---| "EVENT_RAID_MEMBER_REMOVED"
---| "EVENT_RAID_SAVE_MAP_QUESTION"
---| "EVENT_REACTOR_COUNTDOWN"
---| "EVENT_REACTOR_COUNTDOWN_CANCELLED"
---| "EVENT_READY_CHECK_ENDED"
---| "EVENT_READY_CHECK_INFO_CHANGED"
---| "EVENT_READY_CHECK_STARTED"
---| "EVENT_READY_FOR_FINALLY_RESPAWN"
---| "EVENT_REFORGE_RESULT"
---| "EVENT_REFORGE_RESULT_FAIL"
---| "EVENT_REFORGE_RESULT_READY"
---| "EVENT_RELIEF_BARRIER_DAMAGE"
---| "EVENT_REMORT_ABILITY_SHARING_REQUEST"
---| "EVENT_REMORT_CHARACTER_SCENE_CAMERA_READY"
---| "EVENT_REMORT_LIST_GAINED"
---| "EVENT_REMORT_SHOW_CREATION_DIALOG"
---| "EVENT_REMORT_VARIATIONS_INFO_CHANGED"
---| "EVENT_REMORT_ZOOM_TRIGGER_CHANGED"
---| "EVENT_REPUTATION_DISAPPEARED"
---| "EVENT_REPUTATION_LEVEL_CHANGED"
---| "EVENT_REPUTATION_VALUE_CHANGED"
---| "EVENT_RESPAWN_FROM_GRAVEYARD"
---| "EVENT_RESPAWN_STARTED"
---| "EVENT_RESURRECT_REJECTED"
---| "EVENT_RESURRECT_REQUESTED"
---| "EVENT_REVIVAL_ROLL_RESULT"
---| "EVENT_REVIVALS_CHANGED"
---| "EVENT_RUNE_OPERATION_RESULT"
---| "EVENT_SCANNED_HUB_OBJECTS_CHANGED"
---| "EVENT_SECOND_TIMER"
---| "EVENT_SECRET_CLOSED"
---| "EVENT_SECRET_COMPONENT_CLOSED"
---| "EVENT_SECRET_FINISHED"
---| "EVENT_SECRET_FINISHER_STATUS_CHANGED"
---| "EVENT_SECRET_OPENED"
---| "EVENT_SECRETS_CHANGED"
---| "EVENT_SHIELD_REGEN_IN_PROGRESS_CHANGED"
---| "EVENT_SHIELD_STRENGTH_CHANGED"
---| "EVENT_SHIP_CUSTOMIZING_CHANGED"
---| "EVENT_SHIP_CUSTOMIZING_FINISHED"
---| "EVENT_SHIP_CUSTOMIZING_STARTED"
---| "EVENT_SHIP_DAMAGE_RECEIVED"
---| "EVENT_SHOW_ITEMS_INFO"
---| "EVENT_SHOW_SUBTITLES"
---| "EVENT_SKILL_ADDED"
---| "EVENT_SKILL_IMPROVEMENT_CHANGED"
---| "EVENT_SKILL_REMOVED"
---| "EVENT_SKILLS_CHANGED"
---| "EVENT_SKILL_SCORE_CHANGED"
---| "EVENT_SLASH_COMMAND_FAILED"
---| "EVENT_SLASH_COMMAND_PREFIX_CHANGED"
---| "EVENT_SOS_FINISHED"
---| "EVENT_SOS_STARTED"
---| "EVENT_SOUL_PROGRESS_EXPERIENCE_CHANGED"
---| "EVENT_SOUL_PROGRESS_TALENTS_CHANGED"
---| "EVENT_SPELLBOOK_CHANGED"
---| "EVENT_SPELLBOOK_ELEMENT_ADDED"
---| "EVENT_SPELLBOOK_ELEMENT_CHANGED"
---| "EVENT_SPELLBOOK_ELEMENT_EFFECT"
---| "EVENT_SPELL_LANDED_NO_TARGET"
---| "EVENT_SPOUSE_POSITION_UPDATED"
---| "EVENT_STABLE_FOOD_CHANGED"
---| "EVENT_STABLE_MOUNT_ADDED"
---| "EVENT_STABLE_MOUNT_CHANGED"
---| "EVENT_STABLE_MOUNT_HUNGRY"
---| "EVENT_STABLE_MOUNT_LEVEL_CHANGED"
---| "EVENT_STABLE_MOUNT_REMOVED"
---| "EVENT_STABLE_MOUNTS_CHANGED"
---| "EVENT_STABLE_MOUNT_SKINS_CHANGED"
---| "EVENT_STABLE_MOUNT_TALENTS_CHANGED"
---| "EVENT_STABLE_SLOTS_COUNT_CHANGED"
---| "EVENT_TAKE_ITEMS_FAILED"
---| "EVENT_TALENTS_CHANGED"
---| "EVENT_TALK_STARTED"
---| "EVENT_TALK_STOPPED"
---| "EVENT_TARGET_POS_CHANGED"
---| "EVENT_TARGET_SALES_ADDED"
---| "EVENT_TARGET_SALES_CHANGED"
---| "EVENT_TELEPORT_OFFER_REQUEST"
---| "EVENT_TRACK_ADDED"
---| "EVENT_TRACK_OBJECT_CHANGED"
---| "EVENT_TRACK_POS_CHANGED"
---| "EVENT_TRACK_REMOVED"
---| "EVENT_TRAINER_LEARN_ERROR"
---| "EVENT_TRANSPORT_ACCELERATION_TARGET_CHANGED"
---| "EVENT_TRANSPORT_ANGULAR_VELOCITY_CHANGED"
---| "EVENT_TRANSPORT_CRITICAL_MALFUNCTION"
---| "EVENT_TRANSPORT_DEVICES_CHANGED"
---| "EVENT_TRANSPORT_DIRECTION_CHANGED"
---| "EVENT_TRANSPORT_ENERGY_CHANGED"
---| "EVENT_TRANSPORT_HORIZONTAL_VELOCITY_CHANGED"
---| "EVENT_TRANSPORT_INSIGHT_CHANGED"
---| "EVENT_TRANSPORT_OBSERVING_FINISHED"
---| "EVENT_TRANSPORT_OBSERVING_STARTED"
---| "EVENT_TRANSPORT_POS_CHANGED"
---| "EVENT_TRANSPORT_RENAME_REPLY"
---| "EVENT_TRANSPORT_RENAME_REPLY_RESULT"
---| "EVENT_TRANSPORTS_CHANGED"
---| "EVENT_TRANSPORT_SHIELD_CHANGED"
---| "EVENT_TRANSPORT_SHIP_INFO_CHANGED"
---| "EVENT_TRANSPORT_VERTICAL_VELOCITY_CHANGED"
---| "EVENT_TREASURY_FULL"
---| "EVENT_TUTORIAL_REQUEST"
---| "EVENT_TUTORIAL_SEARCH_RESULT"
---| "EVENT_UI_RELOADED:"
---| "EVENT_UNEQUIP_FAILED"
---| "EVENT_UNIT_CLASS_CHANGED"
---| "EVENT_UNIT_DAMAGE_RECEIVED"
---| "EVENT_UNIT_DEAD_CHANGED"
---| "EVENT_UNIT_EQUIPMENT_CHANGED"
---| "EVENT_UNIT_FACTION_CHANGED"
---| "EVENT_UNIT_FAIRY_CHANGED"
---| "EVENT_UNIT_FAIRY_RANK_CHANGED"
---| "EVENT_UNIT_FATALITY_CHANGED"
---| "EVENT_UNIT_FOLLOWERS_LIST_CHANGED"
---| "EVENT_UNIT_GUILD_CHANGED"
---| "EVENT_UNIT_HONOR_VALUE_CHANGED"
---| "EVENT_UNIT_LEVEL_CHANGED"
---| "EVENT_UNIT_MANA_CHANGED"
---| "EVENT_UNIT_MANA_PERCENTAGE_CHANGED"
---| "EVENT_UNIT_MESSAGE"
---| "EVENT_UNIT_MOOD_CHANGED"
---| "EVENT_UNIT_MOUNT_HEALTH_CHANGED"
---| "EVENT_UNIT_POS_CHANGED"
---| "EVENT_UNIT_PVP_FLAG_CHANGED"
---| "EVENT_UNIT_RAGE_CHANGED"
---| "EVENT_UNIT_RELATION_CHANGED"
---| "EVENT_UNITS_CHANGED"
---| "EVENT_UNIT_TAG_CHANGED"
---| "EVENT_UNIT_TOOK_MONEY"
---| "EVENT_UNIT_VETERAN_RANK_CHANGED"
---| "EVENT_UNIT_WILL_CHANGED"
---| "EVENT_UNIT_ZONE_PVP_TYPE_CHANGED"
---| "EVENT_UNKNOWN_SLASH_COMMAND"
---| "EVENT_UNSTUCK_SPELL_EFFECT"
---| "EVENT_UNSTUCK_SPELL_CHANGED"
---| "EVENT_USABLE_DEVICES_CHANGED"
---| "EVENT_USER_SCREENSHOT"
---| "EVENT_VALUED_OBJECT_CLICKED"
---| "EVENT_VALUED_OBJECT_DOUBLE_CLICKED"
---| "EVENT_VALUED_OBJECT_MOUSEOVER"
---| "EVENT_VARIABLE_ADDED"
---| "EVENT_VARIABLE_REMOVED"
---| "EVENT_VARIABLE_VALUE_CHANGED"
---| "EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE"
---| "EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL"
---| "EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT"
---| "EVENT_VENDOR_ITEM_ALREADY_SOLD"
---| "EVENT_VENDOR_ITEM_NOT_FOR_SALE"
---| "EVENT_VENDOR_LIST_UPDATED"
---| "EVENT_VETERANRANKS_COMMAND_RESPONSE"
---| "EVENT_VICTIM_TRACKER_CHANGED"
---| "EVENT_WHEELOFLOOT_ADDED"
---| "EVENT_WHEELOFLOOT_CHANGED"
---| "EVENT_WHEELOFLOOT_ITEMS"
---| "EVENT_WHEELOFLOOT_REMOVED"
---| "EVENT_WHISPER_FAILED"
---| "EVENT_DND_DRAG_CANCELLED"
---| "EVENT_DND_DRAG_OVER"
---| "EVENT_DND_DRAG_TO"
---| "EVENT_DND_DROP_ATTEMPT"
---| "EVENT_DND_PICK_ATTEMPT"
---| "EVENT_WIDGET_SHOW_CHANGED"
---| "EVENT_WISHMASTER_CHANGED"
---| "EVENT_WISHMASTER_MULTIPLYING"
