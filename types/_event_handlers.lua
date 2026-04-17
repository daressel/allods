---@meta

--- Event handler overloads for common.RegisterEventHandler
--- Each overload specifies the exact event data type for a given event name

--- Событие посылается, когда в книге умений появилось новое пассивное умение (абилка).
---@class EVENT_ABILITIES_ELEMENT_ADDED_Data
---@field id AbilityId Id ресурса пассивного умения
---@field silent boolean не выводить нотификацию если true

--- Событие присылается при уничтожении RunTime аккаунта по причине дисконнекта, чтобы была возможность показать сообщение об этом игроку прежде, чем клиент схлопнется.
---@class EVENT_ACCOUNT_HAS_DESTROYED_Data

--- Уведомление о неудачном исполнении эксплойта.
---@class EVENT_ACTION_FAILED_EXPLOIT_Data
---@field sysId string строковый код ошибки вида "ENUM_ActionFailCause_..."
---@field isInNotPredicate boolean true, если причина ошибки на самом деле противоположна полученному коду ошибки sysId
---@field name WString имя предмета, необходимого для каста
---@field dress integer тип одежды/оружия, необходимый для каста
---@field race number раса, необходимая для каста, поле устарело (OBSOLETE)
---@field sysRace string

--- Уведомление о неудачном исполнении действия, не являющего заклинанием или эксплойтом.
---@class EVENT_ACTION_FAILED_OTHER_Data
---@field sysId string строковый код ошибки
---@field isInNotPredicate boolean true, если причина ошибки на самом деле противоположна полученному коду ошибки sysId
---@field name WString имя предмета, необходимого для каста
---@field sysName string служебное название ресурса
---@field dress integer тип одежды/оружия, необходимый для каста
---@field race integer раса, необходимая для каста, поле устарело (OBSOLETE)
---@field sysRace string раса существа

--- Уведомление о неудачном исполнении заклинания.
---@class EVENT_ACTION_FAILED_SPELL_Data
---@field sysId string строковый код ошибки вида "ENUM_ActionFailCause_..."
---@field unitId ObjectId идентификатор юнитам, вызвавшего ошибку
---@field spellId SpellId идентификатор исполняемого заклинания
---@field isInNotPredicate boolean true, если причина ошибки на самом деле противоположна полученному коду ошибки sysId
---@field name WString|nil имя предмета, необходимого для каста
---@field number integer|nil необходимое количество предметов
---@field dress integer|nil тип одежды/оружия, необходимый для каста
---@field itemClass WString|nil имя класса предмета, необходимого для каста
---@field race number|nil раса, необходимая для каста, поле устарело (OBSOLETE)
---@field sysRace string|nil где значения перечисления:
---@field psionicContactType integer|nil тип контакта (PSIONIC_CONTACT_NORMAL, PSIONIC_CONTACT_CRUDE)
---@field sysPsionicContactType string|nil строковое значение типа ("ENUM_Normal", "ENUM_Crude")
---@field reputationLevel integer|nil уровень репутации, если требуется
---@field mobs WString[] таблица имён подходящих мобов

--- Событие посылается каждый раз, когда изменилось состояние панели действий (ActionPanel).
---@class EVENT_ACTION_PANEL_CHANGED_Data

--- Событие посылается каждый раз, когда изменилось состояние элемента на панели действий (ActionPanel). К созданию/удалению элемента это не относится, при этом изменяется панель целиком.
---@class EVENT_ACTION_PANEL_ELEMENT_CHANGED_Data

--- Оповещение о начале эффекта для элемента на панели управления.
---@class EVENT_ACTION_PANEL_ELEMENT_EFFECT_Data
---@field effect integer тип начавшегося эффекта
---@field index integer индекс элемента на панели управления
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах
---@field prepared boolean текущее значение флага prepared
---@field isActive boolean true, спелл стал активным

--- Событие присылается при окончании действия юнитом.
---@class EVENT_ACTION_PROGRESS_FINISH_Data

--- Событие присылается во время заморозки action.
---@class EVENT_ACTION_PROGRESS_FREEZE_Data
---@field progress integer обновление времени действия action

--- Событие присылается при запуске действия юнитом.
---@class EVENT_ACTION_PROGRESS_START_Data
---@field duration integer время действия "действия"
---@field progress integer прошло времени (так как событие может прийти с задержкой)
---@field name WString название действия
---@field launchWhenReady boolean если true то действие сработает сразу после окончания подготовки, если false, то действие можно приготовить и удерживать его запуск
---@field spellId SpellId если известен спелл, то присылается идентификатор спелла
---@field isPrecast boolean|nil если известен спелл, то присылается признак, что у спелла есть время прекаста
---@field isChannel boolean|nil если известен спелл, то присылается признак, что у спелла есть механика чаннелинга

--- Событие присылается во время действия action.
---@class EVENT_ACTION_PROGRESS_UPDATE_Data
---@field progress integer обновление времени действия action
---@field name WString название действия

--- Уведомление об особых результатах выполнения заклинания.
---@class EVENT_ACTION_RESULT_SPECIAL_SPELL_Data
---@field sysId string строковый код ошибки вида "ENUM_ACTION_RESULT_SPECIAL_...", значения:
---@field unitId ObjectId идентификатор юнита, ставшего непосредственной причиной данного уведомление
---@field targetId ObjectId|nil идентификатор объекта в которого выпущено заклинание(ENUM_ACTION_RESULT_SPECIAL_LAUNCHED)
---@field spellId SpellId идентификатор заклинания

--- Событие посылается каждый раз, когда у главного игрока меняется активное ездовое животное (он садится на него или слазит с него).
---@class EVENT_ACTIVE_MOUNT_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока поменялся скин ездового животного.
---@class EVENT_ACTIVE_MOUNT_SKIN_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока кардинально поменялось время жизни ездового животного (сколько времени осталось до исчезновения этого животного из конюшни).
---@class EVENT_ACTIVE_MOUNT_TIME_LEFT_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока меняется активный пет.
---@class EVENT_ACTIVE_PET_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока меняется активный пет. Близкий аналог EVENT_ACTIVE_PET_CHANGED.
---@class EVENT_ACTIVE_PET_EXIST_CHANGED_Data

--- Событие посылается каждый раз, когда у активного пета главного игрока меняется список или активное заклинание.
---@class EVENT_ACTIVE_PET_SPELLS_CHANGED_Data

--- Событие посылается каждый раз, когда у активного пета главного игрока меняется внутреннее состояние (тип движения, атаки или состояние боя).
---@class EVENT_ACTIVE_PET_STATE_CHANGED_Data

--- Событие присылается при изменении показателей состояния аддона. Основным показателем состояния является '''статус состояния аддона''' - количество ассертов возбуждаемых исполнением кода скрипта аддона. В зависимости от количества и частоты возбуждаемых ассертов статус состояния может принимать значения в диапазоне  ENUM_ADDON_HEALTH_STATUS_...
---@class EVENT_ADDON_HEALTH_CHANGED_Data
---@field sysName string системное имя аддона
---@field status number статус состояния аддона

--- Уведомление об изменении состояния аддона. Список возможных состояний смотри в  AddonState
---@class EVENT_ADDON_LOAD_STATE_CHANGED_Data
---@field name string Системное имя аддона
---@field state int Новое состояние аддона
---@field isUserAddon boolean Является ли аддон пользовательским

--- Событие присылается когда система фиксирует критически большое ухудшение производительность клиента из-за конкретного аддона.
---@class EVENT_ADDON_REDUCE_PERFOMANCE_Data
---@field sysName string системное имя аддона
---@field timeMs float среднее время обработки события аддоном (в миллисекундах)
---@field deltaFps number приблизительное количество кадров в секунду которые отнимает аддон
---@field maxDeltaFps number максимальное количество кадров в секунду которые отнимал аддон

--- Присылается, если сервер не смог осуществить какую-то операцию с другим игроком.
---@class EVENT_ADDRESSEE_NOT_FOUND_Data
---@field name WString имя другого игрока
---@field sysRequestType string
---@field sysCause string

--- Событие присылается при клике в террейн при активном AEMark. См. также  GamePosition.
---@class EVENT_AEMARK_POINT_CLICKED_Data

--- Событие посылается, когда игрок меняет статус AFK
---@class EVENT_AFK_STATE_CHANGED_Data
---@field id ObjectId Id игрока, меняющего статус AFK
---@field isAfk boolean новый статус AFK

--- Использование умения алхиии завершилось или было прервано.
---@class EVENT_ALCHEMY_CANCELED_Data
---@field isSuccess boolean false, если действие было прервано (например аватар двинулся\прыгнул или убит); true если действие завершилось нормально

--- Алхимический компонент удачно положен/вынут в алхимический слот с помощью avatar.PutAlchemyItemToSlot(itemId, slot).
---@class EVENT_ALCHEMY_ITEM_PLACED_Data
---@field slot integer номер слота
---@field placed boolean true если положен, false если вынут

--- Событие приходит, если игрок пытается положить в ступку предмет, но он не является алхимическим.
---@class EVENT_ALCHEMY_NOT_ALCHEMY_ITEM_Data

--- Событие приходит, когда не удалось добавить компонент в ступку из-за того что в сумке недостаточно таких предметов.
---@class EVENT_ALCHEMY_NOT_AVAILABLE_RESOURCES_Data
---@field itemId ObjectId идентификатор предмета который пытались положить
---@field slot number номер слота в который пытались положить

--- Событие приходит, если не хватает компонент для алхимии.
---@class EVENT_ALCHEMY_NOT_ENOUGH_COMPONENTS_Data

--- Завершён первый этап алхимической реакции.
---@class EVENT_ALCHEMY_REACTION_FINISHED_Data

--- Изменился список алхимических рецептов главного игрока.
---@class EVENT_ALCHEMY_RECIPES_CHANGED_Data

--- Изменился уровень умения алхимии главного игрока.
---@class EVENT_ALCHEMY_SCORE_CHANGED_Data

--- Умение алхиии начало действие после использования алхимического инструмента. Теперь можно положить ингредиенты, используя avatar.PutAlchemyItemToSlot( itemId, slot ).
---@class EVENT_ALCHEMY_STARTED_Data

--- Событие приходит при добавлении целей (смены статуса на активные)
---@class EVENT_ALLODS_GOAL_ADDED_Data

--- Событие приходит при изменении списка текущих целей аватара. Список целей можно получить при помощи функции  common.GetAllodsGoals()
---@class EVENT_ALLODS_GOAL_CHANGED_Data

--- Событие приходит при завершении целей (смены статуса на завершённые)
---@class EVENT_ALLODS_GOAL_COMPLETED_Data

--- Уведомление об изменении метора главного игрока, у которого главный игрок состоит в учениках.
---@class EVENT_APPRENTICE_MENTOR_CHANGED_Data

--- Событие посылается каждый раз, когда игрок переместился в другой астральный хаб.
---@class EVENT_ASTRAL_HUB_CHANGED_Data

--- Событие посылается каждый раз, когда игрок игрок попадает или уходит с астрального острова.
---@class EVENT_ASTRAL_ISLAND_CHANGED_Data

--- Событие посылается каждый раз, когда изменилось время коллапса астрального острова, на котором находится главный игрок.
---@class EVENT_ASTRAL_ISLAND_TIME_CHANGED_Data

--- Событие посылается, если изменилась доступность астрального объекта в хабе.
---@class EVENT_ASTRAL_OBJECT_ENABLED_CHANGED_Data
---@field objectId ObjectId идентификатор объекта

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает астральный объект.
---@class EVENT_ASTRAL_OBJECTS_CHANGED_Data
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся объектов
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших объектов

--- Событие посылается каждый раз, когда изменяется список точек проведения астральных ивентов .
---@class EVENT_ASTRAL_POIS_CHANGED_Data

--- Событие посылается каждый раз, когда игрок переместился в другой астральный сектор.
---@class EVENT_ASTRAL_SECTOR_CHANGED_Data

--- Событие возвращающее результат проверки группы на возможность совершения прыжка в выбранный сектор астрала до выбранной POI.
---@class EVENT_ASTRAL_SECTOR_CHECK_JUMP_RESULT_Data
---@field id ObjectId идентификатор выбранной POI
---@field sectorId AstralSectorId сектор астрала которому принадлежит выбранная POI
---@field isSuccess boolean true, если прыжек доступен. Проверка завершилась успешно
---@field failEntries table|nil если isSuccess == true, то nil. Список причин провала проверки (индексирован с 1), каждый элемент которого таблица с полями:
---@field failType string тип неудовлетворенного требования "ENUM_FailType_..."
---@field names table список имен аватаров (индексирован с 1) не удовлетворяющих требованию failType

--- Событие, если астральный моб изменил агрессивность по отношению к главному игроку.
---@class EVENT_ASTRAL_UNIT_AGGRO_CHANGED_Data
---@field id ObjectId Id астрального юнита

--- Событие присылается при изменении координат астрального моба.
---@class EVENT_ASTRAL_UNIT_POS_CHANGED_Data
---@field unitId ObjectId Id астрального юнита

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или астральный монстр.
---@class EVENT_ASTRAL_UNITS_CHANGED_Data
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся монстров
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших монстров

--- Событие посылается каждый раз, когда в астральном хабе корабль аватара подобрал обломки.
---@class EVENT_ASTRAL_WRECK_LOOT_TAKEN_Data
---@field count integer количество обломков

--- Событие посылается при изменении информации о доступных секторах для прыжка (быстрое путешествие).
---@class EVENT_ASTROLABE_INFO_CHANGED_Data
---@field id ObjectId идентификатор корабля

--- Оповещение об изменении спелла астролябии на корабле.
---@class EVENT_ASTROLABE_SPELL_CHANGED_Data
---@field id SpellId идентификатор ресурса спелла

--- Оповещение о начале эффекта для спелла астролябии на корабле.
---@class EVENT_ASTROLABE_SPELL_EFFECT_Data

--- Уведомление о неудачной немагической атаке. Более подробная информация - функция avatar.GetAttackResult (закрытая ссылка) библиотеки "avatar".
---@class EVENT_ATTACK_RESULT_Data

--- Событие приходит в ответ на запрос auction.Bid(id, price).
---@class EVENT_AUCTION_BID_RESULT_Data
---@field id ObjectId id аукциона
---@field sysResult string код результата

--- Событие приходит в ответ на запрос auction.CreateForItem( ... ).
---@class EVENT_AUCTION_CREATION_RESULT_Data
---@field sysResult string код результата

--- Событие приходит в ответ на запрос auction.Discard( id ).
---@class EVENT_AUCTION_DISCARD_RESULT_Data
---@field id ObjectId id аукциона
---@field sysResult string код результата

--- Событие приходит в ответ на запрос auction.GetProperties().
---@class EVENT_AUCTION_PROPERTIES_Data
---@field id ObjectId id аукциона
---@field sysResult string код результата

--- Событие приходит в ответ на запрос auction.Search( ... ).
---@class EVENT_AUCTION_SEARCH_RESULT_Data
---@field sysResult string код результата
---@field totalPagesCount integer количество страниц в аукционе

--- Событие приходит автоматически, если было необходимо обновить информацию об аукционе в результате auction.Bid( id ) или auction.Discard( id ) (сервер вернул код ошибки - OLD_VERSION).
---@class EVENT_AUCTION_UPDATE_RESULT_Data
---@field id ObjectId id аукциона
---@field sysResult string код результата

--- Присылается при обновлении информации о доступности орденов для вступления.
---@class EVENT_AVAILABLE_ORDERS_CHANGED_Data

--- Событие приходит, если главный игрок был добавлен в чей-то список друзей.
---@class EVENT_AVATAR_ADDED_TO_FRIEND_LIST_Data
---@field name WString имя добавившего

--- Событие посылается при изменении состояния жизни аватара.
---@class EVENT_AVATAR_ALIVE_CHANGED_Data
---@field alive boolean жив ли аватар

--- Событие приходит при любом изменении состояния барьеров (паладина).
---@class EVENT_AVATAR_BARRIERS_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока меняется привязанное транспортное средство (вызвал в ангаре/отозвал и т.п.).
---@class EVENT_AVATAR_BINDED_TRANSPORT_CHANGED_Data

--- Событие посылается в случае невозможности снять бафф с аватара с помощью avatar.RemoveBuff( buffIndex ).
---@class EVENT_AVATAR_BUFF_REMOVING_FAILED_Data

--- Событие присылается, когда меняется форма класса аватара.
---@class EVENT_AVATAR_CLASS_FORM_CHANGED_Data

--- Событие присылается при переходе аватара в другую зону. Уведомляет о более мелких (клиентских) подзонах чем  EVENT_AVATAR_ZONE_CHANGED.
---@class EVENT_AVATAR_CLIENT_ZONE_CHANGED_Data

--- Событие посылается при создании игрока.
---@class EVENT_AVATAR_CREATED_Data

--- Событие посылается каждый раз, когда меняется количество Очков Судьбы у персонажа игрока.
---@class EVENT_AVATAR_DESTINY_POINTS_CHANGED_Data
---@field total integer всего полученно/потеряно Очков Судьбы
---@field bonus integer сколько из этих Очков Судьбы было получено в качестве бонуса из бонусного пула

--- Событие присылается при изменении направления аватара более чем на 3 градуса.
---@class EVENT_AVATAR_DIR_CHANGED_Data
---@field dir number( угол в радианах от 0 до +-3.14

--- Игрок зашел в процедурный данж.
---@class EVENT_AVATAR_ENTER_PROCEDURAL_DUNGEON_Data

--- Событие посылается каждый раз, когда изменился опыт персонажа игрока.
---@class EVENT_AVATAR_EXPERIENCE_CHANGED_Data
---@field currentExp integer опыт персонажа
---@field currentLevelExp integer опыт для получения текущего уровня персонажа
---@field nextLevelExp integer опыт для получения следующего уровня персонажа
---@field extraExp integer накопленный бонусный опыт, который может быть переведен в текущий(currentExp) при помощи "Фолианта знаний"

--- Событие о добавлении персонажа в список друзей.
---@class EVENT_AVATAR_FRIEND_ADDED_Data
---@field name WString имя персонажа

--- Событие приходит при изменении имени реморта друга.
---@class EVENT_AVATAR_FRIEND_ALT_NAME_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name Wstring имя персонажа
---@field altName Wstring имя реморта персонажа

--- Событие приходит при изменении описания друга.
---@class EVENT_AVATAR_FRIEND_DESCRIPTION_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока

--- Событие приходит при неудачной операции со списком друзей/игнорирования.
---@class EVENT_AVATAR_FRIEND_IGNORE_LISTS_ERROR_Data
---@field sysError string код ошибки

--- Событие приходит при изменении изменились базовых полей описания друга.
---@class EVENT_AVATAR_FRIEND_INFO_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name WString имя друга

--- Событие приходит при изменении уровня друга.
---@class EVENT_AVATAR_FRIEND_LEVEL_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name WString имя персонажа
---@field level integer новый уровень персонажа

--- Событие приходит при изменении списка друзей.
---@class EVENT_AVATAR_FRIEND_LIST_CHANGED_Data

--- Событие приходит при завершении загрузки списка друзей с сервера.
---@class EVENT_AVATAR_FRIEND_LIST_LOADED_Data

--- Событие приходит при изменении настроения друга.
---@class EVENT_AVATAR_FRIEND_MOOD_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока

--- Событие приходит при изменении состояния взаимности друга.
---@class EVENT_AVATAR_FRIEND_MUTUAL_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name WString имя персонажа
---@field isMutual boolean состояние взаимности персонажа

--- Событие приходит при изменении состояния онлайн друга.
---@class EVENT_AVATAR_FRIEND_ONLINE_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name WString имя персонажа
---@field isOnline boolean находится ли персонаж в онлайне
---@field sysStatus string онлайн состояние персонажа

--- Уведомление об удалении персонажа из списка друзей.
---@class EVENT_AVATAR_FRIEND_REMOVED_Data
---@field name WString имя персонажа

--- Событие приходит при изменении пола друга.
---@class EVENT_AVATAR_FRIEND_SEX_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока

--- Событие приходит при изменении карты, на которой находится друг.
---@class EVENT_AVATAR_FRIEND_ZONE_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока
---@field name WString имя персонажа
---@field mapId ObjectId|nil идентификатор карты, на которой находится персонаж, если она известна

--- Уведомление о добавлении персонажа в список игнорирования.
---@class EVENT_AVATAR_IGNORE_ADDED_Data
---@field id ObjectId идентификатор элемента из списка игнорирования
---@field name WString имя персонажа

--- Событие приходит при изменении описания игнорируемого игрока.
---@class EVENT_AVATAR_IGNORE_DESCRIPTION_CHANGED_Data
---@field id ObjectId идентификатор элемента списка друзей главного игрока

--- Событие приходит при изменении списка игнорирования.
---@class EVENT_AVATAR_IGNORE_LIST_CHANGED_Data

--- Событие приходит при завершении загрузки игнор листа с сервера.
---@class EVENT_AVATAR_IGNORE_LIST_LOADED_Data

--- Уведомление об удалении персонажа из списка игнорирования.
---@class EVENT_AVATAR_IGNORE_REMOVED_Data
---@field name WString имя персонажа

--- Сообщение приходит, когда главный игрок теряет предмет. В сообщеннии приходит ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
---@class EVENT_AVATAR_ITEM_DROPPED_Data
---@field itemObject ValuedObject объект, содержащий информацию о предмете
---@field actionType string откуда взялся предмет

--- Сообщение приходит, когда главный игрок получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
---@class EVENT_AVATAR_ITEM_TAKEN_Data
---@field itemObject ValuedObject объект, содержащий информацию о предмете
---@field actionType string откуда взялся предмет

--- Сообщение приходит, когда согрупник или соотрядник главного игрока получает предмет. В сообщеннии приходит  ValuedObject - объект, в котором содержится информация о предмете. Этот объект можно добавлять в какой либо ValuedText.
---@class EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE_Data
---@field playerId ObjectId|nil идентификатор согрупника, если возможно его получить
---@field itemObject ValuedObject объект, содержащий информацию о предмете
---@field actionType string откуда взялся предмет

--- Игрок вышел из процедурного данжа.
---@class EVENT_AVATAR_LEAVE_PROCEDURAL_DUNGEON_Data

--- Событие присылается, если игрок отменил выход из миссии (с помощью mission.CancelLogout()).
---@class EVENT_AVATAR_LOGOUT_CANCELLED_Data

--- Событие присылается при переходе аватара на другую карту.
---@class EVENT_AVATAR_MAP_CHANGED_Data

--- Событие присылается когда становится доступна информация о местонахождении аватара. Только после этого события можно пытаться вызывать функции связанные с картой.
---@class EVENT_AVATAR_MAP_INFO_AVAILABLE_Data

--- Событие присылается, если изменились модификаторы карты на карте главного игрока.
---@class EVENT_AVATAR_MAP_MODIFIERS_CHANGED_Data

--- Уведомление о выполнении достижения аватаром.
---@class EVENT_AVATAR_MEDAL_FINISHED_Data
---@field id ObjectId идентификатор достижения

--- Событие посылается каждый раз, когда изменилось количество денег у игрока.
---@class EVENT_AVATAR_MONEY_CHANGED_Data

--- Сообщение приходит, когда главный игрок потерял деньги.
---@class EVENT_AVATAR_MONEY_DROPPED_Data
---@field money integer количество денег
---@field actionType string почему потеряны деньги

--- Сообщение приходит, когда главный игрок получает деньги.
---@class EVENT_AVATAR_MONEY_TAKEN_Data
---@field money integer количество денег
---@field actionType string откуда получены деньги

--- Сообщение приходит, когда согрупник или соотрядник главного игрока получает деньги.
---@class EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE_Data
---@field playerId ObjectId|nil идентификатор согрупника, если возможно его получить
---@field money integer количество денег
---@field actionType string откуда взялся предмет

--- Событие присылается при изменении координат аватара.
---@class EVENT_AVATAR_POS_CHANGED_Data

--- Приходит, если главный игрок получил один из типов опыта для развития. Это может быть обычный опыт (experience), репутация с какой-либо фракцией, слава за PvP сражения.
---@class EVENT_AVATAR_PROGRESS_GAINED_Data
---@field type integer тип опыта
---@field sysType string строковое представление типа опыта
---@field source integer тип источника опыта
---@field sysSource string строковое представление типа источника опыта
---@field total number полученное количество опыта
---@field bonus number сколько из этого опыта было получено за бонусные очки
---@field level number уровень
---@field value number текущее значение
---@field isPvPExperience boolean этот опыт был получен за PvP
---@field factionId FactionId фракция

--- Событие посылается каждый раз, когда меняется доступ в классовый канал чата псиоников.
---@class EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED_Data

--- Событие посылается каждый раз, когда у псионика (основного игрока) появляется псионический контакт.
---@class EVENT_AVATAR_PSIONIC_CONTACT_ADDED_Data
---@field type integer тип контакта

--- Событие посылается каждый раз, когда у псионика (основного игрока) меняется состояние (цель или длительность (durationMs, но не remainingMs)) определенного псионического контакта.
---@class EVENT_AVATAR_PSIONIC_CONTACT_CHANGED_Data
---@field type integer тип контакта

--- Событие посылается каждый раз, когда у псионика (основного игрока) исчезает псионический контакт.
---@class EVENT_AVATAR_PSIONIC_CONTACT_REMOVED_Data
---@field type integer тип контакта

--- Событие приходит периодически, когда псионик определяет, что около него есть вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка). Периодичность события определяется серверной механикой.
---@class EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED_Data
---@field octant integer номер октанта, в котором замечен враг
---@field hidden boolean true, если враг невидим

--- Событие посылается каждый раз, когда псионик определяет, что его поселектил вражеский PC. Для этого он должен использовать способность  DangerSense (закрытая ссылка).
---@class EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET_Data
---@field unitId ObjectId id игрока, поселектившего псионика

--- Событие посылается каждый раз, когда псионик читает мысли другого игрока или NPC. Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
---@class EVENT_AVATAR_PSIONIC_READ_THOUGHT_Data
---@field unitId ObjectId id юнита, у которого прочитали мысль
---@field thought WString сама мысль

--- Событие посылается каждый раз, когда псионик читает мысли другого игрока, но не может их понять (противоположная фракция). Для этого он должен обладать пассивным умением  ReadThoughts (закрытая ссылка).
---@class EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT_Data
---@field unitId ObjectId id юнита, у которого прочитали мысль
---@field factionName WString имя фракции (того игрока, мысль которого прочитал псионик)

--- Событие посылается каждый раз, когда у сталкера (основного игрока) меняется что-либо в колчане.
---@class EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED_Data

--- Событие посылается при появлении барьеров дамага у лучника.
---@class EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED_Data

--- Событие посылается при изменении состояния барьеров дамага у лучника.
---@class EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED_Data

--- Событие посылается при исчезновении барьеров дамага у лучника.
---@class EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED_Data

--- Приходит, если изменилась возможность распределять пункты характеристик.
---@class EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED_Data

--- Изменение статов аватара: базовых, брони, сопротивляемости.
---@class EVENT_AVATAR_STATS_CHANGED_Data

--- Событие приходит при смене таргета игроком.
---@class EVENT_AVATAR_TARGET_CHANGED_Data
---@field isTargetDead boolean|nil true, когда таргет поменялся в результате его смерти, иначе nil

--- Событие с рекомендацией сервера об изменении цели аватара на указанную.
---@class EVENT_AVATAR_TARGET_RECOMMENDED_Data
---@field targetId ObjectId рекомендуемая цель

--- Событие посылается при изменении основной цели основной цели (это не опечатка) аватара.
---@class EVENT_AVATAR_TARGET_TARGET_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока меняется транспортное средство (появляется, исчезает).
---@class EVENT_AVATAR_TRANSPORT_CHANGED_Data

--- Уведомление о получении какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
---@class EVENT_AVATAR_UNLOCK_ADDED_Data
---@field unlockId ObjectId идентификатор анлока
---@field unlockName WString название анлока
---@field unlockEndTime integer|nil дата окончания действия анлока, если анлок временный, иначе nil

--- Уведомление о изменении состояния анлока.
---@class EVENT_AVATAR_UNLOCK_CHANGED_Data
---@field id ObjectId идентификатор анлока

--- Уведомление о потере какого-либо анлока главным игроком. Например, может измениться доступность слота для экипировки и т.д.
---@class EVENT_AVATAR_UNLOCK_REMOVED_Data
---@field unlockId ObjectId идентификатор анлока
---@field unlockName WString название анлока

--- Уведомление об изменении состояний залоченности для аватара. Например, может измениться доступность слота для экипировки и т.д.
---@class EVENT_AVATAR_UNLOCKS_CHANGED_Data

--- Событие присылается при смене (получении, потере) используемого устройства.
---@class EVENT_AVATAR_USED_OBJECT_CHANGED_Data

--- Событие посылается при изменении режима движения игрока (шагом/бегом).
---@class EVENT_AVATAR_WALK_MODE_CHANGED_Data

--- Событие посылается каждый раз, когда у основного игрока-война (Warrior) меняется боевой дух.
---@class EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED_Data

--- Событие посылается при появлении барьера дамага у воина.
---@class EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED_Data

--- Событие посылается при изменении состояния барьера дамага у воина.
---@class EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED_Data
---@field value integer текущее значение дамага в барьере воина
---@field limit integer предельное значение дамага в барьере воина

--- Событие посылается при исчезновении барьера дамага у воина.
---@class EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED_Data

--- Событие присылается раз в секунду после того, как если игрок пытается выйти из миссии (mission.Logout()), но находится в бою. В этом случае выход будет отложен на некоторое время.
---@class EVENT_AVATAR_WILL_BE_REMOVED_Data
---@field delay integer количество секунд до окончательного выхода из миссии.

--- Серверное событие о переходе персонажа в другую зону. Для более подробного уведомления (но только при наличии UI) следует использовать (клиентское):  EVENT_AVATAR_CLIENT_ZONE_CHANGED.
---@class EVENT_AVATAR_ZONE_CHANGED_Data

--- Посылается каждый раз, когда появляется информация о новой контрольной точке баттлграунда.
---@class EVENT_BATTLEGROUND_CHECKPOINT_ADDED_Data
---@field id ObjectId id появившейся контрольной точки

--- Посылается каждый раз, когда информация о контрольной точке баттлграунда становится недоступной (контрольная точка по каким-либо причинам удаляется).
---@class EVENT_BATTLEGROUND_CHECKPOINT_REMOVED_Data
---@field id ObjectId id контрольной точки

--- Посылается каждый раз, когда меняется состояние контрольной точки баттлграунда.
---@class EVENT_BATTLEGROUND_CHECKPOINT_STATE_CHANGED_Data
---@field checkpointId ObjectId id контрольной точки, чьё состояние изменилось

--- Посылается каждый раз, когда изменяется информация о контрольных точках баттлграунда (добавляются-удаляются, меняется состояние и т.п.).
---@class EVENT_BATTLEGROUND_CHECKPOINTS_CHANGED_Data

--- Событие посылается в момент выстрела (тика) из лучемета. В этот момент уже известно, есть попадания или нет. Если нет, то targets = nil.
---@class EVENT_BEAM_CANNON_SHOT_STARTED_Data
---@field id ObjectId id устройства (тип устройства USDEV_BEAM_CANNON)
---@field targets ObjectId[] таблица (индексированная с 1) id целей. Если попаданий нет то nil.

--- Оповещение об изменении возможности телепортации обратно от побратима к начальной позиции.
---@class EVENT_BEST_FRIEND_RETURN_STATE_CHANGED_Data

--- Событие приходит, если изменилось состояние спелла для телепортации к побратиму.
---@class EVENT_BEST_FRIEND_TELEPORT_SPELL_CHANGED_Data
---@field id SpellId идентификатор ресурса спелла

--- Оповещение о начале эффекта для спелла телепортации к побратиму.
---@class EVENT_BEST_FRIEND_TELEPORT_SPELL_EFFECT_Data

--- Оповещение об изменении возможности телепортации к побратиму.
---@class EVENT_BEST_FRIEND_TELEPORT_STATE_CHANGED_Data

--- Уведомление о том, что изменилась, добавлена или удалена информация о бонусе (та её часть, которая не требует  rules.BillingInfoUpdate()).
---@class EVENT_BILLINGINFO_BONUS_CHANGED_Data
---@field bonusId BillingBonusId id бонуса, про который событие

--- Уведомление о том, что пришёл ответ на запрос об обновлении информации о бонусах (см. rules.BillingInfoUpdate()).
---@class EVENT_BILLINGINFO_BONUS_STATUS_CHANGED_Data
---@field status String удачно ли выполнен запрос или по какой причине неудача

--- Событие вызывается при изменении состояния пользовательского биндинга клавиш (при работе через библиотеку binding).
---@class EVENT_BINDING_CHANGED_Data

--- Приходит, если изменился дополнительный бонус к прогрессу персонажа.
---@class EVENT_BONUS_POOL_CHANGED_Data
---@field type integer тип бонуса
---@field sysType string строковое представление типа бонуса

--- Приходит, если изменился список дополнительных бонусов к прогрессу персонажа.
---@class EVENT_BONUS_POOLS_CHANGED_Data

--- Уведомление о результате взаимодействия с сундучком.
---@class EVENT_BOX_OPERATION_RESULT_Data
---@field sysResult string код результата

--- Событие присылается, если изменился известный набор объявлений на доске.
---@class EVENT_BULLETIN_BOARD_CHANGED_Data

--- Событие присылается, если изменилось состояние операции с доской объявлений.
---@class EVENT_BULLETIN_BOARD_OPERATION_IN_PROGRESS_CHANGED_Data
---@field postId integer идентификатор объявления

--- Событие присылается, если на доске объявлений появилось объявление.
---@class EVENT_BULLETIN_BOARD_POST_ADDED_Data
---@field id integer идентификатор объявления

--- Событие присылается, если на доске объявлений изменилось поле объявление (уровень, онлайн, зона, время).
---@class EVENT_BULLETIN_BOARD_POST_CHANGED_Data
---@field id integer идентификатор объявления

--- Событие присылается периодически, при изменении стоимости вызова искры, когда главный игрок находится в состоянии воскрешения (умер и находится на кладбище, ожидая свою искру).
---@class EVENT_CALL_SPARK_COST_CHANGED_Data

--- Событие присылается, если не получилось вызвать искру главного игрока, находящегося на кладбище. Вызов искры инициирует avatar.CallSpark().
---@class EVENT_CALL_SPARK_FAILED_Data

--- Событие посылается каждый раз, когда у камеры меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
---@class EVENT_CAMERA_DIRECTION_CHANGED_Data

--- Присылается в ответ на запрос guild.CanCreateGuildHereRequest( inventorySlot ).
---@class EVENT_CAN_CREATE_GUILD_HERE_RESPONSE_Data
---@field success boolean можно ли создать гильдию в данном месте

--- Событие посылается в момент попадания выстрела из пушки в цель (или просто окончании полета снаряда).
---@class EVENT_CANNON_SHOT_FINISHED_Data
---@field id ObjectId id устройства
---@field target ObjectId id цели (интерактивный объект)

--- Событие посылается в момент начала каста выстрела из пушки.
---@class EVENT_CANNON_SHOT_PREPARATION_STARTED_Data
---@field id ObjectId id устройства (пушки)
---@field preparationTimeMs integer время подготовки выстрела

--- Событие посылается в момент выстрела из пушки. В этот момент уже известно, попала пушка в цель или нет. Если промазала, то target = nil.
---@class EVENT_CANNON_SHOT_STARTED_Data
---@field id ObjectId id устройства (тип устройства USDEV_CANNON)
---@field target ObjectId id цели (интерактивный объект)

--- Событие посылается при изменении цели пушки управляемой игроком(любого орудия с активным прицелом).
---@class EVENT_CANNON_TARGET_CHANGE_Data
---@field target integer

--- Событие посылается, если не удалось привязать Widget3D к определенному объекту.
---@class EVENT_CANNOT_ATTACH_WIDGET_3D_Data
---@field objectId ObjectId Id объекта (юнит или устройство)

--- Событие, уведомляющее о невозможности выхода из игры в бою.
---@class EVENT_CANT_LEAVE_GAME_IN_COMBAT_Data

--- Сообщение о невозможности полутить исчезнувший объект. Например, кто-то уже полутил сундук или моба до того, как сервер успел сообщить об этом на другой клиент.
---@class EVENT_CANT_LOOT_DISAPPEARED_LOOT_BAG_Data

--- Уведомление о невозможности отправить сообщение в чат. Сообщения нельзя отсылать чаще, чем через определенный интервал времени для предотвращения спама.
---@class EVENT_CANT_SEND_CHAT_BY_DELAY_Data
---@field delayMs integer допустимый интервал между сообщениями в чат в миллисекундах

--- В режиме парикмахерской, камера закончила движение после вызова сhangeRoom.SetCameraPath(...).
---@class EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY_Data

--- Событие приходит, если необходимо открыть интерфейс парикмахерской.
---@class EVENT_CHANGE_ROOM_STARTED_Data

--- В режиме парикмахерской, камера может назумливаться на лицо персонажа. При изменении состояния назумленности (на лицо, на максимум, в середине) или возможности назумливаться приходит это сообщение.
---@class EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED_Data

--- Событие посылается при изменении состояния смены класса - когда требуется выбрать замены для вещей на соответствующие новому классу и когда такая необходимость отпадает.
---@class EVENT_CHARACTER_CLASS_CHANGER_CHANGED_Data

--- Событие посылается когда аватар лишен права писать сообщения в чат.
---@class EVENT_CHAT_AVATAR_MUTED_Data
---@field reason WString причина
---@field durationMinutes integer продолжительность в минутах
---@field time table таблица с информацией о времени отправки сообщения (локальное время сервера). Поля:
---@field h integer час
---@field m integer минута
---@field s integer секунда

--- Событие посылается для каждого нового сообщения, пришедшего в чат. Если сообщение является эхом (включено в настройках по умолчанию), то это то сообщение, которое мы изначально попытались отправить.
---@class EVENT_CHAT_MESSAGE_Data
---@field sender WString имя отправителя (игрока или моба)
---@field shard WString название сервера отправителя
---@field senderUniqueId UniqueId|nil уникальный идентификатор персонажа-отправителя
---@field senderId ObjectId идентификатор персонажа-отправителя или nil, если данная информация недоступна (например, если игрок не отреплицирован)
---@field chatType integer тип сообщения
---@field isEcho boolean является ли сообщение эхом
---@field recipient WString имя получателя
---@field isAlive boolean жив игрок (может действовать) или нет (мертв или в числилище)
---@field msg WString текст сообщения
---@field spamWeight integer спам-вес сообщения. если меньше 100, то не спам, иначе - спам

--- Событие, которое приходит при невозможности отослать сообщение в чат, поскольку сообщение подпадает под критерии флуда (множетво одинаковых сообщений, следующих с высокой частотой).
---@class EVENT_CHAT_MESSAGE_IS_FLOOD_Data
---@field cooldownMs integer время (в миллисекундах), которое должно пройти до момента, когда сообщение может быть послано в чат.

--- Событие, которое приходит при невозможности доставить сообщение в чат.
---@class EVENT_CHAT_MESSAGE_REJECTED_Data
---@field sysReason string причина неудачной отправки сообщения.
---@field time table таблица с информацией о времени прихода сообщения. Поля:
---@field h integer часы
---@field m integer минуты
---@field s integer секунды
---@field expiredTime nil Если ограничения нет, то nil, иначе таблица с полями о том, сколько времени осталось:
---@field d integer дней

--- Событие посылается для каждого нового сообщения, пришедшего в чат. Если сообщение является эхом (включено в настройках по умолчанию), то это то сообщение, которое мы изначально попытались отправить.
---@class EVENT_CHAT_MESSAGE_WITH_OBJECTS_Data
---@field sender WString имя отправителя (игрока или моба)
---@field shard WString название сервера отправителя
---@field senderUniqueId UniqueId|nil уникальный идентификатор персонажа-отправителя
---@field senderId ObjectId|nil идентификатор персонажа-отправителя или nil, если данная информация недоступна (например, если игрок не отреплицирован)
---@field recipientUniqueId UniqueId|nil уникальный идентификатор персонажа-получателя или nil, если данная информация недоступна
---@field recipientId ObjectId|nil идентификатор персонажа-получателя или nil, если данная информация недоступна
---@field chatType integer тип сообщения
---@field isEcho boolean является ли сообщение эхом
---@field time table таблица с информацией о времени отправки сообщения (локальное время сервера). Поля:
---@field h integer час
---@field m integer минута
---@field s integer секунда
---@field recipient WString имя получателя
---@field isAlive boolean жив игрок (может действовать) или нет (мертв или в числилище)
---@field messages table
---@field text WString|nil если не nil, то текстовый фрагмент
---@field spamWeight integer|nil спам-вес для текстового фрагмента сообщения, если меньше 100, то не спам, иначе - спам
---@field item ValuedObject|nil если не nil, то подстановочный объект, содержащий информацию о предмете
---@field medal ValuedObject|nil если не nil, то подстановочный объект, содержащий информацию о достижении

--- Ошибка при работе с именноваными каналами.
---@class EVENT_CHAT_NAMED_ERROR_Data
---@field sysResult string строковый код ошибки

--- Событие посылается для в случае отсылки личного сообщения игроку, который в данный момент находится в игре под своим альтернативным персонажем.
---@class EVENT_CHAT_SENT_TO_ALT_Data
---@field altName WString имя альтернативного персонажа, который на самом деле получит сообщение

--- Событие посылается, когда игрок запросил  checkroomLib.Open() или  checkroomLib.Close() и произошла передача на клиент или было убрано с клиента содержимое гардероба.
---@class EVENT_CHECKROOM_CHANGED_Data

--- Событие возникающее при добавлении одежды в гардероб.
---@class EVENT_CHECKROOM_ITEM_ADDED_Data
---@field itemId ObjectId идентификатор добавленного предмета

--- Событие посылается, приходит при изменении полей предмета в гардеробе. Например, при надевании или снимании.
---@class EVENT_CHECKROOM_ITEM_CHANGED_Data
---@field itemId ObjectId идентификатор гардеробного предмета

--- Событие посылается при изменении состояния устройства. Например, устройство кто-то стал использовать.
---@class EVENT_CHEST_LOOTER_CHANGED_Data
---@field deviceId number id устройства

--- Уведомление об окончании показа 2D-изображение на весь экран, если такое было показано и для него имелось время автоматического скрытия.
---@class EVENT_CLIENT_IMAGE_HIDE_ALL_Data

--- Уведомление о приходе на клиент события, для которого необходимо показать 2D-изображение на весь экран.
---@class EVENT_CLIENT_IMAGE_SHOW_Data
---@field objectId ObjectId|nil интерактивный объект, от которого пришло сообщение, если такая информация доступна
---@field name WString название изображения
---@field description WString описание изображения
---@field sysId string|nil системное строковое описание, если указано
---@field timeoutMs integer|nil количество миллисекунд, через которое необходимо автоматически скрыть изображение
---@field image TextureId|nil идентификатор текстуры изображения

--- Уведомление о приходе на клиент текстового сообщения.
---@class EVENT_CLIENT_MESSAGE_Data

--- Событие посылается, если изменилось некоторое условие, заданное дизанерами. Информацию см.  avatar.IsConditionValid( alias ).
---@class EVENT_CONDITION_EVENT_Data
---@field alias string строковое обозначение события
---@field isValid boolean true, условие выполняется

--- Уведомление об изменении контейнера главного игрока.
---@class EVENT_CONTAINER_CHANGED_Data
---@field slotType integer тип контейнера

--- Событие о появлении предмета в слоте контейнера главного игрока по любой причине. Это может быть и появление нового предмета, и перетаскивание имеющегося в сумке и тестовый чит.
---@class EVENT_CONTAINER_ITEM_ADDED_Data
---@field ownerId ObjectId идентификатор владельца
---@field slotType integer тип контейнера
---@field slot integer индекс слота в сумке [0..]
---@field itemId ObjectId идентификатор предмета
---@field sysName string внутреннее имя предмета
---@field isNewItem boolean true, если предмет был действительно добавлен в контейнер, а не просто был перемещен внутри него

--- Уведомление об изменении какого-либо свойства предмета в слоте контейнера главного игрока.
---@class EVENT_CONTAINER_ITEM_CHANGED_Data
---@field ownerId ObjectId идентификатор владельца
---@field slotType integer тип контейнера
---@field slot integer индекс слота в хранилище
---@field itemId ObjectId идентификатор предмета

--- Оповещение о начале эффекта для элемента в каком-либо контейнере.
---@class EVENT_CONTAINER_ITEM_EFFECT_Data
---@field effect integer тип начавшегося эффекта
---@field itemId ObjectId id итема
---@field slot integer слот, в котором лежит данный итем
---@field slotType integer тип контейнера, в слоте которого лежит данный итем
---@field duration integer общая продолжительность
---@field remaining integer оставшееся время

--- Событие об исчезновении предмета из слота контейнера главного игрока.
---@class EVENT_CONTAINER_ITEM_REMOVED_Data
---@field ownerId ObjectId идентификатор владельца
---@field slotType integer тип контейнера
---@field slot integer индекс слота в сумке [0..]
---@field itemId ObjectId идентификатор предмета
---@field sysName string внутреннее имя предмета
---@field isRemovedItem boolean true, если предмет был действительно удален из контейнера, а не просто был перемещен внутри него

--- Событие присылается, если необходимо начать отслеживание точки применения контекстного дейтсвия.
---@class EVENT_CONTEXT_ACTION_POINT_STARTED_Data
---@field id ObjectId идентификатор контекстного действия

--- Событие присылается при изменении контекстных действий. Мог измениться список контекстных действий или флаг  enabled какого-либо контекстного действия.
---@class EVENT_CONTEXT_ACTIONS_CHANGED_Data

--- Событие присылается при изменении координат цели прицела главного игрока.
---@class EVENT_CROSSHAIR_TARGET_POS_CHANGED_Data
---@field objectId ObjectId Id юнита

--- Изменился список игровых альтернативных валют, имеющихся у игрока.
---@class EVENT_CURRENCIES_CHANGED_Data

--- Присылается, если закончился процесс обмена валют. Нужно скрыть интерфейс обмена.
---@class EVENT_CURRENCY_EXCHANGE_FINISHED_Data

--- Присылается, если изменились параметры сервиса обмена валют.
---@class EVENT_CURRENCY_EXCHANGE_INFO_CHANGED_Data

--- Присылается, если начался процесс обмена валют. Нужно показать интерфейс обмена.
---@class EVENT_CURRENCY_EXCHANGE_STARTED_Data

--- Событие присылается при попытке что-либо приобрести при недостаточном количестве игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
---@class EVENT_CURRENCY_NOT_ENOUGH_Data
---@field id CurrencyId идентификатор альтернативной валюты.

--- Событие присылается при изменении количества игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
---@class EVENT_CURRENCY_VALUE_CHANGED_Data
---@field id CurrencyId идентификатор альтернативной валюты.
---@field delta integer число на которое изменилось значение валюты (может быть как положительным, так и отрицательным)
---@field sysName string внутреннее имя альтернативной валюты

--- Событие посылается каждый раз, когда сменяется текущий квест. Например когда текущим назначается другой квест или когда текущий квест завершается или сбрасывается.
---@class EVENT_CURRENT_QUEST_CHANGED_Data
---@field questId QuestId id квеста, ставшего текущим; если nil, значит текщего квеста нет

--- Текстовая эмоция (/emote) от другого игрока.
---@class EVENT_CUSTOM_EMOTE_Data
---@field id ObjectId от кого пришло сообщение
---@field targetId ObjectId цель сообщения или nil
---@field text WString текстовое сообщение
---@field isAlive boolean жив игрок (может действовать) или нет (мертв или в чистилище)

--- Событие посылается каждый раз, когда главный игрок меняет активный слот кастомизации.
---@class EVENT_CUSTOMIZATION_ACTIVE_SLOT_CHANGED_Data

--- Событие посылается каждый раз, когда главный игрок меняет содержимое (ставит/снимает/меняет моба) активного слота кастомизации.
---@class EVENT_CUSTOMIZATION_ACTIVE_SLOT_CONTENT_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока меняется состояние кастомизации (он начал/закончил кастомизировать какое-либо помещение или объект).
---@class EVENT_CUSTOMIZATION_STATE_CHANGED_Data

--- Событие посылается каждый раз, когда изменилось состояние умения или заклинания, не привязанного к книге заклинаний.
---@class EVENT_DEFAULT_SPELL_CHANGED_Data

--- Оповещение о начале эффекта для спелла не привязанного к книге заклинаний.
---@class EVENT_DEFAULT_SPELL_EFFECT_Data
---@field effect integer тип начавшегося эффекта
---@field id SpellId Id ресурса умения ( этот параметр НЕ УБИРАТЬ )
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах
---@field prepared boolean текущее значение флага prepared
---@field isActive boolean true, спелл стал активным
---@field objectId ObjectId|nil идентификатор предмета к которому привязан данный спелл

--- Уведомление об изменении состояния хранилища.
---@class EVENT_DEPOSITE_BOX_CHANGED_Data

--- Событие посылается каждый раз, когда у одного из действий используемого устройства (например, выстрел огнём у пушки) изменилась эффективность.
---@class EVENT_DEVICE_ACTION_EFFECTIVENESS_CHANGED_Data
---@field id ObjectId Id устройства
---@field action integer номер экшена
---@field isEffective boolean false, если действие стало не эффективно

--- Событие посылается каждый раз, когда у используемого устройства (например, рули, пушки на корабле) изменилось активное действие.
---@class EVENT_DEVICE_ACTIVE_ACTION_CHANGED_Data
---@field id ObjectId Id устройства

--- Событие посылается каждый раз, когда у одного экшена используемого устройства (например, выстрел огнём из пушки) закончился кулдаун.
---@class EVENT_DEVICE_COOLDOWN_FINISHED_Data
---@field id ObjectId Id устройства
---@field action integer номер экшена

--- Событие посылается каждый раз, когда у одного экшена используемого устройства (например, выстрел огнём у пушки) начинается кулдаун.
---@class EVENT_DEVICE_COOLDOWN_STARTED_Data
---@field id ObjectId Id устройства
---@field action integer номер экшена

--- Событие посылается каждый раз, когда у какого-либо дейсвия используемого устройства (например, поворот вправо у руля) меняется состояние доступности. См. avatar.GetUsableDeviceInfo().
---@class EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED_Data
---@field id ObjectId Id устройства

--- Событие присылается при нанесение повреждения устройству. См. EVENT_UNIT_DAMAGE_RECEIVED.
---@class EVENT_DEVICE_DAMAGE_RECEIVED_Data

--- Событие присылается при изменение статуса смерти устройства (готово или уже использовано).
---@class EVENT_DEVICE_DEAD_CHANGED_Data
---@field deviceId ObjectId идентификатор устройства

--- Событие посылается каждый раз, когда используемое устройство (например, рули, пушки на корабле) включается или выключается.
---@class EVENT_DEVICE_OFFLINE_CHANGED_Data
---@field id ObjectId Id устройства

--- Событие посылается каждый раз, когда поюзанное устройство (например, рули, пушки на корабле) выключенно. Содержит причину.
---@class EVENT_DEVICE_OFFLINE_REASON_Data
---@field id ObjectId Id устройства
---@field sysReason string причина, по которой девайс выключен

--- Приходит, если изменился список заданий, связанных с устройством.
---@class EVENT_DEVICE_RELATED_QUESTS_CHANGED_Data
---@field deviceId ObjectId идентификатор устройства

--- Событие посылается при попытке повернуть руль на нулевой скорости.
---@class EVENT_DEVICE_ZERO_SPEED_Data
---@field id ObjectId Id руля (устройства)

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает устройство (например улей или доска объявлений).
---@class EVENT_DEVICES_CHANGED_Data
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся устройств
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших устройств

--- Выключён режим крафтинга (создания вещей).
---@class EVENT_DICE_CRAFT_CANCELED_Data
---@field skillId SkillId Id умения (скила)

--- Одна из команд, используемых для крафтинга, завершилась неудачей, состояние крафтинга не изменилось.
---@class EVENT_DICE_CRAFT_CMD_FAILED_Data
---@field skillId SkillId Id умения (скила)
---@field cmdType string какая именно команда не выполнена

--- Завершёно созание вещи, режим крафтинга (создание вещей) остаётся включен.
---@class EVENT_DICE_CRAFT_FINISHED_Data
---@field skillId SkillId Id умения (скила)

--- Событие приходит, если не хватает компонент.
---@class EVENT_DICE_CRAFT_NOT_ENOUGH_COMPONENTS_Data
---@field skillId SkillId Id умения (скила)

--- Включён режим выбора рецептов крафтинга (создание вещей) - приходит когда включается крафтинг или мини-игра крафтинга завершилась без выхода из крафтинга (если мини-игра завершилась выходом из крафтинга - приходит EVENT_DICE_CRAFT_CANCELED).
---@class EVENT_DICE_CRAFT_PREPARED_Data
---@field skillId SkillId Id умения (скила)
---@field isInitial boolean true, если событие пришло при включении режима крафтинга; false - при завершении мини-игры
---@field tool ObjectId Id инструмента, использованного для старта мини-игры

--- Изменился список рецептов.
---@class EVENT_DICE_CRAFT_RECIPES_CHANGED_Data
---@field skillId SkillId Id умения (скила)

--- Изменился уровень умения крафтинга.
---@class EVENT_DICE_CRAFT_SCORE_CHANGED_Data
---@field skillId SkillId Id умения (скила)

--- Изменилось содержимое одного из слотов (добавлен/убран/заменён предмет).
---@class EVENT_DICE_CRAFT_SLOT_CHANGED_Data
---@field skillId SkillId Id умения (скила)
---@field slot integer номер слота
---@field itemId ObjectId nil если слот пуст; иначе идентификатор предмета

--- Обновилась информация о состоянии текущго сеанса крафтинга (был очередной реролл).
---@class EVENT_DICE_CRAFT_STATUS_CHANGED_Data
---@field skillId SkillId Id умения (скила)
---@field rerollsLeft integer число оставшихся попыток реролла
---@field dices table текущая раскладка нароллившихся дайсов, ключи таблицы - номера слотов, значения таблицы - соответствующие им нароллившиеся значения
---@field isCurced boolean true, если предметы будут проклатыми

--- Событие, которое приходит при попытке дизассемблинга.
---@class EVENT_DISASSEMBLING_RESULT_Data
---@field skillId SkillId|nil идентификатор умения, с помощью которого пытались дизассемблировать, если доступно
---@field sysResult string результат дизассемблинга
---@field value integer|nil дополнительное числовое значение, если есть

--- Запрос на роспуск гильдии от игрока. Приходит, например, при выполнении слеш-команды роспуска гильдии. Ожидаемая обработка - запрос игроку на подтверждение роспуска и отдача команды серверу на собственно роспуск.
---@class EVENT_DISBAND_GUILD_REQUEST_Data

--- Уведомление об окончании ролла:
---@class EVENT_DISTRIBUTION_FINISHED_Data
---@field rollId ObjectId уникальный идентификатор ролла

--- Событие приходит при отмене системой drag&drop. Скрипт должен выполнить все необходимые логические и визуальные операции, отменяющие перетаскивание.
---@class EVENT_DND_DRAG_CANCELLED_Data

--- Событие приходит во время drag&drop при изменении виджета под курсором (выборка ведется по стандартному алгоритму PICK, то есть среди доступных для кликов). Скрипт должен выполнить все необходимые визуальные операции, показывающие и перемещающие курсор, а также объекты под ним. Событие приходит как вход в контрол, так и на выход из него.
---@class EVENT_DND_DRAG_OVER_Data
---@field srcWidget WidgetSafe перетаскиваемый виджет
---@field srcId integer идентификатор DNDId перетаскиваемого виджета
---@field targetWidget WidgetSafe|nil виджет под курсором, nil если такового нет (считаются только доступные для кликов виджеты, MainScreenControl3D игнорируется)
---@field targetId integer идентификатор DNDId связанный с виджетом под курсором. Если виджета под курсором нет или он не зарегистрирован в drag&drop, то DND_INVALID_ID
---@field enter boolean вошли или вышли из объекта под курсором

--- Событие приходит при перемещении курсора во время drag&drop.
---@class EVENT_DND_DRAG_TO_Data
---@field srcWidget WidgetSafe перетаскиваемый виджет
---@field srcId integer идентификатор DNDId перетаскиваемого виджета
---@field posX integer координата курсора по X (реальная)
---@field posY integer координата курсора по Y (реальная)
---@field outside boolean находится ли курсор за пределами окна приложения
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)

--- Событие приходит при попытке системы завершить drag&drop. Для подтверждения окончания перетаскивания скрипт должен вызвать функцию DNDConfirmDropAttempt. При завершении drag&drop скрипт должен в этом же обработчике события выполнить и все необходимые логические и визуальные операции, заканчивающие перетаскивание.
---@class EVENT_DND_DROP_ATTEMPT_Data
---@field srcWidget WidgetSafe перетаскиваемый виджет
---@field srcId integer идентификатор DNDId перетаскиваемого виджета
---@field targetWidget WidgetSafe|nil виджет под курсором, nil если такового нет (считаются только доступные для кликов виджеты, MainScreenControl3D игнорируется)
---@field targetId integer идентификатор DNDId связанный с виджетом под курсором. Если виджета под курсором нет или он не зарегистрирован в drag&drop, то DND_INVALID_ID
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)

--- Событие приходит при попытке системы начать drag&drop. Для подтверждения начала перетаскивания скрипт должен вызвать функцию DNDConfirmPickAttempt.
---@class EVENT_DND_PICK_ATTEMPT_Data
---@field srcWidget WidgetSafe окно, которое пытаются начать перетаскивать
---@field srcId integer идентификатор, зарегистрированный для окна, которое пытаются начать перетаскивать
---@field posX integer координата курсора по X (реальная)
---@field posY integer координата курсора по Y (реальная)
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)

--- Инициация перехода игрока в варп.
---@class EVENT_DO_WARP_Data

--- Уведомление об появлении нового цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_ADDED_Data
---@field id ObjectId идентификатор цели

--- Уведомление об изменении состояния активности цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_DISABLED_Data
---@field id ObjectId идентификатор цели
---@field disabled boolean состояние активности цели

--- Уведомление об изменении владельца цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_OWNER_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field owner integer команда доминирующая над данной целью
---@field actualOwner integer команда контролирующая данную цель

--- Уведомление об изменении прогресса захвата цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_PROGRESS_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field progress number текущий прогресс захвата цели

--- Уведомление об изменении количества очков необходимых для захвата цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_PROGRESS_TO_CAPTURE_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field progressToCapture number текущее количество очков необходимых для захвата цели

--- Уведомление об изменении радиуса захвата цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_RADIUS_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field radius number радиус окрестности в которой надо находиться для захвата цели

--- Уведомление об удалении нового цели в режиме Domination. Информацию по удаленной цели функцией dominationsLib.GetObjectiveInfo( id ) получить невозможно.
---@class EVENT_DOMINATION_OBJECTIVE_REMOVED_Data
---@field id ObjectId идентификатор цели

--- Уведомление об изменении состояния цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_STATE_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field state integer текущее состояние цели

--- Уведомление об изменении списока персонажей одной из команд находящихся вблизи данной цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_TEAM_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field team integer команда список персонажей которой изменился

--- Уведомление об изменении даты предыдущего захвата цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_TIME_SWITCHED_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field timeSwitched integer дата предыдущего захвата цели

--- Уведомление об изменении прогнозируемого времени захвата цели в режиме Domination.
---@class EVENT_DOMINATION_OBJECTIVE_TIME_TO_CAPTURE_CHANGED_Data
---@field id ObjectId идентификатор цели
---@field timeToCapture integer прогнозируемое время захвата в текущих условиях

--- Присылается при изменении значения CommandPoints пета друида.
---@class EVENT_DRUID_PET_COMMAND_POINTS_CHANGED_Data

--- Посылается каждый раз, когда выбор личного приключения для атаки закончен.
---@class EVENT_DUNGEON_CHOICE_FINISHED_Data

--- Посылается каждый раз, когда стартовал выбор личного приключения для атаки.
---@class EVENT_DUNGEON_CHOICE_STARTED_Data

--- Событие посылается каждый раз, когда изменилось состояние эмоций. В данный момент оно происходит при изменении возможности запуска (emoteInfo.canRun).
---@class EVENT_EMOTES_CHANGED_Data

--- Событие присылается при претерпении урона (класс паладин, спелл "претерпеть боль").
---@class EVENT_ENDURE_BARRIER_DAMAGE_Data
---@field damage integer кол-во урона, который удалось перетерпеть

--- Событие о провале попытки экипировать предмет. Приходит либо itemId либо slot.
---@class EVENT_EQUIP_FAILED_Data
---@field sysCode string код ошибки ("ENUM_DressResult_...")
---@field itemId ObjectId|nil идентификатор предмета, если есть такая информация
---@field slot integer|nil индекс слота в инвентаре [0..], если есть такая информация
---@field slotType number тип контейнера, в котором лежит предмет

--- Событие посылается, когда поменялся текущий активный набор ритуальных вещей  enum DUMMY_TYPE.
---@class EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED_Data
---@field value integer тип контейнера с экипировкой

--- Событие посылается, когда главному или инспектируемому игроку становятся доступны ритуальные вещи (контейнер, действия и т.п.).
---@class EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED_Data
---@field unitId ObjectId идентификатор игрока, у которого изменилось состояние
---@field type integer тип контейнера с экипировкой

--- Событие приходит при любом изменении информации о бонусе от покровителя.
---@class EVENT_FAIRY_BONUS_CHANGED_Data

--- Присылается в случае, если игрок вступил в брак.
---@class EVENT_FAMILY_CREATED_Data
---@field unitId ObjectId идентификатор игрока

--- Присылается в случае, если игрок развёлся (разрушил брак).
---@class EVENT_FAMILY_DESTROYED_Data
---@field unitId ObjectId идентификатор игрока

--- Присылается в случае, если изменился опыт, накопленный семейным заклинанием главного игрока.
---@class EVENT_FAMILY_SPELL_EXPERIENCE_CHANGED_Data
---@field spellId SpellId идентификатор ресурса заклинания

--- Присылается в случае, если изменился список семейных заклинания главного игрока.
---@class EVENT_FAMILY_SPELLS_CHANGED_Data

--- Событие посылается каждый раз, когда изменяется режим следования за объектом (включился/выключился/сменился объект).
---@class EVENT_FOLLOW_MODE_CHANGED_Data
---@field followObjectId ObjectId идентификатор объекта, за которым следует аватар, если событие послано при включении режима следования или смене объекта; nil - при выключении

--- Уведомление о неудачном исполнении фуражирования.
---@class EVENT_FORAGING_FAILED_Data

--- Событие приходит, если был начат крафт (форж/рефорж) итемов. Пользователю необходимо показать диалог для форжа/рефоржа.
---@class EVENT_FORGE_CRAFT_DIALOG_Data

--- Событие посылается при изменении режима полноэкранности игры.
---@class EVENT_FULLSCREEN_CHANGED_Data
---@field value boolean true, если теперь игра в полноэкранном режиме

--- Событие об изменении предмета (например, изменилось количество в стеке).
---@class EVENT_GAME_ITEM_CHANGED_Data
---@field itemId ObjectId идентификатор предмета

--- Событие об изменении проклятости предмета. Одновременно, приходит событие  EVENT_GAME_ITEM_CHANGED.
---@class EVENT_GAME_ITEM_CURSED_CHANGED_Data
---@field itemId ObjectId идентификатор предмета

--- Присылается в случае некой ошибки на сервере.
---@class EVENT_GENERAL_ERROR_Data
---@field sysCause string

--- Оповещение о начале эффекта для элемента в книге умений.
---@class EVENT_GLOBAL_COOLDOWN_Data
---@field effect integer тип начавшегося эффекта
---@field id integer номер события. Гарантируется что событие с бОльшим номером содержит более актуальную информацию. Для случая нескольких событий в кадре (порядок прихода не определен)
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах

--- Приходит, если было прислано сообщение от гейммастеров.
---@class EVENT_GLOBAL_NOTICE_Data
---@field msg WString сообщение

--- Приходит, если изменился список глобальных рейтов к прогрессу персонажа.
---@class EVENT_GLOBAL_RATES_CHANGED_Data

--- Уведомление о результатах ролла при Greed/Need ролле:
---@class EVENT_GREED_NEED_ROLLS_Data
---@field rollId ObjectId уникальный идентификатор ролла
---@field results table список игроков принимавших участие в ролле и их ролл (индексируется [0...])
---@field looterId ObjectId|nil уникальный идентификатор игрока, если он найден
---@field looterName WString имя игрока
---@field roll integer число, выпавшее игроку

--- Уведомление о сделанном выборе при Greed/Need ролле:
---@class EVENT_GREED_NEED_SELECTED_Data
---@field rollId ObjectId уникальный идентификатор ролла
---@field looterId ObjectId|nil уникальный идентификатор игрока, сделавшего выбор, если он найден
---@field looterName WString имя игрока, сделавшего выбор
---@field choice integer выбор

--- По каким-то причинам вступление в группу не сработало.
---@class EVENT_GROUP_ACCEPT_ERROR_Data

--- Событие на появление группы. Присылается не только на действительное создание группы, но и при вхождении игрока в состав уже существующей.
---@class EVENT_GROUP_APPEARED_Data

--- Событие на изменение состава группы (включая создание и роспуск).
---@class EVENT_GROUP_CHANGED_Data

--- Уведомление о смене агрегатного состояния группы: группа -&gt; отряд, отряд -&gt; группа.
---@class EVENT_GROUP_CONVERTED_Data

--- Прямой отказ персонажа вступить в группу.
---@class EVENT_GROUP_DECLINE_Data
---@field declinerName WString имя персонажа, приславшего отказ (другая информация о нем может быть недоступна)

--- Уведомление о невозможности пригласить персонажа в группу.
---@class EVENT_GROUP_DECLINE_BUSY_Data
---@field declinerName WString имя персонажа, от которого пришел отказ (другая информация о нем может быть недоступна)

--- Уведомление о невозможности пригласить персонажа в группу по причине игнора.
---@class EVENT_GROUP_DECLINE_IGNORED_Data
---@field declinerName WString имя персонажа, от которого пришел отказ

--- Событие на исчезновение группы. Присылается не только на роспуск группы, но и при выходе игрока из состава существующей.
---@class EVENT_GROUP_DISAPPEARED_Data

--- Событие о приглашении в группу.
---@class EVENT_GROUP_INVITE_Data
---@field inviterName WString имя приглашающего (другая информация о нем может быть недоступна)
---@field inviterShardName WString имя шарда приглашающего

--- Присылается в случае исчезновения приглашения в группу. Оно может истечь по времени, быть принято или отклонено.
---@class EVENT_GROUP_INVITE_END_Data

--- Событие, которое приходит при невозможности пригласить игрока в группу.
---@class EVENT_GROUP_INVITE_FAILED_Data
---@field name WString имя адресата
---@field sysReason string причина неудачной отправки сообщения

--- Уведомление о смене качества итемов для текущей схемы дележа лута в группе.
---@class EVENT_GROUP_ITEM_QUALITY_CHANGED_Data

--- Событие, которое приходит при неудачной попытке выгнать игрока из группы.
---@class EVENT_GROUP_KICK_FAILED_Data
---@field name WString имя адресата
---@field sysReason string причина неудачной отправки сообщения

--- Уведомление о смене лидера группы главного игрока.
---@class EVENT_GROUP_LEADER_CHANGED_Data

--- Уведомление о смене схемы дележа лута в группе.
---@class EVENT_GROUP_LOOT_SCHEME_CHANGED_Data

--- Событие приходит при появлении нового члена группы.
---@class EVENT_GROUP_MEMBER_ADDED_Data
---@field name WString имя нового согрупника
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

--- Событие на изменение состояния члена группы (онлайн-офлайн, лидер).
---@class EVENT_GROUP_MEMBER_CHANGED_Data
---@field name WString имя персонажа
---@field uniqueId UniqueId постоянный идентификатор аватара (не меняется при релогинах), чьё состояние изменилось (см. group.GetMembers() и group.GetMemberInfo(id), поле uniqueId в обоих случаях); nil если это наёмник-моб
---@field id ObjectId идентификатор члена группы; nil, если его нет поблизости (порвалась связь, в другой зоне и т.д.)

--- Событие приходит при выходе члена группы из ее состава.
---@class EVENT_GROUP_MEMBER_REMOVED_Data
---@field name WString имя вышедшего согрупника
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

--- Присылается в случае, если какой-либо игрок вступил в гильдию главного игрока.
---@class EVENT_GUILD_ACCEPTED_Data
---@field invitee WString имя вступившего игрока
---@field inviter WString имя приглашавшего игрока
---@field guild WString название гильдии

--- Присылается в случае, если атака на чужой гильдейский аллод провалилась.
---@class EVENT_GUILD_ALLOD_ATTACK_FAILED_Data
---@field allodId ObjectId|nil идентификатор аллода, если информация найдена
---@field allod WString название аллода
---@field attacker WString имя атакующей гильдии
---@field deffender WString имя защищающейся гильдии

--- Присылается в случае, если атака на чужой гильдейский аллод удалась.
---@class EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL_Data
---@field allodId ObjectId|nil идентификатор аллода, если информация найдена
---@field allod WString название аллода
---@field attacker WString имя атакующей гильдии
---@field deffender WString имя защищающейся гильдии

--- Присылается в случае, если изменился владелец гильдейского аллода.
---@class EVENT_GUILD_ALLOD_OWNER_CHANGED_Data
---@field allodId ObjectId|nil идентификатор аллода, если информация найдена
---@field allod WString название аллода
---@field newOwner WString имя гильдии - нового владельца аллода
---@field oldOwner WString имя гильдии - старого владельца аллода

--- Оповещение об окончании кулдауна телепортации на гильдейский аллод.
---@class EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_FINISHED_Data
---@field allodId ObjectId идентификатор аллода

--- Оповещение о начале кулдауна телепортации на гильдейский аллод.
---@class EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_STARTED_Data
---@field allodId ObjectId идентификатор аллода
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах

--- Присылается в случае неудачной попытки приглашения в гильдию (игрок уже в гильдии).
---@class EVENT_GUILD_ALREADY_IN_GUILD_Data
---@field declinerName WString имя приглашаемого игрока

--- Присылается, если главный игрок попал в гильдию (в новую, или в существующую при входе в игру).
---@class EVENT_GUILD_APPEARED_Data

--- Присылается, если изменилось влияние гильдии главного игрока.
---@class EVENT_GUILD_AUTHORITY_CHANGED_Data

--- Серверное событие с гильдейской банковской историей аватара. Приходит после вызова функции  guild.GetAvatarHistory().
---@class EVENT_GUILD_AVATAR_HISTORY_Data
---@field moneyChange integer величина транзакции в меди
---@field comment WString комментарий при проведении операции
---@field time LuaFullDateTime время транзакции
---@field changeReason integer причина транзакции
---@field sysChangeReason string причина транзакции

--- Событие возникает при обновление данных об истории операций казны гильдии, является итогом вызова guild.GetHistory( page, orderBy, rearOrder )).
---@class EVENT_GUILD_BANK_HISTORY_CHANGED_Data

--- Присылается, если изменилось минимальное ограничение на транзакцию в гильдейскомм банке.
---@class EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED_Data

--- Событие возникает при изменении баланса казны гильдии.
---@class EVENT_GUILD_BANK_MONEY_CHANGED_Data

--- Присылается, если завершилась операция в гильдейском банке.
---@class EVENT_GUILD_BANK_OPERATION_RESULT_Data
---@field success boolean true, если операция завершилась успешно
---@field sysOperationType string тип операции, которая завершилась

--- Присылается при измении списока выбранных способностей босса гильдии.
---@class EVENT_GUILD_BOSS_ABILITIES_CHANGED_Data

--- Присылается в случае если изменился босс гильдии.
---@class EVENT_GUILD_BOSS_CHANGED_Data

--- Присылается в случае, если изменился опыт босса гильдии.
---@class EVENT_GUILD_BOSS_EXPERIENCE_CHANGED_Data
---@field experience integer опыт босса гильдии

--- Присылается в случае, если изменилась сила босса гильдии.
---@class EVENT_GUILD_BOSS_GEAR_SCORE_CHANGED_Data
---@field gearScore integer сила босса гильдии

--- Присылается при измении списка заданий для прогресса босса гильдии.
---@class EVENT_GUILD_BOSS_QUESTS_CHANGED_Data

--- Присылается при измении статуса заданий для прогресса босса гильдии.
---@class EVENT_GUILD_BOSS_QUESTS_STATUS_CHANGED_Data

--- Присылается при измении списока выбранных заклинаний босса гильдии.
---@class EVENT_GUILD_BOSS_SPELLS_CHANGED_Data

--- Присылается при измении состояния босса гильдии.
---@class EVENT_GUILD_BOSS_STATE_CHANGED_Data

--- Событие посылается каждый раз, когда у гилдии появляется новый баф. Если апдейтится старый, то ничего не приходит.
---@class EVENT_GUILD_BUFF_ADDED_Data
---@field buffId ObjectId идентификатор бафа

--- Событие посылается каждый раз, когда у гилдии игрока меняется набор бафов.
---@class EVENT_GUILD_BUFFS_CHANGED_Data

--- Присылается в случае невозможности вступить в гильдию (после вызова guild.Accept()).
---@class EVENT_GUILD_CANT_ACCEPT_Data

--- Присылается в случае, если была создана гильдия, в создании которой участвовал главный игрок.
---@class EVENT_GUILD_CREATED_Data
---@field guildName WString название гильдии
---@field leaderName WString имя лидера гильдии (создавшего гильдию)

--- Присылается, если изменилось количество гильдейских валют в гильдии главного игрока.
---@class EVENT_GUILD_CURRENCIES_CHANGED_Data

--- Присылается в случае неудачной попытки приглашения в гильдию.
---@class EVENT_GUILD_DECLINE_Data
---@field declinerName WString имя приглашаемого игрока

--- Присылается в случае неудачной попытки приглашения в гильдию (игрок занят).
---@class EVENT_GUILD_DECLINE_BUSY_Data
---@field declinerName WString имя приглашаемого игрока

--- Уведомление о невозможности приглашения в гильдию по причине игнора.
---@class EVENT_GUILD_DECLINE_IGNORED_Data
---@field declinerName WString имя приглашаемого игрока

--- Присылается, если изменилось описание гильдии главного игрока.
---@class EVENT_GUILD_DESCRIPTION_CHANGED_Data

--- Присылается, если игрок вышел из гильдии.
---@class EVENT_GUILD_DISAPPEARED_Data

--- Присылается запрос на подтверждение открытия прогресса гильдии. Необходимо ответить  guild.EnableProgressReply().
---@class EVENT_GUILD_ENABLE_PROGRESS_REQUEST_Data
---@field timeoutMs integer таймаут в миллисекундах. По истечении таймаута запрос будет отклонён

--- Присылается в случае невозможности выполнить указанную операцию с гильдией.
---@class EVENT_GUILD_FAILED_Data
---@field sysCause string строковое описание причины

--- Присылается при измении прогресса оплота гильдии.
---@class EVENT_GUILD_HALL_EXPERIENCE_CHANGED_Data
---@field value integer

--- Присылается при измении дневного прогресса оплота гильдии.
---@class EVENT_GUILD_HALL_EXPERIENCE_DAILY_CHANGED_Data
---@field value integer

--- Присылается при измении списка заданий для прогресса оплота гильдии.
---@class EVENT_GUILD_HALL_QUESTS_CHANGED_Data

--- Присылается при измении статуса заданий для прогресса оплота гильдии.
---@class EVENT_GUILD_HALL_QUESTS_STATUS_CHANGED_Data

--- Присылается при измении состояния оплота гильдии.
---@class EVENT_GUILD_HALL_STATE_CHANGED_Data

--- Присылается в случае получения приглашения в гильдию.
---@class EVENT_GUILD_INVITE_Data
---@field inviterName WString имя приглашающего игрока
---@field guildName WString имя гильдии

--- Событие возникает при обновление данных об истории операций с предметами гильдии, является итогом вызова guild.GetItemsHistory( page, orderBy, rearOrder )).
---@class EVENT_GUILD_ITEMS_HISTORY_CHANGED_Data

--- Присылается при попытке получить историю операций с предметами гильдии.
---@class EVENT_GUILD_ITEMS_OPERATION_RESULT_Data
---@field success boolean true, если операция завершилась успешно

--- Присылается в случае изменения лидера гильдии главного игрока.
---@class EVENT_GUILD_LEADER_CHANGED_Data

--- Присылается, если изменился уровень гильдии главного игрока.
---@class EVENT_GUILD_LEVEL_CHANGED_Data

--- Присылается в случае изменения списка членов гильдии главного игрока.
---@class EVENT_GUILD_LIST_CHANGED_Data

--- Присылается, если в гильдию главного игрока добавлен игрок.
---@class EVENT_GUILD_MEMBER_ADDED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии

--- Присылается, если изменилось влияние у члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_AUTHORITY_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии
---@field delta integer на сколько изменилось

--- Присылается, если у члена гильдии изменился баланс в гильдейском банке.
---@class EVENT_GUILD_MEMBER_BALANCE_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)

--- Присылается, если изменились параметры члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии

--- Присылается, если изменилось влияние, набранное за день, у члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_DAY_AUTHORITY_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии
---@field delta integer на сколько изменилось

--- Присылается в случае, если какой-либо игрок вышел или его вывели из гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_KICKED_Data
---@field kicked WString имя вышедшего из гильдии игрока
---@field kicker WString имя выкинувшего игрока (или сам kicked, или офицер/глава гильдии)

--- Присылается, если изменилось преданность члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_LOYALTY_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии
---@field delta integer на сколько изменилось

--- Присылается, если изменилось влияние, набранное за месяц, у члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_MONTH_AUTHORITY_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии
---@field delta integer на сколько изменилось

--- Присылается когда меняется онлайн-статус члена гильдии (см. поле onlineStatus функции  guild.GetMemberInfo( memberId )).
---@class EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии

--- Присылается, если изменился ранг члена гильдии.
---@class EVENT_GUILD_MEMBER_RANK_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии

--- Присылается, если из списка гильдии главного игрока удален игрок.
---@class EVENT_GUILD_MEMBER_REMOVED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии

--- Присылается когда выдаются или отнимаются права у игрока на использовании гильдейсткой символики.
---@class EVENT_GUILD_MEMBER_SYMBOLICS_Data
---@field mount ObjectId|nil идентификатор ресурса выдающего маунта
---@field smile ObjectId|nil идентификатор ресурса выдающего эмотикон
---@field lifestyle ObjectId|nil идентификатор ресурса выдающего визуал
---@field ability ObjectId|nil идентификатор ресурса выдающего косметическую способность
---@field granted boolean true если права выданы, false если отобраны
---@field member WString имя игрока
---@field guild WString название гильдии

--- Присылается, если изменилось право на ношение накидки у члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_TABARD_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии

--- Присылается, если изменилось влияние, набранное за неделю , у члена гильдии главного игрока.
---@class EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED_Data
---@field id ObjectId идентификатор члена гильдии (не совпадает с идентификатором игрока)
---@field name WString имя члена гильдии
---@field delta integer на сколько изменилось

--- Присылается, если изменилась новость гильдии.
---@class EVENT_GUILD_MESSAGE_CHANGED_Data

--- Присылается, если изменилось набранное за месяц влияние гильдии главного игрока.
---@class EVENT_GUILD_MONTH_AUTHORITY_CHANGED_Data

--- Приходит при изменении имени гильдии, в которой состоит аватар игрока.
---@class EVENT_GUILD_NAME_CHANGED_Data

--- Присылается в случае попытки создать гильдию с недоступным именем.
---@class EVENT_GUILD_NAME_NOT_AVAILABLE_Data
---@field name WString имя, с которым не удалось создать гильдию
---@field sysNameErrorKind string причина, по которой имя недопустимо
---@field notAllowedSubstring WString если ошибка произошла из-за недопустимой подстроки, то ее значение

--- Приходит при изменении флага "гильдию требуется переименовать" у гильдии, в которой состоит аватар игрока.
---@class EVENT_GUILD_NEED_RENAME_CHANGED_Data

--- Присылается, если изменилсся пул бонусного авторитета гильдии главного игрока.
---@class EVENT_GUILD_SEASON_AUTHORITY_BONUS_POOL_CHANGED_Data

--- Присылается, если изменилось сезонное влияние гильдии главного игрока.
---@class EVENT_GUILD_SEASON_AUTHORITY_CHANGED_Data

--- Присылается, если изменился сезонный уровень гильдии главного игрока.
---@class EVENT_GUILD_SEASON_LEVEL_CHANGED_Data

--- Присылается, если изменилось "несгораемое" сезонное влияние гильдии главного игрока.
---@class EVENT_GUILD_SEASON_SECURE_AUTHORITY_CHANGED_Data

--- Присылается когда произошли изменения в уникальной символике гильдии.
---@class EVENT_GUILD_SYMBOLICS_CHANGED_Data

--- Присылается, если изменился список знаков отличия для наград гильдии главного игрока.
---@class EVENT_GUILD_TABARDS_CHANGED_Data

--- Событие присылается, когда изменились таланты гильдии.
---@class EVENT_GUILD_TALENTS_CHANGED_Data

--- Присылается в случае смены гильдийской текстуры.
---@class EVENT_GUILD_TEXTURE_CHANGED_Data

--- Присылается, если изменился уровень гильдии главного игрока.
---@class EVENT_GUILD_UNLOCKED_LEVEL_CHANGED_Data

--- Уведомление о смене корпуса активного корабля.
---@class EVENT_HANGAR_ACTIVE_HULL_CHANGED_Data

--- Уведомление о смене активного корабля.
---@class EVENT_HANGAR_ACTIVE_SHIP_CHANGED_Data

--- Уведомление об изменении списка доступных для выбора корпусов у активного корабля кораблей.
---@class EVENT_HANGAR_ACTIVE_SHIP_HULLS_CHANGED_Data

--- Уведомление об изменении списка доступных для выбора скинов корпуса активного корабля.
---@class EVENT_HANGAR_ACTIVE_SHIP_SKINS_CHANGED_Data

--- Уведомление о смене скина корпуса активного корабля.
---@class EVENT_HANGAR_ACTIVE_SKIN_CHANGED_Data

--- Уведомление о получении списка имеющихся устройств, после запроса НПС в ангаре.
---@class EVENT_HANGAR_DEVICES_RECEIVED_Data

--- Приходит информация о требуемом ремонте корабля. Требуется ответ hangar.RepairReply( positive ), чтобы начать или отменить ремонт.
---@class EVENT_HANGAR_REPAIR_QUESTION_Data
---@field moneyToAdd integer сколько надо добавить денег
---@field tickCountToFullRepair integer количество тиков до полной починки
---@field maxTickCount integer количество тиков до всей возможной починки на имеюихся ресурсах
---@field shipRepairPerTick integer процент корабля, который будет отремонтирован [0..100] за один тик
---@field tickTimeMs integer время тика в миллисекундах
---@field itemId ObjectId идентификатор итема, который нужен и сколько его потратится
---@field itemsPerTick float количество предметов, тратящихся за один тик. Может быть дробным. При трате округляется в большую сторону.
---@field totalRepairTime table сколько времени займет ремонт на всех имеющихся ресурсах, поля таблицы:
---@field fullRepairTime table сколько времени займет вообще весь ремонт, поля таблицы:

--- Уведомление об изменении списка доступных для выбора кораблей.
---@class EVENT_HANGAR_SHIPS_CHANGED_Data

--- Уведомление о получении списка имеющихся устройств для замены, после запроса слота в ангаре.
---@class EVENT_HANGAR_SLOT_DEVICES_RECEIVED_Data

--- Уведомление об изменении одного из спеллов, используемых для работы с кораблём в ангаре, например в случае, когда изменилась возможность использовать этот спелл.
---@class EVENT_HANGAR_SPELL_CHANGED_Data
---@field id SpellId Id ресурса спелла

--- Оповещение о начале эффекта для одного из спеллов, используемых для работы с кораблём в ангаре. Аналогично  EVENT_SPELLBOOK_ELEMENT_EFFECT.
---@class EVENT_HANGAR_SPELL_EFFECT_Data

--- Событие присылается при появлении у юнита пула анти-хила.
---@class EVENT_HEAL_ABSORB_POOL_APPEARED_Data
---@field unitId ObjectId юнит, у которого появился пул анти-хила

--- Событие присылается при изменении у юнита пула анти-хила.
---@class EVENT_HEAL_ABSORB_POOL_CHANGED_Data
---@field unitId ObjectId юнит, у которого изменился пул анти-хила
---@field healAbsorb float текущее значение пула анти-хила

--- Событие присылается при исчезании у юнита пула анти-хила.
---@class EVENT_HEAL_ABSORB_POOL_DISAPPEARED_Data
---@field unitId ObjectId юнит, у которого исчез пул анти-хила

--- Уведомление о лечении юнита.
---@class EVENT_HEALING_RECEIVED_Data
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
---@field lethality float величина сложности ран цели в момент лечения
---@field spellId SpellId Id спелла, которым лечили, если лечили спеллом.
---@field abilityId AbilityId Id абилки, которой лечили, если лечили абилкой.
---@field buffId BuffId Id буффа, которым лечили, если лечили буффом.
---@field isFall boolean true, если здоровье изменено из-за падения

--- Оповещение об изменении локатора HearthStone.
---@class EVENT_HEARSTONE_LOCATOR_CHANGED_Data

--- Оповещение об окончании кулдауна на HearthStone.
---@class EVENT_HEARTHSTONE_COOLDOWN_FINISHED_Data

--- Оповещение о старте кулдауна на HearthStone.
---@class EVENT_HEARTHSTONE_COOLDOWN_STARTED_Data
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах

--- Оповещение о появлении HearthStone.
---@class EVENT_HEARTHSTONE_CREATED_Data

--- Оповещение об исчезновении HearthStone.
---@class EVENT_HEARTHSTONE_DESTROYED_Data

--- Событие присылается при изменении количества скрытой игровой альтернативной валюты, имеющейся у игрока. Передаётся CurrencyId.
---@class EVENT_HIDDEN_CURRENCY_VALUE_CHANGED_Data
---@field id CurrencyId идентификатор альтернативной валюты.
---@field delta integer число на которое изменилось значение валюты (может быть как положительным, так и отрицательным)
---@field sysName string внутреннее имя альтернативной валюты

--- Уведомление о конце выбора текста для IME.
---@class EVENT_IME_SELECT_FINISHED_Data

--- Уведомление о начале выбора текста для IME.
---@class EVENT_IME_SELECT_STARTED_Data

--- Событие присылается при изменении объекта под курсором.
---@class EVENT_INGAME_UNDER_CURSOR_CHANGED_Data
---@field state string может принимать следующие значения:
---@field unitId ObjectId идентификатор юнита под курсором
---@field deviceId ObjectId идентификатор устройства под курсором
---@field canUse boolean можно ли использовать устройство в текущий момент (в частности, учитывается расстояние до него)
---@field deviceType integer тип корабельного устройства
---@field type integer тип хаба {HT_NONE, HT_UNKNOWN, HT_OUR, HT_ENEMYSHIP, HT_PORTAL, HT_ALLOD, HT_ISLAND}
---@field name WString|nil название хаба, если это HT_PORTAL

--- Результат вызова информации о достижениях другого игрока.
---@class EVENT_INSPECT_AVATAR_MEDALS_RESULT_Data

--- Событие посылается при окончании инспекции объекта.
---@class EVENT_INSPECT_FINISHED_Data

--- Событие посылается, если при осмотре главным игроком другого игрока у осматриваемого игрока изменился активный маунт.
---@class EVENT_INSPECT_MOUNT_CHANGED_Data

--- Событие посылается при изменении уровня умения главного игрока осматривать других игроков.
---@class EVENT_INSPECT_SKILL_CHANGED_Data

--- Событие посылается при начале инспекции объекта. Объектом может быть игрок, дружественный аватару, и являющийся целью аватара. При потере цели инспекция сбрасыватся EVENT_INSPECT_FINISHED.
---@class EVENT_INSPECT_STARTED_Data

--- Событие посылается в ответ на запрос наличия доступных заданий у собеседника  avatar.RequestInteractions(). Также приходит автоматически при начале разговора.
---@class EVENT_INTERACTION_STARTED_Data

--- Настало время скрыть/показать интерфейс.
---@class EVENT_INTERFACE_TOGGLE_Data
---@field hide boolean true - скрыть, false - показать
---@field hideCursor boolean true - скрыть курсор вместе с остальным интерфейсом, false - не скрывать курсор вместе с интерфейсом
---@field lockInfut boolean true - блокируется управление камерой, false - не блокируется
---@field useCinemaStripes boolean требуется ли отображение черных полос сверху и снизу экрана
---@field toggleTarget integer что должно быть скрыто/показано

--- Событие об изменении содержимого инвентаря главного персонажа.
---@class EVENT_INVENTORY_CHANGED_Data

--- Уведомление о смене гемов в дереве талантов души.
---@class EVENT_INVENTORY_GEMS_CHANGED_Data

--- Уведомление о добалении слота для гемов в дереве талантов души.
---@class EVENT_INVENTORY_GEMS_SLOT_ADDED_Data
---@field slot integer индекс слота

--- Уведомление о удалении слота для гемов в дереве талантов души.
---@class EVENT_INVENTORY_GEMS_SLOT_REMOVED_Data
---@field slot integer индекс слота

--- Событие об изменении содержимого  "переполненной сумки" главного персонажа.
---@class EVENT_INVENTORY_OVERFLOW_CHANGED_Data

--- Событие, сообщающее о появлении нового слота в "переполненной сумке" главного персонажа.
---@class EVENT_INVENTORY_OVERFLOW_SLOT_ADDED_Data
---@field slot integer индекс слота в сумке [0..]

--- Событие, сообщающее о пропажи слота в "переполненной сумке" главного персонажа.
---@class EVENT_INVENTORY_OVERFLOW_SLOT_REMOVED_Data
---@field slot integer индекс слота в сумке [0..]

--- Событие об изменении размера инвентаря главного персонажа.
---@class EVENT_INVENTORY_SIZE_CHANGED_Data

--- Событие об изменении содержимого слота инвентаря главного персонажа.
---@class EVENT_INVENTORY_SLOT_CHANGED_Data
---@field tabIndex number индекс вкладки инвентаря
---@field slotIndex number индекс слота во вкладке
---@field itemId ObjectId идентификатор предмета

--- Событие посылается каждый раз, когда изменяются значения смертей и их лимитов для острова.
---@class EVENT_ISLAND_DEATH_LIMIT_CHANGED_Data

--- Событие приходит, если была попытка использовать/надеть/снять предмет, но он не доступен для использования (персонаж мертв или предмет и так находится в процессе переодевания).
---@class EVENT_ITEM_DISABLED_Data
---@field itemId ObjectId идентификатор предмета

--- Событие возникает при успешном перемещении предмета.
---@class EVENT_ITEM_MOVED_Data
---@field itemId ObjectId идентификатор предмета
---@field from integer тип контейнера ОТКУДА был перемещен предмет
---@field to integer тип контейнера КУДА был перемещен предмет

--- Событие посылается , когда игрок запросил avatar.RequestQuestsForItem( itemId ).
---@class EVENT_ITEM_QUESTS_RECEIVED_Data
---@field slot integer слот, для предмета которого получены квесты
---@field itemId ObjectId id предмета, для которого получены квесты; nil если предмет по какой-либо причине не может быть найден в своём слоте

--- Приходит, если изменился список заданий, связанных с предметом.
---@class EVENT_ITEM_RELATED_QUESTS_CHANGED_Data
---@field itemId ObjectId идентификатор предмета

--- Событие о завершении сервером операции с предметом. Некоторые операции с предметом не могут производиться до завершения предыдущих операций, это событие служит для определения момента, когда можно проводить следующее действие такого рода. Информация о новом состоянии предмета на клиенте может запаздывать и в момент прихода сообщения может быть устаревшей, т.е. при необходимости надо ждать  EVENT_GAME_ITEM_CHANGED.
---@class EVENT_ITEM_SERVER_CMD_FINISHED_Data
---@field itemId ObjectId идентификатор предмета, с которым завершилась операция
---@field isSuccess boolean если true, то операция завершилась удачно

--- Уведомление о невозможности торговли по причине игнора.
---@class EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED_Data
---@field declinerName WString имя персонажа, от которого пришел отказ

--- Во время торговли с другим игроком произошла ошибка.
---@class EVENT_ITEMS_EXCHANGE_ERROR_Data
---@field inviter WString имя игрока, инициировавшего торговлю
---@field invited WString имя игрока, приглашенного торговать
---@field error string описание ошибки

--- Торговля между игроками завершена.
---@class EVENT_ITEMS_EXCHANGE_FINISHED_Data
---@field state int состояние завершения торговли

--- Главному игроку предложено поторговать с другим игроком.
---@class EVENT_ITEMS_EXCHANGE_INVITED_Data

--- Событие приходит, если какой либо из участников торговли между окончательно согласился с условиями обмена или отказался от своего окончательного согласия.
---@class EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED_Data
---@field offerId ObjectId идентификатор игрока

--- Событие приходит, если какой либо из участников торговли между игроками поменял предметы на столе обмена.
---@class EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED_Data
---@field offerId ObjectId идентификатор игрока, поменявшего предметы

--- Событие приходит, если какой либо из участников торговли между игроками изменил сумму денег на игровом столе.
---@class EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED_Data
---@field offerId ObjectId идентификатор игрока

--- Событие приходит, если какой либо из участников торговли между предварительно согласился с условиями обмена или отказался от своего предварительного согласия.
---@class EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED_Data
---@field offerId ObjectId идентификатор игрока

--- Главный игрок не может положить предмет на обменный стол, так как слот уже занят.
---@class EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY_Data

--- Главным игроком инициирована торговля между игроками.
---@class EVENT_ITEMS_EXCHANGE_STARTED_Data

--- Изменилось состояние торговли между игроками. Состояний может быть несколько:
---@class EVENT_ITEMS_EXCHANGE_STATE_CHANGED_Data

--- Не удалось совершить действие связанное с LFG
---@class EVENT_LFG_ACTION_FAIL_Data
---@field cause integer причина сбоя

--- Событие посылается при изменении возможности для игрока отправится на текущую целевую локацию, т.е. стали выполнены все предикаты для отправки в локацию, либо наоборот, какой-то из предикатов перестал выполняться.
---@class EVENT_LFG_DEPART_AVAILABLE_CHANGED_Data
---@field available boolean возможность отправки на текущую целевую локацию

--- Событие посылается при изменении доступности для игрока целевой локации, т.е. локация стала доступна, либо наоборот не доступна по условиям входа.
---@class EVENT_LFG_DESTINATION_AVAILABLE_CHANGED_Data
---@field destination LfgDestinationId идентификатор целевой локации

--- Событие посылается при смене цели(пункт назначения) для сбора группы.
---@class EVENT_LFG_DESTINATION_CHANGED_Data
---@field destination LfgDestinationId пункт назначения

--- Посылается каждый раз, когда для какой-либо LFG-ативности меняется информация о количестве посещений за сегодняшний день аватаром.
---@class EVENT_LFG_DESTINATION_VISITS_CHANGED_Data
---@field destination LfgDestinationId пункт назначения

--- Событие посылается при когда изменился список открытых активностей в LFG.
---@class EVENT_LFG_DESTINATIONS_LIST_CHANGED_Data

--- Игрок запустил LFG, подал заявку на подбор группы
---@class EVENT_LFG_JOIN_Data
---@field destination LfgDestinationId пункт назначения
---@field roles integer[] список вакантных ролей в группе

--- Игрок ушел из LFG, отказался от подбора группы.
---@class EVENT_LFG_LEAVE_Data

--- Событие посылается при начале голосования.
---@class EVENT_LFG_VOTE_Data
---@field initiator WString имя игрока, активировавшего опрос
---@field type integer предмет опроса
---@field destination LfgDestinationId|nil пункт назначения
---@field endTimeMs integer время окончания опроса
---@field roles integer[] список вакантных ролей в группе

--- Событие посылается при сорванном голосования.
---@class EVENT_LFG_VOTE_TERMINATE_Data

--- Событие, информирующее о прогрессе загрузки миссии.
---@class EVENT_LOADING_PROGRESS_Data
---@field sysStage string фаза загрузки
---@field current integer текущее количество загруженных ресурсов
---@field total integer общее количество ресурсов, которые необходимо загрузить
---@field firstTime boolean true, если событие присылается первый раз после начала очередной загрузки
---@field finished boolean завершена ли загрузка
---@field fraction float текущий общий прогресс загрузки в долях единицы: [0..1]
---@field mapName WString название карты
---@field mapDescription WString описание карты
---@field mapImage TextureId идентификатор текстуры с изображением для данной карты

--- Уведомление о приходе на клиент текстового сообщения в лобби.
---@class EVENT_LOBBY_CLIENT_MESSAGE_Data

--- Присылается при изменении раскладки клавиатуры.
---@class EVENT_LOCALE_CHANGED_Data

--- Событие посылается каждый раз, когда появился какой-нибудь контейнер с лутом.
---@class EVENT_LOOT_BAG_APPEARED_Data

--- Событие посылается на изменение контейнера с лутом. Если одновременно изменились несколько элементов, то событие присылается только раз.
---@class EVENT_LOOT_BAG_CHANGED_Data

--- Событие посылается на исчезновение контейнера с лутом.
---@class EVENT_LOOT_BAG_DISAPPEARED_Data

--- Событие посылается на исчезновение объекта в контейнера с лутом.
---@class EVENT_LOOT_BAG_ITEM_DISAPPEARED_Data

--- Событие посылается на исчезновение денег в контейнере с лутом.
---@class EVENT_LOOT_BAG_MONEY_DISAPPEARED_Data

--- Событие посылается на открытие/закрытие сумки с лутом.
---@class EVENT_LOOT_BAG_OPEN_STATE_CHANGED_Data
---@field customFilter integer фильтр, переданный из скрипта при использовании предмета

--- Событие посылается при селекте контейнера с лутом. (В настоящий момент только на клик в неселекченный труп - т.е. в момент селекта - моба с лутом.)
---@class EVENT_LOOT_BAG_SELECTED_Data

--- Событие посылается каждый раз, когда игрок приносит чужой сундук в свою сокровищницу.
---@class EVENT_LOOT_CHEST_CAPTURED_Data
---@field playerId ObjectId Id игрока захватившего сундук
---@field isEnemyChest boolean является ли сундук вражеским

--- Событие посылается каждый раз, когда игрок бросает сундук на корабле.
---@class EVENT_LOOT_CHEST_DROPPED_Data
---@field playerId ObjectId Id игрока бросившего сундук
---@field isEnemyChest boolean является ли сундук вражеским

--- Событие посылается каждый раз, когда игрок возвращает сундук в сокровищницу.
---@class EVENT_LOOT_CHEST_RETURNED_Data
---@field playerId ObjectId Id игрока возвратившего сундук
---@field isEnemyChest boolean является ли сундук вражеским

--- Событие посылается каждый раз, когда игрок поднимает сундук на корабле.
---@class EVENT_LOOT_CHEST_TAKEN_Data
---@field playerId ObjectId Id игрока поднявшего сундук
---@field isEnemyChest boolean является ли сундук вражеским

--- Уведомление о начале ролла при Master ролле. Приходит всем, кроме мастера (мастеру приходит EVENT_LOOT_TO_DISTRIBUTE).
---@class EVENT_LOOT_DISTRIBUTION_STARTED_Data
---@field itemObject ValuedObject объект, содержащий информацию о предмете

--- Сообщение приходит при начале дележа при Greed/Need ролле:
---@class EVENT_LOOT_FOR_GREED_NEED_Data
---@field rollId ObjectId уникальный идентификатор ролла
---@field itemId ObjectId уникальный идентификатор айтема
---@field count integer количество данного айтема в стеке

--- Уведомление о появлении/исчезновении лута в юните-трупе.
---@class EVENT_LOOT_MARK_Data

--- Уведомление о начале ролла при Master ролле (приходит только мастеру):
---@class EVENT_LOOT_TO_DISTRIBUTE_Data
---@field rollId ObjectId уникальный идентификатор ролла
---@field itemId ObjectId уникальный идентификатор итема
---@field looters table список кросс-серверных уникальных идентификаторов игроков, принимающих участие в ролле (индексируется [0...])

--- Сообщение приходит, когда меняется информация о текущем варианте выпадения лута на астральных островах.
---@class EVENT_LOOTSELECTOR_CHANGED_Data

--- Событие присылается, когда заканчивается лотерея "Лото".
---@class EVENT_LOTTERY_END_Data

--- Событие присылается, когда меняется состояние лотереи. Подробнее о состояниях: EnumLotteryState
---@class EVENT_LOTTERY_STATE_CHANGED_Data

--- Событие с результатом создания письма.
---@class EVENT_MAIL_CREATE_RESULT_Data
---@field sysResult string результат создания письма, текстовый енум. Not fully implemented yet.
---@field recipientName WString имя адресата

--- Событие с результатом попытки удаления письма.
---@class EVENT_MAIL_DELETE_RESULT_Data
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

--- Событие с результатом извлечения предметов из письма.
---@class EVENT_MAIL_EXTRACT_ITEMS_RESULT_Data
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

--- Событие с результатом извлечения денег из письма.
---@class EVENT_MAIL_EXTRACT_MONEY_RESULT_Data
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

--- Событие с результатом попытки возврата письма отправителю.
---@class EVENT_MAIL_RETURN_RESULT_Data
---@field mailId ObjectId уникальный идентификатор письма
---@field sysResult string результат операции

--- Событие приходит при открытии (активации) почтового ящика.
---@class EVENT_MAILBOX_ACTIVATED_Data

--- Уведомление об изменении состояния почтового ящика. Например, при изменении статуса готовности или списка писем в нем.
---@class EVENT_MAILBOX_CHANGED_Data

--- Уведомление об изменении состояния почтового ящика на сервере. Означает, что данные на клиенте устарели и должны быть обновлены (см.  mailBox.RequestMails( startIndex, count ) и  mailBox.RequestMailInfo( mailId ) (закрытая ссылка)), до обновления функции  mailBox.GetMails() и  mailBox.GetMail( mailId ) будут возвращать nil.
---@class EVENT_MAILBOX_CHANGED_ON_SERVER_Data

--- Событие приходит при закрытии (деактивации) почтового ящика.
---@class EVENT_MAILBOX_CLOSED_Data

--- Событие приходит при попадании письма в почтовый ящик.
---@class EVENT_MAILBOX_NEW_MAIL_ARRIVED_Data
---@field totalCount integer общее количество писем в почтовом ящике
---@field unreadCount integer количество непрочтённых писем в почтовом ящике

--- Уведомление о непрочитанных письмах. Присылается при входе в игру и при добавлении новых непрочитанных писем.
---@class EVENT_MAILBOX_NEW_UNREAD_MESSAGE_Data
---@field oldUnreadMessages integer прежнее количество непрочитанных писем
---@field unreadMessages integer текущее количество непрочитанных писем

--- Уведомление о статусе исполнения команды, касающейся почтового ящика на сервере. Содержит в себе код ошибки или удачного завершения. Использовать только для сообщений об ошибках, для других целей есть  EVENT_MAILBOX_CHANGED_ON_SERVER.
---@class EVENT_MAILBOX_SERVER_OPERATION_RESULT_Data
---@field sysResult string статус завершения операции

--- Уведомление об изменении содержимого писем. В частности, при получении недостающей информации с сервера. Присылается список всех измененных за кадр писем (cобытие приходит не чаще раза за кадр).
---@class EVENT_MAILS_CHANGED_Data

--- Событие присылается при измениние маны юнита другим юнитом.
---@class EVENT_MANA_RECEIVED_Data
---@field unitId ObjectId юнит, у которого изменилась мана
---@field casterId ObjectId юнит, который изменил ману, если информация о нём ещё доступна
---@field addedMana number( величина изменения маны (отрицательная - выжгли, положительная - добавили)
---@field spellId SpellId Id ресурса заклинания, которым изменили ману.
---@field abilityId AbilityId Id абилки, если изменили абилкой.
---@field buffId BuffId Id буффа, если изменили буффом.
---@field isFall boolean true, если мана изменена из-за падения
---@field isExploit boolean true, если мана изменена из-за эксплойта

--- Событие возникает при изменение состояния каналов в текущей игровой локации.
---@class EVENT_MAP_CHANNELS_INFO_CHANGED_Data

--- Уведомление о невозможности зайти в полностью заполненный инстанс.
---@class EVENT_MAP_INSTANCE_FULL_Data
---@field mapName WString название инстанса

--- Событие присылается при окончании отсчета времени до выброса из инстанса.
---@class EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED_Data

--- Событие присылается при начале отсчета времени до выброса из инстанса.
---@class EVENT_MAP_INSTANCE_KICK_TIMER_STARTED_Data

--- Посылается каждый раз, когда меняется время автоматической отправки группы в активность.
---@class EVENT_MATCH_MAKING_AUTO_DEPART_TIME_CHANGED_Data
---@field eventId ObjectId идентификатор активности в которую собирается группа

--- Посылается когда меняется информация о сражении, в котором аватар принимает участие.
---@class EVENT_MATCH_MAKING_CURRENT_BATTLE_CHANGED_Data

--- Посылается каждый раз, когда в списке инстанс-ивентов появляется новый элемент. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
---@class EVENT_MATCH_MAKING_EVENT_ADDED_Data
---@field eventId ObjectId id добавленного инстанс-ивента

--- Посылается когда у аватара появляется или теряется способность участвовать в каком-либо инстанс-ивенте.
---@class EVENT_MATCH_MAKING_EVENT_AVAILABILITY_CHANGED_Data
---@field eventId ObjectId id инстанс-ивента, чья доступность изменилась

--- Посылается когда у инстанс-ивента появляется или пропадает откат бонуса
---@class EVENT_MATCH_MAKING_EVENT_DOUBLE_BONUS_CHANGED_Data
---@field eventId ObjectId id инстанс-ивента, чей бонус изменился

--- Посылается каждый раз, когда получена новая информация о прогрессе текущего инстанс-ивента (либо по завершении инстанс-ивента, либо после включения получения информации о прогрессе текущего инстанс-ивента, см. matchMaking.ListenEventProgress( needListen ) (закрытая ссылка)).
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED_Data

--- Посылается при изменении статуса заверщённости текущего инстанс-ивента (предполагается, что принудительная телепортация из инстанса случится несколько позже и за это время игрок может просмотреть статистику по ивенту). Посылается только если включено слежение за прогрессом ивента (matchMaking.ListenEventProgress(true) (закрытая ссылка)), поэтому при каждом включении слежения за прогрессом (после получения сообщения EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED) текущее состояние нужно проверять дополнительно (matchMaking.GetEventProgressInfo(), поле completed).
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED_Data

--- Посылается при изменении длительности текущего инстанс-ивента. Посылается только если включено слежение за прогрессом ивента (matchMaking.ListenEventProgress(true) (закрытая ссылка)), поэтому при каждом включении слежения за прогрессом (после получения сообщения EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED) текущее состояние нужно проверять дополнительно (matchMaking.GetEventProgressInfo(), поле durationMs).
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_DURATION_CHANGED_Data

--- Посылается каждый раз, когда изменяется информация о достижениях одного из участников текущего инстанс-ивента (т.е. для  matchMaking.GetEventProgressInfo() меняются поля таблицы members: kills, totalDamageDone, totalHealDone).
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBER_CHANGED_Data

--- Посылается каждый раз, когда изменяется список с достижениями участников текущего инстанс-ивента (добавляются или удаляются участники).
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBERS_CHANGED_Data

--- Посылается каждый раз, когда удаляется информация о прогрессе текущего инстанс-ивента, скорее всего в результате соответствующего вызова matchMaking.ListenEventProgress( needListen ) (закрытая ссылка).
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_REMOVED_Data

--- Посылается каждый раз, когда изменяется номер текущего раунда, длительности раундов или времена начала раундов (т.е. поля round, durationsByRound и startTimesByRound результата функции  matchMaking.GetEventProgressInfo())
---@class EVENT_MATCH_MAKING_EVENT_PROGRESS_ROUNDS_CHANGED_Data

--- Посылается каждый раз, когда аватар присоединяется к очереди на какой-либо инстанс-ивент.
---@class EVENT_MATCH_MAKING_EVENT_QUEUE_ADDED_Data
---@field eventId ObjectId id инстанс-ивента

--- Посылается каждый раз, когда аватар выходит из очереди на какой-либо инстанс-ивент.
---@class EVENT_MATCH_MAKING_EVENT_QUEUE_REMOVED_Data
---@field eventId ObjectId id инстанс-ивента

--- Посылается, когда аватар удаляется сразу из всех очередей на инстанс-ивенты, в которых он находился (например в случае приглашения на инстанс-ивент).
---@class EVENT_MATCH_MAKING_EVENT_QUEUES_REMOVED_Data

--- Посылается каждый раз, когда из списка инстанс-ивентов удаляется какой-либо элемент. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
---@class EVENT_MATCH_MAKING_EVENT_REMOVED_Data
---@field eventId ObjectId id удалённого инстанс-ивента

--- Событие посылается, когда приглашение телепортироваться на инстанс-ивент теряет силу либо из-за отказа игрока или кого-то из членов группы, в составе которой игрок стоит в очереди на инстанс-ивент, либо из-за того, что игрок или его согрупник не отреагировал на приглашение за отведённое ему время.
---@class EVENT_MATCH_MAKING_EVENT_TELEPORT_REJECTED_Data
---@field eventId ObjectId Id инстанс-ивента, приглашение на который потеряло силу
---@field isTimeout boolean если true, то приглашение потеряло силу из-за истечения времени, если false, то из-за отказа игрока или кого-то из членов группы

--- Событие посылается, когда подходит очередь игрока на участие в инстанс-ивенте. Если до истечения таймаута ответ не послан, приглашение считается отвергнутым. Ответ (принять/отказаться) посылается через  matchMaking.InstancedEventTeleportReply( accept ) (закрытая ссылка).
---@class EVENT_MATCH_MAKING_EVENT_TELEPORT_REQUEST_Data
---@field eventId ObjectId Id инстанс-ивента, на который пришло приглашение
---@field timeoutMs integer время ожидания ответа (в ms), если ответа в течение этого времени нет, то приглашение считается отвергнутым
---@field isDelayedInvite boolean true, если аватар не может быть телепортирован сразу после согласия (например получил приглашение во время боя); в этом случае если согласие дано, аватар будет телепортирован в инстанс-ивент только по истечении timeoutMs; поведение при игнорировании приглашения (см. описание поля timeoutMs) от значения isDelayedInvite не зависит

--- Посылается каждый раз, когда для какого-либо инстанс-ивента меняется информация о количестве посещений за сегодняшний день основным игроком.
---@class EVENT_MATCH_MAKING_EVENT_VISITS_CHANGED_Data
---@field eventId ObjectId id добавленного инстанс-ивента

--- Посылается когда у аватара появляется или теряется способность участвовать в инстанс-ивентах.
---@class EVENT_MATCH_MAKING_EVENTS_AVAILABILITY_CHANGED_Data
---@field isAvailable boolean true если способность появилась, иначе false

--- Событие посылается всякий раз, когда каким-либо образом меняется информация о списке существующих в игре инстанс-ивентов (список стал доступен, список стал недоступен, добавлены или удалены элементы списка).
---@class EVENT_MATCH_MAKING_EVENTS_CHANGED_Data

--- Посылается каждый раз, когда каким-либо образом (добавляется-удаляется-меняется) изменяется оценка времени ожидания присоединения к какому-либо инстанс-ивенту. Должно быть включено получение и отслеживание информации об инстанс-ивентах, см. matchMaking.ListenEvents( needListen ).
---@class EVENT_MATCH_MAKING_JOIN_TIME_CHANGED_Data
---@field eventId ObjectId id инстанс-ивента, для которого изменилась оценка времени ожидания присоединения

--- Посылается каждый раз, когда меняется роль хотя бы одного персонажа в группе.
---@class EVENT_MATCH_MAKING_MEMBERS_ROLES_CHANGED_Data
---@field eventId ObjectId|nil идентификатор активности в которую собирается группа, nil - если поменялись роли в текущей активности в которой находится игрок

--- Посылается каждый раз, когда изменяется иноформация о достижениях команд-участников текущего инстанс-ивента ( matchMaking.GetEventProgressInfo(), поле achievements).
---@class EVENT_MATCH_MAKING_PROGRESS_ACHIEVEMENTS_CHANGED_Data

--- Посылается, когда изменяется список ресурсов, начисленных какому-либо из участников инстанс-ивента в качестве достижений (в списке появился новый ресурс или изменилось количество какого-либо уже присутствующего в списке ресурса). Посылается не чаще 1 раза в секунду.
---@class EVENT_MATCH_MAKING_PROGRESS_MEMBERS_ACHIEVEMENTS_CHANGED_Data

--- Уведомление об появлении нового активного достижения.
---@class EVENT_MEDAL_ADDED_Data
---@field id ObjectId идентификатор достижения

--- Уведомление об изменении прогресса достижения.
---@class EVENT_MEDAL_PROGRESS_CHANGED_Data
---@field id ObjectId идентификатор достижения

--- Уведомление об удалении активного достижения.
---@class EVENT_MEDAL_REMOVED_Data
---@field id ObjectId идентификатор достижения

--- Уведомление об изменении списка активных достижений.
---@class EVENT_MEDALS_CHANGED_Data

--- Событие приходит в ответ на запрос medalsLib.SearchMedals( name, limit ). В ответе перечислены идентификаторы ресурсов рангов найденных достижений.
---@class EVENT_MEDALS_SEARCH_RESULTS_Data

--- Уведомление о выполнении достижения членом группы или отряда аватара, но не самим аватаром.
---@class EVENT_MEMBER_MEDAL_FINISHED_Data
---@field id ObjectId идентификатор достижения
---@field avatarName WString имя персонажа выполнившего достижение

--- Уведомление о появлении у ментора нового ученика.
---@class EVENT_MENTOR_APPRENTICE_ADDED_Data
---@field mentorId ObjectId идентификатор (субъекта менторских взаимоотношений) ментора
---@field mentorPlayerId ObjectId идентификатор (субъекта менторских взаимоотношений) добавленного ученика

--- Уведомление об исчезновении ученика у ментора.
---@class EVENT_MENTOR_APPRENTICE_REMOVED_Data
---@field mentorId ObjectId идентификатор (субъекта менторских взаимоотношений) ментора
---@field mentorPlayerId ObjectId идентификатор (субъекта менторских взаимоотношений) удаленного ученика

--- Сообщение приходит, если у субъекта менторских взаимоотношений изменилась награда, полученная с ученика.
---@class EVENT_MENTOR_APPRENTICE_REWARD_CHANGED_Data
---@field mentorId ObjectId идентификатор субъекта менторских взаимоотношений - ментора
---@field apprenticeId ObjectId идентификатор субъекта менторских взаимоотношений - ученика

--- Уведомление об изменении метора, которым является главный игрок.
---@class EVENT_MENTOR_CHANGED_Data

--- Уведомление об изменении какого-то кулдауна менторской системы.
---@class EVENT_MENTOR_COOLDOWNS_CHANGED_Data

--- Уведомление об изменении общей информации о менторстве (флаги возможности/желания стать ментором/учеником).
---@class EVENT_MENTOR_DATA_CHANGED_Data

--- Сообщение приходит, если у ментора поменялась общая информация (изменился субъект менторских взаимоотношений и надо обновить его поля).
---@class EVENT_MENTOR_INFO_CHANGED_Data
---@field mentorId ObjectId идентификатор ментора

--- Уведомление об изменении сообщения ментора.
---@class EVENT_MENTOR_MESSAGE_CHANGED_Data
---@field mentorId ObjectId идентификатор ментора

--- Сообщение приходит, если у субъекта менторских взаимоотношений изменились какие-то поля.
---@class EVENT_MENTOR_PLAYER_INFO_CHANGED_Data
---@field mentorPlayerId ObjectId идентификатор субъекта менторских взаимоотношений

--- Событие приходит, если было начато улучшение мета-предметов. Пользователю необходимо показать диалог для получения параметров для  avatar.UpgradeMetaItem().
---@class EVENT_META_DIALOG_Data

--- Событие приходит, если необходимо закрыть диалог улучшения мета-предметов.
---@class EVENT_META_UPGRADE_BREAK_Data

--- Уведомление о результатах попытки улучшения мета-предмета.
---@class EVENT_META_UPGRADE_RESULT_Data
---@field sysCause string результат попытки улучшения, в случае удачи приходит "ENUM_ActionFailCause_NoFail"
---@field isLucky boolean сработал ли шанс моментального/двойного улучшения
---@field improvementIncrease float степень улучшения (в промежутке [0, 99])
---@field upgradeChanceBehavior string поведение при срабатывании шанса моментального/двойного улучшения
---@field upgradeVector string что улучшается: качество или уровень
---@field sourceId ObjectId идентификатор улучшаемого предмета
---@field enchancerId ObjectId идентификатор предмета-улучшителя
---@field agentId ObjectId идентификатор предмета реагента
---@field agentCount integer количество использованных предметов-реагентов
---@field resultId ObjectId идентификатор полученного предмета

--- Уведомление, что был освобожден слот с портретом. Скрипт обязан очистить (заменить на валидные) текстуры фонового слоя для всех виджетов, которые использовали данный слот. См. также:  mission.FreePortrait и mission.SetPortraitBackgroundTexture.
---@class EVENT_MISSION_FREE_PORTRAIT_SLOT_Data
---@field slot integer слот с портретом

--- Событие, информирующее о инициализации загрузки миссии (все аддоны готовы к использованию). После этого события приходят ещё и  EVENT_ADDON_LOAD_STATE_CHANGED.
---@class EVENT_MISSION_INITIALIZED_Data

--- Уведомление об появлении игрового события.
---@class EVENT_MISSION_RULE_ADDED_Data
---@field ruleId RuleId идентификатор ресурса события

--- Уведомление об изменении игрового события.
---@class EVENT_MISSION_RULE_CHANGED_Data
---@field ruleId RuleId идентификатор ресурса события

--- Уведомление об изменении счётчика игрового события.
---@class EVENT_MISSION_RULE_COUNTER_CHANGED_Data
---@field ruleId ObjectId идентификатор игрового события

--- Уведомление об ичезновении игрового события.
---@class EVENT_MISSION_RULE_REMOVED_Data
---@field ruleId RuleId идентификатор ресурса события

--- Уведомление об изменении информации об игровых событиях.
---@class EVENT_MISSION_RULES_CHANGED_Data

--- Событие присылается при окончании действия мобом.
---@class EVENT_MOB_ACTION_PROGRESS_FINISH_Data
---@field id ObjectId идентификатор моба

--- Событие присылается при заморозке прогресса действия моба.
---@class EVENT_MOB_ACTION_PROGRESS_FREEZE_Data
---@field id ObjectId идентификатор моба
---@field progress integer обновление времени действия action

--- Событие присылается при запуске действия мобом.
---@class EVENT_MOB_ACTION_PROGRESS_START_Data
---@field id ObjectId идентификатор моба
---@field duration integer время действия "действия"
---@field progress integer прошло времени (так как событие может прийти с задержкой)
---@field name WString название действия
---@field spellId SpellId если известен спелл, то присылается идентификатор спелла
---@field isPrecast boolean|nil если известен спелл, то присылается признак, что у спелла есть время прекаста
---@field isChannel boolean|nil если известен спелл, то присылается признак, что у спелла есть механика чаннелинга

--- Уведомление об эвейде моба.
---@class EVENT_MOB_EVADED_Data
---@field unitId ObjectId идентификатор моба

--- Приходит, если изменился список заданий процедурного данжа, связанных с мобом.
---@class EVENT_MOB_RELATED_GOALS_CHANGED_Data
---@field unitId ObjectId идентификатор моба

--- Приходит, если изменился список заданий, связанных с мобом.
---@class EVENT_MOB_RELATED_QUESTS_CHANGED_Data
---@field unitId ObjectId идентификатор моба

--- Событие посылается каждый раз, когда изменилось состояние движение аватара в точку (начали/закончили режим движения в точку, изменилась точка назначения).
---@class EVENT_MOVE_BY_CLICK_CHANGED_Data

--- Событие присылается при изменении модификатора зоны мутации.
---@class EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED_Data

--- Событие присылается при изменении заполненности игровой зоны мутации.
---@class EVENT_MUTATION_ZONE_POPULATION_CHANGED_Data

--- Событие посылается, когда изменяется информация о стоимости постановки флагов атаки на сектор.
---@class EVENT_MWAR_FLAG_COSTS_CHANGED_Data

--- Событие приходит, когда изменяется информация о рейтинге гильдий для Доминиона (начала транслироваться на клиент или перестала транслироваться на клиент, или обновилась).
---@class EVENT_MWAR_LADDER_CHANGED_Data

--- Посылается, когда меняется информация о том, в очереди на какое сражение Доминиона стоит аватар.
---@class EVENT_MWAR_QUEUE_CHANGED_Data

--- Событие приходит, когда изменяется информация о сторонах сражения Доминиона (начала транслироваться на клиент или перестала транслироваться на клиент, или обновилась во время работающей трансляции).
---@class EVENT_MWAR_RATING_PROGRESS_CHANGED_Data

--- Событие присылается, если изменилась возможность автонавигации.
---@class EVENT_NAVIGATE_ENABLED_CHANGED_Data

--- Событие посылается, когда навигационный сканер получил информацию об астрале в текущем сканируемом хабе сканера.
---@class EVENT_NAVIGATION_SCANER_HUB_PVE_INFO_Data

--- Событие посылается, когда навигационный сканер получил информацию об игроках в текущем сканируемом хабе сканера.
---@class EVENT_NAVIGATION_SCANER_HUB_PVP_INFO_Data

--- Событие посылается, когда навигационный сканер начал сканировать хаб и уже получил базовую информацию об этом хабе.
---@class EVENT_NAVIGATION_SCANER_HUB_STARTED_Data

--- Событие посылается, когда навигационный сканер получил информацию о следах кораблей игроков в хабе главного игрока.
---@class EVENT_NAVIGATION_SCANER_HUB_TRAILS_INFO_Data

--- Событие посылается каждый раз, когда меняется статус device.HasNavigatorFollowedMarker().
---@class EVENT_NAVIGATOR_FOLLOWED_CHANGED_Data

--- Событие посылается каждый раз, когда меняется список сундуков во вражеской сокровищнице, увиденных с помощью специального предмета через навигатор корабля главного игрока.
---@class EVENT_NAVIGATOR_TARGET_CHESTS_CHANGED_Data

--- Присылается при изменении значения BloodPool некроманта.
---@class EVENT_NECROMANCER_BLOOD_POOL_CHANGED_Data

--- Уведомление об открытии новой репутации.
---@class EVENT_NEW_REPUTATION_APPEARED_Data
---@field factionId FactionId фракция

--- Уведомление об открытии страницы с полным текстом новости в окне нотификации новостей.
---@class EVENT_NEWS_POST_LOADED_Data
---@field ruleId ObjectId если у новости нет привязки к игровому событию, то nil; иначе идентификатор игрового события (во внутриигровом календаре), которому соответствует новость

--- Уведомление о выборе новости в окне нотификации новостей (для перехода на соответствующее событие во внутриигровом календаре).
---@class EVENT_NEWS_POST_SELECTED_Data
---@field ruleId ObjectId идентификатор игрового события (во внутриигровом календаре), которому соответствует новость; если у новости нет привязки к игровому событию, то nil

--- Событие посылается каждый раз, когда у объекта появляется новый баф. Если обновляются параметры существующего, то приходит  EVENT_OBJECT_BUFF_CHANGED.
---@class EVENT_OBJECT_BUFF_ADDED_Data
---@field objectId ObjectId идентификатор объекта на который повесили баф
---@field buffName WString имя бафа
---@field buffId ObjectId идентификатор бафа
---@field sysName string системное название бафа
---@field resourceId buffId идентификатор ресурса бафа
---@field isNeedVisualize boolean нужно ли отображать данный бафф
---@field interfacePriority int интерфейсный приоритет

--- Событие посылается каждый раз, когда у объекта изменяются свойства существующего бафа, а именно:
---@class EVENT_OBJECT_BUFF_CHANGED_Data
---@field objectId ObjectId идентификатор объекта на который повесили баф
---@field buffName WString имя бафа
---@field buffId ObjectId идентификатор бафа
---@field sysName string системное название бафа
---@field resourceId buffId идентификатор ресурса бафа
---@field isNeedVisualize boolean нужно ли отображать данный бафф
---@field interfacePriority int интерфейсный приоритет

--- Событие посылается каждый раз, когда у объекта появляется новый бафф для которого требуется визуализация прогресса (бафф имеет группу castbar).
---@class EVENT_OBJECT_BUFF_PROGRESS_ADDED_Data

--- Событие посылается каждый раз, когда у объекта изменяются свойства бафа для которого требуется визуализация прогресса (бафф имеет группу castbar).
---@class EVENT_OBJECT_BUFF_PROGRESS_CHANGED_Data

--- Событие посылается каждый раз, когда у объекта пропадает бафф для которого требуется визуализация прогресса (бафф имеет группу castbar).
---@class EVENT_OBJECT_BUFF_PROGRESS_REMOVED_Data

--- Событие посылается каждый раз, когда у объекта пропадает баф.
---@class EVENT_OBJECT_BUFF_REMOVED_Data
---@field objectId ObjectId идентификатор объекта у которого пропал баф
---@field buffName WString имя бафа
---@field buffId ObjectId идентификатор бафа
---@field sysName string внутреннее имя бафа (может быть использовано для специальной обработки), соответствующее поле в базе для бафа - "sysUIScriptName"
---@field resourceId buffId идентификатор ресурса бафа
---@field isNeedVisualize boolean нужно ли отображать данный бафф
---@field interfacePriority int интерфейсный приоритет

--- Событие посылается не чаще одного раза в кадр, если в данном кадре у объекта изменился набор буфов. Подразумевается именно добавление или удаление бафов, но не изменение свойств существующих.
---@class EVENT_OBJECT_BUFFS_CHANGED_Data
---@field objectId ObjectId

--- Событие посылается не чаще одного раза в кадр, если в данном кадре у какого-либо из объектов вокруг игрока меняется информация о каком либо буфе.
---@class EVENT_OBJECT_BUFFS_ELEMENT_CHANGED_Data
---@field objects tables[] индексированная по ObjectId таблица таблиц:
---@field key ObjectId идентификатор объекта
---@field value boolean[] таблица, индексированная по идентификаторам изменившихся бафов

--- Событие посылается при изменение состояния интерактивного объекта бой/не бой.
---@class EVENT_OBJECT_COMBAT_STATUS_CHANGED_Data
---@field objectId ObjectId идентификатор объекта
---@field inCombat boolean состояние бой/не бой

--- Событие посылается при окончании отслеживания объекта на карте с помощью специального умения.
---@class EVENT_OBJECT_DETECT_FINISHED_Data
---@field objectId ObjectId Id объекта (юнит или устройство)

--- Событие посылается при начале отслеживания объекта на карте.
---@class EVENT_OBJECT_DETECT_STARTED_Data
---@field objectId ObjectId Id объекта (юнит или устройство)

--- Событие посылается, если у отслеживаемого объекта изменился список детекторов.
---@class EVENT_OBJECT_DETECTOR_LIST_CHANGED_Data
---@field objectId ObjectId Id объекта (юнит или устройство)

--- Событие посылается каждый раз, когда изменилось состояние диминишинга у объекта.
---@class EVENT_OBJECT_DIMINISHING_CHANGED_Data

--- Событие посылается каждый раз, когда изменилось состояние одной из групп диминишинга.
---@class EVENT_OBJECT_DIMINISHING_GROUP_CHANGED_Data
---@field objectId ObjectId идентификатор объекта
---@field group integer группа диминишинга
---@field level number уровень диминишинга(от 0 до 3, где 0 - полное отсутствие диминишинга, 3 - полное сопротивление контролям из данной группы)

--- Событие присылается при изменении процентного значения здоровья интерактивных объектов и числового значения здоровья для персонажа игрока
---@class EVENT_OBJECT_HEALTH_CHANGED_Data
---@field id ObjectId идентификатор объекта
---@field healthDelta integer|nil на сколько изменилась точная величина здоровья, если такая информация доступна для этого объекта
---@field healthLimitDelta integer|nil на сколько изменилась максимальная величина здоровья, если такая информация доступна для этого объекта
---@field healthPercentsDelta integer|nil на сколько изменилась относительная величина здоровья, если такая информация доступна для этого объекта
---@field additionalDelta integer|nil на сколько изменилась точная величина дополнительного здоровья (поглощение), если такая информация доступна для этого объекта
---@field additionalPercentsDelta integer|nil на сколько изменилась относительная величина дополнительного здоровья (поглощение), если такая информация доступна для этого объекта
---@field isInvulnerableChanged boolean поменялся ли isInvulnerable (состояние неуязвимости)

--- Событие присылается при изменении процентного значения маны интерактивных объектов и числового значения маны для персонажа игрока
---@class EVENT_OBJECT_MANA_CHANGED_Data
---@field id ObjectId идентификатор объекта
---@field manaDelta integer|nil на сколько изменилась точная величина маны, если такая информация доступна для этого объекта
---@field manaLimitDelta integer|nil на сколько изменилась максимальная величина маны, если такая информация доступна для этого объекта
---@field manaPercentsDelta integer|nil на сколько изменилась относительная величина маны, если такая информация доступна для этого объекта

--- Сообщение об изменении имени объекта.
---@class EVENT_OBJECT_NAME_CHANGED_Data
---@field id ObjectId идентификатор объекта

--- Сообщение об изменении возможности выделить объект в цель.
---@class EVENT_OBJECT_SELECTABLE_CHANGED_Data
---@field objectId ObjectId идентификатор объекта

--- Событие посылается каждый раз, когда у объекта удаляется информация о специфических параметрах UI для данного объекта.
---@class EVENT_OBJECT_UIINFO_REMOVED_Data
---@field objectId ObjectId

--- Событие присылается при изменения здоровья и состояния неуязвимости объектов
---@class EVENT_OBJECTS_HEALTH_CHANGED_Data

--- Уведомление об изменении значения опций. Текущие значения больше недействительны и необходимо полное обновление. Для обновления необходимо использовать функцию  options.Update().
---@class EVENT_OPTION_CHANGED_Data
---@field sysCustomId string идентификатор пользовательской опции

--- Присылается при изменении значение достижений.
---@class EVENT_ORDER_ACHIEVEMENTS_CHANGED_Data

--- Присылается при изменении возможности голосования.
---@class EVENT_ORDER_CAN_VOTE_CHANGED_Data
---@field canVote boolean true если можно голосовать

--- Присылается, когда у аватара появляется или пропал орден.
---@class EVENT_ORDER_CHANGED_Data

--- Присылается при изменении информации об ордене.
---@class EVENT_ORDER_INFO_CHANGED_Data

--- Присылается в ответ на голосование за бонусы.
---@class EVENT_ORDER_VOTE_ANSWER_Data
---@field isOk boolean индикатор успешности голосования
---@field result string результат голосования

--- Событие посылается каждый раз, когда у члена группы главного игрока меняется активный пет.
---@class EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED_Data
---@field playerId ObjectId идентификатор члена группы

--- Событие присылается при изменение координат игрока, состоящего в группе с основным игроком.
---@class EVENT_PARTY_MEMBER_POSITION_UPDATED_Data
---@field id ObjectId Id игрока

--- Событие посылается каждый раз, когда персонаж становится/перестаёт быть пассажиром, к примеру, на двухместном маунте.
---@class EVENT_PASSANGER_STATE_CHANGED_Data
---@field passangerState boolean является ли персонаж пассажиром, к примеру, на двухместном маунте.

--- Событие посылается каждый раз, когда у какого-либо пета, находящегося в области видимости главного игрока, меняется имя или пол.
---@class EVENT_PET_INFO_CHANGED_Data
---@field id ObjectId id пета

--- Событие присылается при клике игроком в интерактивный объект или мимо него в основном 3D-окне.
---@class EVENT_PICK_OBJECT_Data
---@field objectId ObjectId идентификатор объекта или nil, если кликнули мимо объекта
---@field simplified boolean схема управления: основная ("WSAD")/упрощенная ("simplified_move")
---@field moveByClick boolean в схеме управления включено движение по клику мыши
---@field primary boolean способ выбора объекта (основная/альтернативная кнопки мыши)
---@field dblClick boolean клик/двойной клик мыши
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)

--- Событие, которое приходит после выполнения слеш-команды (в чате) /played.
---@class EVENT_PLAYED_COMMAND_RESPONSE_Data
---@field time table сколько времени игрок провёл в игре, поля таблицы:

--- Событие присылается при изменении уровня астрального анлока игрока.
---@class EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED_Data
---@field playerId ObjectId идентификатор игрока

--- Приходит, если изменился текущий рейтинг экипировки персонажа. Приходит только  для главного и инспектируемого игроков.
---@class EVENT_PLAYER_GEAR_SCORE_CHANGED_Data
---@field playerId ObjectId идентификатор игрока

--- Приходит, если изменилось состояние величия игрока.
---@class EVENT_PLAYER_GREAT_CHANGED_Data
---@field playerId ObjectId идентификатор игрока

--- Событие присылается при изменении титула основного игрока или любого игрока, находящегося в области видимости.
---@class EVENT_PLAYER_TITLE_CHANGED_Data
---@field id ObjectId

--- Событие присылается при изменении списка доступных титулов персонажа, находящегося в области видимости.
---@class EVENT_PLAYER_TITLES_CHANGED_Data
---@field id ObjectId

--- Уведомление об изменении игрового окна. См. также:  common.GetPosConverterParams().
---@class EVENT_POS_CONVERTER_CHANGED_Data

--- Событие посылается при открытии/закрытии контейнера прокачанного оружия.
---@class EVENT_POWEREDLSWEAPONS_CHANGED_Data

--- Событие возникающее при добавлении предмета в прокаченое оружие.
---@class EVENT_POWEREDLSWEAPONS_ITEM_ADDED_Data
---@field itemId ObjectId идентификатор добавленного предмета
---@field slot integer номер слота

--- Событие присылается при изменении бонусной стадии премиума.
---@class EVENT_PREMIUM_BONUS_STAGE_CHANGED_Data
---@field stage number бонусная стадия премиума

--- Событие присылается при изменении состояния премиума premiumLib.GetInfo().
---@class EVENT_PREMIUM_CHANGED_Data

--- Событие присылается при изменении стадии премиума.
---@class EVENT_PREMIUM_STAGE_CHANGED_Data
---@field stage number стадия премиума

--- Событие посылается при старте изменения фракции (прайденов).
---@class EVENT_PRIDEN_FACTION_CHOICE_Data
---@field isLevelUp boolean спецфлаг для донатного левелапа прайдена после выбора фракции
---@field noDiscard boolean если true то запрещено отвергать выбор, интерфейс выбора не должен закрываться без принятия решения

--- Появилось новое задание для процедурного данжа.
---@class EVENT_PROCEDURAL_DUNGEON_GOAL_ADDED_Data
---@field goal ObjectId идентификатор задания

--- Изменился счетчик в задании процедурного данжа.
---@class EVENT_PROCEDURAL_DUNGEON_GOAL_COUNT_CHANGED_Data
---@field goal ObjectId идентификатор задания

--- Изменилось состояние задания процедурного данжа.
---@class EVENT_PROCEDURAL_DUNGEON_GOAL_STATE_CHANGED_Data
---@field goal ObjectId идентификатор задания

--- Изменился список заданий для игрока в процедурном данже.
---@class EVENT_PROCEDURAL_DUNGEON_GOALS_CHANGED_Data

--- Изменился список ключевых точек для игрока в процедурном данже.
---@class EVENT_PROCEDURAL_DUNGEON_POINTS_CHANGED_Data

--- Появился новый сценарий для процедурного данжа.
---@class EVENT_PROCEDURAL_DUNGEON_SCENARIO_ADDED_Data
---@field id ObjectId идентификатор сценария

--- Изменилось состояние сценария процедурного данжа.
---@class EVENT_PROCEDURAL_DUNGEON_SCENARIO_STATE_CHANGED_Data
---@field id ObjectId идентификатор сценария

--- Уведомление о прерывании текущего действия.
---@class EVENT_PROCESS_TERMINATED_Data
---@field sysId string строковый код ошибки вида "ENUM_ActionFailCause_..."

--- Событие посылается, когда главный игрок может пользоваться новой профессией (в данный момент, это способность носить вещи определенного класса).
---@class EVENT_PROFICIENCY_ADDED_Data

--- Событие посылается, когда главный игрок больше не может пользоваться профессией (в данный момент, это способность носить вещи определенного класса).
---@class EVENT_PROFICIENCY_REMOVED_Data

--- Событие посылается один раз в кадр, если произошло изменение проецированной 2D координаты (или других параметров) некоторых объектов из списка проецируемых объектов.
---@class EVENT_PROJECTED_OBJECTS_CHANGED_Data

--- Событие присылается при изгнании из барьера урона (класс паладин, спелл "изгнать боль").
---@class EVENT_PURGE_BARRIER_DAMAGE_Data
---@field damage integer размер изгнанного из барьера урона

--- Событие посылается при удалении задания сервером из журнала заданий (например, при отсутствии условий выполнения задания).
---@class EVENT_QUEST_ABANDONED_Data
---@field name WString название задания

--- Событие посылается при невозможности взять квест.
---@class EVENT_QUEST_ACCEPT_ERROR_Data
---@field result integer

--- Событие посылается каждый раз, когда меняется книга заданий.
---@class EVENT_QUEST_BOOK_CHANGED_Data

--- Событие приходит при изменении лимитов журнала заданий: изменении максимально допустимого количества обычных и ежедневных заданий.
---@class EVENT_QUEST_BOOK_LIMITS_CHANGED_Data

--- Событие посылается каждый раз, когда игрок попытался сдать уже выполненное задание квестгиверу, и сервер подтвердил, что задание выполнено и сдано (принято ютом).
---@class EVENT_QUEST_COMPLETED_Data
---@field questId QuestId

--- Событие посылается каждый раз, когда игрок удаляет задание из журнала задний (отказывается от выполнения этого задания).
---@class EVENT_QUEST_DISCARDED_Data
---@field name WString название задания

--- Событие посылается при провале квеста.
---@class EVENT_QUEST_FAILED_Data
---@field questId QuestId

--- Событие посылается, когда с сервера приходит ответ на запрошенную игроком подсказку "какой следующий квест делать" (вызовом avatar.FindNextQuest( mode )).
---@class EVENT_QUEST_FIND_NEXT_RESULT_Data
---@field questId QuestId

--- Событие посылается при отказе сервера принять задание из-за нехватки места в инвентаре.
---@class EVENT_QUEST_FINISH_FAILED_NO_SPACE_Data
---@field questId QuestId идентификатор задания
---@field pocket integer|nil номер переполненного кармана, если переполнен карман

--- Оповещение о смене маркера у объекта-квестодателя. Объект может быть NPC или устройством.
---@class EVENT_QUEST_MARK_UPDATED_Data
---@field objectId ObjectId идентификатор интерактивного объекта

--- Событие посылается каждый раз, когда произошло изменение состояния одного из подзаданий квеста.
---@class EVENT_QUEST_OBJECTIVE_UPDATED_Data
---@field questId QuestId идентификатор ресурса квеста
---@field objectiveId ObjectId идентификатор счетчика квеста
---@field objectiveNumber integer (OBSOLETE) номер подзадания в списке objectives, возвращаемого функцией GetQuestProgress

--- Событие посылается при окончании квеста, когда он становится готов к сдаче, или наоборот.
---@class EVENT_QUEST_READY_TO_RETURN_CHANGED_Data
---@field questId QuestId

--- Событие посылается каждый раз, когда игрок получил и принял задание.
---@class EVENT_QUEST_RECEIVED_Data
---@field questId QuestId

--- Событие посылается каждый раз, когда произошло обновление наград за выполнение задания. Награды при этом могут не измениться.
---@class EVENT_QUEST_REWARD_UPDATED_Data
---@field questId QuestId

--- Событие посылается, когда другой игрок хочет поделиться своим квестом с группой.
---@class EVENT_QUEST_SHARE_INVITATION_Data
---@field shareId ObjectId уникальный идентификатор предложения

--- Событие посылается в результате предложения задания от другого игрока.
---@class EVENT_QUEST_SHARE_INVITATION_RESULT_Data
---@field questName WString название отменяемого задание
---@field sharerName WString имя игрока, предлагавшего задание
---@field sharerId ObjectId Id игрока, предлагавшего задание
---@field result int результат

--- Событие посылается в случае отмены предложения задания от другого игрока из-за таймаута.
---@class EVENT_QUEST_SHARE_INVITATION_TIMEOUT_Data
---@field questName WString название отменяемого задание
---@field sharerName WString имя игрока, предлагавшего задание

--- Событие посылается при отказе сервера начать задание из-за нехватки места в списке квестов (уже взято максимальное количество квестов).
---@class EVENT_QUEST_START_FAILED_LOG_FULL_Data
---@field questId QuestId идентификатор задания

--- Событие посылается при отказе сервера начать задание из-за нехватки места в инвентаре.
---@class EVENT_QUEST_START_FAILED_NO_SPACE_Data
---@field questId QuestId идентификатор задания
---@field pocket integer|nil номер переполненного кармана, если переполнен карман

--- Событие посылается если время квестового таймера истекло.
---@class EVENT_QUEST_TIMER_FINISHED_Data
---@field questId QuestId

--- Событие посылается если был запущен квестовый таймер или изменилась его продолжительность.
---@class EVENT_QUEST_TIMER_UPDATED_Data
---@field questId QuestId
---@field durationMs integer продолжительность таймера
---@field timeLeftMs integer оставшееся время таймера

--- Событие посылается каждый раз, когда произошло изменение в списке целей задания.
---@class EVENT_QUEST_UPDATED_Data
---@field questId QuestId

--- Уведомление о появлении нового вопроса.
---@class EVENT_QUESTION_ADDED_Data
---@field id ObjectId идентификатор появившегося вопроса

--- Уведомление об удалении вопроса.
---@class EVENT_QUESTION_REMOVED_Data
---@field id ObjectId идентификатор удалённого вопроса

--- Уведомление о появлении новых результатов массового опроса.
---@class EVENT_QUESTION_RESULTS_CHANGED_Data
---@field id ObjectId идентификатор опроса

--- Присылается в случае неудачной попытки приглашения в рейд (игрок уже в рейде).
---@class EVENT_RAID_ALREADY_IN_Data
---@field declinerName WString имя приглашаемого игрока

--- Событие на появление рейда. Присылается не только на действительное создание рейда, но и при вхождении игрока в состав уже существующего.
---@class EVENT_RAID_APPEARED_Data

--- Присылается в случае невозможности вступить в рейд (после вызова raid.Accept()).
---@class EVENT_RAID_CANT_ACCEPT_Data

--- Присылается в случае невозможности попасть на локацию, так как игрок не вступил в рейд.
---@class EVENT_RAID_CANT_ENTER_MAP_Data
---@field mapName WString|nil название локации, если возможно получить

--- Событие на изменение состава рейда (включая создание и роспуск).
---@class EVENT_RAID_CHANGED_Data

--- Присылается в случае неудачной попытки приглашения в рейд.
---@class EVENT_RAID_DECLINE_Data
---@field declinerName WString имя приглашаемого игрока

--- Присылается в случае неудачной попытки приглашения в рейд (игрок занят).
---@class EVENT_RAID_DECLINE_BUSY_Data
---@field declinerName WString имя приглашаемого игрока

--- Уведомление о невозможности приглашения в рейд по причине игнора.
---@class EVENT_RAID_DECLINE_IGNORED_Data
---@field declinerName WString имя приглашаемого игрока

--- Событие на исчезновение рейда. Присылается не только на роспуск рейда, но и при выходе игрока из состава существующего.
---@class EVENT_RAID_DISAPPEARED_Data

--- Присылается при попытке войти в инст, когда в инст не пустят.
---@class EVENT_RAID_ENTER_VARS_MAP_UNAVALIABLE_Data
---@field mapName WString имя карты
---@field variables VariableId[] список боссов, из-за которых не пустят в инст

--- Присылается при попытке войти в инст, когда прогресс инста не соответствует прогрессу сохранения.
---@class EVENT_RAID_ENTER_VARS_MAP_WARNING_Data
---@field mapName WString имя карты
---@field variables VariableId[] список боссов, из-за который происходит расхождение

--- Присылается в случае невозможности выполнить указанную операцию с рейдом.
---@class EVENT_RAID_FAILED_Data
---@field sysReason string строковое описание причины

--- Присылается в случае получения приглашения в рейд.
---@class EVENT_RAID_INVITE_Data
---@field inviterName WString имя приглашающего игрока
---@field inviterShardName WString имя шарда приглашающего игрока

--- Присылается в случае исчезновения приглашения в рейд. Оно может истечь по времени, быть принято или отклонено.
---@class EVENT_RAID_INVITE_END_Data

--- Присылается в случае изменения лидера рейда.
---@class EVENT_RAID_LEADER_CHANGED_Data

--- Присылается в случае изменения помощника лидера рейда.
---@class EVENT_RAID_LEADER_HELPER_CHANGED_Data
---@field oldLeaderHelper UniqueId уникальный идентификатор аватара, который был помощником лидера рейда (или nil - если до этого не назначался)
---@field newLeaderHelper UniqueId уникальный идентификатор аватара, который стал помощником лидера рейда (или nil - если теперь помощника лидера рейда нет)

--- Присылается в случае изменения ответственного за лут рейда.
---@class EVENT_RAID_LOOT_MASTER_CHANGED_Data
---@field oldLootMaster UniqueId уникальный идентификатор аватара, который был ответственным за лут рейда (или nil - если до этого не назначался)
---@field newLootMaster UniqueId уникальный идентификатор аватара, который стал ответственным за лут рейда (или nil - если теперь ответственного за лут рейда нет)

--- Присылается в случае появления игрока в отряде.
---@class EVENT_RAID_MEMBER_ADDED_Data
---@field name WString имя игрока
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

--- Присылается в случае изменения один или более параметров члена рейда
---@class EVENT_RAID_MEMBER_CHANGED_Data
---@field name WString имя аватара, который изменился
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

--- Событие присылается при изменение координат игрока, состоящего в отряде с основным игроком.
---@class EVENT_RAID_MEMBER_POSITION_UPDATED_Data
---@field id ObjectId Id игрока

--- Присылается в случае удаления или ухода игрока из отряда.
---@class EVENT_RAID_MEMBER_REMOVED_Data
---@field name WString имя игрока
---@field id ObjectId|nil идентификатор игрока, если доступен
---@field uniqueId UniqueId|nil уникальный постоянный идентификатор персонажа

--- Предложение о сохранении в этой карте. Присылается в случае захода в существующий рейдовый инстанс.
---@class EVENT_RAID_SAVE_MAP_QUESTION_Data
---@field timeoutMs integer таймаут на ответ в миллисекундах
---@field mapName WString|nil название локации, если возможно получить

--- Событие посылается каждый раз, когда у транспортного средства игрока до взрыва реактора осталось определённое время.
---@class EVENT_REACTOR_COUNTDOWN_Data
---@field timeMs integer оставшееся время в миллисекундах

--- Событие посылается каждый раз, когда у транспортного средства игрока отменено самоуничтожение реактора.
---@class EVENT_REACTOR_COUNTDOWN_CANCELLED_Data

--- Событие посылается при завершении опроса о готовности группы или рейда.
---@class EVENT_READY_CHECK_ENDED_Data

--- Событие посылается каждый раз, когда меняется состояние готовности игрока в группе или рейде (для текущего активного опроса). На начало и окончание опроса приходят отдельные события, данное событие в этих случаях не приходит.
---@class EVENT_READY_CHECK_INFO_CHANGED_Data

--- Событие посылается при начале опроса о готовности группы или рейда.
---@class EVENT_READY_CHECK_STARTED_Data
---@field initiatorId UniqueId уникальынй идентификатор игрока игрока, активировавшего опрос

--- Событие присылается, если игрок готов к окончательному воскрешению из чистилища. Искра уже пришла к нему.
---@class EVENT_READY_FOR_FINALLY_RESPAWN_Data

--- Завершён reforge крафт вещи, можно запрашивать доступные варианты.
---@class EVENT_REFORGE_RESULT_Data

--- Reforge-крафт вещи завершён неудачно, выбранный вариант итема НЕ получен.
---@class EVENT_REFORGE_RESULT_FAIL_Data

--- Завершён reforge крафт вещи, выбранный вариант итема получен.
---@class EVENT_REFORGE_RESULT_READY_Data
---@field itemId ObjectId идентификатор полученного итема

--- Событие присылается при уменьшении барьера (класс паладин, спелл "уменьшить боль").
---@class EVENT_RELIEF_BARRIER_DAMAGE_Data
---@field damage integer кол-во урона, на которое был уменьшен барьер

--- Событие о запросе на расшаривание умений для альта главного игрока.
---@class EVENT_REMORT_ABILITY_SHARING_REQUEST_Data

--- В окне создания реморта, камера закончила движение после вызова  remortCreation.SetCameraPath(...).
---@class EVENT_REMORT_CHARACTER_SCENE_CAMERA_READY_Data

--- Пришел список ремортов для переключения главного игрока на один из них.
---@class EVENT_REMORT_LIST_GAINED_Data

--- Пришел запрос на создание реморта. Необходимо показать диалог создания реморта.
---@class EVENT_REMORT_SHOW_CREATION_DIALOG_Data

--- Событие приходит при обновлении информации о вариациях персонажей.
---@class EVENT_REMORT_VARIATIONS_INFO_CHANGED_Data

--- В режиме создания реморта, камера может назумливаться на лицо персонажа. При изменении состояния назумленности или возможности назумливаться приходит это сообщение.
---@class EVENT_REMORT_ZOOM_TRIGGER_CHANGED_Data

--- Уведомление об удалении открытой репутации.
---@class EVENT_REPUTATION_DISAPPEARED_Data
---@field factionId FactionId фракция

--- Уведомление об изменении уровня репутации.
---@class EVENT_REPUTATION_LEVEL_CHANGED_Data
---@field factionId FactionId фракция

--- Уведомление об изменении значения репутации.
---@class EVENT_REPUTATION_VALUE_CHANGED_Data
---@field factionId FactionId фракция
---@field delta integer числовое изменение репутации (может быть как положительным, так и отрицательным числом)

--- Событие присылается при воскрешении главного игрока с кладбища. Воскрешение с кладбище происходит втоматически или вызовом искры.
---@class EVENT_RESPAWN_FROM_GRAVEYARD_Data

--- Событие присылается при перемещении главного игрока на кладбище и начале ожидания возвращения своей искры. Возвращение на кладбище инициируется avatar.Respawn().
---@class EVENT_RESPAWN_STARTED_Data

--- Этот запрос посылается, когда кто-то пытается оживить главного игрока, и игрок не успел ответить avatar.ResurrectReply( accept ).
---@class EVENT_RESURRECT_REJECTED_Data
---@field resurrecterName WString имя юнита, пытавшегося оживить игрока.
---@field unitId ObjectId Id юнита, пытавшегося оживить игрока, если он есть в реплике.

--- Этот запрос посылается, когда кто-то пытается оживить главного игрока. В ответ игрок должен ответить avatar.ResurrectReply( accept ). Если игрок не успеет, то прийдёт EVENT_RESURRECT_REJECTED.
---@class EVENT_RESURRECT_REQUESTED_Data
---@field resurrecterName WString имя юнита, пытающегося оживить игрока.
---@field unitId ObjectId Id юнита, пытающегося оживить игрока.
---@field timeOutMs integer сколько миллисекунд действует это приглашение

--- Результат попытки пригласить игрока вернуться в игру. Содержит статус ENUM_CreateRevivalRollResultStatus.
---@class EVENT_REVIVAL_ROLL_RESULT_Data
---@field status String("ENUM_CreateRevivalRollResultStatus") статус; строковая константа

--- Обновился список игроков которым можно выслать предложение вернуться в игру.
---@class EVENT_REVIVALS_CHANGED_Data

--- Уведомление о результате взаимодействия с руной.
---@class EVENT_RUNE_OPERATION_RESULT_Data
---@field sysResult string код результата

--- Событие посылается, если изменился список объектов насканеных навигатором корабля главного игрока.
---@class EVENT_SCANNED_HUB_OBJECTS_CHANGED_Data

--- Оповещение о раскрытии всех компонент тайны мира. Теперь главное задание тайны мира можно сдать.
---@class EVENT_SECRET_CLOSED_Data
---@field id ObjectId

--- Оповещение о завершении компоненты тайны мира. Сдан завершающий квест по этой компоненте.
---@class EVENT_SECRET_COMPONENT_CLOSED_Data
---@field id ObjectId
---@field componentIndex integer индекс завершенной компоненты

--- Оповещение о завершении тайны мира. Задание сдано, награда получена.
---@class EVENT_SECRET_FINISHED_Data
---@field id ObjectId

--- Оповещение о изменении статуса тайны мира, которую может принять интерактивный объект. Происходит, если интерактивный объект есть в реплике и изменился статус (не сделан/сделана/сдана) какой-то тайны мира. В этом случае, например, можно поменять знак над головой этого объекта.
---@class EVENT_SECRET_FINISHER_STATUS_CHANGED_Data
---@field id ObjectId

--- Оповещение об открытии новой тайны мира.
---@class EVENT_SECRET_OPENED_Data
---@field id ObjectId

--- Оповещение об изменении тайн мира. Например при изменении фракции.
---@class EVENT_SECRETS_CHANGED_Data

--- Событие посылается каждый раз, когда у щита корабля меняется регенерирование.
---@class EVENT_SHIELD_REGEN_IN_PROGRESS_CHANGED_Data
---@field id ObjectId Id устройства

--- Событие посылается каждый раз, когда у щита корабля меняется сила (само значение или максимальная величина).
---@class EVENT_SHIELD_STRENGTH_CHANGED_Data
---@field id ObjectId Id устройства
---@field strengthDelta number( изменение силы

--- Уведомление об изменении в процессе кастомизации корабля в ангаре главного игрока.
---@class EVENT_SHIP_CUSTOMIZING_CHANGED_Data

--- Уведомление о получении конце кастомизации корабля в ангаре главного игрока.
---@class EVENT_SHIP_CUSTOMIZING_FINISHED_Data

--- Уведомление о получении начале кастомизации корабля в ангаре главного игрока. Начиная с этого момента можно заменять визуальные украшения корабля прямо на самом корабле.
---@class EVENT_SHIP_CUSTOMIZING_STARTED_Data

--- Событие посылается в момент нанесения урона кораблю. Поля attacker, defender, damageSource могут быть равны nil, если за время до получения события соответствующий корабль или астральный монстр успел исчезнуть (вышел за пределы видимости, разрушился). Кроме того attacker может быть равен nil, если стрелял не корабль и не астральный монстр.
---@class EVENT_SHIP_DAMAGE_RECEIVED_Data
---@field attacker ObjectId id корабля или астрального монстра, с которого стреляли.
---@field defender ObjectId id корабля или астрального монстра, в который попали.
---@field damageSource ObjectId id интерактивного объекта, который произвел выстрел (пушка).
---@field attackerPlayer ObjectId id игрока, который произвел выстрел.
---@field totalDamage integer
---@field hullDamage integer
---@field shieldDamage integer
---@field deviceDamage integer
---@field isCritical boolean true - нанесен критический урон
---@field isGlancing boolean true - нанесен уменьшенный урон
---@field isLethal boolean true - нанесен окончательный урон и объект погиб
---@field side integer|nil сторона корабля, в которую попали
---@field angle float|nil угол обстрела по горизонтали, для вычисления повреждения щита
---@field cannonPenetration float|nil процент пробития щита снарядом
---@field spellId SpellId Id спелла, если били спеллом.
---@field abilityId AbilityId Id абилки, если били абилкой.
---@field buffId BuffId Id буффа, если били буффом.
---@field mapModifierId MapModifierId модификатор карты, если повреждения от модификатора карты

--- Сообщение приходит, когда по каким-либо причинам необходимо показать информацию по определенным предметам. В сообщеннии приходит список ValuedObject-ов - объектов, в которых содержится информация о предметах. Эти объекты можно добавлять в какой либо ValuedText.
---@class EVENT_SHOW_ITEMS_INFO_Data
---@field items ValuedObject[] индексированный с 0 список объектов, содержащий информацию о предметах
---@field reason integer причина, из-за которой необходимо показать информацию

--- Настало время показать субтитры в катсцене.
---@class EVENT_SHOW_SUBTITLES_Data
---@field text WString текст субтитры
---@field delayMs integer время демонстрации субтитры

--- Главный игрок изучил скилл.
---@class EVENT_SKILL_ADDED_Data
---@field skillId SkillId Id ресурса скилла

--- Изменился опыт, накопленный на уровне скилла.
---@class EVENT_SKILL_IMPROVEMENT_CHANGED_Data
---@field skillId SkillId идентификатор ресурса скилла

--- Главный игрок забыл скилл.
---@class EVENT_SKILL_REMOVED_Data
---@field skillId SkillId Id ресурса скилла (можно получить avatar.GetSkillInfo( skillId ))

--- Изменился уровень скилла главного игрока.
---@class EVENT_SKILL_SCORE_CHANGED_Data
---@field skillId SkillId идентификатор ресурса скилла

--- Изменился список скиллов главного героя.
---@class EVENT_SKILLS_CHANGED_Data

--- Событие, которое приходит при невозможности выполнить слеш-команду (в чате).
---@class EVENT_SLASH_COMMAND_FAILED_Data
---@field name WString имя адресата
---@field sysReason sysString причина неудачной отправки сообщения:

--- Уведомление посылается при любом изменении префикса слеш-команды, в т.ч. при установке пустого префикса после префикса "say" (команда по-умолчанию), хотя действия для последних двух случаев идентичны.
---@class EVENT_SLASH_COMMAND_PREFIX_CHANGED_Data

--- Событие присылается при исчезновении в зоне главного игрока объекта SOS, запущеного другим игроком той же фракции.
---@class EVENT_SOS_FINISHED_Data
---@field id ObjectId идентификатор объекта SOS

--- Событие присылается при появлении в зоне главного игрока объекта SOS, запущеного другим игроком той же фракции.
---@class EVENT_SOS_STARTED_Data
---@field id ObjectId идентификатор объекта SOS

--- Уведомление об изменении накопленного количества опыта души.
---@class EVENT_SOUL_PROGRESS_EXPERIENCE_CHANGED_Data
---@field currentValue integer текущее значение опыта души
---@field deltaValue integer изменение значения опыта души
---@field currentLevel integer текущее значение уровня души
---@field deltaLevel integer изменение значения уровня души

--- Уведомление о смене активных талантов души.
---@class EVENT_SOUL_PROGRESS_TALENTS_CHANGED_Data

--- Событие посылается каждый раз, когда изменилось состояние панели действий (SpellBook).
---@class EVENT_SPELLBOOK_CHANGED_Data

--- Событие посылается, когда в книге умений (SpellBook) появилось новое умение.
---@class EVENT_SPELLBOOK_ELEMENT_ADDED_Data

--- Событие посылается каждый раз, когда изменилось состояние элемента (умения или заклинания) в книге умений (SpellBook). К созданию/удалению элемента это не относится, при этом изменяется книга целиком.
---@class EVENT_SPELLBOOK_ELEMENT_CHANGED_Data

--- Оповещение о начале эффекта для элемента в книге умений.
---@class EVENT_SPELLBOOK_ELEMENT_EFFECT_Data
---@field effect integer тип начавшегося эффекта
---@field id SpellId Id ресурса умения ( этот параметр НЕ УБИРАТЬ )
---@field duration integer общая продолжительность в миллисекундах
---@field remaining integer оставшееся время в миллисекундах
---@field prepared boolean текущее значение флага prepared
---@field isActive boolean true, спелл стал активным
---@field objectId ObjectId|nil идентификатор предмета к которому привязан данный спелл

--- Событие присылается при изменение координат игрока, состоящего в браке с основным игроком.
---@class EVENT_SPOUSE_POSITION_UPDATED_Data
---@field id ObjectId Id игрока

--- Событие посылается каждый раз, когда у главного игрока меняется количество еды для ездовых животных.
---@class EVENT_STABLE_FOOD_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока появилось ездовое животное в конюшне.
---@class EVENT_STABLE_MOUNT_ADDED_Data
---@field id ObjectId идентификатор ездового животного

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялись характеристики (опыт, максимум здоровья, максимум времени насыщения и т.п.).
---@class EVENT_STABLE_MOUNT_CHANGED_Data
---@field id ObjectId идентификатор ездового животного

--- Событие посылается каждый раз, когда одно из ездовых животных главного игрока проголодалось.
---@class EVENT_STABLE_MOUNT_HUNGRY_Data
---@field id ObjectId идентификатор ездового животного

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялся уровень.
---@class EVENT_STABLE_MOUNT_LEVEL_CHANGED_Data
---@field id ObjectId идентификатор ездового животного
---@field level integer новый уровень

--- Событие посылается каждый раз, когда у главного игрока исчезает ездовое животное из конюшни. Плучаемый идентификатор уже не валиден и по нему нельзя получить информацию об исчезнувшем животном.
---@class EVENT_STABLE_MOUNT_REMOVED_Data
---@field id ObjectId идентификатор ездового животного

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока поменялись свойства скинов (доступность).
---@class EVENT_STABLE_MOUNT_SKINS_CHANGED_Data
---@field id ObjectId идентификатор ездового животного

--- Событие посылается каждый раз, когда у одного из ездовых животных главного игрока меняются ативные(выбранные) таланты в результате вызова функции mount.SelectTalents( mountId, talents )
---@class EVENT_STABLE_MOUNT_TALENTS_CHANGED_Data
---@field id ObjectId идентификатор ездового животного

--- Событие посылается каждый раз, когда у главного игрока меняется список ездовых животных в конюшне.
---@class EVENT_STABLE_MOUNTS_CHANGED_Data

--- Событие посылается каждый раз, когда у главного игрока меняется количество слотов в конюшне.
---@class EVENT_STABLE_SLOTS_COUNT_CHANGED_Data

--- Уведомление о неудачном взятии предмета в инвентори.
---@class EVENT_TAKE_ITEMS_FAILED_Data
---@field cause integer код результата

--- Событие присылается, когда изменились таланты.
---@class EVENT_TALENTS_CHANGED_Data

--- Аватар начал разговор с NPC. Приходит после вызова  avatar.StartInteract().
---@class EVENT_TALK_STARTED_Data

--- Аватар закончил разговор с NPC
---@class EVENT_TALK_STOPPED_Data

--- Событие присылается при изменении координат цели главного игрока.
---@class EVENT_TARGET_POS_CHANGED_Data
---@field unitId ObjectId Id юнита

--- Появилось новое предложение в таргетных продажах.
---@class EVENT_TARGET_SALES_ADDED_Data
---@field id ObjectId идентификатор

--- Произошли какие-то изменения в таргетных продажах.
---@class EVENT_TARGET_SALES_CHANGED_Data

--- Сообщение приходит, когда одногруппник собирается телепортироваться. Ответить нужно avatar.TeleportOfferReply( accept ). На ответ отводится определённое время.
---@class EVENT_TELEPORT_OFFER_REQUEST_Data
---@field requesterId ObjectId идентификатор одногруппника, приславшего запрос
---@field timeoutMs integer врямя в миллисекундах, за которое надо дать ответ

--- Событие посылается, если в зоне действия аватара появился отслеживаемый объект Track.
---@class EVENT_TRACK_ADDED_Data
---@field id ObjectId идентификатор объекта

--- Событие посылается, если отслеживаемый объект Track изменился(поле '''objectId''' в ответе функции  objects.GetTrackInfo( trackId )).
---@class EVENT_TRACK_OBJECT_CHANGED_Data
---@field id ObjectId идентификатор трека

--- Событие посылается, если отслеживаемый объект Track изменил позицию.
---@class EVENT_TRACK_POS_CHANGED_Data
---@field id ObjectId идентификатор объекта

--- Событие посылается, если в зоне действия аватара исчез отслеживаемый объект Track.
---@class EVENT_TRACK_REMOVED_Data
---@field id ObjectId идентификатор объекта

--- Событие приходит, если нельзя выучить заклинание или умения у тренера. Возвращаются коды всех найденных ошибок. См. LEARN_ERROR_....
---@class EVENT_TRAINER_LEARN_ERROR_Data

--- Изменился целевой сектор для астрального прыжка.
---@class EVENT_TRANSPORT_ACCELERATION_TARGET_CHANGED_Data
---@field id ObjectId Id транспорта

--- Событие посылается каждый раз, когда у транспортного средства меняется скорость поворота.
---@class EVENT_TRANSPORT_ANGULAR_VELOCITY_CHANGED_Data
---@field id ObjectId Id транспортного средства

--- Событие присылается, если на кораблечто-то сломалось. Получает его команда этого корабля и чужие навигаторы, следящие за этим кораблём. Содержит код поломки ENUM_CriticalMalfunctionType_CMT....
---@class EVENT_TRANSPORT_CRITICAL_MALFUNCTION_Data
---@field id ObjectId идентификатор корабля
---@field sysType string

--- Событие посылается каждый раз, когда у транспортного средства меняется список устройств.
---@class EVENT_TRANSPORT_DEVICES_CHANGED_Data
---@field id ObjectId Id транспортного средства

--- Событие посылается каждый раз, когда у транспортного средства меняется величина поворота (yaw). Апдейт происходит при изменении угла на 3 градуса от последнего сообщения.
---@class EVENT_TRANSPORT_DIRECTION_CHANGED_Data
---@field id ObjectId Id транспортного средства

--- Событие посылается каждый раз, когда у транспортного средства меняется какая-либо состовляющая энергии.
---@class EVENT_TRANSPORT_ENERGY_CHANGED_Data
---@field id ObjectId Id транспортного средства

--- Событие посылается каждый раз, когда у транспортного средства меняется скорость движения по горизонтали (вперёд).
---@class EVENT_TRANSPORT_HORIZONTAL_VELOCITY_CHANGED_Data
---@field id ObjectId Id транспортного средства

--- Событие посылается каждый раз, когда у транспортного средства меняется "Инсайт".
---@class EVENT_TRANSPORT_INSIGHT_CHANGED_Data
---@field id ObjectId Id транспортного средства
---@field delta integer на сколько изменился

--- Событие присылается при окончании просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор отзумился от чужого корабля). Теперь у ранее просматриваемого транспорта недоступна информация по устройствам.
---@class EVENT_TRANSPORT_OBSERVING_FINISHED_Data

--- Событие присылается при началe просмотра некоего транспорта через навигационное устройство корабля главного игрока (навигатор назумился на другой корабль). Теперь у просматриваемого транспорт доступна информация по устройствам.
---@class EVENT_TRANSPORT_OBSERVING_STARTED_Data

--- Событие присылается при изменении координат транспорта.
---@class EVENT_TRANSPORT_POS_CHANGED_Data
---@field id ObjectId Id транспорта

--- Событие посылается в случае, если транспорт необходимо переименовать
---@class EVENT_TRANSPORT_RENAME_REPLY_Data
---@field hasName boolean true - у корабля уже есть имя. Идёт запрос на переименование. Иначе требуется задать самое первое имя корабля.
---@field oldName WString старое имя корабля

--- Событие посылается в случае, если была попытка переименования транспорта  hangar.Rename( name ).
---@class EVENT_TRANSPORT_RENAME_REPLY_RESULT_Data
---@field success boolean true, если переименовывание прошло успешно. false, если имя невалидно, нужно попробовать другое имя.
---@field sysNameErrorKind string причина, по которой имя недопустимо
---@field name WString имя корабля, в случае ошибки то, на которое пытались сменить

--- Событие посылается каждый раз, когда у транспортного средства меняется сила щита с определенной стороны.
---@class EVENT_TRANSPORT_SHIELD_CHANGED_Data
---@field id ObjectId Id транспортного средства
---@field side integer сторона.
---@field strengthDelta integer на сколько изменилась суммарная сила щитов по представленной стороне. Величина отрицательна, если по щитам был нанесён урон, и положительная, если сила щитов восстановилась.

--- Событие посылается каждый раз, когда изменилась базовая информация по какому-то кораблю.
---@class EVENT_TRANSPORT_SHIP_INFO_CHANGED_Data
---@field objectId ObjectId Id транспортного средства

--- Событие посылается каждый раз, когда у транспортного средства меняется скорость движения по вертикали.
---@class EVENT_TRANSPORT_VERTICAL_VELOCITY_CHANGED_Data
---@field id ObjectId Id транспортного средства

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает корабль.
---@class EVENT_TRANSPORTS_CHANGED_Data
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся кораблей
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших кораблей

--- Событие посылается каждый раз, когда игрок пытается вернуть сундук в полную сокровищницу.
---@class EVENT_TREASURY_FULL_Data

--- Уведомление об инициировании показа обучения.
---@class EVENT_TUTORIAL_REQUEST_Data
---@field id TutorialId(ResourceId) идентификатор обучения

--- Срабатывает при выдаче результатов поиска обучения. Результат вызова tutorialLib.SearchTutorial( request ).
---@class EVENT_TUTORIAL_SEARCH_RESULT_Data
---@field id TutorialId(ResourceId) идентификатор обучения
---@field request WString исходный запрос
---@field tutorials TutorialId[] список идентификаторов обучения удовлетворяющих запросу
---@field categories TutorialCategoryId[] список идентификаторов категорий обучения удовлетворяющих запросу

--- Событие о провале попытки снять предмет.
---@class EVENT_UNEQUIP_FAILED_Data
---@field slot integer индекс слота в инвентаре [0..]
---@field sysCode string код ошибки

--- Сообщение об изменении информации о классе юнита.
---@class EVENT_UNIT_CLASS_CHANGED_Data
---@field unitId ObjectId идентификатор юнита

--- Событие присылается при нанесение повреждения юниту. Тип повреждения -  "ENUM_SubElement_...".
---@class EVENT_UNIT_DAMAGE_RECEIVED_Data
---@field source ObjectId идентификатор того, кто наносит повреждения
---@field sourceName WString имя того, кто наносит повреждения
---@field target ObjectId идентификатор того, кто получает повреждения. Этот объект может уже исчезнуть и надо проверять его на существование (см. object.IsExist())
---@field amount number количество нанесенных повреждений
---@field ability WString имя спелла или умения
---@field sysSubElement string тип повреждения
---@field lethal boolean этот удар был финальным. Юнит умер.
---@field spellId SpellId Id спелла, если били спеллом.
---@field abilityId AbilityId Id абилки, если били абилкой.
---@field buffId BuffId Id буффа, если били буффом.
---@field mapModifierId MapModifierId модификатор карты, если повреждения от модификатора карты
---@field isFall boolean повреждение от падения
---@field isExploit boolean повреждения от эксплойта
---@field isDodge boolean увернулась ли цель от удара
---@field isMiss boolean был ли промах
---@field isCritical boolean был ли нанесён Critical Damage (увеличенное повреждение)
---@field isGlancing boolean был ли нанесён glancing damage (уменьшенное повреждение)
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

--- Событие присылается при изменение статуса смерти юнита (юнит умер или ожил).
---@class EVENT_UNIT_DEAD_CHANGED_Data
---@field unitId ObjectId идентификатор юнита

--- Событие об изменении экипировки юнита (главный игрок или игрок, инспектируемый главным).
---@class EVENT_UNIT_EQUIPMENT_CHANGED_Data
---@field unitId ObjectId идентификатор юнита
---@field slotType integer тип контейнера

--- Событие присылается при изменинии фракции юнита.
---@class EVENT_UNIT_FACTION_CHANGED_Data

--- Событие присылается при изменении покровителя.
---@class EVENT_UNIT_FAIRY_CHANGED_Data
---@field unitId ObjectId идентификатор объекта

--- Событие присылается при изменении ранга покровителя - номера или статуса временный/постоянный.
---@class EVENT_UNIT_FAIRY_RANK_CHANGED_Data
---@field unitId ObjectId идентификатор объекта, чей покровитель поменял ранг

--- Приходит, если изменилось состояние проигрывания фаталити на каком-то юните.
---@class EVENT_UNIT_FATALITY_CHANGED_Data
---@field id ObjectId идентификатор юнита

--- Событие посылается каждый раз, когда у какого-либо игрока меняется список подчинённых юнитов (петы, ассистенты, турели и т.п.).
---@class EVENT_UNIT_FOLLOWERS_LIST_CHANGED_Data
---@field id ObjectId идентификатор игрока, у которого изменился список подчинённых юнитов

--- Присылается в случае изменения гильдии какого-либо игрока.
---@class EVENT_UNIT_GUILD_CHANGED_Data
---@field unitId ObjectId идентификатор игрока

--- Событие посылается каждый раз, когда у игрока меняется слава.
---@class EVENT_UNIT_HONOR_VALUE_CHANGED_Data
---@field unitId ObjectId идентификатор игрока

--- Событие присылается при изменении уровня.
---@class EVENT_UNIT_LEVEL_CHANGED_Data
---@field unitId ObjectId
---@field amount integer

--- Событие присылается при изменении процентного значения маны юнита и числового значение для аватара.
---@class EVENT_UNIT_MANA_CHANGED_Data
---@field unitId ObjectId

--- Событие присылается при измениние маны юнита.
---@class EVENT_UNIT_MANA_PERCENTAGE_CHANGED_Data

--- Событие присылается, если NPC или моб прислал текстовое сообщение.
---@class EVENT_UNIT_MESSAGE_Data
---@field id ObjectId|nil id юнита если есть, иначе nil
---@field name WString имя юнита
---@field message WString текстовое сообщение от NPC
---@field isWhisper boolean является ли сообщение личным

--- Приходит, если у какого-либо игрока изменилось настроение.
---@class EVENT_UNIT_MOOD_CHANGED_Data
---@field unitId ObjectId идентификатор игрока

--- Событие посылается каждый раз, когда у игрока меняется текущее здоровье ездового животного.
---@class EVENT_UNIT_MOUNT_HEALTH_CHANGED_Data
---@field unitId ObjectId идентификатор игрока
---@field health integer точная величина здоровья маунта, если такая информация доступна (иначе - 0)

--- Событие присылается при изменении координат юнита. В данный момент такое событие приходит только для юнитов, задетекченных специальным умением главного игрока.
---@class EVENT_UNIT_POS_CHANGED_Data
---@field unitId ObjectId Id юнита

--- Событие посылается при изменении PvP флага какого-либо юнита (игрока или моба).
---@class EVENT_UNIT_PVP_FLAG_CHANGED_Data
---@field unitId ObjectId Id юнита

--- Приходит, если изменилось количество Гнева у юнита.
---@class EVENT_UNIT_RAGE_CHANGED_Data
---@field unitId ObjectId идентификатор юнита

--- Событие присылается при возможном изменение состояния юнита (враждебное/дружественное/нейтральное).
---@class EVENT_UNIT_RELATION_CHANGED_Data
---@field unitId ObjectId Id юнита

--- Событие присылается при изменении потэганности моба. Моб становится потэганным, когда какой-нибудь игрок вступает с ним в бой. После этого, в случае скоропостижной смерти моба, весь лут достаётся этому игроку вне зависимости от того, кто ещё участвовал в жестоком убийстве.
---@class EVENT_UNIT_TAG_CHANGED_Data
---@field unitId ObjectId

--- Событие присылается, если игрок в группе (или аватар) взял лут (деньги).
---@class EVENT_UNIT_TOOK_MONEY_Data
---@field ownerId ObjectId идентификатор игрока, взявшего предмет
---@field mobId ObjectId идентификатор моба, с которого были взяты деньги (nil, если моб далеко)
---@field money integer количество взятых денег

--- Приходит, если изменился ветеранский ранг игрока.
---@class EVENT_UNIT_VETERAN_RANK_CHANGED_Data
---@field unitId ObjectId идентификатор игрока

--- Приходит, если изменилось количество Воли у юнита.
---@class EVENT_UNIT_WILL_CHANGED_Data
---@field unitId ObjectId идентификатор юнита

--- Событие посылается при изменении PvP-типа зоны для игрока.
---@class EVENT_UNIT_ZONE_PVP_TYPE_CHANGED_Data
---@field unitId ObjectId Id игрока

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает юнит.
---@class EVENT_UNITS_CHANGED_Data
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся юнитов
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших юнитов

--- Событие, которое приходит при невозможности распознать слеш-команду (в чате).
---@class EVENT_UNKNOWN_SLASH_COMMAND_Data
---@field text WString строка, которую не удалось разобрать как слеш-команду

--- Оповещение о начале эффекта для спелла вытаскивания игрока, если он застрял.
---@class EVENT_UNSTUCK_SPELL_CHANGED_Data

--- Уведомление об изменении спелла вытаскивания игрока, если он застрял.
---@class EVENT_UNSTUCK_SPELL_EFFECT_Data
---@field id SpellId Id ресурса спелла

--- Событие посылается раз в кадр, если за этот кадр в зоне действия аватара появляется или исчезает корабельное устройство.
---@class EVENT_USABLE_DEVICES_CHANGED_Data
---@field spawned ObjectId[] индексированная с 1 таблица идентификаторов появившихся устройств
---@field despawned ObjectId[] индексированная с 1 таблица идентификаторов исчезнувших устройств

--- Уведомление о сделанном снимке экрана, удачном или неудачном.
---@class EVENT_USER_SCREENSHOT_Data
---@field success boolean успешно или нет сделан снимок экрана
---@field filePath WString полный путь до файла со снимком экрана
---@field fileName WString (краткое) имя файла со снимком экрана
---@field isPostpone boolean было ли снятие скриншота отложено на несколько кадров

--- Уведомление, что был кликнут ValuedObject - объект представляющий игровой объект в UI тексте.
---@class EVENT_VALUED_OBJECT_CLICKED_Data
---@field object ValuedObject кликнутый объект в тексте
---@field cursorPosX number( X позиция курсора, в которой произошёл клик
---@field cursorPosY number( Y позиция курсора, в которой произошёл клик
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)
---@field mouseButton integer какая кнопка мыши была нажата
---@field widget WidgetSafe виджет в котором находится ValuedObject

--- Уведомление, что ValuedObject - объект представляющий игровой объект в UI тексте, был дважды кликнут (даблклик).
---@class EVENT_VALUED_OBJECT_DOUBLE_CLICKED_Data
---@field object ValuedObject кликнутый объект в тексте
---@field cursorPosX number( X позиция курсора, в которой произошёл клик
---@field cursorPosY number( Y позиция курсора, в которой произошёл клик
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)
---@field mouseButton integer какая кнопка мыши была нажата
---@field widget WidgetSafe виджет в котором находится ValuedObject

--- Уведомление, что был на ValuedObject (объект представляющий игровой объект в UI тексте) был наведён или был убран с него курсор мыши.
---@class EVENT_VALUED_OBJECT_MOUSEOVER_Data
---@field object ValuedObject кликнутый объект в тексте
---@field cursorPosX number( X позиция курсора, в которой произошёл клик
---@field cursorPosY number( Y позиция курсора, в которой произошёл клик
---@field kbFlags integer состояние модификаторов клавиатуры (ссылка ниже)
---@field mouseButton integer какая кнопка мыши была нажата
---@field widget WidgetSafe виджет в котором находится ValuedObject
---@field isActive boolean true, если курсор мыши был наведён на объект. Если курсор был убран с объекта, то false

--- Событие присылается при появлении у гдавного игрока значения геймдизайнерской переменной.
---@class EVENT_VARIABLE_ADDED_Data
---@field id VariableId идентификатор переменной
---@field sysName string псевдоним переменной

--- Событие присылается при исчезновении у главного игрока значения геймдизайнерской переменной.
---@class EVENT_VARIABLE_REMOVED_Data
---@field id VariableId идентификатор переменной

--- Событие присылается при изменении значения геймдизайнерской переменной главного игрока.
---@class EVENT_VARIABLE_VALUE_CHANGED_Data
---@field id VariableId идентификатор переменной
---@field sysName string псевдоним переменной
---@field delta number число на которое изменилось значение переменной (может быть как положительным, так и отрицительным)

--- Событие посылается, если не хватает места для покупки.
---@class EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE_Data

--- Событие посылается, если не хватает репутации для покупки.
---@class EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL_Data

--- Событие посылается, если для покупки не хватает очков заработанных за участие в событии.
---@class EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT_Data

--- Событие посылается, если во время покупки предмета он уже был продан кому-то другому.
---@class EVENT_VENDOR_ITEM_ALREADY_SOLD_Data

--- Уведомление о невозможности продать предмет (предмет не продается).
---@class EVENT_VENDOR_ITEM_NOT_FOR_SALE_Data
---@field itemId ObjectId идентификатор предмета, который не удалось продать

--- Событие посылается в ответ на запрос наличия доступных вещей на продажу у NPC-торговца avatar.RequestVendor().
---@class EVENT_VENDOR_LIST_UPDATED_Data

--- Событие, которое приходит после выполнения слеш-команды (в чате) /veteran.
---@class EVENT_VETERANRANKS_COMMAND_RESPONSE_Data
---@field value integer текущий прогресс
---@field rewards table таблица рангов, индексация [0..]
---@field name wstring название ранга

--- Событие посылается при изменении счётчика убитых противников в PvP.
---@class EVENT_VICTIM_TRACKER_CHANGED_Data

--- Добавилось новое колесо лута
---@class EVENT_WHEELOFLOOT_ADDED_Data
---@field wheelId number идентификатор колеса лута

--- Изменилось колесо лута
---@class EVENT_WHEELOFLOOT_CHANGED_Data
---@field wheelId number идентификатор колеса лута

--- Пришёл ответ на запрос предметов колеса лута.
---@class EVENT_WHEELOFLOOT_ITEMS_Data
---@field wheelId number идентификатор колеса лута
---@field slots GameId[] предметы в слотах разрола
---@field prizes GameId[] предметы призов

--- Удалилось колесо лута
---@class EVENT_WHEELOFLOOT_REMOVED_Data
---@field wheelId number идентификатор колеса лута

--- Событие, которое приходит при невозможности доставить сообщение целевому игроку.
---@class EVENT_WHISPER_FAILED_Data
---@field name WString имя адресата
---@field sysReason string причина неудачной отправки сообщения

--- Уведомление об изменении информации о Волшебной лампе.
---@class EVENT_WISHMASTER_CHANGED_Data

--- Уведомление о результатах и возможностях улучшения Волшебной лампы.
---@class EVENT_WISHMASTER_MULTIPLYING_Data
---@field resourceId WishmasterResourceId идентификатор Волшебной лампы

--- Registers an event handler for the specified event.
--- The handler function receives event-specific data as its first parameter.
---@overload fun(handler: fun(params: EVENT_ABILITIES_ELEMENT_ADDED_Data), event: "EVENT_ABILITIES_ELEMENT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACCOUNT_HAS_DESTROYED_Data), event: "EVENT_ACCOUNT_HAS_DESTROYED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_FAILED_EXPLOIT_Data), event: "EVENT_ACTION_FAILED_EXPLOIT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_FAILED_OTHER_Data), event: "EVENT_ACTION_FAILED_OTHER", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_FAILED_SPELL_Data), event: "EVENT_ACTION_FAILED_SPELL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PANEL_CHANGED_Data), event: "EVENT_ACTION_PANEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PANEL_ELEMENT_CHANGED_Data), event: "EVENT_ACTION_PANEL_ELEMENT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PANEL_ELEMENT_EFFECT_Data), event: "EVENT_ACTION_PANEL_ELEMENT_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PROGRESS_FINISH_Data), event: "EVENT_ACTION_PROGRESS_FINISH", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PROGRESS_FREEZE_Data), event: "EVENT_ACTION_PROGRESS_FREEZE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PROGRESS_START_Data), event: "EVENT_ACTION_PROGRESS_START", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_PROGRESS_UPDATE_Data), event: "EVENT_ACTION_PROGRESS_UPDATE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTION_RESULT_SPECIAL_SPELL_Data), event: "EVENT_ACTION_RESULT_SPECIAL_SPELL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_MOUNT_CHANGED_Data), event: "EVENT_ACTIVE_MOUNT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_MOUNT_SKIN_CHANGED_Data), event: "EVENT_ACTIVE_MOUNT_SKIN_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_MOUNT_TIME_LEFT_CHANGED_Data), event: "EVENT_ACTIVE_MOUNT_TIME_LEFT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_PET_CHANGED_Data), event: "EVENT_ACTIVE_PET_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_PET_EXIST_CHANGED_Data), event: "EVENT_ACTIVE_PET_EXIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_PET_SPELLS_CHANGED_Data), event: "EVENT_ACTIVE_PET_SPELLS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ACTIVE_PET_STATE_CHANGED_Data), event: "EVENT_ACTIVE_PET_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ADDON_HEALTH_CHANGED_Data), event: "EVENT_ADDON_HEALTH_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ADDON_LOAD_STATE_CHANGED_Data), event: "EVENT_ADDON_LOAD_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ADDON_REDUCE_PERFOMANCE_Data), event: "EVENT_ADDON_REDUCE_PERFOMANCE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ADDRESSEE_NOT_FOUND_Data), event: "EVENT_ADDRESSEE_NOT_FOUND", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AEMARK_POINT_CLICKED_Data), event: "EVENT_AEMARK_POINT_CLICKED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AFK_STATE_CHANGED_Data), event: "EVENT_AFK_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_CANCELED_Data), event: "EVENT_ALCHEMY_CANCELED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_ITEM_PLACED_Data), event: "EVENT_ALCHEMY_ITEM_PLACED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_NOT_ALCHEMY_ITEM_Data), event: "EVENT_ALCHEMY_NOT_ALCHEMY_ITEM", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_NOT_AVAILABLE_RESOURCES_Data), event: "EVENT_ALCHEMY_NOT_AVAILABLE_RESOURCES", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_NOT_ENOUGH_COMPONENTS_Data), event: "EVENT_ALCHEMY_NOT_ENOUGH_COMPONENTS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_REACTION_FINISHED_Data), event: "EVENT_ALCHEMY_REACTION_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_RECIPES_CHANGED_Data), event: "EVENT_ALCHEMY_RECIPES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_SCORE_CHANGED_Data), event: "EVENT_ALCHEMY_SCORE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALCHEMY_STARTED_Data), event: "EVENT_ALCHEMY_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALLODS_GOAL_ADDED_Data), event: "EVENT_ALLODS_GOAL_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALLODS_GOAL_CHANGED_Data), event: "EVENT_ALLODS_GOAL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ALLODS_GOAL_COMPLETED_Data), event: "EVENT_ALLODS_GOAL_COMPLETED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_APPRENTICE_MENTOR_CHANGED_Data), event: "EVENT_APPRENTICE_MENTOR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_HUB_CHANGED_Data), event: "EVENT_ASTRAL_HUB_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_ISLAND_CHANGED_Data), event: "EVENT_ASTRAL_ISLAND_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_ISLAND_TIME_CHANGED_Data), event: "EVENT_ASTRAL_ISLAND_TIME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_OBJECT_ENABLED_CHANGED_Data), event: "EVENT_ASTRAL_OBJECT_ENABLED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_OBJECTS_CHANGED_Data), event: "EVENT_ASTRAL_OBJECTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_POIS_CHANGED_Data), event: "EVENT_ASTRAL_POIS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_SECTOR_CHANGED_Data), event: "EVENT_ASTRAL_SECTOR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_SECTOR_CHECK_JUMP_RESULT_Data), event: "EVENT_ASTRAL_SECTOR_CHECK_JUMP_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_UNIT_AGGRO_CHANGED_Data), event: "EVENT_ASTRAL_UNIT_AGGRO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_UNIT_POS_CHANGED_Data), event: "EVENT_ASTRAL_UNIT_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_UNITS_CHANGED_Data), event: "EVENT_ASTRAL_UNITS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTRAL_WRECK_LOOT_TAKEN_Data), event: "EVENT_ASTRAL_WRECK_LOOT_TAKEN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTROLABE_INFO_CHANGED_Data), event: "EVENT_ASTROLABE_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTROLABE_SPELL_CHANGED_Data), event: "EVENT_ASTROLABE_SPELL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ASTROLABE_SPELL_EFFECT_Data), event: "EVENT_ASTROLABE_SPELL_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ATTACK_RESULT_Data), event: "EVENT_ATTACK_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AUCTION_BID_RESULT_Data), event: "EVENT_AUCTION_BID_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AUCTION_CREATION_RESULT_Data), event: "EVENT_AUCTION_CREATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AUCTION_DISCARD_RESULT_Data), event: "EVENT_AUCTION_DISCARD_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AUCTION_PROPERTIES_Data), event: "EVENT_AUCTION_PROPERTIES", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AUCTION_SEARCH_RESULT_Data), event: "EVENT_AUCTION_SEARCH_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AUCTION_UPDATE_RESULT_Data), event: "EVENT_AUCTION_UPDATE_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVAILABLE_ORDERS_CHANGED_Data), event: "EVENT_AVAILABLE_ORDERS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ADDED_TO_FRIEND_LIST_Data), event: "EVENT_AVATAR_ADDED_TO_FRIEND_LIST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ALIVE_CHANGED_Data), event: "EVENT_AVATAR_ALIVE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_BARRIERS_CHANGED_Data), event: "EVENT_AVATAR_BARRIERS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_BINDED_TRANSPORT_CHANGED_Data), event: "EVENT_AVATAR_BINDED_TRANSPORT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_BUFF_REMOVING_FAILED_Data), event: "EVENT_AVATAR_BUFF_REMOVING_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_CLASS_FORM_CHANGED_Data), event: "EVENT_AVATAR_CLASS_FORM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_CLIENT_ZONE_CHANGED_Data), event: "EVENT_AVATAR_CLIENT_ZONE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_CREATED_Data), event: "EVENT_AVATAR_CREATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_DESTINY_POINTS_CHANGED_Data), event: "EVENT_AVATAR_DESTINY_POINTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_DIR_CHANGED_Data), event: "EVENT_AVATAR_DIR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ENTER_PROCEDURAL_DUNGEON_Data), event: "EVENT_AVATAR_ENTER_PROCEDURAL_DUNGEON", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_EXPERIENCE_CHANGED_Data), event: "EVENT_AVATAR_EXPERIENCE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_ADDED_Data), event: "EVENT_AVATAR_FRIEND_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_ALT_NAME_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_ALT_NAME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_DESCRIPTION_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_DESCRIPTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_IGNORE_LISTS_ERROR_Data), event: "EVENT_AVATAR_FRIEND_IGNORE_LISTS_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_INFO_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_LEVEL_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_LIST_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_LIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_LIST_LOADED_Data), event: "EVENT_AVATAR_FRIEND_LIST_LOADED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_MOOD_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_MOOD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_MUTUAL_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_MUTUAL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_ONLINE_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_ONLINE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_REMOVED_Data), event: "EVENT_AVATAR_FRIEND_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_SEX_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_SEX_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_FRIEND_ZONE_CHANGED_Data), event: "EVENT_AVATAR_FRIEND_ZONE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_IGNORE_ADDED_Data), event: "EVENT_AVATAR_IGNORE_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_IGNORE_DESCRIPTION_CHANGED_Data), event: "EVENT_AVATAR_IGNORE_DESCRIPTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_IGNORE_LIST_CHANGED_Data), event: "EVENT_AVATAR_IGNORE_LIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_IGNORE_LIST_LOADED_Data), event: "EVENT_AVATAR_IGNORE_LIST_LOADED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_IGNORE_REMOVED_Data), event: "EVENT_AVATAR_IGNORE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ITEM_DROPPED_Data), event: "EVENT_AVATAR_ITEM_DROPPED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ITEM_TAKEN_Data), event: "EVENT_AVATAR_ITEM_TAKEN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE_Data), event: "EVENT_AVATAR_ITEM_TAKEN_BY_GROUPMATE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_LEAVE_PROCEDURAL_DUNGEON_Data), event: "EVENT_AVATAR_LEAVE_PROCEDURAL_DUNGEON", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_LOGOUT_CANCELLED_Data), event: "EVENT_AVATAR_LOGOUT_CANCELLED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MAP_CHANGED_Data), event: "EVENT_AVATAR_MAP_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MAP_INFO_AVAILABLE_Data), event: "EVENT_AVATAR_MAP_INFO_AVAILABLE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MAP_MODIFIERS_CHANGED_Data), event: "EVENT_AVATAR_MAP_MODIFIERS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MEDAL_FINISHED_Data), event: "EVENT_AVATAR_MEDAL_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MONEY_CHANGED_Data), event: "EVENT_AVATAR_MONEY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MONEY_DROPPED_Data), event: "EVENT_AVATAR_MONEY_DROPPED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MONEY_TAKEN_Data), event: "EVENT_AVATAR_MONEY_TAKEN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE_Data), event: "EVENT_AVATAR_MONEY_TAKEN_BY_GROUPMATE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_POS_CHANGED_Data), event: "EVENT_AVATAR_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PROGRESS_GAINED_Data), event: "EVENT_AVATAR_PROGRESS_GAINED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED_Data), event: "EVENT_AVATAR_PSIONIC_CHANNEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_CONTACT_ADDED_Data), event: "EVENT_AVATAR_PSIONIC_CONTACT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_CONTACT_CHANGED_Data), event: "EVENT_AVATAR_PSIONIC_CONTACT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_CONTACT_REMOVED_Data), event: "EVENT_AVATAR_PSIONIC_CONTACT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED_Data), event: "EVENT_AVATAR_PSIONIC_DANGER_SENSE_LOCATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET_Data), event: "EVENT_AVATAR_PSIONIC_DANGER_SENSE_TARGET", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_READ_THOUGHT_Data), event: "EVENT_AVATAR_PSIONIC_READ_THOUGHT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT_Data), event: "EVENT_AVATAR_PSIONIC_UNREADABLE_THOUGHT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED_Data), event: "EVENT_AVATAR_STALKER_CARTRIDGE_BELT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED_Data), event: "EVENT_AVATAR_STALKER_DAMAGE_POOL_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED_Data), event: "EVENT_AVATAR_STALKER_DAMAGE_POOL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED_Data), event: "EVENT_AVATAR_STALKER_DAMAGE_POOL_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED_Data), event: "EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_STATS_CHANGED_Data), event: "EVENT_AVATAR_STATS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_TARGET_CHANGED_Data), event: "EVENT_AVATAR_TARGET_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_TARGET_RECOMMENDED_Data), event: "EVENT_AVATAR_TARGET_RECOMMENDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_TARGET_TARGET_CHANGED_Data), event: "EVENT_AVATAR_TARGET_TARGET_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_TRANSPORT_CHANGED_Data), event: "EVENT_AVATAR_TRANSPORT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_UNLOCK_ADDED_Data), event: "EVENT_AVATAR_UNLOCK_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_UNLOCK_CHANGED_Data), event: "EVENT_AVATAR_UNLOCK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_UNLOCK_REMOVED_Data), event: "EVENT_AVATAR_UNLOCK_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_UNLOCKS_CHANGED_Data), event: "EVENT_AVATAR_UNLOCKS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_USED_OBJECT_CHANGED_Data), event: "EVENT_AVATAR_USED_OBJECT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_WALK_MODE_CHANGED_Data), event: "EVENT_AVATAR_WALK_MODE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED_Data), event: "EVENT_AVATAR_WARRIOR_COMBAT_ADVANTAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED_Data), event: "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED_Data), event: "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED_Data), event: "EVENT_AVATAR_WARRIOR_DAMAGE_POOL_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_WILL_BE_REMOVED_Data), event: "EVENT_AVATAR_WILL_BE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_AVATAR_ZONE_CHANGED_Data), event: "EVENT_AVATAR_ZONE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BATTLEGROUND_CHECKPOINT_ADDED_Data), event: "EVENT_BATTLEGROUND_CHECKPOINT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BATTLEGROUND_CHECKPOINT_REMOVED_Data), event: "EVENT_BATTLEGROUND_CHECKPOINT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BATTLEGROUND_CHECKPOINT_STATE_CHANGED_Data), event: "EVENT_BATTLEGROUND_CHECKPOINT_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BATTLEGROUND_CHECKPOINTS_CHANGED_Data), event: "EVENT_BATTLEGROUND_CHECKPOINTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BEAM_CANNON_SHOT_STARTED_Data), event: "EVENT_BEAM_CANNON_SHOT_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BEST_FRIEND_RETURN_STATE_CHANGED_Data), event: "EVENT_BEST_FRIEND_RETURN_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BEST_FRIEND_TELEPORT_SPELL_CHANGED_Data), event: "EVENT_BEST_FRIEND_TELEPORT_SPELL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BEST_FRIEND_TELEPORT_SPELL_EFFECT_Data), event: "EVENT_BEST_FRIEND_TELEPORT_SPELL_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BEST_FRIEND_TELEPORT_STATE_CHANGED_Data), event: "EVENT_BEST_FRIEND_TELEPORT_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BILLINGINFO_BONUS_CHANGED_Data), event: "EVENT_BILLINGINFO_BONUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BILLINGINFO_BONUS_STATUS_CHANGED_Data), event: "EVENT_BILLINGINFO_BONUS_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BINDING_CHANGED_Data), event: "EVENT_BINDING_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BONUS_POOL_CHANGED_Data), event: "EVENT_BONUS_POOL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BONUS_POOLS_CHANGED_Data), event: "EVENT_BONUS_POOLS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BOX_OPERATION_RESULT_Data), event: "EVENT_BOX_OPERATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BULLETIN_BOARD_CHANGED_Data), event: "EVENT_BULLETIN_BOARD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BULLETIN_BOARD_OPERATION_IN_PROGRESS_CHANGED_Data), event: "EVENT_BULLETIN_BOARD_OPERATION_IN_PROGRESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BULLETIN_BOARD_POST_ADDED_Data), event: "EVENT_BULLETIN_BOARD_POST_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_BULLETIN_BOARD_POST_CHANGED_Data), event: "EVENT_BULLETIN_BOARD_POST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CALL_SPARK_COST_CHANGED_Data), event: "EVENT_CALL_SPARK_COST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CALL_SPARK_FAILED_Data), event: "EVENT_CALL_SPARK_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CAMERA_DIRECTION_CHANGED_Data), event: "EVENT_CAMERA_DIRECTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CAN_CREATE_GUILD_HERE_RESPONSE_Data), event: "EVENT_CAN_CREATE_GUILD_HERE_RESPONSE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANNON_SHOT_FINISHED_Data), event: "EVENT_CANNON_SHOT_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANNON_SHOT_PREPARATION_STARTED_Data), event: "EVENT_CANNON_SHOT_PREPARATION_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANNON_SHOT_STARTED_Data), event: "EVENT_CANNON_SHOT_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANNON_TARGET_CHANGE_Data), event: "EVENT_CANNON_TARGET_CHANGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANNOT_ATTACH_WIDGET_3D_Data), event: "EVENT_CANNOT_ATTACH_WIDGET_3D", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANT_LEAVE_GAME_IN_COMBAT_Data), event: "EVENT_CANT_LEAVE_GAME_IN_COMBAT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANT_LOOT_DISAPPEARED_LOOT_BAG_Data), event: "EVENT_CANT_LOOT_DISAPPEARED_LOOT_BAG", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CANT_SEND_CHAT_BY_DELAY_Data), event: "EVENT_CANT_SEND_CHAT_BY_DELAY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY_Data), event: "EVENT_CHANGE_ROOM_CHARACTER_SCENE_CAMERA_READY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHANGE_ROOM_STARTED_Data), event: "EVENT_CHANGE_ROOM_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED_Data), event: "EVENT_CHANGE_ROOM_ZOOM_TRIGGER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHARACTER_CLASS_CHANGER_CHANGED_Data), event: "EVENT_CHARACTER_CLASS_CHANGER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_AVATAR_MUTED_Data), event: "EVENT_CHAT_AVATAR_MUTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_MESSAGE_Data), event: "EVENT_CHAT_MESSAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_MESSAGE_IS_FLOOD_Data), event: "EVENT_CHAT_MESSAGE_IS_FLOOD", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_MESSAGE_REJECTED_Data), event: "EVENT_CHAT_MESSAGE_REJECTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_MESSAGE_WITH_OBJECTS_Data), event: "EVENT_CHAT_MESSAGE_WITH_OBJECTS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_NAMED_ERROR_Data), event: "EVENT_CHAT_NAMED_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHAT_SENT_TO_ALT_Data), event: "EVENT_CHAT_SENT_TO_ALT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHECKROOM_CHANGED_Data), event: "EVENT_CHECKROOM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHECKROOM_ITEM_ADDED_Data), event: "EVENT_CHECKROOM_ITEM_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHECKROOM_ITEM_CHANGED_Data), event: "EVENT_CHECKROOM_ITEM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CHEST_LOOTER_CHANGED_Data), event: "EVENT_CHEST_LOOTER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CLIENT_IMAGE_HIDE_ALL_Data), event: "EVENT_CLIENT_IMAGE_HIDE_ALL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CLIENT_IMAGE_SHOW_Data), event: "EVENT_CLIENT_IMAGE_SHOW", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CLIENT_MESSAGE_Data), event: "EVENT_CLIENT_MESSAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONDITION_EVENT_Data), event: "EVENT_CONDITION_EVENT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTAINER_CHANGED_Data), event: "EVENT_CONTAINER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTAINER_ITEM_ADDED_Data), event: "EVENT_CONTAINER_ITEM_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTAINER_ITEM_CHANGED_Data), event: "EVENT_CONTAINER_ITEM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTAINER_ITEM_EFFECT_Data), event: "EVENT_CONTAINER_ITEM_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTAINER_ITEM_REMOVED_Data), event: "EVENT_CONTAINER_ITEM_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTEXT_ACTION_POINT_STARTED_Data), event: "EVENT_CONTEXT_ACTION_POINT_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CONTEXT_ACTIONS_CHANGED_Data), event: "EVENT_CONTEXT_ACTIONS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CROSSHAIR_TARGET_POS_CHANGED_Data), event: "EVENT_CROSSHAIR_TARGET_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENCIES_CHANGED_Data), event: "EVENT_CURRENCIES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENCY_EXCHANGE_FINISHED_Data), event: "EVENT_CURRENCY_EXCHANGE_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENCY_EXCHANGE_INFO_CHANGED_Data), event: "EVENT_CURRENCY_EXCHANGE_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENCY_EXCHANGE_STARTED_Data), event: "EVENT_CURRENCY_EXCHANGE_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENCY_NOT_ENOUGH_Data), event: "EVENT_CURRENCY_NOT_ENOUGH", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENCY_VALUE_CHANGED_Data), event: "EVENT_CURRENCY_VALUE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CURRENT_QUEST_CHANGED_Data), event: "EVENT_CURRENT_QUEST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CUSTOM_EMOTE_Data), event: "EVENT_CUSTOM_EMOTE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CUSTOMIZATION_ACTIVE_SLOT_CHANGED_Data), event: "EVENT_CUSTOMIZATION_ACTIVE_SLOT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CUSTOMIZATION_ACTIVE_SLOT_CONTENT_CHANGED_Data), event: "EVENT_CUSTOMIZATION_ACTIVE_SLOT_CONTENT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_CUSTOMIZATION_STATE_CHANGED_Data), event: "EVENT_CUSTOMIZATION_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEFAULT_SPELL_CHANGED_Data), event: "EVENT_DEFAULT_SPELL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEFAULT_SPELL_EFFECT_Data), event: "EVENT_DEFAULT_SPELL_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEPOSITE_BOX_CHANGED_Data), event: "EVENT_DEPOSITE_BOX_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_ACTION_EFFECTIVENESS_CHANGED_Data), event: "EVENT_DEVICE_ACTION_EFFECTIVENESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_ACTIVE_ACTION_CHANGED_Data), event: "EVENT_DEVICE_ACTIVE_ACTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_COOLDOWN_FINISHED_Data), event: "EVENT_DEVICE_COOLDOWN_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_COOLDOWN_STARTED_Data), event: "EVENT_DEVICE_COOLDOWN_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED_Data), event: "EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_DAMAGE_RECEIVED_Data), event: "EVENT_DEVICE_DAMAGE_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_DEAD_CHANGED_Data), event: "EVENT_DEVICE_DEAD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_OFFLINE_CHANGED_Data), event: "EVENT_DEVICE_OFFLINE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_OFFLINE_REASON_Data), event: "EVENT_DEVICE_OFFLINE_REASON", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_RELATED_QUESTS_CHANGED_Data), event: "EVENT_DEVICE_RELATED_QUESTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICE_ZERO_SPEED_Data), event: "EVENT_DEVICE_ZERO_SPEED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DEVICES_CHANGED_Data), event: "EVENT_DEVICES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_CANCELED_Data), event: "EVENT_DICE_CRAFT_CANCELED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_CMD_FAILED_Data), event: "EVENT_DICE_CRAFT_CMD_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_FINISHED_Data), event: "EVENT_DICE_CRAFT_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_NOT_ENOUGH_COMPONENTS_Data), event: "EVENT_DICE_CRAFT_NOT_ENOUGH_COMPONENTS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_PREPARED_Data), event: "EVENT_DICE_CRAFT_PREPARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_RECIPES_CHANGED_Data), event: "EVENT_DICE_CRAFT_RECIPES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_SCORE_CHANGED_Data), event: "EVENT_DICE_CRAFT_SCORE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_SLOT_CHANGED_Data), event: "EVENT_DICE_CRAFT_SLOT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DICE_CRAFT_STATUS_CHANGED_Data), event: "EVENT_DICE_CRAFT_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DISASSEMBLING_RESULT_Data), event: "EVENT_DISASSEMBLING_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DISBAND_GUILD_REQUEST_Data), event: "EVENT_DISBAND_GUILD_REQUEST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DISTRIBUTION_FINISHED_Data), event: "EVENT_DISTRIBUTION_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DND_DRAG_CANCELLED_Data), event: "EVENT_DND_DRAG_CANCELLED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DND_DRAG_OVER_Data), event: "EVENT_DND_DRAG_OVER", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DND_DRAG_TO_Data), event: "EVENT_DND_DRAG_TO", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DND_DROP_ATTEMPT_Data), event: "EVENT_DND_DROP_ATTEMPT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DND_PICK_ATTEMPT_Data), event: "EVENT_DND_PICK_ATTEMPT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DO_WARP_Data), event: "EVENT_DO_WARP", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_ADDED_Data), event: "EVENT_DOMINATION_OBJECTIVE_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_DISABLED_Data), event: "EVENT_DOMINATION_OBJECTIVE_DISABLED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_OWNER_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_OWNER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_PROGRESS_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_PROGRESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_PROGRESS_TO_CAPTURE_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_PROGRESS_TO_CAPTURE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_RADIUS_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_RADIUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_REMOVED_Data), event: "EVENT_DOMINATION_OBJECTIVE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_STATE_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_TEAM_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_TEAM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_TIME_SWITCHED_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_TIME_SWITCHED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DOMINATION_OBJECTIVE_TIME_TO_CAPTURE_CHANGED_Data), event: "EVENT_DOMINATION_OBJECTIVE_TIME_TO_CAPTURE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DRUID_PET_COMMAND_POINTS_CHANGED_Data), event: "EVENT_DRUID_PET_COMMAND_POINTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DUNGEON_CHOICE_FINISHED_Data), event: "EVENT_DUNGEON_CHOICE_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_DUNGEON_CHOICE_STARTED_Data), event: "EVENT_DUNGEON_CHOICE_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_EMOTES_CHANGED_Data), event: "EVENT_EMOTES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ENDURE_BARRIER_DAMAGE_Data), event: "EVENT_ENDURE_BARRIER_DAMAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_EQUIP_FAILED_Data), event: "EVENT_EQUIP_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED_Data), event: "EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED_Data), event: "EVENT_EQUIPMENT_DRESS_ENABLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FAIRY_BONUS_CHANGED_Data), event: "EVENT_FAIRY_BONUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FAMILY_CREATED_Data), event: "EVENT_FAMILY_CREATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FAMILY_DESTROYED_Data), event: "EVENT_FAMILY_DESTROYED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FAMILY_SPELL_EXPERIENCE_CHANGED_Data), event: "EVENT_FAMILY_SPELL_EXPERIENCE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FAMILY_SPELLS_CHANGED_Data), event: "EVENT_FAMILY_SPELLS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FOLLOW_MODE_CHANGED_Data), event: "EVENT_FOLLOW_MODE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FORAGING_FAILED_Data), event: "EVENT_FORAGING_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FORGE_CRAFT_DIALOG_Data), event: "EVENT_FORGE_CRAFT_DIALOG", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_FULLSCREEN_CHANGED_Data), event: "EVENT_FULLSCREEN_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GAME_ITEM_CHANGED_Data), event: "EVENT_GAME_ITEM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GAME_ITEM_CURSED_CHANGED_Data), event: "EVENT_GAME_ITEM_CURSED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GENERAL_ERROR_Data), event: "EVENT_GENERAL_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GLOBAL_COOLDOWN_Data), event: "EVENT_GLOBAL_COOLDOWN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GLOBAL_NOTICE_Data), event: "EVENT_GLOBAL_NOTICE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GLOBAL_RATES_CHANGED_Data), event: "EVENT_GLOBAL_RATES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GREED_NEED_ROLLS_Data), event: "EVENT_GREED_NEED_ROLLS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GREED_NEED_SELECTED_Data), event: "EVENT_GREED_NEED_SELECTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_ACCEPT_ERROR_Data), event: "EVENT_GROUP_ACCEPT_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_APPEARED_Data), event: "EVENT_GROUP_APPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_CHANGED_Data), event: "EVENT_GROUP_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_CONVERTED_Data), event: "EVENT_GROUP_CONVERTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_DECLINE_Data), event: "EVENT_GROUP_DECLINE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_DECLINE_BUSY_Data), event: "EVENT_GROUP_DECLINE_BUSY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_DECLINE_IGNORED_Data), event: "EVENT_GROUP_DECLINE_IGNORED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_DISAPPEARED_Data), event: "EVENT_GROUP_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_INVITE_Data), event: "EVENT_GROUP_INVITE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_INVITE_END_Data), event: "EVENT_GROUP_INVITE_END", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_INVITE_FAILED_Data), event: "EVENT_GROUP_INVITE_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_ITEM_QUALITY_CHANGED_Data), event: "EVENT_GROUP_ITEM_QUALITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_KICK_FAILED_Data), event: "EVENT_GROUP_KICK_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_LEADER_CHANGED_Data), event: "EVENT_GROUP_LEADER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_LOOT_SCHEME_CHANGED_Data), event: "EVENT_GROUP_LOOT_SCHEME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_MEMBER_ADDED_Data), event: "EVENT_GROUP_MEMBER_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_MEMBER_CHANGED_Data), event: "EVENT_GROUP_MEMBER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GROUP_MEMBER_REMOVED_Data), event: "EVENT_GROUP_MEMBER_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ACCEPTED_Data), event: "EVENT_GUILD_ACCEPTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ALLOD_ATTACK_FAILED_Data), event: "EVENT_GUILD_ALLOD_ATTACK_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL_Data), event: "EVENT_GUILD_ALLOD_ATTACK_SUCCESSFUL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ALLOD_OWNER_CHANGED_Data), event: "EVENT_GUILD_ALLOD_OWNER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_FINISHED_Data), event: "EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_STARTED_Data), event: "EVENT_GUILD_ALLOD_TELEPORT_COOLDOWN_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ALREADY_IN_GUILD_Data), event: "EVENT_GUILD_ALREADY_IN_GUILD", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_APPEARED_Data), event: "EVENT_GUILD_APPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_AVATAR_HISTORY_Data), event: "EVENT_GUILD_AVATAR_HISTORY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BANK_HISTORY_CHANGED_Data), event: "EVENT_GUILD_BANK_HISTORY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED_Data), event: "EVENT_GUILD_BANK_MINIMUM_TRANSACTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BANK_MONEY_CHANGED_Data), event: "EVENT_GUILD_BANK_MONEY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BANK_OPERATION_RESULT_Data), event: "EVENT_GUILD_BANK_OPERATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_ABILITIES_CHANGED_Data), event: "EVENT_GUILD_BOSS_ABILITIES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_CHANGED_Data), event: "EVENT_GUILD_BOSS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_EXPERIENCE_CHANGED_Data), event: "EVENT_GUILD_BOSS_EXPERIENCE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_GEAR_SCORE_CHANGED_Data), event: "EVENT_GUILD_BOSS_GEAR_SCORE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_QUESTS_CHANGED_Data), event: "EVENT_GUILD_BOSS_QUESTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_QUESTS_STATUS_CHANGED_Data), event: "EVENT_GUILD_BOSS_QUESTS_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_SPELLS_CHANGED_Data), event: "EVENT_GUILD_BOSS_SPELLS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BOSS_STATE_CHANGED_Data), event: "EVENT_GUILD_BOSS_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BUFF_ADDED_Data), event: "EVENT_GUILD_BUFF_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_BUFFS_CHANGED_Data), event: "EVENT_GUILD_BUFFS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_CANT_ACCEPT_Data), event: "EVENT_GUILD_CANT_ACCEPT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_CREATED_Data), event: "EVENT_GUILD_CREATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_CURRENCIES_CHANGED_Data), event: "EVENT_GUILD_CURRENCIES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_DECLINE_Data), event: "EVENT_GUILD_DECLINE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_DECLINE_BUSY_Data), event: "EVENT_GUILD_DECLINE_BUSY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_DECLINE_IGNORED_Data), event: "EVENT_GUILD_DECLINE_IGNORED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_DESCRIPTION_CHANGED_Data), event: "EVENT_GUILD_DESCRIPTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_DISAPPEARED_Data), event: "EVENT_GUILD_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ENABLE_PROGRESS_REQUEST_Data), event: "EVENT_GUILD_ENABLE_PROGRESS_REQUEST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_FAILED_Data), event: "EVENT_GUILD_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_HALL_EXPERIENCE_CHANGED_Data), event: "EVENT_GUILD_HALL_EXPERIENCE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_HALL_EXPERIENCE_DAILY_CHANGED_Data), event: "EVENT_GUILD_HALL_EXPERIENCE_DAILY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_HALL_QUESTS_CHANGED_Data), event: "EVENT_GUILD_HALL_QUESTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_HALL_QUESTS_STATUS_CHANGED_Data), event: "EVENT_GUILD_HALL_QUESTS_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_HALL_STATE_CHANGED_Data), event: "EVENT_GUILD_HALL_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_INVITE_Data), event: "EVENT_GUILD_INVITE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ITEMS_HISTORY_CHANGED_Data), event: "EVENT_GUILD_ITEMS_HISTORY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_ITEMS_OPERATION_RESULT_Data), event: "EVENT_GUILD_ITEMS_OPERATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_LEADER_CHANGED_Data), event: "EVENT_GUILD_LEADER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_LEVEL_CHANGED_Data), event: "EVENT_GUILD_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_LIST_CHANGED_Data), event: "EVENT_GUILD_LIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_ADDED_Data), event: "EVENT_GUILD_MEMBER_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_MEMBER_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_BALANCE_CHANGED_Data), event: "EVENT_GUILD_MEMBER_BALANCE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_CHANGED_Data), event: "EVENT_GUILD_MEMBER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_DAY_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_MEMBER_DAY_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_KICKED_Data), event: "EVENT_GUILD_MEMBER_KICKED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_LOYALTY_CHANGED_Data), event: "EVENT_GUILD_MEMBER_LOYALTY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_MONTH_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_MEMBER_MONTH_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED_Data), event: "EVENT_GUILD_MEMBER_ONLINE_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_RANK_CHANGED_Data), event: "EVENT_GUILD_MEMBER_RANK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_REMOVED_Data), event: "EVENT_GUILD_MEMBER_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_SYMBOLICS_Data), event: "EVENT_GUILD_MEMBER_SYMBOLICS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_TABARD_CHANGED_Data), event: "EVENT_GUILD_MEMBER_TABARD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_MEMBER_WEEK_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MESSAGE_CHANGED_Data), event: "EVENT_GUILD_MESSAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_MONTH_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_MONTH_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_NAME_CHANGED_Data), event: "EVENT_GUILD_NAME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_NAME_NOT_AVAILABLE_Data), event: "EVENT_GUILD_NAME_NOT_AVAILABLE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_NEED_RENAME_CHANGED_Data), event: "EVENT_GUILD_NEED_RENAME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_SEASON_AUTHORITY_BONUS_POOL_CHANGED_Data), event: "EVENT_GUILD_SEASON_AUTHORITY_BONUS_POOL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_SEASON_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_SEASON_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_SEASON_LEVEL_CHANGED_Data), event: "EVENT_GUILD_SEASON_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_SEASON_SECURE_AUTHORITY_CHANGED_Data), event: "EVENT_GUILD_SEASON_SECURE_AUTHORITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_SYMBOLICS_CHANGED_Data), event: "EVENT_GUILD_SYMBOLICS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_TABARDS_CHANGED_Data), event: "EVENT_GUILD_TABARDS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_TALENTS_CHANGED_Data), event: "EVENT_GUILD_TALENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_TEXTURE_CHANGED_Data), event: "EVENT_GUILD_TEXTURE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_GUILD_UNLOCKED_LEVEL_CHANGED_Data), event: "EVENT_GUILD_UNLOCKED_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_ACTIVE_HULL_CHANGED_Data), event: "EVENT_HANGAR_ACTIVE_HULL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_ACTIVE_SHIP_CHANGED_Data), event: "EVENT_HANGAR_ACTIVE_SHIP_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_ACTIVE_SHIP_HULLS_CHANGED_Data), event: "EVENT_HANGAR_ACTIVE_SHIP_HULLS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_ACTIVE_SHIP_SKINS_CHANGED_Data), event: "EVENT_HANGAR_ACTIVE_SHIP_SKINS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_ACTIVE_SKIN_CHANGED_Data), event: "EVENT_HANGAR_ACTIVE_SKIN_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_DEVICES_RECEIVED_Data), event: "EVENT_HANGAR_DEVICES_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_REPAIR_QUESTION_Data), event: "EVENT_HANGAR_REPAIR_QUESTION", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_SHIPS_CHANGED_Data), event: "EVENT_HANGAR_SHIPS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_SLOT_DEVICES_RECEIVED_Data), event: "EVENT_HANGAR_SLOT_DEVICES_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_SPELL_CHANGED_Data), event: "EVENT_HANGAR_SPELL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HANGAR_SPELL_EFFECT_Data), event: "EVENT_HANGAR_SPELL_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEAL_ABSORB_POOL_APPEARED_Data), event: "EVENT_HEAL_ABSORB_POOL_APPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEAL_ABSORB_POOL_CHANGED_Data), event: "EVENT_HEAL_ABSORB_POOL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEAL_ABSORB_POOL_DISAPPEARED_Data), event: "EVENT_HEAL_ABSORB_POOL_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEALING_RECEIVED_Data), event: "EVENT_HEALING_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEARSTONE_LOCATOR_CHANGED_Data), event: "EVENT_HEARSTONE_LOCATOR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEARTHSTONE_COOLDOWN_FINISHED_Data), event: "EVENT_HEARTHSTONE_COOLDOWN_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEARTHSTONE_COOLDOWN_STARTED_Data), event: "EVENT_HEARTHSTONE_COOLDOWN_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEARTHSTONE_CREATED_Data), event: "EVENT_HEARTHSTONE_CREATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HEARTHSTONE_DESTROYED_Data), event: "EVENT_HEARTHSTONE_DESTROYED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_HIDDEN_CURRENCY_VALUE_CHANGED_Data), event: "EVENT_HIDDEN_CURRENCY_VALUE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_IME_SELECT_FINISHED_Data), event: "EVENT_IME_SELECT_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_IME_SELECT_STARTED_Data), event: "EVENT_IME_SELECT_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INGAME_UNDER_CURSOR_CHANGED_Data), event: "EVENT_INGAME_UNDER_CURSOR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INSPECT_AVATAR_MEDALS_RESULT_Data), event: "EVENT_INSPECT_AVATAR_MEDALS_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INSPECT_FINISHED_Data), event: "EVENT_INSPECT_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INSPECT_MOUNT_CHANGED_Data), event: "EVENT_INSPECT_MOUNT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INSPECT_SKILL_CHANGED_Data), event: "EVENT_INSPECT_SKILL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INSPECT_STARTED_Data), event: "EVENT_INSPECT_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INTERACTION_STARTED_Data), event: "EVENT_INTERACTION_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INTERFACE_TOGGLE_Data), event: "EVENT_INTERFACE_TOGGLE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_CHANGED_Data), event: "EVENT_INVENTORY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_GEMS_CHANGED_Data), event: "EVENT_INVENTORY_GEMS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_GEMS_SLOT_ADDED_Data), event: "EVENT_INVENTORY_GEMS_SLOT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_GEMS_SLOT_REMOVED_Data), event: "EVENT_INVENTORY_GEMS_SLOT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_OVERFLOW_CHANGED_Data), event: "EVENT_INVENTORY_OVERFLOW_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_OVERFLOW_SLOT_ADDED_Data), event: "EVENT_INVENTORY_OVERFLOW_SLOT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_OVERFLOW_SLOT_REMOVED_Data), event: "EVENT_INVENTORY_OVERFLOW_SLOT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_SIZE_CHANGED_Data), event: "EVENT_INVENTORY_SIZE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_INVENTORY_SLOT_CHANGED_Data), event: "EVENT_INVENTORY_SLOT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ISLAND_DEATH_LIMIT_CHANGED_Data), event: "EVENT_ISLAND_DEATH_LIMIT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEM_DISABLED_Data), event: "EVENT_ITEM_DISABLED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEM_MOVED_Data), event: "EVENT_ITEM_MOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEM_QUESTS_RECEIVED_Data), event: "EVENT_ITEM_QUESTS_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEM_RELATED_QUESTS_CHANGED_Data), event: "EVENT_ITEM_RELATED_QUESTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEM_SERVER_CMD_FINISHED_Data), event: "EVENT_ITEM_SERVER_CMD_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED_Data), event: "EVENT_ITEMS_EXCHANGE_DECLINE_IGNORED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_ERROR_Data), event: "EVENT_ITEMS_EXCHANGE_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_FINISHED_Data), event: "EVENT_ITEMS_EXCHANGE_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_INVITED_Data), event: "EVENT_ITEMS_EXCHANGE_INVITED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED_Data), event: "EVENT_ITEMS_EXCHANGE_OFFER_FINAL_CONFIRMED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED_Data), event: "EVENT_ITEMS_EXCHANGE_OFFER_ITEMS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED_Data), event: "EVENT_ITEMS_EXCHANGE_OFFER_MONEY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED_Data), event: "EVENT_ITEMS_EXCHANGE_OFFER_PRIMARY_CONFIRMED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY_Data), event: "EVENT_ITEMS_EXCHANGE_SLOT_IS_BUSY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_STARTED_Data), event: "EVENT_ITEMS_EXCHANGE_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ITEMS_EXCHANGE_STATE_CHANGED_Data), event: "EVENT_ITEMS_EXCHANGE_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_ACTION_FAIL_Data), event: "EVENT_LFG_ACTION_FAIL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_DEPART_AVAILABLE_CHANGED_Data), event: "EVENT_LFG_DEPART_AVAILABLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_DESTINATION_AVAILABLE_CHANGED_Data), event: "EVENT_LFG_DESTINATION_AVAILABLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_DESTINATION_CHANGED_Data), event: "EVENT_LFG_DESTINATION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_DESTINATION_VISITS_CHANGED_Data), event: "EVENT_LFG_DESTINATION_VISITS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_DESTINATIONS_LIST_CHANGED_Data), event: "EVENT_LFG_DESTINATIONS_LIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_JOIN_Data), event: "EVENT_LFG_JOIN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_LEAVE_Data), event: "EVENT_LFG_LEAVE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_VOTE_Data), event: "EVENT_LFG_VOTE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LFG_VOTE_TERMINATE_Data), event: "EVENT_LFG_VOTE_TERMINATE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOADING_PROGRESS_Data), event: "EVENT_LOADING_PROGRESS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOBBY_CLIENT_MESSAGE_Data), event: "EVENT_LOBBY_CLIENT_MESSAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOCALE_CHANGED_Data), event: "EVENT_LOCALE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_APPEARED_Data), event: "EVENT_LOOT_BAG_APPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_CHANGED_Data), event: "EVENT_LOOT_BAG_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_DISAPPEARED_Data), event: "EVENT_LOOT_BAG_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_ITEM_DISAPPEARED_Data), event: "EVENT_LOOT_BAG_ITEM_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_MONEY_DISAPPEARED_Data), event: "EVENT_LOOT_BAG_MONEY_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_OPEN_STATE_CHANGED_Data), event: "EVENT_LOOT_BAG_OPEN_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_BAG_SELECTED_Data), event: "EVENT_LOOT_BAG_SELECTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_CHEST_CAPTURED_Data), event: "EVENT_LOOT_CHEST_CAPTURED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_CHEST_DROPPED_Data), event: "EVENT_LOOT_CHEST_DROPPED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_CHEST_RETURNED_Data), event: "EVENT_LOOT_CHEST_RETURNED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_CHEST_TAKEN_Data), event: "EVENT_LOOT_CHEST_TAKEN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_DISTRIBUTION_STARTED_Data), event: "EVENT_LOOT_DISTRIBUTION_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_FOR_GREED_NEED_Data), event: "EVENT_LOOT_FOR_GREED_NEED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_MARK_Data), event: "EVENT_LOOT_MARK", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOT_TO_DISTRIBUTE_Data), event: "EVENT_LOOT_TO_DISTRIBUTE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOOTSELECTOR_CHANGED_Data), event: "EVENT_LOOTSELECTOR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOTTERY_END_Data), event: "EVENT_LOTTERY_END", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_LOTTERY_STATE_CHANGED_Data), event: "EVENT_LOTTERY_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAIL_CREATE_RESULT_Data), event: "EVENT_MAIL_CREATE_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAIL_DELETE_RESULT_Data), event: "EVENT_MAIL_DELETE_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAIL_EXTRACT_ITEMS_RESULT_Data), event: "EVENT_MAIL_EXTRACT_ITEMS_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAIL_EXTRACT_MONEY_RESULT_Data), event: "EVENT_MAIL_EXTRACT_MONEY_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAIL_RETURN_RESULT_Data), event: "EVENT_MAIL_RETURN_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_ACTIVATED_Data), event: "EVENT_MAILBOX_ACTIVATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_CHANGED_Data), event: "EVENT_MAILBOX_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_CHANGED_ON_SERVER_Data), event: "EVENT_MAILBOX_CHANGED_ON_SERVER", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_CLOSED_Data), event: "EVENT_MAILBOX_CLOSED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_NEW_MAIL_ARRIVED_Data), event: "EVENT_MAILBOX_NEW_MAIL_ARRIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_NEW_UNREAD_MESSAGE_Data), event: "EVENT_MAILBOX_NEW_UNREAD_MESSAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILBOX_SERVER_OPERATION_RESULT_Data), event: "EVENT_MAILBOX_SERVER_OPERATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAILS_CHANGED_Data), event: "EVENT_MAILS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MANA_RECEIVED_Data), event: "EVENT_MANA_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAP_CHANNELS_INFO_CHANGED_Data), event: "EVENT_MAP_CHANNELS_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAP_INSTANCE_FULL_Data), event: "EVENT_MAP_INSTANCE_FULL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED_Data), event: "EVENT_MAP_INSTANCE_KICK_TIMER_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MAP_INSTANCE_KICK_TIMER_STARTED_Data), event: "EVENT_MAP_INSTANCE_KICK_TIMER_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_AUTO_DEPART_TIME_CHANGED_Data), event: "EVENT_MATCH_MAKING_AUTO_DEPART_TIME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_CURRENT_BATTLE_CHANGED_Data), event: "EVENT_MATCH_MAKING_CURRENT_BATTLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_ADDED_Data), event: "EVENT_MATCH_MAKING_EVENT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_AVAILABILITY_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_AVAILABILITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_DOUBLE_BONUS_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_DOUBLE_BONUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_DURATION_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_DURATION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBER_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBERS_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_MEMBERS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_REMOVED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_PROGRESS_ROUNDS_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_PROGRESS_ROUNDS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_QUEUE_ADDED_Data), event: "EVENT_MATCH_MAKING_EVENT_QUEUE_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_QUEUE_REMOVED_Data), event: "EVENT_MATCH_MAKING_EVENT_QUEUE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_QUEUES_REMOVED_Data), event: "EVENT_MATCH_MAKING_EVENT_QUEUES_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_REMOVED_Data), event: "EVENT_MATCH_MAKING_EVENT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_TELEPORT_REJECTED_Data), event: "EVENT_MATCH_MAKING_EVENT_TELEPORT_REJECTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_TELEPORT_REQUEST_Data), event: "EVENT_MATCH_MAKING_EVENT_TELEPORT_REQUEST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENT_VISITS_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENT_VISITS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENTS_AVAILABILITY_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENTS_AVAILABILITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_EVENTS_CHANGED_Data), event: "EVENT_MATCH_MAKING_EVENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_JOIN_TIME_CHANGED_Data), event: "EVENT_MATCH_MAKING_JOIN_TIME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_MEMBERS_ROLES_CHANGED_Data), event: "EVENT_MATCH_MAKING_MEMBERS_ROLES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_PROGRESS_ACHIEVEMENTS_CHANGED_Data), event: "EVENT_MATCH_MAKING_PROGRESS_ACHIEVEMENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MATCH_MAKING_PROGRESS_MEMBERS_ACHIEVEMENTS_CHANGED_Data), event: "EVENT_MATCH_MAKING_PROGRESS_MEMBERS_ACHIEVEMENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MEDAL_ADDED_Data), event: "EVENT_MEDAL_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MEDAL_PROGRESS_CHANGED_Data), event: "EVENT_MEDAL_PROGRESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MEDAL_REMOVED_Data), event: "EVENT_MEDAL_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MEDALS_CHANGED_Data), event: "EVENT_MEDALS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MEDALS_SEARCH_RESULTS_Data), event: "EVENT_MEDALS_SEARCH_RESULTS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MEMBER_MEDAL_FINISHED_Data), event: "EVENT_MEMBER_MEDAL_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_APPRENTICE_ADDED_Data), event: "EVENT_MENTOR_APPRENTICE_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_APPRENTICE_REMOVED_Data), event: "EVENT_MENTOR_APPRENTICE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_APPRENTICE_REWARD_CHANGED_Data), event: "EVENT_MENTOR_APPRENTICE_REWARD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_CHANGED_Data), event: "EVENT_MENTOR_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_COOLDOWNS_CHANGED_Data), event: "EVENT_MENTOR_COOLDOWNS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_DATA_CHANGED_Data), event: "EVENT_MENTOR_DATA_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_INFO_CHANGED_Data), event: "EVENT_MENTOR_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_MESSAGE_CHANGED_Data), event: "EVENT_MENTOR_MESSAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MENTOR_PLAYER_INFO_CHANGED_Data), event: "EVENT_MENTOR_PLAYER_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_META_DIALOG_Data), event: "EVENT_META_DIALOG", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_META_UPGRADE_BREAK_Data), event: "EVENT_META_UPGRADE_BREAK", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_META_UPGRADE_RESULT_Data), event: "EVENT_META_UPGRADE_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_FREE_PORTRAIT_SLOT_Data), event: "EVENT_MISSION_FREE_PORTRAIT_SLOT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_INITIALIZED_Data), event: "EVENT_MISSION_INITIALIZED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_RULE_ADDED_Data), event: "EVENT_MISSION_RULE_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_RULE_CHANGED_Data), event: "EVENT_MISSION_RULE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_RULE_COUNTER_CHANGED_Data), event: "EVENT_MISSION_RULE_COUNTER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_RULE_REMOVED_Data), event: "EVENT_MISSION_RULE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MISSION_RULES_CHANGED_Data), event: "EVENT_MISSION_RULES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOB_ACTION_PROGRESS_FINISH_Data), event: "EVENT_MOB_ACTION_PROGRESS_FINISH", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOB_ACTION_PROGRESS_FREEZE_Data), event: "EVENT_MOB_ACTION_PROGRESS_FREEZE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOB_ACTION_PROGRESS_START_Data), event: "EVENT_MOB_ACTION_PROGRESS_START", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOB_EVADED_Data), event: "EVENT_MOB_EVADED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOB_RELATED_GOALS_CHANGED_Data), event: "EVENT_MOB_RELATED_GOALS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOB_RELATED_QUESTS_CHANGED_Data), event: "EVENT_MOB_RELATED_QUESTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MOVE_BY_CLICK_CHANGED_Data), event: "EVENT_MOVE_BY_CLICK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED_Data), event: "EVENT_MUTATION_ZONE_MAP_MODIFIERS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MUTATION_ZONE_POPULATION_CHANGED_Data), event: "EVENT_MUTATION_ZONE_POPULATION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MWAR_FLAG_COSTS_CHANGED_Data), event: "EVENT_MWAR_FLAG_COSTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MWAR_LADDER_CHANGED_Data), event: "EVENT_MWAR_LADDER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MWAR_QUEUE_CHANGED_Data), event: "EVENT_MWAR_QUEUE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_MWAR_RATING_PROGRESS_CHANGED_Data), event: "EVENT_MWAR_RATING_PROGRESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATE_ENABLED_CHANGED_Data), event: "EVENT_NAVIGATE_ENABLED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATION_SCANER_HUB_PVE_INFO_Data), event: "EVENT_NAVIGATION_SCANER_HUB_PVE_INFO", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATION_SCANER_HUB_PVP_INFO_Data), event: "EVENT_NAVIGATION_SCANER_HUB_PVP_INFO", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATION_SCANER_HUB_STARTED_Data), event: "EVENT_NAVIGATION_SCANER_HUB_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATION_SCANER_HUB_TRAILS_INFO_Data), event: "EVENT_NAVIGATION_SCANER_HUB_TRAILS_INFO", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATOR_FOLLOWED_CHANGED_Data), event: "EVENT_NAVIGATOR_FOLLOWED_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NAVIGATOR_TARGET_CHESTS_CHANGED_Data), event: "EVENT_NAVIGATOR_TARGET_CHESTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NECROMANCER_BLOOD_POOL_CHANGED_Data), event: "EVENT_NECROMANCER_BLOOD_POOL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NEW_REPUTATION_APPEARED_Data), event: "EVENT_NEW_REPUTATION_APPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NEWS_POST_LOADED_Data), event: "EVENT_NEWS_POST_LOADED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_NEWS_POST_SELECTED_Data), event: "EVENT_NEWS_POST_SELECTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFF_ADDED_Data), event: "EVENT_OBJECT_BUFF_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFF_CHANGED_Data), event: "EVENT_OBJECT_BUFF_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFF_PROGRESS_ADDED_Data), event: "EVENT_OBJECT_BUFF_PROGRESS_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFF_PROGRESS_CHANGED_Data), event: "EVENT_OBJECT_BUFF_PROGRESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFF_PROGRESS_REMOVED_Data), event: "EVENT_OBJECT_BUFF_PROGRESS_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFF_REMOVED_Data), event: "EVENT_OBJECT_BUFF_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFFS_CHANGED_Data), event: "EVENT_OBJECT_BUFFS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_BUFFS_ELEMENT_CHANGED_Data), event: "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_COMBAT_STATUS_CHANGED_Data), event: "EVENT_OBJECT_COMBAT_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_DETECT_FINISHED_Data), event: "EVENT_OBJECT_DETECT_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_DETECT_STARTED_Data), event: "EVENT_OBJECT_DETECT_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_DETECTOR_LIST_CHANGED_Data), event: "EVENT_OBJECT_DETECTOR_LIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_DIMINISHING_CHANGED_Data), event: "EVENT_OBJECT_DIMINISHING_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_DIMINISHING_GROUP_CHANGED_Data), event: "EVENT_OBJECT_DIMINISHING_GROUP_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_HEALTH_CHANGED_Data), event: "EVENT_OBJECT_HEALTH_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_MANA_CHANGED_Data), event: "EVENT_OBJECT_MANA_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_NAME_CHANGED_Data), event: "EVENT_OBJECT_NAME_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_SELECTABLE_CHANGED_Data), event: "EVENT_OBJECT_SELECTABLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECT_UIINFO_REMOVED_Data), event: "EVENT_OBJECT_UIINFO_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OBJECTS_HEALTH_CHANGED_Data), event: "EVENT_OBJECTS_HEALTH_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_OPTION_CHANGED_Data), event: "EVENT_OPTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ORDER_ACHIEVEMENTS_CHANGED_Data), event: "EVENT_ORDER_ACHIEVEMENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ORDER_CAN_VOTE_CHANGED_Data), event: "EVENT_ORDER_CAN_VOTE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ORDER_CHANGED_Data), event: "EVENT_ORDER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ORDER_INFO_CHANGED_Data), event: "EVENT_ORDER_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_ORDER_VOTE_ANSWER_Data), event: "EVENT_ORDER_VOTE_ANSWER", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED_Data), event: "EVENT_PARTY_MEMBER_ACTIVE_PET_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PARTY_MEMBER_POSITION_UPDATED_Data), event: "EVENT_PARTY_MEMBER_POSITION_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PASSANGER_STATE_CHANGED_Data), event: "EVENT_PASSANGER_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PET_INFO_CHANGED_Data), event: "EVENT_PET_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PICK_OBJECT_Data), event: "EVENT_PICK_OBJECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PLAYED_COMMAND_RESPONSE_Data), event: "EVENT_PLAYED_COMMAND_RESPONSE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED_Data), event: "EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PLAYER_GEAR_SCORE_CHANGED_Data), event: "EVENT_PLAYER_GEAR_SCORE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PLAYER_GREAT_CHANGED_Data), event: "EVENT_PLAYER_GREAT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PLAYER_TITLE_CHANGED_Data), event: "EVENT_PLAYER_TITLE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PLAYER_TITLES_CHANGED_Data), event: "EVENT_PLAYER_TITLES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_POS_CONVERTER_CHANGED_Data), event: "EVENT_POS_CONVERTER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_POWEREDLSWEAPONS_CHANGED_Data), event: "EVENT_POWEREDLSWEAPONS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_POWEREDLSWEAPONS_ITEM_ADDED_Data), event: "EVENT_POWEREDLSWEAPONS_ITEM_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PREMIUM_BONUS_STAGE_CHANGED_Data), event: "EVENT_PREMIUM_BONUS_STAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PREMIUM_CHANGED_Data), event: "EVENT_PREMIUM_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PREMIUM_STAGE_CHANGED_Data), event: "EVENT_PREMIUM_STAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PRIDEN_FACTION_CHOICE_Data), event: "EVENT_PRIDEN_FACTION_CHOICE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_GOAL_ADDED_Data), event: "EVENT_PROCEDURAL_DUNGEON_GOAL_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_GOAL_COUNT_CHANGED_Data), event: "EVENT_PROCEDURAL_DUNGEON_GOAL_COUNT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_GOAL_STATE_CHANGED_Data), event: "EVENT_PROCEDURAL_DUNGEON_GOAL_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_GOALS_CHANGED_Data), event: "EVENT_PROCEDURAL_DUNGEON_GOALS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_POINTS_CHANGED_Data), event: "EVENT_PROCEDURAL_DUNGEON_POINTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_SCENARIO_ADDED_Data), event: "EVENT_PROCEDURAL_DUNGEON_SCENARIO_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCEDURAL_DUNGEON_SCENARIO_STATE_CHANGED_Data), event: "EVENT_PROCEDURAL_DUNGEON_SCENARIO_STATE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROCESS_TERMINATED_Data), event: "EVENT_PROCESS_TERMINATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROFICIENCY_ADDED_Data), event: "EVENT_PROFICIENCY_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROFICIENCY_REMOVED_Data), event: "EVENT_PROFICIENCY_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PROJECTED_OBJECTS_CHANGED_Data), event: "EVENT_PROJECTED_OBJECTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_PURGE_BARRIER_DAMAGE_Data), event: "EVENT_PURGE_BARRIER_DAMAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_ABANDONED_Data), event: "EVENT_QUEST_ABANDONED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_ACCEPT_ERROR_Data), event: "EVENT_QUEST_ACCEPT_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_BOOK_CHANGED_Data), event: "EVENT_QUEST_BOOK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_BOOK_LIMITS_CHANGED_Data), event: "EVENT_QUEST_BOOK_LIMITS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_COMPLETED_Data), event: "EVENT_QUEST_COMPLETED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_DISCARDED_Data), event: "EVENT_QUEST_DISCARDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_FAILED_Data), event: "EVENT_QUEST_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_FIND_NEXT_RESULT_Data), event: "EVENT_QUEST_FIND_NEXT_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_FINISH_FAILED_NO_SPACE_Data), event: "EVENT_QUEST_FINISH_FAILED_NO_SPACE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_MARK_UPDATED_Data), event: "EVENT_QUEST_MARK_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_OBJECTIVE_UPDATED_Data), event: "EVENT_QUEST_OBJECTIVE_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_READY_TO_RETURN_CHANGED_Data), event: "EVENT_QUEST_READY_TO_RETURN_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_RECEIVED_Data), event: "EVENT_QUEST_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_REWARD_UPDATED_Data), event: "EVENT_QUEST_REWARD_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_SHARE_INVITATION_Data), event: "EVENT_QUEST_SHARE_INVITATION", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_SHARE_INVITATION_RESULT_Data), event: "EVENT_QUEST_SHARE_INVITATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_SHARE_INVITATION_TIMEOUT_Data), event: "EVENT_QUEST_SHARE_INVITATION_TIMEOUT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_START_FAILED_LOG_FULL_Data), event: "EVENT_QUEST_START_FAILED_LOG_FULL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_START_FAILED_NO_SPACE_Data), event: "EVENT_QUEST_START_FAILED_NO_SPACE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_TIMER_FINISHED_Data), event: "EVENT_QUEST_TIMER_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_TIMER_UPDATED_Data), event: "EVENT_QUEST_TIMER_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUEST_UPDATED_Data), event: "EVENT_QUEST_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUESTION_ADDED_Data), event: "EVENT_QUESTION_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUESTION_REMOVED_Data), event: "EVENT_QUESTION_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_QUESTION_RESULTS_CHANGED_Data), event: "EVENT_QUESTION_RESULTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_ALREADY_IN_Data), event: "EVENT_RAID_ALREADY_IN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_APPEARED_Data), event: "EVENT_RAID_APPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_CANT_ACCEPT_Data), event: "EVENT_RAID_CANT_ACCEPT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_CANT_ENTER_MAP_Data), event: "EVENT_RAID_CANT_ENTER_MAP", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_CHANGED_Data), event: "EVENT_RAID_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_DECLINE_Data), event: "EVENT_RAID_DECLINE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_DECLINE_BUSY_Data), event: "EVENT_RAID_DECLINE_BUSY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_DECLINE_IGNORED_Data), event: "EVENT_RAID_DECLINE_IGNORED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_DISAPPEARED_Data), event: "EVENT_RAID_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_ENTER_VARS_MAP_UNAVALIABLE_Data), event: "EVENT_RAID_ENTER_VARS_MAP_UNAVALIABLE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_ENTER_VARS_MAP_WARNING_Data), event: "EVENT_RAID_ENTER_VARS_MAP_WARNING", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_FAILED_Data), event: "EVENT_RAID_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_INVITE_Data), event: "EVENT_RAID_INVITE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_INVITE_END_Data), event: "EVENT_RAID_INVITE_END", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_LEADER_CHANGED_Data), event: "EVENT_RAID_LEADER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_LEADER_HELPER_CHANGED_Data), event: "EVENT_RAID_LEADER_HELPER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_LOOT_MASTER_CHANGED_Data), event: "EVENT_RAID_LOOT_MASTER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_MEMBER_ADDED_Data), event: "EVENT_RAID_MEMBER_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_MEMBER_CHANGED_Data), event: "EVENT_RAID_MEMBER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_MEMBER_POSITION_UPDATED_Data), event: "EVENT_RAID_MEMBER_POSITION_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_MEMBER_REMOVED_Data), event: "EVENT_RAID_MEMBER_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RAID_SAVE_MAP_QUESTION_Data), event: "EVENT_RAID_SAVE_MAP_QUESTION", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REACTOR_COUNTDOWN_Data), event: "EVENT_REACTOR_COUNTDOWN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REACTOR_COUNTDOWN_CANCELLED_Data), event: "EVENT_REACTOR_COUNTDOWN_CANCELLED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_READY_CHECK_ENDED_Data), event: "EVENT_READY_CHECK_ENDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_READY_CHECK_INFO_CHANGED_Data), event: "EVENT_READY_CHECK_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_READY_CHECK_STARTED_Data), event: "EVENT_READY_CHECK_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_READY_FOR_FINALLY_RESPAWN_Data), event: "EVENT_READY_FOR_FINALLY_RESPAWN", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REFORGE_RESULT_Data), event: "EVENT_REFORGE_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REFORGE_RESULT_FAIL_Data), event: "EVENT_REFORGE_RESULT_FAIL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REFORGE_RESULT_READY_Data), event: "EVENT_REFORGE_RESULT_READY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RELIEF_BARRIER_DAMAGE_Data), event: "EVENT_RELIEF_BARRIER_DAMAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REMORT_ABILITY_SHARING_REQUEST_Data), event: "EVENT_REMORT_ABILITY_SHARING_REQUEST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REMORT_CHARACTER_SCENE_CAMERA_READY_Data), event: "EVENT_REMORT_CHARACTER_SCENE_CAMERA_READY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REMORT_LIST_GAINED_Data), event: "EVENT_REMORT_LIST_GAINED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REMORT_SHOW_CREATION_DIALOG_Data), event: "EVENT_REMORT_SHOW_CREATION_DIALOG", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REMORT_VARIATIONS_INFO_CHANGED_Data), event: "EVENT_REMORT_VARIATIONS_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REMORT_ZOOM_TRIGGER_CHANGED_Data), event: "EVENT_REMORT_ZOOM_TRIGGER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REPUTATION_DISAPPEARED_Data), event: "EVENT_REPUTATION_DISAPPEARED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REPUTATION_LEVEL_CHANGED_Data), event: "EVENT_REPUTATION_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REPUTATION_VALUE_CHANGED_Data), event: "EVENT_REPUTATION_VALUE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RESPAWN_FROM_GRAVEYARD_Data), event: "EVENT_RESPAWN_FROM_GRAVEYARD", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RESPAWN_STARTED_Data), event: "EVENT_RESPAWN_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RESURRECT_REJECTED_Data), event: "EVENT_RESURRECT_REJECTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RESURRECT_REQUESTED_Data), event: "EVENT_RESURRECT_REQUESTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REVIVAL_ROLL_RESULT_Data), event: "EVENT_REVIVAL_ROLL_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_REVIVALS_CHANGED_Data), event: "EVENT_REVIVALS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_RUNE_OPERATION_RESULT_Data), event: "EVENT_RUNE_OPERATION_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SCANNED_HUB_OBJECTS_CHANGED_Data), event: "EVENT_SCANNED_HUB_OBJECTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SECRET_CLOSED_Data), event: "EVENT_SECRET_CLOSED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SECRET_COMPONENT_CLOSED_Data), event: "EVENT_SECRET_COMPONENT_CLOSED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SECRET_FINISHED_Data), event: "EVENT_SECRET_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SECRET_FINISHER_STATUS_CHANGED_Data), event: "EVENT_SECRET_FINISHER_STATUS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SECRET_OPENED_Data), event: "EVENT_SECRET_OPENED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SECRETS_CHANGED_Data), event: "EVENT_SECRETS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHIELD_REGEN_IN_PROGRESS_CHANGED_Data), event: "EVENT_SHIELD_REGEN_IN_PROGRESS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHIELD_STRENGTH_CHANGED_Data), event: "EVENT_SHIELD_STRENGTH_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHIP_CUSTOMIZING_CHANGED_Data), event: "EVENT_SHIP_CUSTOMIZING_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHIP_CUSTOMIZING_FINISHED_Data), event: "EVENT_SHIP_CUSTOMIZING_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHIP_CUSTOMIZING_STARTED_Data), event: "EVENT_SHIP_CUSTOMIZING_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHIP_DAMAGE_RECEIVED_Data), event: "EVENT_SHIP_DAMAGE_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHOW_ITEMS_INFO_Data), event: "EVENT_SHOW_ITEMS_INFO", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SHOW_SUBTITLES_Data), event: "EVENT_SHOW_SUBTITLES", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SKILL_ADDED_Data), event: "EVENT_SKILL_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SKILL_IMPROVEMENT_CHANGED_Data), event: "EVENT_SKILL_IMPROVEMENT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SKILL_REMOVED_Data), event: "EVENT_SKILL_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SKILL_SCORE_CHANGED_Data), event: "EVENT_SKILL_SCORE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SKILLS_CHANGED_Data), event: "EVENT_SKILLS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SLASH_COMMAND_FAILED_Data), event: "EVENT_SLASH_COMMAND_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SLASH_COMMAND_PREFIX_CHANGED_Data), event: "EVENT_SLASH_COMMAND_PREFIX_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SOS_FINISHED_Data), event: "EVENT_SOS_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SOS_STARTED_Data), event: "EVENT_SOS_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SOUL_PROGRESS_EXPERIENCE_CHANGED_Data), event: "EVENT_SOUL_PROGRESS_EXPERIENCE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SOUL_PROGRESS_TALENTS_CHANGED_Data), event: "EVENT_SOUL_PROGRESS_TALENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SPELLBOOK_CHANGED_Data), event: "EVENT_SPELLBOOK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SPELLBOOK_ELEMENT_ADDED_Data), event: "EVENT_SPELLBOOK_ELEMENT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SPELLBOOK_ELEMENT_CHANGED_Data), event: "EVENT_SPELLBOOK_ELEMENT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SPELLBOOK_ELEMENT_EFFECT_Data), event: "EVENT_SPELLBOOK_ELEMENT_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_SPOUSE_POSITION_UPDATED_Data), event: "EVENT_SPOUSE_POSITION_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_FOOD_CHANGED_Data), event: "EVENT_STABLE_FOOD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_ADDED_Data), event: "EVENT_STABLE_MOUNT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_CHANGED_Data), event: "EVENT_STABLE_MOUNT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_HUNGRY_Data), event: "EVENT_STABLE_MOUNT_HUNGRY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_LEVEL_CHANGED_Data), event: "EVENT_STABLE_MOUNT_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_REMOVED_Data), event: "EVENT_STABLE_MOUNT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_SKINS_CHANGED_Data), event: "EVENT_STABLE_MOUNT_SKINS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNT_TALENTS_CHANGED_Data), event: "EVENT_STABLE_MOUNT_TALENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_MOUNTS_CHANGED_Data), event: "EVENT_STABLE_MOUNTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_STABLE_SLOTS_COUNT_CHANGED_Data), event: "EVENT_STABLE_SLOTS_COUNT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TAKE_ITEMS_FAILED_Data), event: "EVENT_TAKE_ITEMS_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TALENTS_CHANGED_Data), event: "EVENT_TALENTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TALK_STARTED_Data), event: "EVENT_TALK_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TALK_STOPPED_Data), event: "EVENT_TALK_STOPPED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TARGET_POS_CHANGED_Data), event: "EVENT_TARGET_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TARGET_SALES_ADDED_Data), event: "EVENT_TARGET_SALES_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TARGET_SALES_CHANGED_Data), event: "EVENT_TARGET_SALES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TELEPORT_OFFER_REQUEST_Data), event: "EVENT_TELEPORT_OFFER_REQUEST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRACK_ADDED_Data), event: "EVENT_TRACK_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRACK_OBJECT_CHANGED_Data), event: "EVENT_TRACK_OBJECT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRACK_POS_CHANGED_Data), event: "EVENT_TRACK_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRACK_REMOVED_Data), event: "EVENT_TRACK_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRAINER_LEARN_ERROR_Data), event: "EVENT_TRAINER_LEARN_ERROR", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_ACCELERATION_TARGET_CHANGED_Data), event: "EVENT_TRANSPORT_ACCELERATION_TARGET_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_ANGULAR_VELOCITY_CHANGED_Data), event: "EVENT_TRANSPORT_ANGULAR_VELOCITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_CRITICAL_MALFUNCTION_Data), event: "EVENT_TRANSPORT_CRITICAL_MALFUNCTION", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_DEVICES_CHANGED_Data), event: "EVENT_TRANSPORT_DEVICES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_DIRECTION_CHANGED_Data), event: "EVENT_TRANSPORT_DIRECTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_ENERGY_CHANGED_Data), event: "EVENT_TRANSPORT_ENERGY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_HORIZONTAL_VELOCITY_CHANGED_Data), event: "EVENT_TRANSPORT_HORIZONTAL_VELOCITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_INSIGHT_CHANGED_Data), event: "EVENT_TRANSPORT_INSIGHT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_OBSERVING_FINISHED_Data), event: "EVENT_TRANSPORT_OBSERVING_FINISHED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_OBSERVING_STARTED_Data), event: "EVENT_TRANSPORT_OBSERVING_STARTED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_POS_CHANGED_Data), event: "EVENT_TRANSPORT_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_RENAME_REPLY_Data), event: "EVENT_TRANSPORT_RENAME_REPLY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_RENAME_REPLY_RESULT_Data), event: "EVENT_TRANSPORT_RENAME_REPLY_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_SHIELD_CHANGED_Data), event: "EVENT_TRANSPORT_SHIELD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_SHIP_INFO_CHANGED_Data), event: "EVENT_TRANSPORT_SHIP_INFO_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORT_VERTICAL_VELOCITY_CHANGED_Data), event: "EVENT_TRANSPORT_VERTICAL_VELOCITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TRANSPORTS_CHANGED_Data), event: "EVENT_TRANSPORTS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TREASURY_FULL_Data), event: "EVENT_TREASURY_FULL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TUTORIAL_REQUEST_Data), event: "EVENT_TUTORIAL_REQUEST", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_TUTORIAL_SEARCH_RESULT_Data), event: "EVENT_TUTORIAL_SEARCH_RESULT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNEQUIP_FAILED_Data), event: "EVENT_UNEQUIP_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_CLASS_CHANGED_Data), event: "EVENT_UNIT_CLASS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_DAMAGE_RECEIVED_Data), event: "EVENT_UNIT_DAMAGE_RECEIVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_DEAD_CHANGED_Data), event: "EVENT_UNIT_DEAD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_EQUIPMENT_CHANGED_Data), event: "EVENT_UNIT_EQUIPMENT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_FACTION_CHANGED_Data), event: "EVENT_UNIT_FACTION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_FAIRY_CHANGED_Data), event: "EVENT_UNIT_FAIRY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_FAIRY_RANK_CHANGED_Data), event: "EVENT_UNIT_FAIRY_RANK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_FATALITY_CHANGED_Data), event: "EVENT_UNIT_FATALITY_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_FOLLOWERS_LIST_CHANGED_Data), event: "EVENT_UNIT_FOLLOWERS_LIST_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_GUILD_CHANGED_Data), event: "EVENT_UNIT_GUILD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_HONOR_VALUE_CHANGED_Data), event: "EVENT_UNIT_HONOR_VALUE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_LEVEL_CHANGED_Data), event: "EVENT_UNIT_LEVEL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_MANA_CHANGED_Data), event: "EVENT_UNIT_MANA_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_MANA_PERCENTAGE_CHANGED_Data), event: "EVENT_UNIT_MANA_PERCENTAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_MESSAGE_Data), event: "EVENT_UNIT_MESSAGE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_MOOD_CHANGED_Data), event: "EVENT_UNIT_MOOD_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_MOUNT_HEALTH_CHANGED_Data), event: "EVENT_UNIT_MOUNT_HEALTH_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_POS_CHANGED_Data), event: "EVENT_UNIT_POS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_PVP_FLAG_CHANGED_Data), event: "EVENT_UNIT_PVP_FLAG_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_RAGE_CHANGED_Data), event: "EVENT_UNIT_RAGE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_RELATION_CHANGED_Data), event: "EVENT_UNIT_RELATION_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_TAG_CHANGED_Data), event: "EVENT_UNIT_TAG_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_TOOK_MONEY_Data), event: "EVENT_UNIT_TOOK_MONEY", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_VETERAN_RANK_CHANGED_Data), event: "EVENT_UNIT_VETERAN_RANK_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_WILL_CHANGED_Data), event: "EVENT_UNIT_WILL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNIT_ZONE_PVP_TYPE_CHANGED_Data), event: "EVENT_UNIT_ZONE_PVP_TYPE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNITS_CHANGED_Data), event: "EVENT_UNITS_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNKNOWN_SLASH_COMMAND_Data), event: "EVENT_UNKNOWN_SLASH_COMMAND", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNSTUCK_SPELL_CHANGED_Data), event: "EVENT_UNSTUCK_SPELL_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_UNSTUCK_SPELL_EFFECT_Data), event: "EVENT_UNSTUCK_SPELL_EFFECT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_USABLE_DEVICES_CHANGED_Data), event: "EVENT_USABLE_DEVICES_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_USER_SCREENSHOT_Data), event: "EVENT_USER_SCREENSHOT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VALUED_OBJECT_CLICKED_Data), event: "EVENT_VALUED_OBJECT_CLICKED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VALUED_OBJECT_DOUBLE_CLICKED_Data), event: "EVENT_VALUED_OBJECT_DOUBLE_CLICKED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VALUED_OBJECT_MOUSEOVER_Data), event: "EVENT_VALUED_OBJECT_MOUSEOVER", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VARIABLE_ADDED_Data), event: "EVENT_VARIABLE_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VARIABLE_REMOVED_Data), event: "EVENT_VARIABLE_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VARIABLE_VALUE_CHANGED_Data), event: "EVENT_VARIABLE_VALUE_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE_Data), event: "EVENT_VENDOR_BUY_NOT_ENOUGH_PLACE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL_Data), event: "EVENT_VENDOR_BUY_REPUTATION_IS_TOO_SMALL", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT_Data), event: "EVENT_VENDOR_BUY_REQUIRED_ACHIEVEMENT", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VENDOR_ITEM_ALREADY_SOLD_Data), event: "EVENT_VENDOR_ITEM_ALREADY_SOLD", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VENDOR_ITEM_NOT_FOR_SALE_Data), event: "EVENT_VENDOR_ITEM_NOT_FOR_SALE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VENDOR_LIST_UPDATED_Data), event: "EVENT_VENDOR_LIST_UPDATED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VETERANRANKS_COMMAND_RESPONSE_Data), event: "EVENT_VETERANRANKS_COMMAND_RESPONSE", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_VICTIM_TRACKER_CHANGED_Data), event: "EVENT_VICTIM_TRACKER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WHEELOFLOOT_ADDED_Data), event: "EVENT_WHEELOFLOOT_ADDED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WHEELOFLOOT_CHANGED_Data), event: "EVENT_WHEELOFLOOT_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WHEELOFLOOT_ITEMS_Data), event: "EVENT_WHEELOFLOOT_ITEMS", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WHEELOFLOOT_REMOVED_Data), event: "EVENT_WHEELOFLOOT_REMOVED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WHISPER_FAILED_Data), event: "EVENT_WHISPER_FAILED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WISHMASTER_CHANGED_Data), event: "EVENT_WISHMASTER_CHANGED", filter?: table, registerPersonal?: boolean)
---@overload fun(handler: fun(params: EVENT_WISHMASTER_MULTIPLYING_Data), event: "EVENT_WISHMASTER_MULTIPLYING", filter?: table, registerPersonal?: boolean)
---@param eventFunction function handler function
---@param sysEventName string event name
---@param filter? table event filter or nil
---@param registerPersonal? boolean auto-activate personalEvents (default true)
function common.RegisterEventHandler(eventFunction, sysEventName, filter, registerPersonal) end

--- Unregisters an event handler. Parameters must match those used during registration.
---@param eventFunction function handler function to unregister
---@param sysEventName string event name
---@param filter? table event filter or nil
function common.UnRegisterEventHandler(eventFunction, sysEventName, filter) end
