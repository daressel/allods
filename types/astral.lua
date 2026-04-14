---@meta

---@class astralLib
astral = {}

---@class AstralGetAddonInfoResult
---@field id ObjectId идентификатор аддона
---@field name string название аддона
---@field description string название аддона
---@field rect table минимальные и максимальные координаты секторов, входящих в аддон. Поля:
---@field levelOffset number смещение уровня
---@field isSphere boolean true, если этот аддон надо отображать на карте в виде сферы/круга (преобразовывать координаты секторов, ужимая их в круг)

---@class AstralGetAstrolabeDeniedPlayersResult
---@field withoutCoins string[] индексированный с 1 список имён игроков команды, у которых не хватает альтернативной валюты для прыжка
---@field withoutFairies string[] индексированный с 1 список имён игроков команды, у которых покровитель не благосклонен

---@class AstralGetAstrolabeInfoResult
---@field jumpSpellId SpellId спелл "стандартного" прыжка в сектор
---@field chargedJumpSpellId SpellId спелл прыжка в сектор с использованием "заряда ускорения"

---@class AstralGetAstrolabeInfoExResult
---@field techLevel integer уровень доступных секторов для прыжка
---@field sectors таблица, индексированная [1..], содержащая значения:

---@class AstralGetIslandCollapseTimeResult
---@field durationMs integer полное время в миллисекундах сворачивания острова
---@field remainingMs integer время в миллисекундах оставшееся до сворачивания острова на данный момент

---@class AstralGetIslandDeathLimitResult
---@field limit integer ограничение на количество смертей
---@field deathCount integer текущее количество смертей

---@class AstralGetObjectInfoResult
---@field name string имя астрального объекта
---@field description string текстовое описание астрального объекта
---@field position GamePosition координаты объекта в хабе.
---@field isEnabled boolean доступен ли объект
---@field sectorId ObjectId|nil если этот объект - червоточина, идентификатор сектора, в который ведёт червоточина
---@field collisionRadius integer|nil радиус коллизии объекта астрала. Если значение не задано, то вернет nil.
---@field image TextureId текстура с иконкой объекта
---@field collisionIcon TextureId масштабируемая текстура для проекции коллизии объекта астрала на карте.

---@class AstralGetPOIInfoResult
---@field id ObjectId идентификатор точки
---@field sectorId ObjectId идентификатор сектора
---@field name string|nil название евента
---@field description string|nil описание евента
---@field visibleOnMap boolean false, если показывать POI только в списке POI для прыжка; true, если надо показывать и на астральной карте
---@field canJump boolean false, если нельзя прыгнуть к этой POI с помощью астролябии. Не надо показывать в списке для прыжка
---@field texture TextureId идентификатор текстуры для иконки точки

---@class AstralGetPOITradeInfoResult
---@field prodPrice integer цена продукции
---@field rawPrice integer цена сырья
---@field prodStockpile integer заполненность складов продукцией
---@field rawStockpile integer заполненность складов сырьем
---@field maxProdStockpile integer объем складов с продукцией
---@field maxRawStockpile integer объем складов с сырьем

---@class AstralGetSectorAstrolabeInfoResult
---@field unlockLevel number уровень анлока, требующийся для прыжка в этот сектор
---@field isAvailable boolean можно ли осуществить прыжок

---@class AstralGetSectorInfoResult
---@field id ObjectId идентификатор сектора
---@field addonId ObjectId|nil идентификатор астрального аддона, если такая информация имеется
---@field name string|nil название сектора
---@field description ValuedText|nil описание
---@field techLevel integer уровень сектора
---@field quality number уровень качества данного сектора
---@field requiredUnlock number требуемый анлок астрала
---@field ticketsCount number количество необходимых ключей для посещения острова
---@field maxServerProgress number значение серверного анлока, выше которого ключи перестают требоваться
---@field number integer порядковый номер сектора в астральном аддоне
---@field x number координата X расположения сектора в аддоне
---@field y number координата Y расположения сектора в аддоне
---@field astrolabeVisible boolean true если сектор виден в астролябии
---@field mapVisible boolean true если сектор виден на карте
---@field allowChoiceLoot boolean true если в секторе можно выбирать лут

---@class AstralGetSectorInfoByIdResult
---@field id ObjectId идентификатор сектора
---@field addonId ObjectId|nil идентификатор астрального аддона, если такая информация имеется
---@field name string|nil название сектора
---@field description ValuedText|nil описание
---@field techLevel integer уровень сектора
---@field requiredUnlock number требуемый анлок астрала
---@field ticketsCount number количество необходимых ключей для посещения острова
---@field maxServerProgress number значение серверного анлока, выше которого ключи перестают требоваться
---@field number integer порядковый номер сектора в астральном аддоне
---@field x number координата X расположения сектора в аддоне
---@field y number координата Y расположения сектора в аддоне
---@field regionId AstralRegionId или nil nil если нет информации, иначе идентификатор астрального региона, к которому относится сектор
---@field astrolabeVisible boolean true если сектор виден в астролябии
---@field mapVisible boolean true если сектор виден на карте
---@field allowChoiceLoot boolean true если в секторе можно выбирать лут

---Выполняет прыжок в заданный сектор астрала до выбранной POI за марки (быстрое путешествие). Для начала путешествия так же необходимо указать заклинание, при помощи которого будет происходить перемещение. Идентификаторы заклинаний '''быстрого перемещения в астрале''' можно получить через  astral.GetAstrolabeInfo
---@param poiId ObjectId идентификатор астральной POI
---@param spellId SpellId идентификатор заклинания, при помощи которого будет происходить перемещение
---@return нет
function astral.AstrolabeJump(poiId, spellId) end

---Выполняет проверку группы на возможность совершения прыжка в заданный сектор астрала до выбранной POI за марки (быстрое путешествие).
---@param poiId ObjectId идентификатор астральной POI
---@param direct boolean если true, проверяется возможность совершить прыжок с использованием ускорителей(прыжок из ангара на остров), если false, проверяется возможность совершить обычный прыжок на остров из страла
---@return нет
function astral.CheckJump(poiId, direct) end

---Возвращает информацию об астральном аддоне по его идентификатору.
---@param addonId ObjectId идентификатор аддона
---@return AstralGetAddonInfoResult
function astral.GetAddonInfo(addonId) end

---Возвращает список идентификаторов (индексирован с 1) всех аддонов в астрале в порядке их сложности.
---@return ObjectId[]
function astral.GetAddons() end

---Возвращает список идентификаторов всех секторов, находящихся в заданном астральном аддоне.
---@param addonId ObjectId идентификатор аддона
---@return ObjectId[]
function astral.GetAddonSectors(addonId) end

---Возвращает список идентификаторов всех точек астральных эвентов.
---@return ObjectId[]
function astral.GetAllPOIs() end

---Возвращает два списка имён игроков, находящихся в команде корабля, из-за которых нельзя использовать астролябию, так как у них нет альтернативной валюты или благосклонности покровителя.
---@return AstralGetAstrolabeDeniedPlayersResult
function astral.GetAstrolabeDeniedPlayers() end

---Возвращает информацию об астролябии, если эта информация доступна и астролябию может использовать главный игрок (он на своем корабле и является капитаном).
---@return AstralGetAstrolabeInfoResult
function astral.GetAstrolabeInfo() end

---Возвращает информацию о доступных секторах для прыжка (быстрое путешествие). Показывает как непосредственно, так и потенциально доступные сектора.
---@return AstralGetAstrolabeInfoExResult
function astral.GetAstrolabeInfoEx() end

---Возвращает идентификатор сектора для астрального прыжка (быстрое путешествие), идущего в данный момент (фаза разгона).
---@return ObjectId|nil
function astral.GetAstrolabeTarget() end

---Возвращает идентификатор текущего астрального сектора, в котором находится игрок.
---@return ObjectId|nil
function astral.GetCurrentSector() end

---Возвращает центр (GamePosition) астрального хаба, в котором находится игрок.
---@return GamePosition|nil
function astral.GetHubCenter() end

---Возвращает радиус стабильной зоны астрального хаба, в котором находится игрок.
---@return number
function astral.GetHubRadius() end

---Возвращает информацию о времени сворачивания астрального острова, на котором находится главный игрок. Если игрок не на астральном острове, то возвращает nil.
---@return AstralGetIslandCollapseTimeResult
function astral.GetIslandCollapseTime() end

---Возвращает число смертей и ограничение на их количество для острова.
---@return AstralGetIslandDeathLimitResult
function astral.GetIslandDeathLimit() end

---Возвращает описание астрального объекта в астральном хабе игрока. См. GamePosition - позиция объекта.
---@param objectId ObjectId идентификатор юнита
---@return AstralGetObjectInfoResult
function astral.GetObjectInfo(objectId) end

---Возвращает список идентификаторов астральных объектов в хабе главного игрока.
---@return ObjectId[]
function astral.GetObjects() end

---Возвращает уровень астрального анлока данного игрока. Возвращает правильное значение только для дружественных игроков. Для остальных возвращает 0.
---@param playerId ObjectId идентификатор игрока
---@return number
function astral.GetPlayerUnlockLevel(playerId) end

---Возвращает информацию о точке астрального эвента по её идентификатору.
---@param poiId ObjectId идентификатор точки
---@return AstralGetPOIInfoResult
function astral.GetPOIInfo(poiId) end

---Возвращает информацию о торговле в точке астрального эвента по её идентификатору.
---@param poiId ObjectId идентификатор точки
---@return AstralGetPOITradeInfoResult
function astral.GetPOITradeInfo(poiId) end

---Возвращает список таблиц с информацией об объектах (астрольные юниты, корабли), невидимых с корабля, но насканеных в хабе визором корабля, на котором находится главный игрок. Типы объектов представлены enum "ENUM_HubScanInfoObjectType...":
function astral.GetScannedObjects() end

---возвращает информацию о возможности прыжка в астральный сектор с помощью астролябии.
---@param sectorId ObjectId идентификатор сектора
---@return AstralGetSectorAstrolabeInfoResult
function astral.GetSectorAstrolabeInfo(sectorId) end

---Возвращает идентификатор точки астрального эвента в заданном секторе, к которому мы хотим совершить "прямой" прыжок, т.е. не выбирая другие варианты.
---@param sectorId ObjectId идентификатор сектора
---@return ObjectId|nil
function astral.GetSectorDirectPOI(sectorId) end

---Возвращает список идентификаторов всех секторов связанных с заданным сектором.
---@param sectorId ObjectId|AstralSectorId идентификатор сектора
---@return ObjectId[]
function astral.GetSectorEdges(sectorId) end

---Возвращает информацию об астральном секторе по его идентификатору. См.  ITEM_QUALITY_...
---@param sectorId ObjectId|AstralSectorId идентификатор сектора
---@return AstralGetSectorInfoResult
function astral.GetSectorInfo(sectorId) end

---Возвращает информацию об астральном секторе по его идентификатору. DEPRECATED: Функция устарела и помечена к удалению, следует использовать  astral.GetSectorInfo( astralSectorId )
---@param astralSectorId AstralSectorId идентификатор сектора
---@return AstralGetSectorInfoByIdResult
function astral.GetSectorInfoById(astralSectorId) end

---Возвращает список идентификаторов точек астральных эвентов в заданном секторе.
---@param sectorId ObjectId идентификатор сектора
---@return ObjectId[]
function astral.GetSectorPOIs(sectorId) end

---Возвращает список всех заданий, имеющихся у игрока, связанных с данным астральным сектором.
---@param sectorId ObjectId идентификатор сектора
---@return QuestId[]
function astral.GetSectorRelatedQuests(sectorId) end

---Возвращает список идентификаторов астральных мобов в хабе главного игрока.
---@return ObjectId[]
function astral.GetUnits() end

---Проверяет находится ли игрок в астральном хабе
---@return boolean
function astral.IsInHub() end

---Возвращает true, если указанный астральный сектор исследован (доступен по астральному анлоку) у игрока с учетом группы, в которой он состоит: или сектор открыт у самого игрока, или доступен по групповому анлоку. Т.е. max(sectorAvatarLevel, sectorAstralLevel) <= max(playerAstralUnlock, groupAstralUnlock)
---@return boolean
function astral.IsSectorKnownForGroup() end

---Возвращает true, если указанный астральный сектор исследован (доступен по астральному анлоку: максимум из значений avatarLevel и astralLevel сектора меньше или равен астральному анлоку игрока) у игрока без учета группы, в которой он состоит. Т.е. max(sectorAvatarLevel, sectorAstralLevel) <= playerAstralUnlock
---@param playerId ObjectId идентификатор игрока
---@param sectorId ObjectId идентификатор астрального сектора
---@return boolean
function astral.IsSectorKnownForPlayer(playerId, sectorId) end
