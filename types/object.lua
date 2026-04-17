---@meta

--- CategoryObject
--- Функции Lua API библиотеки object для работы с объектами.

--- Интерфейсный приоритет бафа. Гарантируется строгий порядок (можно сравнивать как числа), больше - выше приоритет.
ENUM_UIBuffPriority_Medium = "ENUM_UIBuffPriority_Medium"
ENUM_UIBuffPriority_High = "ENUM_UIBuffPriority_High"

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

---@class objectLib
object = {}

--- Возвращает список Id объектов (устройство или юнит), отслеживаемых главным игроком на карте.
---@return table
function object.GetDetectedObjects() end

--- Возвращает состояние детектора интерактивных объектов на клиенте. Это могут быть детекторы квестгиверов, торговцев и т.п. См. avatar.EnableClientDetector( type, enable ).
---@param type integer тип детектора
---@return boolean
function object.IsClientDetectorEnabled(type) end

--- Заносит объект в список для проецирования в 2D координаты. Дополнительно можно указать смещение (см.  enum ATTACHED_OBJECT_POS_...).
function object.AddToProjected() end

--- Вывешивает над интерактивным объектом 2D-виджет. В данный момент работает для юнитов и для транспортов, отслеживаемых главным игроком на карте.
---@param objectId ObjectId идентификатор объекта
---@param widget WidgetSafe дескриптор виджета
---@param pos integer расположение виджета (по вертикали), константы:
function object.AttachWidget2D(objectId, widget, pos) end

--- "Привязывает" указанный контрол как Widget3D к заданному объекту. Координаты Widget3D будут пересчитываться автоматически до тех пор, пока контрол не будет "отвязан" обратно. Привязка автоматическая к локатору "Slot_TopFX" визуального объекта, можно задавать дополнительное смещение Widget3D по вертикали. К объекту можно "привязать" несколько Widget3D.
function object.AttachWidget3D() end

--- Возвращает true, если объект возможно атаковать
---@param objectId ObjectId
---@return boolean
function object.CanAttack(objectId) end

--- "Отвязывает" все Widget3D от указанного объекта.
function object.DetachAllWidgets3D() end

--- Убирает 2D-виджеты, привязанные к интерактивному объекту.
---@param objectId ObjectId
---@param widget WidgetSafe
function object.DetachWidget2D(objectId, widget) end

--- "Отвязывает" указанный контрол как Widget3D от объекта.
function object.DetachWidget3D() end

--- Выполняет поиск инстансов баффа с данным sysName на объекте с идентификатором objectId. Возвращает id первого найденного инстанса (порядок обхода не определен) или nil если таковых не нашлось.
---@param objectId ObjectId идентификатор объекта на котором ищем бафф
---@param sysName string внутреннее имя баффа (соответствующее поле в базе для баффа - "sysUIScriptName")
---@return objectId|nil
function object.GetBuffBySysName(objectId, sysName) end

--- Возвращает динамические параметры баффа: его длительность, оставшееся время действия и количество стаков.
---@param Id ObjectId идентификатор экземпляра бафа
function object.GetBuffDynamicInfo(Id) end

--- Возвращает информацию о бафе. В качестве аргумента может принимать как id экземпляра бафа, так и ресурса (BuffId) бафа.
---@param Id ObjectId Идентификатор экземпляра (должен быть валидным) или ресурса буфа
---@param includeResourceInfo boolean|nil Включать ли информацию о ресурсе бафа при получении информации о экземпляре бафа. По умолчанию true
function object.GetBuffInfo(Id, includeResourceInfo) end

--- Возвращает список идентификаторов экземпляров бафов, висящих на данном объекте, и соответствующих критерию поиска.
---@param objectId ObjectId идентификатор объекта.
---@param key BuffId Критерий поиска бафов. Можно искать по ресурсу, по системному имени или по интерфейсному приоритету.
---@return table
function object.GetBuffInstances(objectId, key) end

--- Возвращает список ресурсов бафов по рангам.
---@param buffId BuffId идентификатор ресурса бафа.
---@return table
function object.GetBuffRanks(buffId) end

--- Возвращает список валидных экземпляров бафов висящих на данном объекте.
---@param objectId ObjectId ид объекта на котором ищем бафы. Объект должен существовать и иметь бафф-менеджер.
---@param ignoreInvisible boolean|nil игнорировать бафы с needVisualize == false. По умолчанию false.
---@return table
function object.GetBuffs(objectId, ignoreInvisible) end

--- Возвращает таблицу hash_map&lt;buffId, buffInfo&gt;. Ключи - идентификаторы экземпляров бафа, значения - таблицы информации о бафах. Формат таблиц идентичен  object.GetBuffInfo
---@param data 2
---@param includeResourceInfo boolean|nil Включать ли информацию о ресурсе бафа при получении информации о экземпляре бафа. По умолчанию true
---@param ignoreInvisible boolean|nil игнорировать бафы с needVisualize == false. По умолчанию false.
---@return table
function object.GetBuffsInfo(data, includeResourceInfo, ignoreInvisible) end

--- Возвращает информацию о буфах с заданными параметрами на данном объекте.
---@param objectId ObjectId идентификатор юнита
---@param isPositive boolean true если бафф положительный, false если отрицательный (дебафф)
---@param isNeedVisualize boolean true если бафф отображаемый, false если скрытый
---@return table
function object.GetBuffsWithProperties(objectId, isPositive, isNeedVisualize) end

--- Возвращает системное имя для указанного баффа.
---@param Id ObjectId идентификатор или объекта или ресурса баффа
---@return string|nil
function object.GetBuffSysName(Id) end

--- Возвращает информацию о бафе для отображения в тултипе. Является усеченной версией информации о бафе, но добавлено описание бафа. В качестве аргумента может принимать как id экземпляра бафа, так и ресурса (BuffId) бафа.
---@param Id ObjectId Идентификатор экземпляра (должен быть валидным) или ресурса буфа
function object.GetBuffTooltipInfo(Id) end

--- Возвращает список детекторов, отслеживающих объект.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return table
function object.GetDetectors(objectId) end

--- Возвращает информацию о диминишинге(сопротивлении контролю) объекта.
---@param objectId ObjectId идентификатор объекта
---@return table
function object.GetDiminishingState(objectId) end

--- Возвращает расстояние между аватаром и каким-либо объектом. Объект обязан быть валидным. В случае невозможности вычисления вернет nil.
---@param objectId ObjectId идентификатор объекта
---@param is2D boolean|nil считать расстояние в 2D, игнорировать разницу по высоте. По умолчанию false
---@param isInternal boolean|nil игнорировать фильтр детектируемости объекта. По умолчанию false. Для пользовательских дополнений всегда false.
---@return float|nil
function object.GetDistance(objectId, is2D, isInternal) end

--- Возвращает информацию о здоровье интерактивного объекта.
---@param objectId ObjectId
function object.GetHealthInfo(objectId) end

--- Возвращает для объекта мгновенную информацию об его 2D проекции на экран, без занесения в список для проецирования в 2D координаты. Дополнительно нужно указать смещение (см.  enum ATTACHED_OBJECT_POS).
---@return any
function object.GetInstantProjectedInfo() end

--- Возвращает информацию о тех взаимодействиях с объектом, которые доступны главному игроку.
---@param objectId ObjectId идентификатор объекта (НПС или устройство)
---@return table|nil
function object.GetInteractorInfo(objectId) end

--- Получить списки квестов, имеющие отношение к interactive object, по которым можно вычислить quest mark для этого объекта.
---@param objectId ObjectId идентификатор объекта
---@return table
function object.GetInteractorQuests(objectId) end

--- Возвращает информацию о мане интерактивного объекта.
---@param objectId ObjectId
function object.GetManaInfo(objectId) end

--- Получить имя юнита
---@param objectId ObjectId
---@return WString
function object.GetName(objectId) end

--- Возвращает координаты какого-либо объекта, если разрешено их получать. В данный момент разрешено получать координаты транспортов и детектируемых юнитов.
---@param objectId ObjectId идентификатор объекта
---@return GamePosition|nil
function object.GetPos(objectId) end

--- Возвращает для объекта информацию об его 2D проекции на экран, если он есть в списке для проецирования в 2D координаты.
---@return table|nil
function object.GetProjectedInfo() end

--- Возвращает список идентификаторов тайн мира, которые может завершить этот объект. В списке только тайны мира, открытые игроком. То есть объект может быть object.HasWorldSecret(objectId), но иметь пустой список тайн, если ни одна тайна ещё не была открыта (начата для исследования) игроком.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return table
function object.GetWorldSecrets(objectId) end

--- Проверяет может ли интерактивный объект иметь бафы. Если аргумент не является id интерактивного объекта - вернет false (без ошибки).
---@param id any произвольное значение
---@return boolean
function object.HasBuffManager(id) end

--- Возвращает true, если интерактивный объект выглядит как моб. Иначе false.
---@param id ObjectId идентификатор объекта
---@return boolean
function object.HasMobVisual(id) end

--- Возвращает true, если интерактивный объект имеет квесты на выдачу или приём. Иначе false.
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function object.HasQuest(id) end

--- Возвращает true, если интерактивный объект может завершить (и выдать награду) какую-либо тайну мира. Иначе false.
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function object.HasWorldSecret(id) end

--- Подсвечивает интерактивный объект в нужный цвет ( тип Color ).
---@param objectId ObjectId идентификатор интерактивного объекта
---@param type string тип изменяемого параметра ( "SELECTION", "AMBIENT", "OCCLUSION" )
---@param color Color|nil начальный цвет изменяемого параметра
---@param color2 Color|nil конечный цвет изменяемого параметра (поддерживается только для "AMBIENT")
---@param period float полный период изменения параметра color-&gt;color2-&gt;color (поддерживается только для "AMBIENT")
function object.Highlight(objectId, type, color, color2, period) end

--- Возвращает true, если интерактивный объект является астральным юнитом.
---@param id ObjectId Id объекта
---@return boolean
function object.IsAstralUnit(id) end

--- Возвращает информацию о статусе смерти интерактивного объекта (мертв да/нет).
---@param objectId ObjectId
---@return boolean
function object.IsDead(objectId) end

--- Возвращает true, если интерактивный объект детектируется детекторами, отслеживающих объект.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return boolean
function object.IsDetected(objectId) end

--- Возвращает true, если интерактивный объект является устройством.
---@param id ObjectId Id объекта
---@return boolean
function object.IsDevice(id) end

--- Возвращает true, если объект (юнит, транспорт, астральный юнит) враждебен главному игроку
---@param objectId ObjectId
---@return boolean
function object.IsEnemy(objectId) end

--- true, если интерактивный объект (игрок, устройство, моб, транспорт и т.п.) существует. Иначе false.
---@param objectId ObjectId
---@return boolean
function object.IsExist(objectId) end

--- true, если объект существует в системе, но находится далеко, на другой карте. В этом случае для него можно получить информацию о здоровье, мане, классе, состоянии в группе главного игрока и т.п., но нельзя получить позицию, приаттачить к нему виджет или визуальный объект, добавить его в список проецируемых объектов, выделить, получить портрет и т.п.
---@param objectId ObjectId
---@return boolean
function object.IsExist(objectId) end

--- Возвращает true, если объект (юнит, транспорт, астральный юнит) дружественен главному игроку
---@param objectId ObjectId
---@return boolean
function object.IsFriend(objectId) end

--- Получить состояние боя интерактивного объекта (в данный момент юниты и корабли).
---@param objectId ObjectId идентификатор объекта
---@return boolean
function object.IsInCombat(objectId) end

--- Проверка, находится ли указанный интерактивный объект в радиусе "meleeRange".
---@param objectId ObjectId идентификатор интерактивного объекта
---@return boolean
function object.IsInUsageRange(objectId) end

--- Возвращает true, если интерактивный объект является транспортом.
---@param id ObjectId Id объекта
---@return boolean
function object.IsTransport(id) end

--- Возвращает true, если интерактивный объект является юнитом (игрок, моб, NPC).
---@param id ObjectId Id объекта
---@return boolean
function object.IsUnit(id) end

--- Возвращает возможность принципиального использования объекта.
---@param objectId ObjectId идентификатор объекта
---@return boolean
function object.IsUsable(objectId) end

--- Возвращает true, если аргумент является id валидного (на момент вызова функции) экземпляра бафа. Гарантируется что если бафф валиден, то он останется валидным до конца обработки текущего события в lua.
---@param id any произвольное значение
---@return boolean
function object.IsValidBuff(id) end

--- Возвращает true, если интерактивный объект является торговцем. Иначе false.
---@param id ObjectId Id интерактивного объекта
---@return boolean
function object.IsVendor(id) end

--- Снимает позитивный бафф с объекта, если этот бафф можно снять (прописано в его свойствах). Также бафф можно снять только с персонажа главного игрока, его питомца и его корабля.
---@param buffId ObjectId иденетификатор баффа
function object.RemoveBuff(buffId) end

--- Удаляет объект из списка для проецирования в 2D координаты.
function object.RemoveFromProjected() end

--- Задает для списка проецируемых объектов 3D-control.
function object.SetControl3DForProjected() end

--- Задает область вокруг объекта, где убирается трава и т.п. Область можно включать/выключать.
---@param objectId ObjectId
---@param scale float коэффициент, на который умножается размер объекта
---@param extraRadius float дополнительное увеличение области
function object.SetCutTerrainArea(objectId, scale, extraRadius) end

--- Привязывает визуальный скрипт к интерактивному объекту по индексу.
---@param objectId ObjectId идентификатор объекта
---@param channelIndex integer индекс канала визуального скрипта
---@param visActionId VisObjectId идентификатор визуального объекта (эффекта)
function object.StartVisualAction(objectId, channelIndex, visActionId) end

--- Останавливает визуальный скрипт на интерактивном объекте в определенном канале.
---@param objectId ObjectId идентификатор объекта
---@param channelIndex integer индекс канала визуального скрипта
function object.StopVisualAction(objectId, channelIndex) end

--- Включает или выключает детектор интерактивных объектов на клиенте. Это могут быть детекторы квестгиверов, торговцев и т.п.
function EnableClientDetector() end

-- Events

--- Событие посылается, если не удалось привязать Widget3D к определенному объекту.
EVENT_CANNOT_ATTACH_WIDGET_3D = "EVENT_CANNOT_ATTACH_WIDGET_3D"

--- Событие посылается при изменение состояния интерактивного объекта бой/не бой.
EVENT_OBJECT_COMBAT_STATUS_CHANGED = "EVENT_OBJECT_COMBAT_STATUS_CHANGED"

--- Событие посылается при окончании отслеживания объекта на карте с помощью специального умения.
EVENT_OBJECT_DETECT_FINISHED = "EVENT_OBJECT_DETECT_FINISHED"

--- Событие посылается, если у отслеживаемого объекта изменился список детекторов.
EVENT_OBJECT_DETECTOR_LIST_CHANGED = "EVENT_OBJECT_DETECTOR_LIST_CHANGED"

--- Событие посылается при начале отслеживания объекта на карте.
EVENT_OBJECT_DETECT_STARTED = "EVENT_OBJECT_DETECT_STARTED"

--- Событие посылается каждый раз, когда изменилось состояние диминишинга у объекта.
EVENT_OBJECT_DIMINISHING_CHANGED = "EVENT_OBJECT_DIMINISHING_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние одной из групп диминишинга.
EVENT_OBJECT_DIMINISHING_GROUP_CHANGED = "EVENT_OBJECT_DIMINISHING_GROUP_CHANGED"

--- Событие присылается при изменении процентного значения здоровья интерактивных объектов и числового значения здоровья для персонажа игрока
EVENT_OBJECT_HEALTH_CHANGED = "EVENT_OBJECT_HEALTH_CHANGED"

--- Событие присылается при изменении процентного значения маны интерактивных объектов и числового значения маны для персонажа игрока
EVENT_OBJECT_MANA_CHANGED = "EVENT_OBJECT_MANA_CHANGED"

--- Сообщение об изменении имени объекта.
EVENT_OBJECT_NAME_CHANGED = "EVENT_OBJECT_NAME_CHANGED"

--- Сообщение об изменении возможности выделить объект в цель.
EVENT_OBJECT_SELECTABLE_CHANGED = "EVENT_OBJECT_SELECTABLE_CHANGED"

--- Событие присылается при изменения здоровья и состояния неуязвимости объектов
EVENT_OBJECTS_HEALTH_CHANGED = "EVENT_OBJECTS_HEALTH_CHANGED"

--- Событие посылается каждый раз, когда у объекта удаляется информация о специфических параметрах UI для данного объекта.
EVENT_OBJECT_UIINFO_REMOVED = "EVENT_OBJECT_UIINFO_REMOVED"

--- Событие присылается при клике игроком в интерактивный объект или мимо него в основном 3D-окне.
EVENT_PICK_OBJECT = "EVENT_PICK_OBJECT"

--- Событие посылается один раз в кадр, если произошло изменение проецированной 2D координаты (или других параметров) некоторых объектов из списка проецируемых объектов.
EVENT_PROJECTED_OBJECTS_CHANGED = "EVENT_PROJECTED_OBJECTS_CHANGED"

--- Оповещение о смене маркера у объекта-квестодателя. Объект может быть NPC или устройством.
EVENT_QUEST_MARK_UPDATED = "EVENT_QUEST_MARK_UPDATED"

--- Оповещение о изменении статуса тайны мира, которую может принять интерактивный объект. Происходит, если интерактивный объект есть в реплике и изменился статус (не сделан/сделана/сдана) какой-то тайны мира. В этом случае, например, можно поменять знак над головой этого объекта.
EVENT_SECRET_FINISHER_STATUS_CHANGED = "EVENT_SECRET_FINISHER_STATUS_CHANGED"
