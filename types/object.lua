---@meta

---@class objectLib
object = {}

---@class ObjectGetInteractorInfoResult
---@field interactorId ObjectId id собеседника
---@field isVendor boolean является ли объект торговцем
---@field isRawVendor boolean показывает, что vendor table прописан в interactions, а не в cue (т.е. в разговоре с вендором надо выводить отдельный пункт "Торговать")
---@field vendorType number тип торговца
---@field isReputationVendor boolean торговец продает вещи, требующие определенную репутацию
---@field isQuestGiver boolean выдает ли объект задания
---@field isSecretFinisher boolean выдает ли объект награду за полностью завершенную тайну мира
---@field isTrainer boolean является ли объект тренером
---@field isMailBox boolean предоставляет ли объект сервис почтового ящика
---@field isAuction boolean предоставляет ли объект сервис аукционов
---@field isTeleportMaster boolean предоставляет ли объект сервис телепортов
---@field isRemortMaster boolean предоставляет ли объект сервис реморта
---@field isDepositeBoxAccessor boolean предоставляет ли объект сервис хранилища
---@field isBestiary boolean предоставляет ли объект сервис бестиария (мобы для личного инстанса)
---@field isCurrencyExchanger boolean предоставляет ли объект сервис обмена валют
---@field isChangeRoomMaster boolean предоставляет ли объект сервис комнаты перемен
---@field isBattlegroundControlpoint boolean является ли объект контрольной точкой баттлграунда
---@field isRewardsExchange boolean предоставляет ли объект сервис обмена ценностей
---@field canTakeRestedExp boolean предоставляет ли объект сервис отдыха
---@field hasCues boolean есть ли реплика у объекта
---@field extended boolean[] индексированные по значению enum-a INTERACTION_... дополнительные признаки
---@field hasInteraction boolean итоговый результат, есть ли у объекта какое-либо взаймодействие из вышеперечисленных

---@class ObjectGetInteractorQuestsResult
---@field readyToGive таблица список квестов, которые объект готов выдать аватару прямо сейчас; формат: индексированный от 0 массив QuestId
---@field readyToAccept : таблица список квестов, которые оператор готов принять от аватара прямо сейчас; формат: индексированный от 0 массив QuestId
---@field soonToGive таблица список квестов, которые оператор будет готов выдать аватару, когда тот осободит место в квест-буке или получит один уровень (может требоваться одно или оба из условий); формат: индексированный от 0 массив QuestId
---@field soonToAccept таблица список квестов, которые оператор будет готов принять от аватара, когда последний их выполнит; формат: индексированный от 0 массив QuestId

---@class ObjectGetProjectedInfoResult
---@field posX number 2D экранная координата в интервале [-1, 1]
---@field posY number 2D экранная координата в интервале [-1, 1]
---@field playerDistance number дистанция от объекта до главного игрока в метрах
---@field cameraDistance number дистанция от объекта до камеры в метрах
---@field isLos boolean false, если на линии видимости до объекта какое-то препятствие.
---@field canProject boolean false, если объект не может быть спроецирован. например изменились условия, и он теперь не детектируется детекторами. В обычной ситуации всегда true.

---Заносит объект в список для проецирования в 2D координаты. Дополнительно можно указать смещение (см.  enum ATTACHED_OBJECT_POS_...). Можно добавить только те объекты, для которых можно получить координату (детектируемые объекты, игроки из отряда главного игрока и т.п.).
---@param objectId ObjectId идентификатор объекта
---@param heightOffset number место дополнительно смещения проецируемой точки около объекта
---@return нет
function object.AddToProjected(objectId, heightOffset) end

---Вывешивает над интерактивным объектом 2D-виджет. В данный момент работает для юнитов и для транспортов, отслеживаемых главным игроком на карте. Расположение виджета по вертикали:  ATTACHED_OBJECT_POS_...
---@param objectId ObjectId идентификатор объекта
---@param widget WidgetSafe дескриптор виджета
---@param pos number расположение виджета (по вертикали), константы:
---@return нет
function object.AttachWidget2D(objectId, widget, pos) end

---"Привязывает" указанный контрол как Widget3D к заданному объекту. Координаты Widget3D будут пересчитываться автоматически до тех пор, пока контрол не будет "отвязан" обратно. Привязка автоматическая к локатору "Slot_TopFX" визуального объекта, можно задавать дополнительное смещение Widget3D по вертикали. К объекту можно "привязать" несколько Widget3D.
---@param objectId ObjectId идентификатор объекта
---@param wtControl3D Control3DSafe контрол-3D, который отвечает за показ сцены
---@param widget WidgetSafe 2D-контрол, который "привязывается" как Widget3D к объекту
---@param heightOffset number дополнительное смещение Widget3D по вертикали в метрах
---@return нет
function object.AttachWidget3D(objectId, wtControl3D, widget, heightOffset) end

---Возвращает true, если объект возможно атаковать
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@return boolean
function object.CanAttack(objectId) end

---"Отвязывает" все Widget3D от указанного объекта.
---@param objectId ObjectId идентификатор объекта
---@return нет
function object.DetachAllWidgets3D(objectId) end

---Убирает 2D-виджеты, привязанные к интерактивному объекту.
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@param widget WidgetSafe (or nil) -- виджет, который надо убрать. Если параметр не указан, то удаляются все виджеты, относящиеся к объекту.
---@return нет
function object.DetachWidget2D(objectId, widget) end

---"Отвязывает" указанный контрол как Widget3D от объекта.
---@param objectId ObjectId идентификатор объекта
---@param widget WidgetSafe 2D-контрол, который был "привязан" как Widget3D к объекту
---@return нет
function object.DetachWidget3D(objectId, widget) end

---Выполняет поиск инстансов баффа с данным sysName на объекте с идентификатором objectId. Возвращает id первого найденного инстанса (порядок обхода не определен) или nil если таковых не нашлось.
---@param objectId ObjectId идентификатор объекта на котором ищем бафф
---@param sysName string внутреннее имя баффа (соответствующее поле в базе для баффа - "sysUIScriptName")
---@return objectId|nil
function object.GetBuffBySysName(objectId, sysName) end

---Возвращает информацию о количестве буфов, висящих на данном объекте. Дебуфы тоже считаются буфами.
---@param Id ObjectId
---@return integer
function object.GetBuffCount(Id) end

---Возвращает динамические параметры баффа: его длительность, оставшееся время действия и количество стаков. Примечание: Только эти параметры бафа могут изменится после его создания.
---@param Id ObjectId идентификатор экземпляра бафа
---@param durationMs integer полное время действия буфа
---@param remainingMs integer время до окончания действия буфа
---@param stackCount integer количество уровней эффекта
function object.GetBuffDynamicInfo(Id, durationMs, remainingMs, stackCount) end

---Возвращает информацию о бафе. В качестве аргумента может принимать как id экземпляра бафа, так и ресурса (BuffId) бафа. Набор информации для ресурса бафа является  подмножеством набора информации для экземпляра бафа.
---@param Id ObjectId|BuffId Идентификатор экземпляра (должен быть валидным) или ресурса буфа
---@param includeResourceInfo boolean|nil Включать ли информацию о ресурсе бафа при получении информации о экземпляре бафа. По умолчанию true
---@param buffId BuffId Id ресурса буфа
---@param name string имя буфа
---@param sysName string внутреннее имя буфа (может быть использовано для специальной обработки), соответствующее поле в базе для буфа - "sysUIScriptName"
---@param texture UITextureId идентификатор текстуры для иконки буфа
---@param isStackable boolean стекается буф или нет
---@param stackLimit integer максимальное количество буфов данного типа
---@param isPositive boolean true, если баф позитивный
---@param isGradual boolean true,  если true, то стэки бафа спадают по одному
---@param canDetach boolean можно ли скликивать такой баф
---@param isNeedVisualizeDuration boolean нужно ли показывать duration
---@param priority ENUM_UIBuffPriority приоритет отображения бафа в интерфейсе
---@param groups table таблица групп бафа. Ключ - системное имя группы, значение - true. Безымянные группы не учитываются.
---@param gainSpells table[1] of SpellId список заклинаний, которые усиливает данный баф; таблица индексированная с 1;
---@param isNeedVisualize boolean нужно ли показывать этот баф в панели бафов. Если false для ресурса, то false для всех экземпляров. Обратное неверно.
---@param id ObjectId Id объекта буфа
---@param ownerId ObjectId|nil Id объекта, на котором висит буф, если такой объект есть
---@param stackCount integer может быть количеством одинаковых буфов, уровенем буфа или аналогичной информаций в
---@param durationMs integer полное время действия буфа
---@param remainingMs integer время до окончания действия буфа
---@param producer table таблица с полями
---@param casterId ObjectId|nil идентификатор кастера, повесившего баф, если его можно получить
---@param spellId SpellId|nil Id спелла, если баф повесили спеллом.
---@param abilityId AbilityId|nil Id абилки, если баф повесили абилкой.
---@param buffId BuffId|nil Id буффа, если баф повесили бафом.
---@param mapModifierId MapModifierId|nil Id модификатора карты, если баф повесили модификатором карты.
---@param debugName string отладочная информация (путь до файла)
---@param debugGroups table[1] of string: отладочная информация (путь до файла группы)
function object.GetBuffInfo(Id, includeResourceInfo, buffId, name, sysName, texture, isStackable, stackLimit, isPositive, isGradual, canDetach, isNeedVisualizeDuration, priority, groups, gainSpells, isNeedVisualize, id, ownerId, stackCount, durationMs, remainingMs, producer, casterId, spellId, abilityId, buffId, mapModifierId, debugName, debugGroups) end

---Возвращает список идентификаторов экземпляров бафов, висящих на данном объекте, и соответствующих критерию поиска.
---@param objectId ObjectId идентификатор объекта.
---@param key BuffId|string|ENUM_UIBuffPriority Критерий поиска бафов. Можно искать по ресурсу, по системному имени или по интерфейсному приоритету.
---@return ObjectId[]
function object.GetBuffInstances(objectId, key) end

---Возвращает список ресурсов бафов по рангам.
---@param buffId BuffId идентификатор ресурса бафа.
---@return buffId[]
function object.GetBuffRanks(buffId) end

---Возвращает список валидных экземпляров бафов висящих на данном объекте.
---@param objectId ObjectId ид объекта на котором ищем бафы. Объект должен существовать и иметь бафф-менеджер.
---@param ignoreInvisible boolean|nil игнорировать бафы с needVisualize == false. По умолчанию false.
---@return ObjectId[]
function object.GetBuffs(objectId, ignoreInvisible) end

---Возвращает таблицу hash_map<buffId, buffInfo>. Ключи - идентификаторы экземпляров бафа, значения - таблицы информации о бафах. Формат таблиц идентичен  object.GetBuffInfo
---@param data 2 варианта
---@param includeResourceInfo boolean|nil Включать ли информацию о ресурсе бафа при получении информации о экземпляре бафа. По умолчанию true
---@param ignoreInvisible boolean|nil игнорировать бафы с needVisualize == false. По умолчанию false.
---@return table (hash_map<buffId,  buffInfo>). Ключи
function object.GetBuffsInfo(data, includeResourceInfo, ignoreInvisible) end

---Возвращает информацию о буфах с заданными параметрами на данном объекте. DEPRECATED: API устарела и помечена к удалению.
---@param objectId ObjectId идентификатор юнита
---@param isPositive boolean true если бафф положительный, false если отрицательный (дебафф)
---@param isNeedVisualize boolean true если бафф отображаемый, false если скрытый
---@return ObjectId[]
function object.GetBuffsWithProperties(objectId, isPositive, isNeedVisualize) end

---Возвращает системное имя для указанного баффа.
---@param Id ObjectId|BuffId идентификатор или объекта или ресурса баффа
---@return string|nil
function object.GetBuffSysName(Id) end

---Возвращает информацию о бафе для отображения в тултипе. Является усеченной версией информации о бафе, но добавлено описание бафа. В качестве аргумента может принимать как id экземпляра бафа, так и ресурса (BuffId) бафа. Набор информации для ресурса бафа является подмножеством набора информации для экземпляра бафа.
---@param Id ObjectId|BuffId Идентификатор экземпляра (должен быть валидным) или ресурса буфа
---@param name string имя буфа
---@param texture TextureId идентификатор текстуры для иконки буфа
---@param ownerId ObjectId|nil Id объекта, на котором висит буф, если такой объект есть
---@param isNeedVisualizeDuration boolean нужно ли показывать duration
---@param stackCount integer может быть количеством одинаковых буфов, уровенем буфа или аналогичной информаций в
---@param durationMs integer полное время действия буфа
---@param remainingMs integer время до окончания действия буфа
function object.GetBuffTooltipInfo(Id, name, texture, ownerId, isNeedVisualizeDuration, stackCount, durationMs, remainingMs) end

---Возвращает список детекторов, отслеживающих объект.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return table (map) of ClientDetectorType(int) -> true: Хеш-мап активных детекторов
function object.GetDetectors(objectId) end

---Возвращает информацию о диминишинге(сопротивлении контролю) объекта.
---@param objectId ObjectId идентификатор объекта
---@return number[]
function object.GetDiminishingState(objectId) end

---Возвращает расстояние между аватаром и каким-либо объектом. Объект обязан быть валидным. В случае невозможности вычисления вернет nil.
---@param objectId ObjectId идентификатор объекта
---@param is2D boolean|nil считать расстояние в 2D, игнорировать разницу по высоте. По умолчанию false
---@param isInternal boolean|nil игнорировать фильтр детектируемости объекта. По умолчанию false. Для пользовательских дополнений всегда false.
---@return float|nil
function object.GetDistance(objectId, is2D, isInternal) end

---Возвращает информацию о здоровье интерактивного объекта. Некоторые поля могут быть недоступны, если недоступны их значения для такого типа объектов. Например, нельзя узнать точное значение здоровья или поглощения у противника.
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@param value integer|nil текущее значение здоровья объекта
---@param limit integer|nil предельное значение здоровья объекта
---@param valuePercents integer|nil процент текущего здоровья от предельного
---@param additionalValue integer|nil текущее значение дополнительного (поглощение) здоровья
---@param additionalPercents integer|nil процент текущего дополнительного (поглощение) здоровья от предельного
---@param isInvulnerable boolean true, если объект неуязвим
function object.GetHealthInfo(objectId, value, limit, valuePercents, additionalValue, additionalPercents, isInvulnerable) end

---Возвращает для объекта мгновенную информацию об его 2D проекции на экран, без занесения в список для проецирования в 2D координаты. Дополнительно нужно указать смещение (см.  enum ATTACHED_OBJECT_POS). Информацию можно получить только для тех объектов, для которых можно вычислить координату (детектируемые объекты, игроки из отряда главного игрока и т.п.). Точка (0, 0) - центр экрана. (-1, -1) - левый верхний угол. (1, 1) - правый нижний угол. Если какая-либо возвращаемая координата равна 1 или -1, то объект находится за зоной видимости. Если обе координаты в промежутке (-1, 1), то проецируемая точка видна на экране. Возвращаемое значения аналогичны object.GetProjectedInfo( objectId )
---@param objectId ObjectId идентификатор объекта
---@param heightOffset number место дополнительно смещения проецируемой точки около объекта
---@return аналогичны object.GetProjectedInfo
function object.GetInstantProjectedInfo(objectId, heightOffset) end

---Возвращает информацию о тех взаимодействиях с объектом, которые доступны главному игроку. Для уточнения информации во время взаимодействия, используйте  avatar.GetInteractorInfo(). Если объект квестгивер, то для получения списка предлагаемых заданий, используйте  object.GetInteractorQuests().
---@param objectId ObjectId идентификатор объекта (НПС или устройство)
---@return ObjectGetInteractorInfoResult
function object.GetInteractorInfo(objectId) end

---Получить списки квестов, имеющие отношение к interactive object, по которым можно вычислить quest mark для этого объекта.
---@param objectId ObjectId идентификатор объекта
---@return ObjectGetInteractorQuestsResult
function object.GetInteractorQuests(objectId) end

---Возвращает информацию о мане интерактивного объекта. Некоторые поля могут быть недоступны, если недоступны их значения для такого типа объектов. Например, нельзя узнать точное значение маны или поглощения у противника.
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@param value integer|nil текущее значение маны объекта
---@param limit integer|nil предельное значение маны объекта
---@param valuePercents integer|nil процент текущей маны от предельного
function object.GetManaInfo(objectId, value, limit, valuePercents) end

---Получить имя юнита
---@param objectId ObjectId (not nil) -- идентификатор интерактивного объекта
---@return WString
function object.GetName(objectId) end

---Возвращает координаты какого-либо объекта, если разрешено их получать. В данный момент разрешено получать координаты транспортов и детектируемых юнитов.
---@param objectId ObjectId идентификатор объекта
---@return GamePosition|nil
function object.GetPos(objectId) end

---Возвращает для объекта информацию об его 2D проекции на экран, если он есть в списке для проецирования в 2D координаты. Точка (0, 0) - центр экрана. (-1, -1) - левый верхний угол. (1, 1) - правый нижний угол. Если какая-либо возвращаемая координата равна 1 или -1, то объект находится за зоной видимости. Если обе координаты в промежутке (-1, 1), то проецируемая точка видна на экране.
---@param objectId ObjectId идентификатор объекта
---@return ObjectGetProjectedInfoResult
function object.GetProjectedInfo(objectId) end

---Возвращает список идентификаторов тайн мира, которые может завершить этот объект. В списке только тайны мира, открытые игроком. То есть объект может быть object.HasWorldSecret(objectId), но иметь пустой список тайн, если ни одна тайна ещё не была открыта (начата для исследования) игроком.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return ObjectId[]
function object.GetWorldSecrets(objectId) end

---Проверяет может ли интерактивный объект иметь бафы. Если аргумент не является id интерактивного объекта - вернет false (без ошибки). Примечание: Наличие или отсутствие бафф-менеджера у объекта определяется исключительно его типом. Ситуация когда объект валиден и, согласно типу, должен иметь бафф-менеджер, но не имеет такового является клиентской ошибкой.
---@param id any произвольное значение
---@return boolean
function object.HasBuffManager(id) end

---Возвращает true, если интерактивный объект выглядит как моб. Иначе false.
---@param id ObjectId идентификатор объекта
---@return boolean
function object.HasMobVisual(id) end

---Возвращает true, если интерактивный объект имеет квесты на выдачу или приём. Иначе false. В некоторых случаях может не соответствовать действительности. Для уточнения необходимо вызывать  avatar.HasInteractorQuest().
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function object.HasQuest(id) end

---Возвращает true, если интерактивный объект может завершить (и выдать награду) какую-либо тайну мира. Иначе false.
---@param id ObjectId Id объекта. Если передан Id игрока, вернёт false.
---@return boolean
function object.HasWorldSecret(id) end

---Подсвечивает интерактивный объект в нужный цвет ( тип Color ). Можно поменять несколько параметров подсветки:
---@param objectId ObjectId идентификатор интерактивного объекта
---@param type string тип изменяемого параметра ( "SELECTION", "AMBIENT", "OCCLUSION" )
---@param color Color|nil начальный цвет изменяемого параметра
---@param color2 Color|nil конечный цвет изменяемого параметра (поддерживается только для "AMBIENT")
---@param period number полный период изменения параметра color->color2->color (поддерживается только для "AMBIENT")
---@return нет
function object.Highlight(objectId, type, color, color2, period) end

---Возвращает true, если интерактивный объект является астральным юнитом.
---@param id ObjectId Id объекта
---@return boolean
function object.IsAstralUnit(id) end

---Возвращает информацию о статусе смерти интерактивного объекта (мертв да/нет). Для игроков означает, что игрок мертв и лежит на месте смерти (не в чистилище).
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@return boolean
function object.IsDead(objectId) end

---Возвращает true, если интерактивный объект детектируется детекторами, отслеживающих объект.
---@param objectId ObjectId идентификатор интерактивного объекта
---@return boolean
function object.IsDetected(objectId) end

---Возвращает true, если интерактивный объект является устройством.
---@param id ObjectId Id объекта
---@return boolean
function object.IsDevice(id) end

---Возвращает true, если объект (юнит, транспорт, астральный юнит) враждебен главному игроку
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@return boolean
function object.IsEnemy(objectId) end

---true, если интерактивный объект (игрок, устройство, моб, транспорт и т.п.) существует. Иначе false.
---@param objectId ObjectId (not nil) -- идентификатор интерактивного объекта
---@return boolean
function object.IsExist(objectId) end

---true, если объект существует в системе, но находится далеко, на другой карте. В этом случае для него можно получить информацию о здоровье, мане, классе, состоянии в группе главного игрока и т.п., но нельзя получить позицию, приаттачить к нему виджет или визуальный объект, добавить его в список проецируемых объектов, выделить, получить портрет и т.п.
---@param objectId ObjectId (not nil) -- идентификатор интерактивного объекта
---@return boolean
function object.IsFar(objectId) end

---Возвращает true, если объект (юнит, транспорт, астральный юнит) дружественен главному игроку
---@param objectId ObjectId (not nil) -- идентификатор объекта
---@return boolean
function object.IsFriend(objectId) end

---Получить состояние боя интерактивного объекта (в данный момент юниты и корабли).
---@param objectId ObjectId идентификатор объекта
---@return boolean
function object.IsInCombat(objectId) end

---Проверка, находится ли указанный интерактивный объект в радиусе "meleeRange".
---@param objectId ObjectId идентификатор интерактивного объекта
---@return boolean
function object.IsInUsageRange(objectId) end

---Возвращает true, если интерактивный объект является транспортом.
---@param id ObjectId Id объекта
---@return boolean
function object.IsTransport(id) end

---Возвращает true, если интерактивный объект является юнитом (игрок, моб, NPC).
---@param id ObjectId Id объекта
---@return boolean
function object.IsUnit(id) end

---Возвращает true, если аргумент является id валидного (на момент вызова функции) экземпляра бафа. Гарантируется что если бафф валиден, то он останется валидным до конца обработки текущего события в lua. '''Внимание!''' Проверяются экземпляры бафов, но не ресурсы. Если передать BuffId (userdata ResourceId), то функция вернет false
---@param id any произвольное значение
---@return boolean
function object.IsValidBuff(id) end

---Возвращает true, если интерактивный объект является торговцем. Иначе false. В некоторых случаях может не соответствовать действительности (при динамически изменяющейся способности торговать). Для уточнения необходимо вызывать avatar.IsInteractorVendor().
---@param id ObjectId Id интерактивного объекта
---@return boolean
function object.IsVendor(id) end

---Снимает позитивный бафф с объекта, если этот бафф можно снять (прописано в его свойствах). Также бафф можно снять только с персонажа главного игрока, его питомца и его корабля.
---@param buffId ObjectId иденетификатор баффа
---@return нет
function object.RemoveBuff(buffId) end

---Удаляет объект из списка для проецирования в 2D координаты.
---@param objectId ObjectId идентификатор объекта
---@return нет
function object.RemoveFromProjected(objectId) end

---Задает для списка проецируемых объектов 3D-control.
---@param wtControl3D Control3DSafe контрол-3D, который отвечает за показ сцены
---@return нет
function object.SetControl3DForProjected(wtControl3D) end

---Задает область вокруг объекта, где убирается трава и т.п. Область можно включать/выключать.
---@param objectId ObjectId (not nil) -- идентификатор объекта, вокруг которого отключать траву и т.п., либо nil, если такая область не нужна
---@param scale number коэффициент, на который умножается размер объекта
---@param extraRadius number дополнительное увеличение области
---@return нет
function object.SetCutTerrainArea(objectId, scale, extraRadius) end

---Привязывает визуальный скрипт к интерактивному объекту по индексу. Новый визуальный скрипт удаляет имеющийся визуальный скрипт по тому же каналу (с таким же индексом). Замечание. Для удобства вместо числовых индексов рекомендуется определять мнемонические константы (задаются самими дизайнерами). Также см. VisActionId.
---@param objectId ObjectId идентификатор объекта
---@param channelIndex number индекс канала визуального скрипта
---@param visActionId VisObjectId идентификатор визуального объекта (эффекта)
---@return нет
function object.StartVisualAction(objectId, channelIndex, visActionId) end

---Останавливает визуальный скрипт на интерактивном объекте в определенном канале. Также см. VisActionId.
---@param objectId ObjectId идентификатор объекта
---@param channelIndex number индекс канала визуального скрипта
---@return нет
function object.StopVisualAction(objectId, channelIndex) end
