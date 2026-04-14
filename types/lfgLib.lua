---@meta

---@class lfgLibLib
lfgLib = {}

---@class LfgLibGetDepartRequirementsResult
---@field requirements RequirementsTable список условий

---@class LfgLibGetDestinationRequirementsResult
---@field requirements RequirementsTable список условий

---@class LfgLibGetDestinationRewardResult
---@field money integer сумма в награду
---@field experience integer опыт в награду
---@field loyalty integer получаемая верность гильдии
---@field authority integer получаемое влияние в гильдии
---@field mandatoryItems ObjectId[] список идентификаторов наградных предметов. которые известны
---@field mandatoryItemsCount integer количество наградных предметов (может быть больше, чем mandatoryItems, если некоторые награды не известны)
---@field alternativeItems ObjectId[] список идентификаторов альтернативных наградных предметов
---@field reputations table[] индексированный с 0 список значений репутационных наград для разных фракций. Поля каждого пункта:
---@field faction string имя фракции
---@field value integer на сколько повысится репутация
---@field currencies table[] индексированный с 0 список наград альтернативной валютой. Поля каждого пункта:
---@field currencyId СurrencyId имя альтернативной валюты
---@field value integer величина награды
---@field unlocks UnlockId[] индексированный с 1 список идентификаторов возможностей (анлоков), даваемых в награду

---@class LfgLibGetDestinationTimersResult
---@field groupQueueTime integer базовое время(в миллисекундах) отведенное на сбор группы.
---@field timeForDepart integer фактическое время(в миллисекундах) до предложения отправки группы(даже в неполном составе)
---@field groupStabilizationTime integer базовое время(в миллисекундах) нахождения собранной группы в LFG до её выкидывания

---@class LfgLibGetDestinationVisitsResult
---@field todayVisits integer|nil если есть, то сколько посещений совершил главный игрок сегодня; если нет, то информация отсутствует
---@field weeklyVisits integer|nil если есть, то сколько посещений совершил главный игрок за текущую неделю; если нет, то информация отсутствует
---@field maxVisitsPerDay integer максимальное кол-во посещений локации в день; 0 - без ограничений
---@field maxVisitsPerWeek integer максимальное кол-во посещений локации в неделю; 0 - без ограничений

---@class LfgLibIsRoleAvailableResult
---@field success boolean true если роль доступна, false если роль недоступна
---@field requiredSpell nil|table SpellId[] комбинации ресурсов заклинаний, которые необходимо изучить для того что бы выбранная роль стала доступна

---Немедленно отправляет участников группы в выбранный пункт назначения. При этом в некоторые пункты(например, астральные сектора) отправка может быть инициирована только лидером группы и после утверждения отправки всеми участниками группы на совместном голосовании. В остальные пункты игрок может отправится самостоятельно, причем пункт отправки может не совпадать с целью подбора группы.
---@param destinationId LfgDestinationId идентификатор цели
---@return нет
function lfgLib.Depart(destinationId) end

---Включает/выключает репликацию активностей для LFG.
---@param enable boolean true - вклчюить, false - выключить
---@return нет
function lfgLib.EnableReplicateDestinations(enable) end

---Возвращает текущую цель подбора группы.
---@return LfgDestinationId|nil
function lfgLib.GetCurrentDestination() end

---Требования на отправку в локацию.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return LfgLibGetDepartRequirementsResult
function lfgLib.GetDepartRequirements(destinationId) end

---Возвращает список категорий доступных целей для поиска группы.
---@return LFGDestinationCategoryId|nil[]
function lfgLib.GetDestinationCategories() end

---Требования на вход в локацию.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return LfgLibGetDestinationRequirementsResult
function lfgLib.GetDestinationRequirements(destinationId) end

---Получить описание награды за прохождение локации.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return LfgLibGetDestinationRewardResult
function lfgLib.GetDestinationReward(destinationId) end

---Возвращает список доступных целей для поиска группы.
---@return LfgDestinationId|nil[]
function lfgLib.GetDestinations() end

---Возвращает список доступных целей для поиска группы по категории.
---@return LfgDestinationId|nil[]
function lfgLib.GetDestinationsInCategory() end

---Информация о таймерах LFG активности.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return LfgLibGetDestinationTimersResult
function lfgLib.GetDestinationTimers(destinationId) end

---Информация о посещениях локации, относящийся к LFG.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return LfgLibGetDestinationVisitsResult
function lfgLib.GetDestinationVisits(destinationId) end

---Возвращает список доступных ролей для поиска группы.
---@return Number|nil[]
function lfgLib.GetRoles() end

---Проверка доступно ли LFG игроку.
---@return boolean
function lfgLib.IsAvailable() end

---Проверка может ли игрок сейчас отправиться в выбранную локацию (выполнены ли все предикаты на отправку в локацию).
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return boolean
function lfgLib.IsDepartAvailable(destinationId) end

---Проверка может ли игрок сейчас отправиться в выбранную локацию.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return boolean
function lfgLib.IsDestinationAvailable(destinationId) end

---Проверяет можно ли на локацию проходить свободно, без затрат ресурсов или альтвалюты.
---@param destinationId LfgDestinationId идентификатор целевой локации
---@return boolean
function lfgLib.IsFreePass(destinationId) end

---Возвращает результат проверки доступности выбранной роли в поиске группы.
---@param role Number роль в группе
---@return LfgLibIsRoleAvailableResult
function lfgLib.IsRoleAvailable(role) end

---Начать поиск группы в зависимости от выбранной цели и роли в группе.
---@param destinationId LfgDestinationId идентификатор цели
---@param roles Number[] выбранные роли для участия в группе, значения должны быть выбраны из диапазона значений ENUM_LFGRole
---@return нет
function lfgLib.Join(destinationId, roles) end

---Покинуть подбор группы. Если подбор группы покидает ее лидер, всей группе будет предложено покинуть подбор вместе с ним(оставаясь в составе одной группы). При этом те кто откажется покидать подбор, останутся в нем в составе новой группы.
---@return нет
function lfgLib.Leave() end

---Проголосовать отрицательно по текущему вопросу. При инициации голосования вызывается событие EVENT_LFG_VOTE.
---@return нет
function lfgLib.VoteNo() end

---Проголосовать положительно по текущему вопросу. При инициации голосования вызывается событие EVENT_LFG_VOTE.
---@param roles table|nil список выбранных ролей для вступления в группу; используется в голосованиях типа ENUM_LFGVoteType_Join, ENUM_LFGVoteType_Invite
---@return нет
function lfgLib.VoteYes(roles) end
