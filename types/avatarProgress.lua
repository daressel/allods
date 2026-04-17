---@meta

--- CategoryAvatarProgress
--- Функции Lua Api, предоставляющие информацию о развитии главного игрока (опыт, репутация, слава).

--- Текстовый и числовой енум.
--- за убийство моба
ENUM_DevelopmentSource_Kill = "ENUM_DevelopmentSource_Kill"
--- за выполнение задания
ENUM_DevelopmentSource_Quest = "ENUM_DevelopmentSource_Quest"
--- чит
ENUM_DevelopmentSource_Cheat = "ENUM_DevelopmentSource_Cheat"
--- за накопленный отдых
ENUM_DevelopmentSource_Fatigue = "ENUM_DevelopmentSource_Fatigue"
ENUM_DevelopmentSource_Impact = "ENUM_DevelopmentSource_Impact"
ENUM_DevelopmentSource_ImpactDirect = "ENUM_DevelopmentSource_ImpactDirect"
ENUM_DevelopmentSource_Kill = "ENUM_DevelopmentSource_Kill"
ENUM_DevelopmentSource_Quest = "ENUM_DevelopmentSource_Quest"
ENUM_DevelopmentSource_Cheat = "ENUM_DevelopmentSource_Cheat"
ENUM_DevelopmentSource_Fatigue = "ENUM_DevelopmentSource_Fatigue"
ENUM_DevelopmentSource_Impact = "ENUM_DevelopmentSource_Impact"
ENUM_DevelopmentSource_ImpactDirect = "ENUM_DevelopmentSource_ImpactDirect"

--- Текстовый и числовой енум.
--- опыт
ENUM_DevelopmentTrack_Experience = "ENUM_DevelopmentTrack_Experience"
--- репутация с определённой фракцией
ENUM_DevelopmentTrack_Reputation = "ENUM_DevelopmentTrack_Reputation"
ENUM_DevelopmentTrack_Experience = "ENUM_DevelopmentTrack_Experience"
ENUM_DevelopmentTrack_Reputation = "ENUM_DevelopmentTrack_Reputation"

--- Текстовый и числовой енум.
ENUM_GlobalScalerType_MobExp = "ENUM_GlobalScalerType_MobExp"
ENUM_GlobalScalerType_Authority = "ENUM_GlobalScalerType_Authority"
ENUM_GlobalScalerType_QuestExp = "ENUM_GlobalScalerType_QuestExp"
ENUM_GlobalScalerType_Reputation = "ENUM_GlobalScalerType_Reputation"
ENUM_GlobalScalerType_QuestLoot = "ENUM_GlobalScalerType_QuestLoot"
ENUM_GlobalScalerType_AstralLoot = "ENUM_GlobalScalerType_AstralLoot"
ENUM_GlobalScalerType_GoldAndTrashDrop = "ENUM_GlobalScalerType_GoldAndTrashDrop"
ENUM_GlobalScalerType_WorldDrop = "ENUM_GlobalScalerType_WorldDrop"
ENUM_GlobalScalerType_QuestMoney = "ENUM_GlobalScalerType_QuestMoney"
ENUM_GlobalScalerType_PersonalDrop = "ENUM_GlobalScalerType_PersonalDrop"
ENUM_GlobalScalerType_MobExp = "ENUM_GlobalScalerType_MobExp"
ENUM_GlobalScalerType_Authority = "ENUM_GlobalScalerType_Authority"
ENUM_GlobalScalerType_QuestExp = "ENUM_GlobalScalerType_QuestExp"
ENUM_GlobalScalerType_Reputation = "ENUM_GlobalScalerType_Reputation"
ENUM_GlobalScalerType_QuestLoot = "ENUM_GlobalScalerType_QuestLoot"
ENUM_GlobalScalerType_AstralLoot = "ENUM_GlobalScalerType_AstralLoot"
ENUM_GlobalScalerType_GoldAndTrashDrop = "ENUM_GlobalScalerType_GoldAndTrashDrop"
ENUM_GlobalScalerType_WorldDrop = "ENUM_GlobalScalerType_WorldDrop"
ENUM_GlobalScalerType_QuestMoney = "ENUM_GlobalScalerType_QuestMoney"
ENUM_GlobalScalerType_PersonalDrop = "ENUM_GlobalScalerType_PersonalDrop"

---@class avatarProgressLib
avatarProgress = {}

--- Показывает, можно ли распределять свободные пункты характеристик. При изменении этого состояния приходит событие EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED.
---@return boolean
function avatarProgress.CanImproveInnateStats() end

--- Окончательно распределяет пункты характеристик, предварительно запланированные к распределению функцией avatar.ImproveInnateStat( stat, amount ). Работает только если avatar.CanImproveInnateStats() даёт true, при этом переключает это состояние в false до ответа сервера.
function avatarProgress.DistributeStatPoints() end

--- Возвращает список бонусов развития главного игрока. В результирующей таблице может быть только один элемент, описывающий бонус какого-то кокретного типа.
---@return table
function avatarProgress.GetBonusPools() end

--- Даёт количество доступных для распределения пунктов характеристик (ещё не намеченных к распределению). Работает только если avatar.CanImproveInnateStats() даёт true.
---@return number
function avatarProgress.GetFreeStatPointsToDistribute() end

--- Возвращает список глобальных рейтов развития главного игрока.
---@return table
function avatarProgress.GetGlobalRates() end

--- Аналогично  avatar.GetInnateStats() дает основные характеристики аватара, но с учётом намеченных к распределению (ещё нераспределённых окончательно) пунктов характеристик. Работает только когда  avatar.CanImproveInnateStats() дает true.
---@return table
function avatarProgress.GetImprovedInnateStats() end

--- Даёт информацию о намеченных для распределения пунктах характеристик. Работает только если avatar.CanImproveInnateStats() даёт true.
---@return table
function avatarProgress.GetStatPointsToDistribute() end

--- Отводит для будущего распределения пункты характеристик. Работает только если avatar.CanImproveInnateStats() даёт true.
---@param stat integer значение множества InnateStats, соответствующее характеристике, которую планируется изменить
---@param amount integer количество пунктов характеристик, на которое планируется изменить; не может быть больше текущего количества свободных пунктов характеристик; может быть отрицательным, в этом случае уменьшит ранее заданное этой же функцией количество пунктов для этой характеристики, однако не может уменьшить общее запланированное количество для этой характеристики ниже 0
function avatarProgress.ImproveInnateStat(stat, amount) end

-- Events

--- Приходит, если главный игрок получил один из типов опыта для развития. Это может быть обычный опыт (experience), репутация с какой-либо фракцией, слава за PvP сражения.
EVENT_AVATAR_PROGRESS_GAINED = "EVENT_AVATAR_PROGRESS_GAINED"

--- Приходит, если изменилась возможность распределять пункты характеристик.
EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED = "EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED"

--- Приходит, если изменился дополнительный бонус к прогрессу персонажа.
EVENT_BONUS_POOL_CHANGED = "EVENT_BONUS_POOL_CHANGED"

--- Приходит, если изменился список дополнительных бонусов к прогрессу персонажа.
EVENT_BONUS_POOLS_CHANGED = "EVENT_BONUS_POOLS_CHANGED"

--- Приходит, если изменился список глобальных рейтов к прогрессу персонажа.
EVENT_GLOBAL_RATES_CHANGED = "EVENT_GLOBAL_RATES_CHANGED"
