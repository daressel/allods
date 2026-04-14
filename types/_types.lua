---@meta

---Идентификатор умения. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор пассивного умения - идентификатор его ресурса в базе.)
---@class AbilityId

---Идентификатор группы заклинаний. Пользовательский тип данных. Один из типов группы  ResourceId. См. также  LuaApiTypes, itemLib.GetActionGroupsInfo( itemId ),  avatar.GetActionGroupStatBonus( id ).
---@class ActionGroupId

---Идентификатор визуального объекта-обвязки. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. Идентификатор визуального объекта-обвязки представляет ресурс объекта в базе. Служит для реализации автоматической подмены ресурсов (для коллекционных изданий и т.п.).
---@class AliasVisObjectId

---Идентификатор астрального сектора. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. В настоящее время идентификатор астрального сектора - идентификатор его ресурса в базе.
---@class AstralSectorId

---Идентификатор команды, принимающей участие в баттлграунде. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. Поля, доступные в  BattlegroundMarkId:GetInfo()
---@class BattlegroundMarkId
---@field image string идентификатор иконки
---@field sysName string|nil системное название команды

---Идентификатор платёжного бонуса. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время соответствует идентификатору его ресурса в базе.)
---@class BillingBonusId

---Идентификатор бафа. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор бафа - идентификатор его ресурса в базе.)
---@class BuffId

---Идентификатор класса аватара. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Из объекта этого типа можно получить информацию вызовом функции GetInfo( self ):
---@class CharacterClassId
---@field self CharacterClassId идентификатор  класса аватара
---@field name string локализуемое имя класса (для показа игроку)
---@field className string нелокализуемое системное имя класса (для использования в скриптах)
---@field manaType enum MANA_TYPE_... тип маны, используемый классом
---@field sysManaType string тип маны, используемый классом
---@field sharedAbilities table список способностей (AbilityId), расшариваемых с перерождениями
---@field sharedSpells table список заклинаний (SpellId), расшариваемых с перерождениями
---@field className string -- имя класса
---@field manaType number тип маны героя mana/energy
---@field name WString -- имя класса(локализованное)
---@field greatName WString -- имя Великого класса(локализованное)
---@field raceClassName string локализованное имя расы-класса

---Идентификатор ресурса формы класса аватара игрока. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  CharacterFormId:GetInfo()
---@class CharacterFormId
---@field name string название формы
---@field sysName string служебное название
---@field image TextureId иконка формы

---Идентификатор эффекта наложенного на игрока в бою. Используется для отображения логе боя усиливающих и ослабляющих эффектов, которые были на игроке в момент нанесения урона. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  CombatTagId:GetInfo()
---@class CombatTagId
---@field name string|nil название эффекта
---@field shortName string|nil укороченное название эффекта
---@field description string|nil описание эффекта
---@field isHelpful boolean если true, то эффект усиливающий, иначе остабляющий
---@field image TextureId|nil иконка эффекта

---Идентификатор компонента для крафтинга (в данный момент только алхимия). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор компонента для крафтинга - идентификатор его ресурса в базе.)
---@class ComponentPropertyId

---Идентификатор категории альтернативной игровой валюты. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор категории альтернативной игровой валюты - идентификатор его ресурса в базе.) Поля, доступные в  CurrencyCategoryId:GetInfo()
---@class CurrencyCategoryId
---@field name string название категории
---@field description string описание категории
---@field sysName string системное имя категории

---Идентификатор альтернативной игровой валюты. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор альтернативной игровой валюты - идентификатор его ресурса в базе.) Поля, доступные в  CurrencyId:GetInfo()
---@class CurrencyId
---@field category CurrencyCategoryId категория
---@field description string описание
---@field sourceDescription GlossaryId|nil идентификатор ресурса универсального описателя для источника валюты (при наличии)
---@field hideMaxValue boolean скрывать ли максимальное значение
---@field image TextureId иконка
---@field isCoupon boolean является ли валюта купоном
---@field limitCurrency CurrencyId Другая валюта, содержащее потенциальное количество текущей валюты, которое мы еще можем получить.
---@field maxValue integer максимальное количество
---@field name string название
---@field storage number тип хранилища
---@field sysStorage string тип хранилища строкой
---@field sysName string системное имя
---@field visualizeMode number тип визуализации
---@field sysVisualizeMode string тип визуализации строкой

---Идентификатор объекта декала, привязываемого к интерактивному объекту. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор объекта декала - идентификатор его ресурса в базе.)
---@class DecalObjectId

---Ресурсный файл. Задает фильтр для WidgetEditBase. Содержит в себе список интервалов символов (например от "А" до "я"), набор отдельных символов (например "Ёё") и флажок, говорящий о возможности вставлять объекты.
---@class EditBaseTextFilter
---@field ranges Range [] массив структур, задающих интервалы допустимых символов
---@field minChar string минимальный символ в интервале
---@field maxChar string максимальный символ в интервале
---@field additionalChars string дополнительный набор допустимых символов
---@field firstChars string допустимые символы которые могут стоять только в начале текста (например унарный минус или заглавная буква)
---@field uniqueChars string набор допустимых символов, которые могут встречаться в тексте в единственном экземпляре (например , в десятичном дробном числе)
---@field isAllowObject boolean флажок, говорящий о возможности вставлять объекты

---Идентификатор фракции. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. Поля, доступные в  FactionId:GetInfo()
---@class FactionId
---@field name string локализованное название фракции
---@field sysName string|nil системное название фракции
---@field hide boolean отображать ли фракцию в интерфейсе
---@field hideNotification boolean скрывать нотификацию связанную с этой фракцией

---Позиция в игре (координаты на карте). Пользовательский тип данных Lua, см.  LuaApiTypes.
---@class GamePosition
---@field posX number координата по X
---@field posY number координата по Y
---@field posZ number координата по Z

---Геодата необходима для проецирования координат точки в реальном мира в координаты текстуры интерфейсной карты. Если геодата получена, то таблица с полями:
---@class Geodata

---Идентификатор универсального описателя. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Используется для создания унифицированных описаний для произвольных сущностей. Поля, доступные в  GlossaryId:GetInfo()
---@class GlossaryId
---@field name string название
---@field image TextureId иконка

---Идентификатор цели. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор пассивного умения - идентификатор его ресурса в базе.) Поля, доступные в  GoalId:GetInfo()
---@class GoalId
---@field title string заголовок цели
---@field description string описание цели
---@field finishPredicates table со списком предикатов
---@field locations table список ключевых локаций, каждый элемент представляет собой таблицу с полями
---@field locator QuestLocation таблица с описаниями точек цели задания
---@field rewards GoalReward[] список наград
---@field shortDescription string краткое описание, для экрана загрузки
---@field showPredicates table, список предикатов для отображения
---@field stages table, список этапов типа GoalId
---@field targetLevel integer целевой уровень для выполнения цели
---@field customFinishMessage string кастомное сообщение выполения(для данного гола). Если пусто, выводить стандартное сообщение.

---Описание производных характеристик игрока. Значения этих производных характеристик подставляются в уникальные текстовые описания основных характеристик в каждом конкретном случае. Основные характеристики: ENUM_InnateStats. Производные характеристики высчитываются из основных характеристик и описываются таблицей с полями:
---@class InnateStatSecondary
---@field N1 number рассчитанная величина производной характеристики
---@field N2 number рассчитанная величина производной характеристики
---@field N3 number рассчитанная величина производной характеристики
---@field N4 number рассчитанная величина производной характеристики
---@field isLow boolean характеристика мала для текущего уровня игрока
---@field isReduced boolean часть строки, описывающей стат, должна показываться о уменьшенном действии стата

---Идентификатор ресурса категории сражения (инстанс-ивента). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Об идентификаторах этого типа с помощью функции GetInfo() может быть получена информация:
---@class InstancedEventCategoryId
---@field self InstancedEventCategoryId идентификатор ресурса
---@field name string название категории
---@field sysName string служебное название категории
---@field allowDummyPass boolean доступность Бескорыстной Помощи для эвентов из данной категории, true - доступна

---Идентификатор ресурса сражения (инстанс-ивента). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Об идентификаторах этого типа с помощью функции GetInfo() может быть получена информация:
---@class InstancedEventResourceId
---@field self InstancedEventResourceId идентификатор ресурса
---@field startTime TimeTableId список времен/дат, соответствующих началу сражений

---Идентификатор категории предмета. Пользовательский тип данных (см. также  LuaApiTypes). Один из типов группы  ResourceId. (В настоящее время идентификатор категории предмета - идентификатор его ресурса в базе.)
---@class ItemCategoryId

---Идентификатор ресурса предмета. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Идентификатор ресурса предмета в базе. Поля, доступные в  ItemId:GetInfo()
---@class ItemId
---@field description string описание
---@field image TextureId иконка
---@field name string имя

---Cтатус торговли
---@class ItemsExchangeState_...

---Идентификатор категории цели для LFG(сбора группы). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  LfgDestinationCategoryId:GetInfo()
---@class LfgDestinationCategoryId
---@field name string|nil название категории
---@field sysName string системное название

---Идентификатор активности для LFG(сбора группы). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  LfgDestinationId:GetInfo()
---@class LfgDestinationId
---@field name string|nil название активности
---@field description string|nil описание активности
---@field requiredItem ItemId|nil ресурс необходимый для отправки
---@field requiredCurrency CurrencyId|nil альтвалюта необходимая для отправки
---@field leaderDepartOnly boolean если true, то инициировать отправку в активность может только лидер группы
---@field category LfgDestinationCategoryId|nil категория цели
---@field minAvatarLvl integer минимальный уровень персонажа
---@field maxMembers integer максимальное количество участников
---@field maxEventDuration integer максимальная длительность активности
---@field soloMode boolean если true, локация доступна только для одного игрока
---@field instancedEvent InstancedEventResourceId|nil эвент связанный с данной локацией
---@field difficulty string|nil сложность активности текстом
---@field difficultyMode Number сложность активности индексом
---@field sysDifficultyMode String сложность активности строкой

---Идентификатор категории гардероба. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор категории гардероба - идентификатор его ресурса в базе.) Поля, доступные в  LifestyleCategoryId:GetInfo()
---@class LifestyleCategoryId
---@field name string название категории
---@field description string описание категории

---Идентификатор коллекции гардероба. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор коллекции гардероба - идентификатор его ресурса в базе.) Поля, доступные в  LifestyleCollectionId:GetInfo()
---@class LifestyleCollectionId
---@field name string название коллекции
---@field description string описание коллекции

---Идентификатор ресурса, определяющего вариант выпадения лута на астральных островах. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Об идентификаторах этого типа с помощью функции GetInfo() может быть получена информация:
---@class LootGroupId
---@field self LootGroupId идентификатор ресурса
---@field name string название варианта
---@field image TextureId или nil (только в UIState) идентификатор текстуры для иконки, может отсутствовать

---Полная информация о времени какого-либо события. Таблица с полями:
---@class LuaFullDateTime
---@field y integer год
---@field m integer месяц (начиная с 1)
---@field d integer день (начиная с 1)
---@field h integer час
---@field min integer минута
---@field s integer секунда
---@field ms integer миллисекунда
---@field wday number день недели, начиная с 1
---@field month number месяц начала события с 0
---@field sysMonth string месяц начала события
---@field overallMs integer Unix time (общее время в миллисекундах прошедшее с 1-го января 1970 года)

---Таблица с информацией по расе-классу. Используется как составная часть для других описаний.
---@class table raceClass
---@field sysName string служебное название (расы-класса)
---@field name string локализованное название (расы-класса)
---@field description string локализованное описание (расы-класса)
---@field sysClassName string служебное название класса
---@field className string локализованное название класса
---@field sysRaceName string служебное название расы
---@field raceName string локализованное название расы

---Таблица с описанием пола игрока На данный момент имеются: enum SEX_...:
---@class LuaSexInfoPart

---Идентификатор модификатора карты. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId.
---@class MapModifierId

---Идентификатор ресурса достижения. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Идентификатор ресурса достижения в базе. Поля, доступные в  MedalId:GetInfo()
---@class MedalId
---@field name string название достижения
---@field description string описание достижения
---@field image TextureId картинка достижения
---@field canLink boolean true, если можно ли линковать в чат(хвастаться)

---Идентификатор ресурса ранга достижения. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Идентификатор ресурса достижения в базе. Поля, доступные в  MedalId:GetInfo()
---@class MedalRankId
---@field completeProgress integer количество очков прогресса необходимых для завершения ранга
---@field name string название ранга
---@field description string описание ранга
---@field image TextureId картинка ранга
---@field score integer количество очков за выполнение ранга
---@field reward table награда, таблица с полями
---@field description string описание награды

---Идентификатор группы талантов маунта. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  MountTalentGroupId:GetInfo()
---@class MountTalentId

---Идентификатор таланта маунта. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  MountTalentId:GetInfo()
---@class MountTalentId
---@field price integer стоимость при выборе
---@field unlock UnlockId идентификатор ресурса анлока для получаения данного таланта
---@field unlockItems ItemId[] предвметы разблокирующий данный талант

---Информация о мутации, распространяемой игровым объектом, например стеллой в Хантинг Граундах
---@class MutationInfo
---@field difficulty number сложность игровой зоны(мутации)
---@field population number [0..100] заполненность зоны мутации, задается в целых процентах, определяется как соотношение текущего количества игроков в зоне к предельному
---@field buffId BuffId идентификатор ресурса бафа, накладываемого на персонажей в зоне мутации

---Идентификатор объекта. Пользовательский тип данных Lua, см.  LuaApiTypes. В настоящее время определен как number (integer) или nil.
---@class ObjectId

---Потртеты устанавливаются функцией ''' SetPortraitBackgroundTexture''' и имеют зарезервированный slotIndex. Всего доступно 4 слота ( 0-3 ) для больших портретов и 16 ( 0-15 ) - для маленьких. В Client\GlobalScript.lua объявлены соотетствующие глобальные переменные: Для больших портретов:
---@class Портреты игроков/мобов/нпс

---Идентификатор секции доски объявлений. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId.
---@class PostTypeId

---Идентификатор задания (см.["QuestsIdentification"]). Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор квеста - идентификатор его ресурса в базе.) Поля, доступные в  ItemId:GetInfo()
---@class QuestId
---@field finishText string финальное описание
---@field startText string стартовое описание
---@field goal string описание рекомендации
---@field image TextureId иконка
---@field name string имя
---@field isAutomatic boolean true если это дейлик, иначе false
---@field questCategory Number категория квеста

---QuestLocation описывает одну точку на карте. Таблица с полями. Так же смотрите GamePosition,  cartographer.GetZonesMapInfo( zonesMapId ).
---@class QuestLocation
---@field zonesMapId ObjectId идентификатор интерфейсной карты зоны точки
---@field position GamePosition координаты точки
---@field isIndoor boolean true, если точка цели/сдачи квеста находится в помещении
---@field radius number|nil радиус зоны точки. nil, если радиус не указан или нулевой

---Результат шаринга квеста
---@class QuestShareResult_...

---Идентификатор рецепта. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор рецепта - идентификатор его ресурса в базе.) Информация из объекта этого типа может быть получена вызовом стандартного для семейства ResourceId метода GetInfo().
---@class RecipeId
---@field self RecipeId объект, из которого получается информация
---@field name string имя (локализованое)
---@field description string описание (локализованое)
---@field image UITexture иконка

---Скриптовая система располагает рядом функций получения из приложения ресурсов следующих типов: Доступны во всех типах аддонов:
---@class Related Resource

---Объект, представляющий собой группу звуковых ресурсов. Пользовательский тип данных, см. также  LuaApiTypes.
---@class RelatedSoundsLua

---Объект, представляющий собой группу текстовых ресурсов. Пользовательский тип данных, см. также  LuaApiTypes.
---@class RelatedTextsLua

---Объект, представляющий собой группу текстурных ресурсов. Пользовательский тип данных, см. также  LuaApiTypes.
---@class RelatedTexturesLua

---Объект, представляющий собой группу шаблонов виджетов. Пользовательский тип данных, см. также  LuaApiTypes.
---@class RelatedWidgetsLua

---Таблица, представляющая описание требований (например к использованию заклинания). Содержит список таблиц:
---@class RequirementsTable
---@field RequirementsTable tables[] индексированный с 0 список таблиц - описаний требований.
---@field type number|nil Если требование составное, то значение перечисления enum AFCT_..., у простых требований это поле отсутствует.
---@field type number Если требование составное, то значение перечисления enum AFCT_.... У таких требований есть список дочерних требований.
---@field isInNotPredicate boolean находимся ли мы сейчас в требовании Not - выполнение текущего требования инвертировано
---@field success boolean выполняется ли это требование
---@field childs requirements[] список дочерних требований, если есть
---@field type nil у простых требований это поле отсутствует.
---@field success boolean выполняется ли это требование
---@field cause integer код ошибки.
---@field sysCause string строковый код ошибки.
---@field isInNotPredicate boolean находимся ли мы сейчас в требовании Not - выполнение текущего требования инвертировано
---@field text string|nil требования определенное в виде простой строки
---@field number number|nil
---@field number2 number|nil
---@field money number|nil количество денег в меди
---@field name string|nil
---@field rank number|nil ранг заклинания или умения, если он больше 1
---@field dress number|nil
---@field itemClass string|nil
---@field sysRace string|nil
---@field sysPsionicContactType string|nil
---@field reputationLevel number|nil

---Группа типов, являющихся идентификаторами ресурсов из базы. Один из пользовательских типов данных, см. также  LuaApiTypes. Реализация каждого из типов данной группы - userdata с метатаблицей, соответствующей определенной категории ресурсов базы или nil (в случае отсутствия ресурса). Название типа и метатаблицы совпадают. Методы класса:
---@class ResourceId

---Идентификатор ресурса переодического события. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Поля, доступные в  ItemId:GetInfo()
---@class RuleId
---@field name string название
---@field description string описание
---@field sysName string служебное название

---Идентификатор скина корпуса корабля. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор скина корпуса корабля - идентификатор его ресурса в базе.)
---@class ShipSkinId

---Идентификатор умения. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор умения - идентификатор его ресурса в базе.) Поля, доступные в  SkillId:GetInfo()
---@class SkillId
---@field name string локализованное название скилла
---@field description string локализованное описание скилла
---@field sysName string|nil системное название скилла
---@field image TextureId идентификатор текстуры для иконки умения
---@field type number тип скилла (какие компоненты входят в рецепт, какого типа игра и т.п.)
---@field useLevels boolean true, если скилл прокачивается ступенчатыми уровнями, иначе плавно от 1 до максимального уровня

---Идентификатор ресурса предмета для дерева талантов души. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Идентификатор ресурса достижения в базе. Поля, доступные в  SocketId:GetInfo()
---@class SocketId
---@field gemSlot Number идентификатор слота в дереве талантов души
---@field quality - качество предмета

---Идентификатор звука. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор звука - идентификатор его ресурса в базе.)
---@class Sound2DId

---Идентификатор специальной характеристики. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId.
---@class SpecialStatId

---Идентификатор заклинания. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор заклинания - идентификатор его ресурса в базе.)
---@class SpellId

---Для базовой таблицы талантов используется альтернативная валюта с именем "TalentPoint". Для полей - "Ruby". Подробнее о валютах можно прочитать здесь CategoryCurrency.
---@class Talent Currency

---Идентификатор мастера телепорта. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор мастера телепорта - идентификатор его ресурса в базе.)
---@class TeleportMasterId

---Объект такого типа содержит ссылку на локализуемый (имеющий возможность быть переведенным на разные языки) текстовый файл. Файл должен быть закодирован в формате UTF-8.
---@class TextFileRef. Ссылка на текстовый файл.

---Идентификатор текстуры. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор текстуры - идентификатор ее ресурса в базе.) Смотри также  UITextureId.
---@class TextureId

---Формат передачи времени. В зависимости от типа (type) заполняются определённые поля.
---@class TimeEntry
---@field hourly table|nil если интервал ежечасный, то таблица с полями:
---@field type string тип
---@field minute integer минута начала события, начиная с 0
---@field daily table|nil если интервал ежедневный, то таблица с полями:
---@field type string тип
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field weekly table|nil если интервал еженедельный, то таблица с полями:
---@field type string тип
---@field day number день недели начала события, начиная с 1 ( 1 - понедельник, 7 - воскресенье )
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field monthly table|nil если интервал ежемесячный, то таблица с полями:
---@field type string тип
---@field day integer день месяца начала события, начиная с 1
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field yearly table|nil если интервал ежегодный, то таблица с полями:
---@field type string тип
---@field sysMonth string месяц начала события
---@field month number месяц начала события
---@field day integer день месяца начала события, начиная с 1
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field now table|nil если интервал "сейчас", то таблица с полями:
---@field type string тип
---@field never table|nil если интервал "никогда", то таблица с полями:
---@field type string тип

---Идентификатор таблицы с предустановленным списком времен/дат (как правило обозначают периодически повторяющиеся события). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Информация о списке времен может быть получена вызовом стандартного для семейства ResourceId метода  GetInfo().
---@class TimeTableId
---@field TimeTableId GetInfo
---@field entries table или nil список времен/дат, каждый элемент - таблица, содержит поле sysType, значение которого определяют смысл элемента (периодичность) и набор его полей:
---@field minute integer минута начала события, начиная с 0
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field day integer день недели начала события, 0-6 (понедельник-воскресенье)
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field day integer день месяца начала события, начиная с 1
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field month number месяц начала события
---@field day integer день месяца начала события, начиная с 1
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0
---@field year integer год начала события
---@field month number месяц начала события
---@field day integer день месяца начала события, начиная с 1
---@field hour integer час начала события, начиная с 0
---@field minute integer минута начала события, начиная с 0

---Идентификатор ресурса категории обучения. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Идентификатор ресурса категории обучения в базе. Поля, доступные в  TutorialCategoryId:GetInfo()
---@class TutorialCategoryId

---Идентификатор ресурса обучения. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. Идентификатор ресурса обучения в базе. Поля, доступные в  TutorialId:GetInfo()
---@class TutorialId

---Вопрос для выбора класса персонажа (например в процессе смены класса). Списка классов, из которых нужно выбирать, в этих данных не имеется. Предполагается, что он будет получен другими методами Lua API, например  remortCreation.GetAvatarTemplatesInfo(). Формат поля questionData у questionLib.GetInfo( questionId ) при значении поля type равном "!ClassSelectQuestion":
---@class ClassSelectQuestion
---@field text string локализованная строка, текст, информирующий игрока о смысле требуемого от него выбора

---Формат поля questionData у questionLib.GetInfo( questionId ) при значении поля type равном "!QuizQuestion":
---@class QuizQuestion
---@field text string локализованная строка, текст вопроса на который предполагается ответ игрока "да/нет"
---@field image TextureId или nil идентификатор текстуры для иконки, может отсутствовать
---@field type String тип вопроса

---Обёртка игрового объекта для подстановки в  ValuedText. Специальный вариант userdata. Имеет несколько методов. Для получения экземпляра  ValuedObject нужно пользоваться специальной функцией Get...ValuedObject( object ). ValuedObject возвращает текст и изображение, которыми обёртываемый объект может быть представлент в виджете. Так как типов объектов много, то  ValuedObject содержит информацию о типе объекта и идентификатор объекта. Типы идентификаторов могут быть разными для различных типов объектов.
---@class ValuedObject
---@field obj GetType

---ValuedText – это объект ( форматированная строка с подстановочным значением ), задача которого получение, хранение и использование ФОРМАТИРОВАННОГО текста. Форматированный текст представляет собой
---@class ValuedText - форматированная строка с подстановочными значениями

---Описатель виджета из ресурсной системы. Специальный вариант userdata. Описатель может использоваться для динамического создания виджетов.
---@class WidgetDesc

---Локализуемая строка. Специальный вариант userdata, имя метатаблицы "WString", неиндексируемая userdata. Все методы имеют lua error handling (большая часть API имеет game error handling) Перегруженные операции
---@class WString

---Идентификатор интерфейсной текстуры. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор текстуры - идентификатор ее ресурса в базе.) В отличие от  TextureId хранит UISingleTexture и, соответственно, не теряет значение permanentCache Во всех API (если явно не указано обратное) взаимозаменяем с  TextureId, может быть тривиально к нему приведен.
---@class UITextureId

---Уникальный постоянный(кросс-серверный) идентификатор аватара. Пользовательский тип данных, см. также  LuaApiTypes.
---@class UniqueId

---Идентификатор категории  анлоков (закрытая ссылка). Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор категории анлоков - идентификатор его ресурса в базе.) Поля, доступные в  UnlockCategoryId:GetInfo()
---@class UnlockCategoryId
---@field name string Название категории
---@field sysName string Системное название категории. Возможно использовать для реализации уникального поведения категории.

---Идентификатор визуального скрипта, привязываемого к интерактивному объекту. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор визуального скрипта - идентификатор его ресурса в базе.)
---@class VisActionId

---Идентификатор визуального объекта, привязываемого к интерактивному объекту. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор визуального объекта - идентификатор его ресурса в базе.)
---@class VisObjectId

---Идентификатор корпуса корабля. Пользовательский тип данных (см. также LuaApiTypes). Один из типов группы ResourceId. (В настоящее время идентификатор корпуса корабля - идентификатор его ресурса в базе.) Поля, доступные в  VisualShipId:GetInfo()
---@class VisualShipId
---@field description string описание
---@field name string название
---@field image TextureId иконка
---@field cannonVisualType number тип отображения пушек на интерфейсе
---@field sysCannonVisualType string тип отображения пушек на интерфейсе строкой

---Идентификатор голосования. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId. (В настоящее время идентификатор голосования - идентификатор его ресурса в базе.)
---@class VoteId
---@field marker CurrencyId альтернативная ценность
---@field description string описание вопроса,
---@field answersCount integer количество вариантов на вопрос, 0 - если неограниченно
---@field description string вариант ответа

---Идентификатор Волшебной лампы. Пользовательский тип данных, см. также  LuaApiTypes. Один из типов группы  ResourceId.
---@class WishmasterResourceId
