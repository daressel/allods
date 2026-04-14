---@meta

---@class socialLib
social = {}

---@class SocialGetFriendInfoResult
---@field id ObjectId идентификатор друга игрока из списка друзей
---@field isBestFriend boolean это также лучший друг, если true
---@field isSimpleFriend boolean это также обычный друг, если true
---@field name string имя персонажа
---@field altName string имя перерождения персонажа
---@field description string комментарий самого главного игрока (по данному персонажу)
---@field sysOnlineStatus string состояние друга (онлайн/альт/с мобильника)
---@field isLogged boolean находится ли в игре
---@field isAlt boolean находится ли в игре, как альтернативный персонаж
---@field altName string имя реморта персонажа
---@field level integer уровень персонажа
---@field lastOnlineTimeMs number время в миллисекундах с последнего захода персонажа в игру, если сейчас в игре, то 0
---@field raceClass table LuaRaceClassInfoPart|nil раса-класс персонажа
---@field sex table LuaSexInfoPart|nil описание пола персонажа
---@field mapId ObjectId|nil идентификатор карты, на которой находится персонаж, если известна
---@field zoneName string локализованное название зоны, на которой находится персонаж, аналогично отображению в гильдии
---@field moodEmote ObjectId|nil идентификатор эмоции настроения, если настроение выставлено у друга
---@field isSpouse boolean true если это также супруг

---@class SocialGetFriendshipInfoResult
---@field bestFriendsLimit integer максимальное количество лучших друзей
---@field maxMountGrade integer максимальный грейд маунта, которого можно передать

---@class SocialGetIgnoreInfoResult
---@field id ObjectId идентификатор элемента из списка игнорирования
---@field name string имя персонажа
---@field description string комментарий самого главного игрока (по данному персонажу)

---@class SocialGetRevivalRollInfoResult
---@field maxActiveRolls integer максимальное количество активных заявок

---Попытка добавить персонажа в список друзей текущего аватара игрока.
---@param name string имя персонажа
---@param description string собственный комментарий игрока
---@return нет
function social.AddFriend(name, description) end

---Попытка добавить персонажа в список игнорирования текущего аватара игрока.
---@param name string имя персонажа
---@param description string собственный комментарий игрока
---@return нет
function social.AddIgnore(name, description) end

---Можно ли вернуться от побратима назад.
---@return boolean
function social.CanReturn() end

---Проверяет можно ли социально взаимодействовать с юнитом: добавлять в друзья или список игнора.
---@param unitId ObjectId идентификатор юнита
---@return boolean
function social.CanSocialize(unitId) end

---Можно ли переместиться к побратиму.
---@return boolean
function social.CanTeleport() end

---Завершает дружбу главного игрока с указанным побратимом.
---@param friendId ObjectId идентификатор побратима
---@return нет
function social.EndFriendship(friendId) end

---Забирает ездовое животное главного игрока у побратима.
---@param mountId ObjectId идентификатор ездового животного из конюшни
---@return нет
function social.GetBackMount(mountId) end

---Возвращает идентификатор друга по его имени из списка друзей главного игрока.
---@param name string имя друга
---@return ObjectId|nil
function social.GetFriend(name) end

---Возвращает информацию о друге из списка друзей главного игрока. Некоторые поля могут заполниться не сразу, а с некоторой задержкой: raceClass, sex, mapId, moodEmote.
---@param friendId ObjectId идентификатор друга игрока из списка друзей (это не обычный идентификатор игрока)
---@return SocialGetFriendInfoResult
function social.GetFriendInfo(friendId) end

---Возвращает список друзей текущего аватара игрока. Подробности о каждом элементе списка можно получить по  social.GetFriendInfo().
---@return ObjectId[]
function social.GetFriendList() end

---Возвращает параметры дружбы с побратимами.
---@return SocialGetFriendshipInfoResult
function social.GetFriendshipInfo() end

---Возвращает информацию о персонаже из списка игнорирования главного игрока.
---@param ignoreId ObjectId идентификатор о персонаже из списка игнорирования (это не обычный идентификатор игрока)
---@return SocialGetIgnoreInfoResult
function social.GetIgnoreInfo(ignoreId) end

---Возвращает список игнорирования текущего аватара игрока. Подробности о каждом элементе списка можно получить по  social.GetIgnoreInfo().
---@return ObjectId[]
function social.GetIgnoreList() end

---Возвращает информацию о параметрах системы приглашений возврата в игру.
---@return SocialGetRevivalRollInfoResult
function social.GetRevivalRollInfo() end

---Возвращает идентификатор ресурса спелла для перемещения к побратиму. Запускать его нельзя, можно проверять кулдаун.
---@return SpellId
function social.GetTeleportSpell() end

---Отдает ездовое животное главного игрока обратно побратиму, у которого оно было взято.
---@param mountId ObjectId идентификатор ездового животного из конюшни
---@return нет
function social.GiveBackMount(mountId) end

---Проверяет загрузился ли список друзей.
---@return boolean
function social.IsFriendListLoaded() end

---Проверяет находится ли персонаж в списке игнора у аватара.
---@param player ObjectId|string идентификатор или имя юнита
---@return boolean
function social.IsIgnored(player) end

---Проверяет загрузился ли список игнора.
---@return boolean
function social.IsIgnoreListLoaded() end

---Передает ездовое животное главного игрока указанному побратиму.
---@param friendId ObjectId идентификатор побратима
---@param mountId ObjectId идентификатор ездового животного из конюшни
---@return нет
function social.LendMount(friendId, mountId) end

---Попытка удалить персонажа из списка друзей текущего аватара игрока.
---@param name string имя персонажа
---@return нет
function social.RemoveFriend(name) end

---Попытка удалить персонажа из списка игнорирования текущего аватара игрока.
---@param name string имя персонажа
---@return нет
function social.RemoveIgnore(name) end

---Сделать попытку вернуться от побратима назад. Нельзя вызывать, если возвращение пока не доступно.
---@return нет
function social.ReturnFromBestFriend() end

---Сделать попытку переместиться к побратиму. Нельзя вызывать, если перемещение пока не доступно.
---@param friendId ObjectId идентификатор побратима
---@return нет
function social.TeleportToBestFriend(friendId) end
