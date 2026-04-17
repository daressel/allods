---@meta

--- CategorySocial
--- Функции Lua API библиотеки social. Используется для friend/ignore списков и т.п.

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_AvatarFriendIgnoreListsError".
ENUM_AvatarFriendIgnoreListsError_ServiceNotReady = "ENUM_AvatarFriendIgnoreListsError_ServiceNotReady"
ENUM_AvatarFriendIgnoreListsError_EntryAlreadyExists = "ENUM_AvatarFriendIgnoreListsError_EntryAlreadyExists"
ENUM_AvatarFriendIgnoreListsError_NoSuchEntry = "ENUM_AvatarFriendIgnoreListsError_NoSuchEntry"
ENUM_AvatarFriendIgnoreListsError_InternalError = "ENUM_AvatarFriendIgnoreListsError_InternalError"
ENUM_AvatarFriendIgnoreListsError_AvatarNotFound = "ENUM_AvatarFriendIgnoreListsError_AvatarNotFound"
ENUM_AvatarFriendIgnoreListsError_ListOverflow = "ENUM_AvatarFriendIgnoreListsError_ListOverflow"

--- Текстовый енум. Префикс для автоматической проверки - "ENUM_CreateRevivalRollResultStatus".
ENUM_CreateRevivalRollResultStatus_Success = "ENUM_CreateRevivalRollResultStatus_Success"
ENUM_CreateRevivalRollResultStatus_InternalError = "ENUM_CreateRevivalRollResultStatus_InternalError"
ENUM_CreateRevivalRollResultStatus_AccountNotFound = "ENUM_CreateRevivalRollResultStatus_AccountNotFound"
ENUM_CreateRevivalRollResultStatus_WrongReferOwner = "ENUM_CreateRevivalRollResultStatus_WrongReferOwner"
ENUM_CreateRevivalRollResultStatus_ActiveAccount = "ENUM_CreateRevivalRollResultStatus_ActiveAccount"
ENUM_CreateRevivalRollResultStatus_AlreadySent = "ENUM_CreateRevivalRollResultStatus_AlreadySent"
ENUM_CreateRevivalRollResultStatus_LimitExceeded = "ENUM_CreateRevivalRollResultStatus_LimitExceeded"
ENUM_CreateRevivalRollResultStatus_WrongAvatarLevel = "ENUM_CreateRevivalRollResultStatus_WrongAvatarLevel"
ENUM_CreateRevivalRollResultStatus_NoContentKey = "ENUM_CreateRevivalRollResultStatus_NoContentKey"

---@class socialLib
social = {}

--- Показывает, есть ли у аватара в данный момент возможность передать активный корабль лучшему другу.
function social.CanLendShip() end

--- Возвращает идентификатор спелла, используемого для отбирания у лучшего друга ранее одолженного ему корабля главного игрока. Полученный идентификатор может быть использован только для получения информации (см.  spellLib.GetState( id ) ), а для самого действия вместо каста надо использовать  hangar.TakeAwayShip( shipId ). При изменении состояния спелла посылается событие EVENT_HANGAR_SPELL_CHANGED.
function social.GetTakeAwaySpellId() end

--- Передать активный корабль во временное пользование другому аватару. Аватар должен быть лучшим другом и быть онлайн (см.  social.GetFriendList(), поля isBestFriend и sysOnlineStatus).
---@param friendId ObjectId id аватара, которому передаётся корабль; это не обычный идентификатор игрока, а тот, который выдаёт social.GetFriendList()
function social.LendShip(friendId) end

--- Отбирает корабль ранее одолженный корабль обратно. О возможности действия можно судить по спеллу, получаемому из hangar.GetTakeAwaySpellId() (поле enabled у  spellLib.GetState( id ) ). При изменении состояния посылается событие EVENT_HANGAR_SPELL_CHANGED.
---@param shipId ObjectId идентификатор корабля
function social.TakeAwayShip(shipId) end

--- Попытка добавить персонажа в список друзей текущего аватара игрока.
---@param name WString имя персонажа
---@param description WString собственный комментарий игрока
function social.AddFriend(name, description) end

--- Попытка добавить персонажа в список игнорирования текущего аватара игрока.
---@param name WString имя персонажа
---@param description WString собственный комментарий игрока
function social.AddIgnore(name, description) end

--- Можно ли вернуться от побратима назад.
---@return boolean
function social.CanReturn() end

--- Проверяет можно ли социально взаимодействовать с юнитом: добавлять в друзья или список игнора.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function social.CanSocialize(unitId) end

--- Можно ли переместиться к побратиму.
---@return boolean
function social.CanTeleport() end

--- Завершает дружбу главного игрока с указанным побратимом.
---@param friendId ObjectId идентификатор побратима
function social.EndFriendship(friendId) end

--- Забирает ездовое животное главного игрока у побратима.
---@param mountId ObjectId идентификатор ездового животного из конюшни
function social.GetBackMount(mountId) end

--- Возвращает идентификатор друга по его имени из списка друзей главного игрока.
---@param name WString имя друга
---@return ObjectId|nil
function social.GetFriend(name) end

--- Возвращает информацию о друге из списка друзей главного игрока.
---@param friendId ObjectId идентификатор друга игрока из списка друзей (это не обычный идентификатор игрока)
---@return table|nil
function social.GetFriendInfo(friendId) end

--- Возвращает список друзей текущего аватара игрока. Подробности о каждом элементе списка можно получить по  social.GetFriendInfo().
---@return table
function social.GetFriendList() end

--- Возвращает параметры дружбы с побратимами.
---@return table|nil
function social.GetFriendshipInfo() end

--- Возвращает информацию о персонаже из списка игнорирования главного игрока.
---@param ignoreId ObjectId идентификатор о персонаже из списка игнорирования (это не обычный идентификатор игрока)
---@return table|nil
function social.GetIgnoreInfo(ignoreId) end

--- Возвращает список игнорирования текущего аватара игрока. Подробности о каждом элементе списка можно получить по  social.GetIgnoreInfo().
---@return table
function social.GetIgnoreList() end

--- Возвращает информацию о параметрах системы приглашений возврата в игру.
---@return table|nil
function social.GetRevivalRollInfo() end

--- Возвращает идентификатор ресурса спелла для перемещения к побратиму. Запускать его нельзя, можно проверять кулдаун.
---@return SpellId
function social.GetTeleportSpell() end

--- Отдает ездовое животное главного игрока обратно побратиму, у которого оно было взято.
---@param mountId ObjectId идентификатор ездового животного из конюшни
function social.GiveBackMount(mountId) end

--- Проверяет загрузился ли список друзей.
---@return boolean
function social.IsFriendListLoaded() end

--- Проверяет находится ли персонаж в списке игнора у аватара.
---@param player ObjectId идентификатор или имя юнита
---@return boolean
function social.IsIgnored(player) end

--- Проверяет загрузился ли список игнора.
---@return boolean
function social.IsIgnoreListLoaded() end

--- Передает ездовое животное главного игрока указанному побратиму.
---@param friendId ObjectId идентификатор побратима
---@param mountId ObjectId идентификатор ездового животного из конюшни
function social.LendMount(friendId, mountId) end

--- Попытка удалить персонажа из списка друзей текущего аватара игрока.
---@param name WString имя персонажа
function social.RemoveFriend(name) end

--- Попытка удалить персонажа из списка игнорирования текущего аватара игрока.
---@param name WString имя персонажа
function social.RemoveIgnore(name) end

--- Сделать попытку вернуться от побратима назад. Нельзя вызывать, если возвращение пока не доступно.
function social.ReturnFromBestFriend() end

--- Сделать попытку переместиться к побратиму. Нельзя вызывать, если перемещение пока не доступно.
---@param friendId ObjectId идентификатор побратима
function social.TeleportToBestFriend(friendId) end

-- Events

--- Событие приходит, если главный игрок был добавлен в чей-то список друзей.
EVENT_AVATAR_ADDED_TO_FRIEND_LIST = "EVENT_AVATAR_ADDED_TO_FRIEND_LIST"

--- Событие о добавлении персонажа в список друзей.
EVENT_AVATAR_FRIEND_ADDED = "EVENT_AVATAR_FRIEND_ADDED"

--- Событие приходит при изменении имени реморта друга.
EVENT_AVATAR_FRIEND_ALT_NAME_CHANGED = "EVENT_AVATAR_FRIEND_ALT_NAME_CHANGED"

--- Событие приходит при изменении описания друга.
EVENT_AVATAR_FRIEND_DESCRIPTION_CHANGED = "EVENT_AVATAR_FRIEND_DESCRIPTION_CHANGED"

--- Событие приходит при неудачной операции со списком друзей/игнорирования.
EVENT_AVATAR_FRIEND_IGNORE_LISTS_ERROR = "EVENT_AVATAR_FRIEND_IGNORE_LISTS_ERROR"

--- Событие приходит при изменении изменились базовых полей описания друга.
EVENT_AVATAR_FRIEND_INFO_CHANGED = "EVENT_AVATAR_FRIEND_INFO_CHANGED"

--- Событие приходит при изменении уровня друга.
EVENT_AVATAR_FRIEND_LEVEL_CHANGED = "EVENT_AVATAR_FRIEND_LEVEL_CHANGED"

--- Событие приходит при изменении списка друзей.
EVENT_AVATAR_FRIEND_LIST_CHANGED = "EVENT_AVATAR_FRIEND_LIST_CHANGED"

--- Событие приходит при завершении загрузки списка друзей с сервера.
EVENT_AVATAR_FRIEND_LIST_LOADED = "EVENT_AVATAR_FRIEND_LIST_LOADED"

--- Событие приходит при изменении настроения друга.
EVENT_AVATAR_FRIEND_MOOD_CHANGED = "EVENT_AVATAR_FRIEND_MOOD_CHANGED"

--- Событие приходит при изменении состояния взаимности друга.
EVENT_AVATAR_FRIEND_MUTUAL_CHANGED = "EVENT_AVATAR_FRIEND_MUTUAL_CHANGED"

--- Событие приходит при изменении состояния онлайн друга.
EVENT_AVATAR_FRIEND_ONLINE_CHANGED = "EVENT_AVATAR_FRIEND_ONLINE_CHANGED"

--- Уведомление об удалении персонажа из списка друзей.
EVENT_AVATAR_FRIEND_REMOVED = "EVENT_AVATAR_FRIEND_REMOVED"

--- Событие приходит при изменении пола друга.
EVENT_AVATAR_FRIEND_SEX_CHANGED = "EVENT_AVATAR_FRIEND_SEX_CHANGED"

--- Событие приходит при изменении карты, на которой находится друг.
EVENT_AVATAR_FRIEND_ZONE_CHANGED = "EVENT_AVATAR_FRIEND_ZONE_CHANGED"

--- Уведомление о добавлении персонажа в список игнорирования.
EVENT_AVATAR_IGNORE_ADDED = "EVENT_AVATAR_IGNORE_ADDED"

--- Событие приходит при изменении описания игнорируемого игрока.
EVENT_AVATAR_IGNORE_DESCRIPTION_CHANGED = "EVENT_AVATAR_IGNORE_DESCRIPTION_CHANGED"

--- Событие приходит при изменении списка игнорирования.
EVENT_AVATAR_IGNORE_LIST_CHANGED = "EVENT_AVATAR_IGNORE_LIST_CHANGED"

--- Событие приходит при завершении загрузки игнор листа с сервера.
EVENT_AVATAR_IGNORE_LIST_LOADED = "EVENT_AVATAR_IGNORE_LIST_LOADED"

--- Уведомление об удалении персонажа из списка игнорирования.
EVENT_AVATAR_IGNORE_REMOVED = "EVENT_AVATAR_IGNORE_REMOVED"

--- Оповещение об изменении возможности телепортации обратно от побратима к начальной позиции.
EVENT_BEST_FRIEND_RETURN_STATE_CHANGED = "EVENT_BEST_FRIEND_RETURN_STATE_CHANGED"

--- Событие приходит, если изменилось состояние спелла для телепортации к побратиму.
EVENT_BEST_FRIEND_TELEPORT_SPELL_CHANGED = "EVENT_BEST_FRIEND_TELEPORT_SPELL_CHANGED"

--- Оповещение о начале эффекта для спелла телепортации к побратиму.
EVENT_BEST_FRIEND_TELEPORT_SPELL_EFFECT = "EVENT_BEST_FRIEND_TELEPORT_SPELL_EFFECT"

--- Оповещение об изменении возможности телепортации к побратиму.
EVENT_BEST_FRIEND_TELEPORT_STATE_CHANGED = "EVENT_BEST_FRIEND_TELEPORT_STATE_CHANGED"

--- Результат попытки пригласить игрока вернуться в игру. Содержит статус ENUM_CreateRevivalRollResultStatus.
EVENT_REVIVAL_ROLL_RESULT = "EVENT_REVIVAL_ROLL_RESULT"

--- Обновился список игроков которым можно выслать предложение вернуться в игру.
EVENT_REVIVALS_CHANGED = "EVENT_REVIVALS_CHANGED"
