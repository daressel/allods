---@meta

--- CategoryAstralLua
--- Методы и события для работы с астральными объектами и пр., связанным с астралом.

--- Текстовый enum. Префикс для автоматической проверки - "ENUM_FailType".
ENUM_FailType_Offline = "ENUM_FailType_Offline"
ENUM_FailType_NotOnShip = "ENUM_FailType_NotOnShip"
ENUM_FailType_NoHalo = "ENUM_FailType_NoHalo"
ENUM_FailType_LowTierLevel = "ENUM_FailType_LowTierLevel"
ENUM_FailType_NoTicket = "ENUM_FailType_NoTicket"
ENUM_FailType_NoAstralMap = "ENUM_FailType_NoAstralMap"
ENUM_FailType_NoJumpCurrency = "ENUM_FailType_NoJumpCurrency"

---@class astralLuaLib
astralLua = {}

--- Выполняет прыжок в заданный сектор астрала до выбранной POI за марки (быстрое путешествие).
---@param poiId ObjectId идентификатор астральной POI
---@param spellId SpellId идентификатор заклинания, при помощи которого будет происходить перемещение
function astralLua.AstrolabeJump(poiId, spellId) end

--- Выполняет проверку группы на возможность совершения прыжка в заданный сектор астрала до выбранной POI за марки (быстрое путешествие).
---@param poiId ObjectId идентификатор астральной POI
---@param direct boolean если true, проверяется возможность совершить прыжок с использованием ускорителей(прыжок из ангара на остров), если false, проверяется возможность совершить обычный прыжок на остров из страла
function astralLua.CheckJump(poiId, direct) end

--- Возвращает информацию об астральном аддоне по его идентификатору.
---@param addonId ObjectId идентификатор аддона
---@return table|nil
function astralLua.GetAddonInfo(addonId) end

--- Возвращает список идентификаторов (индексирован с 1) всех аддонов в астрале в порядке их сложности.
---@return table
function astralLua.GetAddons() end

--- Возвращает список идентификаторов всех секторов, находящихся в заданном астральном аддоне.
---@param addonId ObjectId идентификатор аддона
---@return table
function astralLua.GetAddonSectors(addonId) end

--- Возвращает список идентификаторов всех точек астральных эвентов.
---@return table
function astralLua.GetAllPOIs() end

--- Возвращает два списка имён игроков, находящихся в команде корабля, из-за которых нельзя использовать астролябию, так как у них нет альтернативной валюты или благосклонности покровителя.
---@return table
function astralLua.GetAstrolabeDeniedPlayers() end

--- Возвращает информацию об астролябии, если эта информация доступна и астролябию может использовать главный игрок (он на своем корабле и является капитаном).
---@return table|nil
function astralLua.GetAstrolabeInfo() end

--- Возвращает информацию о доступных секторах для прыжка (быстрое путешествие). Показывает как непосредственно, так и потенциально доступные сектора.
---@return table
function astralLua.GetAstrolabeInfoEx() end

--- Возвращает идентификатор сектора для астрального прыжка (быстрое путешествие), идущего в данный момент (фаза разгона).
---@return ObjectId|nil
function astralLua.GetAstrolabeTarget() end

--- Возвращает идентификатор текущего астрального сектора, в котором находится игрок.
---@return ObjectId|nil
function astralLua.GetCurrentSector() end

--- Возвращает центр (GamePosition) астрального хаба, в котором находится игрок.
---@return GamePosition|nil
function astralLua.GetHubCenter() end

--- Возвращает радиус стабильной зоны астрального хаба, в котором находится игрок.
---@return number
function astralLua.GetHubRadius() end

--- Возвращает информацию о времени сворачивания астрального острова, на котором находится главный игрок. Если игрок не на астральном острове, то возвращает nil.
---@return table|nil
function astralLua.GetIslandCollapseTime() end

--- Возвращает число смертей и ограничение на их количество для острова.
---@return table
function astralLua.GetIslandDeathLimit() end

--- Возвращает описание астрального объекта в астральном хабе игрока.
---@param objectId ObjectId идентификатор юнита
---@return table|nil
function astralLua.GetObjectInfo(objectId) end

--- Возвращает список идентификаторов астральных объектов в хабе главного игрока.
---@return table
function astralLua.GetObjects() end

--- Возвращает уровень астрального анлока данного игрока. Возвращает правильное значение только для дружественных игроков. Для остальных возвращает 0.
---@param playerId ObjectId идентификатор игрока
---@return number
function astralLua.GetPlayerUnlockLevel(playerId) end

--- Возвращает информацию о точке астрального эвента по её идентификатору.
---@param poiId ObjectId идентификатор точки
---@return table|nil
function astralLua.GetPOIInfo(poiId) end

--- Возвращает информацию о торговле в точке астрального эвента по её идентификатору.
---@param poiId ObjectId идентификатор точки
---@return table|nil
function astralLua.GetPOITradeInfo(poiId) end

--- возвращает информацию о возможности прыжка в астральный сектор с помощью астролябии.
---@param sectorId ObjectId идентификатор сектора
---@return table
function astralLua.GetSectorAstrolabeInfo(sectorId) end

--- Возвращает идентификатор точки астрального эвента в заданном секторе, к которому мы хотим совершить "прямой" прыжок, т.е. не выбирая другие варианты.
---@param sectorId ObjectId идентификатор сектора
---@return ObjectId|nil
function astralLua.GetSectorDirectPOI(sectorId) end

--- Возвращает список идентификаторов всех секторов связанных с заданным сектором.
---@param sectorId ObjectId идентификатор сектора
---@return table
function astralLua.GetSectorEdges(sectorId) end

--- Возвращает информацию об астральном секторе по его идентификатору.
---@param sectorId ObjectId идентификатор сектора
---@return table|nil
function astralLua.GetSectorInfo(sectorId) end

--- Возвращает информацию об астральном секторе по его идентификатору.
---@param astralSectorId AstralSectorId идентификатор сектора
---@return table|nil
function astralLua.GetSectorInfoById(astralSectorId) end

--- Возвращает список идентификаторов точек астральных эвентов в заданном секторе.
---@param sectorId ObjectId идентификатор сектора
---@return table
function astralLua.GetSectorPOIs(sectorId) end

--- Возвращает список всех заданий, имеющихся у игрока, связанных с данным астральным сектором.
---@param sectorId ObjectId идентификатор сектора
---@return table
function astralLua.GetSectorRelatedQuests(sectorId) end

--- Возвращает список идентификаторов астральных мобов в хабе главного игрока.
---@return table
function astralLua.GetUnits() end

--- Проверяет находится ли игрок в астральном хабе
---@return boolean
function astralLua.IsInHub() end

--- Возвращает true, если указанный астральный сектор исследован (доступен по астральному анлоку) у игрока с учетом группы, в которой он состоит: или сектор открыт у самого игрока, или доступен по групповому анлоку.
---@return boolean
function astralLua.IsSectorKnownForGroup() end

--- Возвращает true, если указанный астральный сектор исследован (доступен по астральному анлоку: максимум из значений avatarLevel и astralLevel сектора меньше или равен астральному анлоку игрока) у игрока без учета группы, в которой он состоит.
---@param playerId ObjectId идентификатор игрока
---@param sectorId ObjectId идентификатор астрального сектора
---@return boolean
function astralLua.IsSectorKnownForPlayer(playerId, sectorId) end

--- Возвращает список таблиц с информацией об объектах (астрольные юниты, корабли), невидимых с корабля, но насканеных в хабе визором корабля, на котором находится главный игрок.
function GetScannedObjects() end

-- Events

--- Событие посылается каждый раз, когда игрок переместился в другой астральный хаб.
EVENT_ASTRAL_HUB_CHANGED = "EVENT_ASTRAL_HUB_CHANGED"

--- Событие посылается каждый раз, когда игрок игрок попадает или уходит с астрального острова.
EVENT_ASTRAL_ISLAND_CHANGED = "EVENT_ASTRAL_ISLAND_CHANGED"

--- Событие посылается каждый раз, когда изменилось время коллапса астрального острова, на котором находится главный игрок.
EVENT_ASTRAL_ISLAND_TIME_CHANGED = "EVENT_ASTRAL_ISLAND_TIME_CHANGED"

--- Событие посылается, если изменилась доступность астрального объекта в хабе.
EVENT_ASTRAL_OBJECT_ENABLED_CHANGED = "EVENT_ASTRAL_OBJECT_ENABLED_CHANGED"

--- Событие посылается каждый раз, когда изменяется список точек проведения астральных ивентов .
EVENT_ASTRAL_POIS_CHANGED = "EVENT_ASTRAL_POIS_CHANGED"

--- Событие посылается каждый раз, когда игрок переместился в другой астральный сектор.
EVENT_ASTRAL_SECTOR_CHANGED = "EVENT_ASTRAL_SECTOR_CHANGED"

--- Событие возвращающее результат проверки группы на возможность совершения прыжка в выбранный сектор астрала до выбранной POI.
EVENT_ASTRAL_SECTOR_CHECK_JUMP_RESULT = "EVENT_ASTRAL_SECTOR_CHECK_JUMP_RESULT"

--- Событие посылается каждый раз, когда в астральном хабе корабль аватара подобрал обломки.
EVENT_ASTRAL_WRECK_LOOT_TAKEN = "EVENT_ASTRAL_WRECK_LOOT_TAKEN"

--- Событие посылается при изменении информации о доступных секторах для прыжка (быстрое путешествие).
EVENT_ASTROLABE_INFO_CHANGED = "EVENT_ASTROLABE_INFO_CHANGED"

--- Оповещение об изменении спелла астролябии на корабле.
EVENT_ASTROLABE_SPELL_CHANGED = "EVENT_ASTROLABE_SPELL_CHANGED"

--- Оповещение о начале эффекта для спелла астролябии на корабле.
EVENT_ASTROLABE_SPELL_EFFECT = "EVENT_ASTROLABE_SPELL_EFFECT"

--- Событие посылается каждый раз, когда изменяются значения смертей и их лимитов для острова.
EVENT_ISLAND_DEATH_LIMIT_CHANGED = "EVENT_ISLAND_DEATH_LIMIT_CHANGED"

--- Событие присылается при изменении уровня астрального анлока игрока.
EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED = "EVENT_PLAYER_ASTRAL_UNLOCK_CHANGED"

--- Событие посылается, если изменился список объектов насканеных навигатором корабля главного игрока.
EVENT_SCANNED_HUB_OBJECTS_CHANGED = "EVENT_SCANNED_HUB_OBJECTS_CHANGED"
