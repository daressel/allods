---@meta

--- CategoryAction
--- События и функции Lua Api, относящиеся к action-слотам.

--- Текстовый enum. Префикс для автоматической проверки - "ENUM_ActionFailCause".
ENUM_ActionFailCause_NoFail = "ENUM_ActionFailCause_NoFail"
ENUM_ActionFailCause_Void = "ENUM_ActionFailCause_Void"
ENUM_ActionFailCause_Cooldown = "ENUM_ActionFailCause_Cooldown"
ENUM_ActionFailCause_Disabled = "ENUM_ActionFailCause_Disabled"
ENUM_ActionFailCause_TooFar = "ENUM_ActionFailCause_TooFar"
ENUM_ActionFailCause_NotInGroup = "ENUM_ActionFailCause_NotInGroup"
ENUM_ActionFailCause_NotInRaid = "ENUM_ActionFailCause_NotInRaid"
ENUM_ActionFailCause_Immune = "ENUM_ActionFailCause_Immune"
ENUM_ActionFailCause_NotInFront = "ENUM_ActionFailCause_NotInFront"
ENUM_ActionFailCause_NoLoS = "ENUM_ActionFailCause_NoLoS"
ENUM_ActionFailCause_NoPath = "ENUM_ActionFailCause_NoPath"
ENUM_ActionFailCause_NoTarget = "ENUM_ActionFailCause_NoTarget"
ENUM_ActionFailCause_NoTargetPoint = "ENUM_ActionFailCause_NoTargetPoint"
ENUM_ActionFailCause_Occupied = "ENUM_ActionFailCause_Occupied"
ENUM_ActionFailCause_Resisted = "ENUM_ActionFailCause_Resisted"
ENUM_ActionFailCause_NotFriend = "ENUM_ActionFailCause_NotFriend"
ENUM_ActionFailCause_NotEnemy = "ENUM_ActionFailCause_NotEnemy"
ENUM_ActionFailCause_NoPvpFlag = "ENUM_ActionFailCause_NoPvpFlag"
ENUM_ActionFailCause_BarrierInNotActive = "ENUM_ActionFailCause_BarrierInNotActive"
ENUM_ActionFailCause_CannotTakeItem = "ENUM_ActionFailCause_CannotTakeItem"
ENUM_ActionFailCause_NoSpaceInBag = "ENUM_ActionFailCause_NoSpaceInBag"
ENUM_ActionFailCause_WrongCharacterClass = "ENUM_ActionFailCause_WrongCharacterClass"
ENUM_ActionFailCause_ItemCountTooSmall = "ENUM_ActionFailCause_ItemCountTooSmall"
ENUM_ActionFailCause_ItemCountTooBig = "ENUM_ActionFailCause_ItemCountTooBig"
ENUM_ActionFailCause_WrongCreatureRace = "ENUM_ActionFailCause_WrongCreatureRace"
ENUM_ActionFailCause_WrongAvatarRace = "ENUM_ActionFailCause_WrongAvatarRace"
ENUM_ActionFailCause_WrongAvatarSex = "ENUM_ActionFailCause_WrongAvatarSex"
ENUM_ActionFailCause_NotEquipped = "ENUM_ActionFailCause_NotEquipped"
ENUM_ActionFailCause_NoItem = "ENUM_ActionFailCause_NoItem"
ENUM_ActionFailCause_NotInZone = "ENUM_ActionFailCause_NotInZone"
ENUM_ActionFailCause_NotInScriptZone = "ENUM_ActionFailCause_NotInScriptZone"
ENUM_ActionFailCause_NotManaCaster = "ENUM_ActionFailCause_NotManaCaster"
ENUM_ActionFailCause_NotEnergyUser = "ENUM_ActionFailCause_NotEnergyUser"
ENUM_ActionFailCause_NotHonorUser = "ENUM_ActionFailCause_NotHonorUser"
ENUM_ActionFailCause_WrongMobWorld = "ENUM_ActionFailCause_WrongMobWorld"
ENUM_ActionFailCause_NotInCombat = "ENUM_ActionFailCause_NotInCombat"
ENUM_ActionFailCause_InCombat = "ENUM_ActionFailCause_InCombat"
ENUM_ActionFailCause_CannotStrike = "ENUM_ActionFailCause_CannotStrike"
ENUM_ActionFailCause_TooClose = "ENUM_ActionFailCause_TooClose"
ENUM_ActionFailCause_NoShield = "ENUM_ActionFailCause_NoShield"
ENUM_ActionFailCause_NoMainhandWeapon = "ENUM_ActionFailCause_NoMainhandWeapon"
ENUM_ActionFailCause_NotEnoughMana = "ENUM_ActionFailCause_NotEnoughMana"
ENUM_ActionFailCause_NotEnoughEnergy = "ENUM_ActionFailCause_NotEnoughEnergy"
ENUM_ActionFailCause_NotEnoughHonor = "ENUM_ActionFailCause_NotEnoughHonor"
ENUM_ActionFailCause_NoBuff = "ENUM_ActionFailCause_NoBuff"
ENUM_ActionFailCause_InterruptedMove = "ENUM_ActionFailCause_InterruptedMove"
ENUM_ActionFailCause_InterruptedRotate = "ENUM_ActionFailCause_InterruptedRotate"
ENUM_ActionFailCause_Canceled = "ENUM_ActionFailCause_Canceled"
ENUM_ActionFailCause_Fizzled = "ENUM_ActionFailCause_Fizzled"
ENUM_ActionFailCause_Evaded = "ENUM_ActionFailCause_Evaded"
ENUM_ActionFailCause_QuestNotActive = "ENUM_ActionFailCause_QuestNotActive"
ENUM_ActionFailCause_CreatureLevelTooSmall = "ENUM_ActionFailCause_CreatureLevelTooSmall"
ENUM_ActionFailCause_QuestNotFinished = "ENUM_ActionFailCause_QuestNotFinished"
ENUM_ActionFailCause_NotNeededForQuests = "ENUM_ActionFailCause_NotNeededForQuests"
ENUM_ActionFailCause_QuestAlreadyVisitedScriptZone = "ENUM_ActionFailCause_QuestAlreadyVisitedScriptZone"
ENUM_ActionFailCause_QuestActive = "ENUM_ActionFailCause_QuestActive"
ENUM_ActionFailCause_HasNoQuestsOnCooldown = "ENUM_ActionFailCause_HasNoQuestsOnCooldown"
ENUM_ActionFailCause_WrongFaction = "ENUM_ActionFailCause_WrongFaction"
ENUM_ActionFailCause_InterruptedDamage = "ENUM_ActionFailCause_InterruptedDamage"
ENUM_ActionFailCause_InterruptedChangeTarget = "ENUM_ActionFailCause_InterruptedChangeTarget"
ENUM_ActionFailCause_HealthNotLower = "ENUM_ActionFailCause_HealthNotLower"
ENUM_ActionFailCause_HealthNotHigher = "ENUM_ActionFailCause_HealthNotHigher"
ENUM_ActionFailCause_LootableOccupied = "ENUM_ActionFailCause_LootableOccupied"
ENUM_ActionFailCause_Dead = "ENUM_ActionFailCause_Dead"
ENUM_ActionFailCause_MorePowerfulEffectActive = "ENUM_ActionFailCause_MorePowerfulEffectActive"
ENUM_ActionFailCause_HavePet = "ENUM_ActionFailCause_HavePet"
ENUM_ActionFailCause_DontHavePet = "ENUM_ActionFailCause_DontHavePet"
ENUM_ActionFailCause_PvpFlagSet = "ENUM_ActionFailCause_PvpFlagSet"
ENUM_ActionFailCause_PvpFlagNotSet = "ENUM_ActionFailCause_PvpFlagNotSet"
ENUM_ActionFailCause_NotEnoughSkillScore = "ENUM_ActionFailCause_NotEnoughSkillScore"
ENUM_ActionFailCause_HasSkill = "ENUM_ActionFailCause_HasSkill"
ENUM_ActionFailCause_NotAvatar = "ENUM_ActionFailCause_NotAvatar"
ENUM_ActionFailCause_NotMob = "ENUM_ActionFailCause_NotMob"
ENUM_ActionFailCause_NotDead = "ENUM_ActionFailCause_NotDead"
ENUM_ActionFailCause_NotAlive = "ENUM_ActionFailCause_NotAlive"
ENUM_ActionFailCause_ResurrectNotActive = "ENUM_ActionFailCause_ResurrectNotActive"
ENUM_ActionFailCause_ExploitForQuestsOnly = "ENUM_ActionFailCause_ExploitForQuestsOnly"
ENUM_ActionFailCause_CannotBeResized = "ENUM_ActionFailCause_CannotBeResized"
ENUM_ActionFailCause_QuestCounterLessThenTest = "ENUM_ActionFailCause_QuestCounterLessThenTest"
ENUM_ActionFailCause_QuestStatusMismatch = "ENUM_ActionFailCause_QuestStatusMismatch"
ENUM_ActionFailCause_CannotAttack = "ENUM_ActionFailCause_CannotAttack"
ENUM_ActionFailCause_CartridgeBeltIsEmpty = "ENUM_ActionFailCause_CartridgeBeltIsEmpty"
ENUM_ActionFailCause_CartridgeBeltIsFull = "ENUM_ActionFailCause_CartridgeBeltIsFull"
ENUM_ActionFailCause_NoCartridgeBelt = "ENUM_ActionFailCause_NoCartridgeBelt"
ENUM_ActionFailCause_NoPsionicContact = "ENUM_ActionFailCause_NoPsionicContact"
ENUM_ActionFailCause_PsionicContactHasNoBuff = "ENUM_ActionFailCause_PsionicContactHasNoBuff"
ENUM_ActionFailCause_StatTooLow = "ENUM_ActionFailCause_StatTooLow"
ENUM_ActionFailCause_DeviceAlreadyInUse = "ENUM_ActionFailCause_DeviceAlreadyInUse"
ENUM_ActionFailCause_CreatureIsTooFat = "ENUM_ActionFailCause_CreatureIsTooFat"
ENUM_ActionFailCause_DeviceBroken = "ENUM_ActionFailCause_DeviceBroken"
ENUM_ActionFailCause_DeviceOffline = "ENUM_ActionFailCause_DeviceOffline"
ENUM_ActionFailCause_TargetNotVisible = "ENUM_ActionFailCause_TargetNotVisible"
ENUM_ActionFailCause_NotEnoughCombatAdvantage = "ENUM_ActionFailCause_NotEnoughCombatAdvantage"
ENUM_ActionFailCause_BuffStackCountNotInRange = "ENUM_ActionFailCause_BuffStackCountNotInRange"
ENUM_ActionFailCause_NothingToDispel = "ENUM_ActionFailCause_NothingToDispel"
ENUM_ActionFailCause_NoPlane = "ENUM_ActionFailCause_NoPlane"
ENUM_ActionFailCause_VariableValueIsTooSmall = "ENUM_ActionFailCause_VariableValueIsTooSmall"
ENUM_ActionFailCause_VariableValueIsTooBig = "ENUM_ActionFailCause_VariableValueIsTooBig"
ENUM_ActionFailCause_NoVariable = "ENUM_ActionFailCause_NoVariable"
ENUM_ActionFailCause_InvalidPos = "ENUM_ActionFailCause_InvalidPos"
ENUM_ActionFailCause_NotOnBoundShip = "ENUM_ActionFailCause_NotOnBoundShip"
ENUM_ActionFailCause_NoStolenLoot = "ENUM_ActionFailCause_NoStolenLoot"
ENUM_ActionFailCause_CannotGetAddressImmediately = "ENUM_ActionFailCause_CannotGetAddressImmediately"
ENUM_ActionFailCause_DruidPetIsNotActive = "ENUM_ActionFailCause_DruidPetIsNotActive"
ENUM_ActionFailCause_NoBoundShip = "ENUM_ActionFailCause_NoBoundShip"
ENUM_ActionFailCause_NoShipInProgress = "ENUM_ActionFailCause_NoShipInProgress"
ENUM_ActionFailCause_ShipInProgressNotComplete = "ENUM_ActionFailCause_ShipInProgressNotComplete"
ENUM_ActionFailCause_ShipInProgressNotSummoned = "ENUM_ActionFailCause_ShipInProgressNotSummoned"
ENUM_ActionFailCause_NoShipInRepair = "ENUM_ActionFailCause_NoShipInRepair"
ENUM_ActionFailCause_HonorNotLess = "ENUM_ActionFailCause_HonorNotLess"
ENUM_ActionFailCause_NoForagingInstrument = "ENUM_ActionFailCause_NoForagingInstrument"
ENUM_ActionFailCause_NoForagingDeviceFound = "ENUM_ActionFailCause_NoForagingDeviceFound"
ENUM_ActionFailCause_ForagingSkillNotEnough = "ENUM_ActionFailCause_ForagingSkillNotEnough"
ENUM_ActionFailCause_ReputationNotLess = "ENUM_ActionFailCause_ReputationNotLess"
ENUM_ActionFailCause_ReputationLevelNotLess = "ENUM_ActionFailCause_ReputationLevelNotLess"
ENUM_ActionFailCause_NotOurShip = "ENUM_ActionFailCause_NotOurShip"
ENUM_ActionFailCause_TooHigh = "ENUM_ActionFailCause_TooHigh"
ENUM_ActionFailCause_NoAbility = "ENUM_ActionFailCause_NoAbility"
ENUM_ActionFailCause_NoFairy = "ENUM_ActionFailCause_NoFairy"
ENUM_ActionFailCause_InvalidFairyRank = "ENUM_ActionFailCause_InvalidFairyRank"
ENUM_ActionFailCause_FairyNotActive = "ENUM_ActionFailCause_FairyNotActive"
ENUM_ActionFailCause_NoSpell = "ENUM_ActionFailCause_NoSpell"
ENUM_ActionFailCause_DressedItemCannotBeUpgraded = "ENUM_ActionFailCause_DressedItemCannotBeUpgraded"
ENUM_ActionFailCause_NothingToTalkAbout = "ENUM_ActionFailCause_NothingToTalkAbout"
ENUM_ActionFailCause_NoContentKey = "ENUM_ActionFailCause_NoContentKey"
ENUM_ActionFailCause_NoSpellInSpellBook = "ENUM_ActionFailCause_NoSpellInSpellBook"
ENUM_ActionFailCause_NotEnoughMoney = "ENUM_ActionFailCause_NotEnoughMoney"
ENUM_ActionFailCause_PetHealthNotHigher = "ENUM_ActionFailCause_PetHealthNotHigher"
ENUM_ActionFailCause_NotEnoughAlternativeCurrency = "ENUM_ActionFailCause_NotEnoughAlternativeCurrency"
ENUM_ActionFailCause_CannotLearnSkill = "ENUM_ActionFailCause_CannotLearnSkill"
ENUM_ActionFailCause_CantSummonShipHere = "ENUM_ActionFailCause_CantSummonShipHere"
ENUM_ActionFailCause_CannotConvertItems = "ENUM_ActionFailCause_CannotConvertItems"
ENUM_ActionFailCause_HasNotGuildRight = "ENUM_ActionFailCause_HasNotGuildRight"
ENUM_ActionFailCause_NotUnlocked = "ENUM_ActionFailCause_NotUnlocked"
ENUM_ActionFailCause_GroupInviteOtherShip = "ENUM_ActionFailCause_GroupInviteOtherShip"
ENUM_ActionFailCause_AlreadyHaveShip = "ENUM_ActionFailCause_AlreadyHaveShip"
ENUM_ActionFailCause_TeleportTargetNotFound = "ENUM_ActionFailCause_TeleportTargetNotFound"
ENUM_ActionFailCause_InvalidShipName = "ENUM_ActionFailCause_InvalidShipName"
ENUM_ActionFailCause_ShipNameAlreadyUsed = "ENUM_ActionFailCause_ShipNameAlreadyUsed"
ENUM_ActionFailCause_GuildCreateWrongPlace = "ENUM_ActionFailCause_GuildCreateWrongPlace"
ENUM_ActionFailCause_GuildCreateMemberBusy = "ENUM_ActionFailCause_GuildCreateMemberBusy"
ENUM_ActionFailCause_GuildCreateAlreadyInGuild = "ENUM_ActionFailCause_GuildCreateAlreadyInGuild"
ENUM_ActionFailCause_RaidInviteOtherShip = "ENUM_ActionFailCause_RaidInviteOtherShip"
ENUM_ActionFailCause_NotEnoughRepairMats = "ENUM_ActionFailCause_NotEnoughRepairMats"
ENUM_ActionFailCause_ShipDoesNotNeedRepair = "ENUM_ActionFailCause_ShipDoesNotNeedRepair"
ENUM_ActionFailCause_UnstuckNotAllowed = "ENUM_ActionFailCause_UnstuckNotAllowed"
ENUM_ActionFailCause_ItemMoveNotAvailable = "ENUM_ActionFailCause_ItemMoveNotAvailable"
ENUM_ActionFailCause_LootOpenOccupied = "ENUM_ActionFailCause_LootOpenOccupied"
ENUM_ActionFailCause_NoLoot = "ENUM_ActionFailCause_NoLoot"
ENUM_ActionFailCause_DepositeBoxAlreadyOpened = "ENUM_ActionFailCause_DepositeBoxAlreadyOpened"
ENUM_ActionFailCause_DepositeBoxNotOpened = "ENUM_ActionFailCause_DepositeBoxNotOpened"
ENUM_ActionFailCause_DepositeBoxUpdateEmptySlot = "ENUM_ActionFailCause_DepositeBoxUpdateEmptySlot"
ENUM_ActionFailCause_DepositeBoxUpdateNotBox = "ENUM_ActionFailCause_DepositeBoxUpdateNotBox"
ENUM_ActionFailCause_DepositeBoxUpdateTooSmall = "ENUM_ActionFailCause_DepositeBoxUpdateTooSmall"
ENUM_ActionFailCause_DepositeBoxPutNoSpace = "ENUM_ActionFailCause_DepositeBoxPutNoSpace"
ENUM_ActionFailCause_DepositeBoxItemCannotBePut = "ENUM_ActionFailCause_DepositeBoxItemCannotBePut"
ENUM_ActionFailCause_NoSkill = "ENUM_ActionFailCause_NoSkill"
ENUM_ActionFailCause_NoProficiency = "ENUM_ActionFailCause_NoProficiency"
ENUM_ActionFailCause_NoItemWithRune = "ENUM_ActionFailCause_NoItemWithRune"
ENUM_ActionFailCause_NotEnoughInsight = "ENUM_ActionFailCause_NotEnoughInsight"
ENUM_ActionFailCause_NoReturnPoint = "ENUM_ActionFailCause_NoReturnPoint"
ENUM_ActionFailCause_ScanPortalNotFound = "ENUM_ActionFailCause_ScanPortalNotFound"
ENUM_ActionFailCause_ScanIslandNotFound = "ENUM_ActionFailCause_ScanIslandNotFound"
ENUM_ActionFailCause_ScanContinentNotFound = "ENUM_ActionFailCause_ScanContinentNotFound"
ENUM_ActionFailCause_ScanWreckNotFound = "ENUM_ActionFailCause_ScanWreckNotFound"
ENUM_ActionFailCause_ScanShipNotFound = "ENUM_ActionFailCause_ScanShipNotFound"
ENUM_ActionFailCause_NotOnLand = "ENUM_ActionFailCause_NotOnLand"
ENUM_ActionFailCause_DeviceActionDisabled = "ENUM_ActionFailCause_DeviceActionDisabled"
ENUM_ActionFailCause_DeviceActionOnCooldown = "ENUM_ActionFailCause_DeviceActionOnCooldown"
ENUM_ActionFailCause_NotOnEnemyShip = "ENUM_ActionFailCause_NotOnEnemyShip"
ENUM_ActionFailCause_NotOnFriendlyShip = "ENUM_ActionFailCause_NotOnFriendlyShip"
ENUM_ActionFailCause_NoMorePowerfulBuff = "ENUM_ActionFailCause_NoMorePowerfulBuff"
ENUM_ActionFailCause_DeviceNotNear = "ENUM_ActionFailCause_DeviceNotNear"
ENUM_ActionFailCause_MobNotNear = "ENUM_ActionFailCause_MobNotNear"
ENUM_ActionFailCause_ProjectileNotNear = "ENUM_ActionFailCause_ProjectileNotNear"
ENUM_ActionFailCause_CaptainCantTeleportToAllod = "ENUM_ActionFailCause_CaptainCantTeleportToAllod"
ENUM_ActionFailCause_AvatarNotCapableForAllod = "ENUM_ActionFailCause_AvatarNotCapableForAllod"
ENUM_ActionFailCause_AvatarBindedToAnotherAllod = "ENUM_ActionFailCause_AvatarBindedToAnotherAllod"
ENUM_ActionFailCause_CannotEnterMapInCombat = "ENUM_ActionFailCause_CannotEnterMapInCombat"
ENUM_ActionFailCause_NoFreeStableSlots = "ENUM_ActionFailCause_NoFreeStableSlots"
ENUM_ActionFailCause_DontHaveMount = "ENUM_ActionFailCause_DontHaveMount"
ENUM_ActionFailCause_AlreadyHaveMount = "ENUM_ActionFailCause_AlreadyHaveMount"
ENUM_ActionFailCause_ShipNotInCustomizeMode = "ENUM_ActionFailCause_ShipNotInCustomizeMode"
ENUM_ActionFailCause_NoShipInUpgrade = "ENUM_ActionFailCause_NoShipInUpgrade"
ENUM_ActionFailCause_NotOnIsland = "ENUM_ActionFailCause_NotOnIsland"
ENUM_ActionFailCause_CantRideIndoor = "ENUM_ActionFailCause_CantRideIndoor"
ENUM_ActionFailCause_FairyAutoFeedIsOff = "ENUM_ActionFailCause_FairyAutoFeedIsOff"
ENUM_ActionFailCause_NoFairyAutoFeedItem = "ENUM_ActionFailCause_NoFairyAutoFeedItem"
ENUM_ActionFailCause_HangarIsNotEmpty = "ENUM_ActionFailCause_HangarIsNotEmpty"
ENUM_ActionFailCause_InAstral = "ENUM_ActionFailCause_InAstral"
ENUM_ActionFailCause_PurifySlotOutOfBounds = "ENUM_ActionFailCause_PurifySlotOutOfBounds"
ENUM_ActionFailCause_PurifyEmptySlot = "ENUM_ActionFailCause_PurifyEmptySlot"
ENUM_ActionFailCause_ItemNotCursed = "ENUM_ActionFailCause_ItemNotCursed"
ENUM_ActionFailCause_CannotPurifyStack = "ENUM_ActionFailCause_CannotPurifyStack"
ENUM_ActionFailCause_ItemIsNotPurifier = "ENUM_ActionFailCause_ItemIsNotPurifier"
ENUM_ActionFailCause_PurifierCannotPurifyThis = "ENUM_ActionFailCause_PurifierCannotPurifyThis"
ENUM_ActionFailCause_MustOwnShipToUpgrade = "ENUM_ActionFailCause_MustOwnShipToUpgrade"
ENUM_ActionFailCause_NotAllowedToStartReadyCheck = "ENUM_ActionFailCause_NotAllowedToStartReadyCheck"
ENUM_ActionFailCause_ReadyCheckAlreadyInProgress = "ENUM_ActionFailCause_ReadyCheckAlreadyInProgress"
ENUM_ActionFailCause_HaveNoTargetShip = "ENUM_ActionFailCause_HaveNoTargetShip"
ENUM_ActionFailCause_UsingIncorrectDevice = "ENUM_ActionFailCause_UsingIncorrectDevice"
ENUM_ActionFailCause_EnemiesNear = "ENUM_ActionFailCause_EnemiesNear"
ENUM_ActionFailCause_SlotCannotBeEmpty = "ENUM_ActionFailCause_SlotCannotBeEmpty"
ENUM_ActionFailCause_TransportIsOverloaded = "ENUM_ActionFailCause_TransportIsOverloaded"
ENUM_ActionFailCause_NotADweller = "ENUM_ActionFailCause_NotADweller"
ENUM_ActionFailCause_NotAllowedToListTWarAuctions = "ENUM_ActionFailCause_NotAllowedToListTWarAuctions"
ENUM_ActionFailCause_NotAllowedToBidTWarAuction = "ENUM_ActionFailCause_NotAllowedToBidTWarAuction"
ENUM_ActionFailCause_NotInAffectGroup = "ENUM_ActionFailCause_NotInAffectGroup"
ENUM_ActionFailCause_CannotLootThisTreasure = "ENUM_ActionFailCause_CannotLootThisTreasure"
ENUM_ActionFailCause_QuestBookTooBig = "ENUM_ActionFailCause_QuestBookTooBig"
ENUM_ActionFailCause_ShipIsNotPersistent = "ENUM_ActionFailCause_ShipIsNotPersistent"
ENUM_ActionFailCause_NotGuildLeader = "ENUM_ActionFailCause_NotGuildLeader"
ENUM_ActionFailCause_GuildProgressAlreadyEnabled = "ENUM_ActionFailCause_GuildProgressAlreadyEnabled"
ENUM_ActionFailCause_IncorrectGuildLevel = "ENUM_ActionFailCause_IncorrectGuildLevel"
ENUM_ActionFailCause_MetaSourceSlotOutOfBounds = "ENUM_ActionFailCause_MetaSourceSlotOutOfBounds"
ENUM_ActionFailCause_MetaEnhancerSlotOutOfBounds = "ENUM_ActionFailCause_MetaEnhancerSlotOutOfBounds"
ENUM_ActionFailCause_MetaAgentSlotOutOfBounds = "ENUM_ActionFailCause_MetaAgentSlotOutOfBounds"
ENUM_ActionFailCause_MetaSourceSlotEqualsEnhancerSlot = "ENUM_ActionFailCause_MetaSourceSlotEqualsEnhancerSlot"
ENUM_ActionFailCause_MetaSourceSlotEmpty = "ENUM_ActionFailCause_MetaSourceSlotEmpty"
ENUM_ActionFailCause_MetaEnhancerSlotEmpty = "ENUM_ActionFailCause_MetaEnhancerSlotEmpty"
ENUM_ActionFailCause_MetaAgentSlotEmpty = "ENUM_ActionFailCause_MetaAgentSlotEmpty"
ENUM_ActionFailCause_MetaItemNotMeta = "ENUM_ActionFailCause_MetaItemNotMeta"
ENUM_ActionFailCause_MetaCannotUpgradeStack = "ENUM_ActionFailCause_MetaCannotUpgradeStack"
ENUM_ActionFailCause_MetaEnhancerIsDifferent = "ENUM_ActionFailCause_MetaEnhancerIsDifferent"
ENUM_ActionFailCause_MetaAgentIsNotAgent = "ENUM_ActionFailCause_MetaAgentIsNotAgent"
ENUM_ActionFailCause_MetaWrongAgentCount = "ENUM_ActionFailCause_MetaWrongAgentCount"
ENUM_ActionFailCause_MetaCannotUpgradeMaxQuality = "ENUM_ActionFailCause_MetaCannotUpgradeMaxQuality"
ENUM_ActionFailCause_NoNecessaryGuildTabardRight = "ENUM_ActionFailCause_NoNecessaryGuildTabardRight"
ENUM_ActionFailCause_NoCustomizeCurrency = "ENUM_ActionFailCause_NoCustomizeCurrency"
ENUM_ActionFailCause_NoGuildProgress = "ENUM_ActionFailCause_NoGuildProgress"
ENUM_ActionFailCause_PeerNoSpaceInBag = "ENUM_ActionFailCause_PeerNoSpaceInBag"
ENUM_ActionFailCause_MountIsHungry = "ENUM_ActionFailCause_MountIsHungry"
ENUM_ActionFailCause_NotOnTWar = "ENUM_ActionFailCause_NotOnTWar"
ENUM_ActionFailCause_OtherMap = "ENUM_ActionFailCause_OtherMap"
ENUM_ActionFailCause_SectorUnavailable = "ENUM_ActionFailCause_SectorUnavailable"
ENUM_ActionFailCause_SectorIsFactionRestricted = "ENUM_ActionFailCause_SectorIsFactionRestricted"
ENUM_ActionFailCause_InHangar = "ENUM_ActionFailCause_InHangar"
ENUM_ActionFailCause_NotInHangar = "ENUM_ActionFailCause_NotInHangar"
ENUM_ActionFailCause_TreasuryIsNotEmpty = "ENUM_ActionFailCause_TreasuryIsNotEmpty"
ENUM_ActionFailCause_OnAstralIsland = "ENUM_ActionFailCause_OnAstralIsland"
ENUM_ActionFailCause_CantRideInZone = "ENUM_ActionFailCause_CantRideInZone"
ENUM_ActionFailCause_NotMounted = "ENUM_ActionFailCause_NotMounted"
ENUM_ActionFailCause_NoAssistant = "ENUM_ActionFailCause_NoAssistant"
ENUM_ActionFailCause_NoUsedStatPoints = "ENUM_ActionFailCause_NoUsedStatPoints"
ENUM_ActionFailCause_NotMarried = "ENUM_ActionFailCause_NotMarried"
--- гильдия не помечена, как безымянная (требующая переименования)
ENUM_ActionFailCause_NoGuildRenameMark = "ENUM_ActionFailCause_NoGuildRenameMark"
--- аватар не является членом гильдии
ENUM_ActionFailCause_NoGuild = "ENUM_ActionFailCause_NoGuild"
--- аватар пытается сменить класс, но у него есть предметы, которые несовместимы со сменой класса
ENUM_ActionFailCause_CCItemsProhibited = "ENUM_ActionFailCause_CCItemsProhibited"
--- Цель не выполнена
ENUM_ActionFailCause_GoalIsNotCompleted = "ENUM_ActionFailCause_GoalIsNotCompleted"
--- Правило не выполнено
ENUM_ActionFailCause_RuleIsNotActive = "ENUM_ActionFailCause_RuleIsNotActive"
--- Метапредмет не появлялся
ENUM_ActionFailCause_MetaItemNotAppear = "ENUM_ActionFailCause_MetaItemNotAppear"
--- Аватар не использовал телепорт
ENUM_ActionFailCause_AvatarNotUsedTeleport = "ENUM_ActionFailCause_AvatarNotUsedTeleport"
ENUM_ActionFailCause_NotLookingForGroup = "ENUM_ActionFailCause_NotLookingForGroup"

--- Текстовый енум. Префикс для автоматической проверки "ENUM_ACTION_RESULT_SPECIAL".
ENUM_ACTION_RESULT_SPECIAL_UNKNOWN = "ENUM_ACTION_RESULT_SPECIAL_UNKNOWN"
ENUM_ACTION_RESULT_SPECIAL_STARTED = "ENUM_ACTION_RESULT_SPECIAL_STARTED"
ENUM_ACTION_RESULT_SPECIAL_LAUNCHED = "ENUM_ACTION_RESULT_SPECIAL_LAUNCHED"
ENUM_ACTION_RESULT_SPECIAL_NO_RANGED_WEAPON = "ENUM_ACTION_RESULT_SPECIAL_NO_RANGED_WEAPON"

--- Текстовый enum.
--- общий
ENUM_SaleTag_None = "ENUM_SaleTag_None"
--- скидка
ENUM_SaleTag_Discount = "ENUM_SaleTag_Discount"
--- скидка 50%
ENUM_SaleTag_Discount50 = "ENUM_SaleTag_Discount50"
--- скидка 70%
ENUM_SaleTag_Discount70 = "ENUM_SaleTag_Discount70"
--- скидка 80%
ENUM_SaleTag_Discount80 = "ENUM_SaleTag_Discount80"
--- скидка 90%
ENUM_SaleTag_Discount90 = "ENUM_SaleTag_Discount90"
--- уникальный товар
ENUM_SaleTag_UniqueItem = "ENUM_SaleTag_UniqueItem"

---@class actionLib
action = {}

--- Привязывает предмет к слоту экшен панели.
---@param itemId ObjectId Id предмета, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function action.BindItemToActionPanel(itemId, index) end

--- Привязывает вызов маунта-метаморфа из конюшни главного игрока к слоту экшен панели.
---@param index integer индекс слота от 0 до max
function action.BindMountMetamorphToActionPanel(index) end

--- Привязывает вызов маунта с определенным скином из конюшни главного игрока к слоту экшен панели.
---@param skinId ObjectId Id скина маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function action.BindMountSkinToActionPanel(skinId, index) end

--- Привязывает вызов маунта из конюшни главного игрока к слоту экшен панели.
---@param mountId ObjectId Id маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function action.BindMountToActionPanel(mountId, index) end

--- Привязывает умение из книги умений к слоту экшен панели.
---@param spellId SpellId Id умения, привязываемого к слоту
---@param index integer индекс слота от 0 до max
function action.BindSpellToActionPanel(spellId, index) end

--- Вернуть информацию о наличии действия в слоте экшен-панели и его параметры.
---@param index integer
---@return nil
function action.GetActionInfo(index) end

--- Вернуть список идентификаторов контекстных действий. В списке перечислены идентификаторы созданных экземпляров контекстных действий.
---@param withMount boolean|nil true добавлять контекстные действия маунта; по-умолчанию true
---@return table
function action.GetContextActions(withMount) end

--- Вернуть общее (суммарное) количество слотов на всех ActionBar-ах (как пустых, так и непустых).
---@return integer
function action.GetMaxActionCount() end

--- Возвращает текущий тип поведения пета аватара. Типы см. avatar.SetPetAggroMode( mode )
---@return number
function action.GetPetAggroMode() end

--- Возвращает текущий тип движения пета аватара. Типы см. avatar.SetPetMoveMode( mode )
---@return number
function action.GetPetMoveMode() end

--- Возвращает true, если активный пет главного игрока находится в состоянии боя. Иначе возвращает false.
---@return boolean
function action.IsPetInCombat() end

--- Устанавливает состояние панели действий для заданного класса и билда. Номера билдов 0-2 соответствуют 1-3 грани талантов, номера билдов 3-9 ничему не соответствуют, но хранятся на сервере и могут быть загружены / выгружены.
---@param sysClass SpellId системное имя класса
---@param buildIndex integer индекс билда от 0 до 9
---@param data string данные о раскладке полученные из SaveActionPanel. Модификация не допускается, имеется контрольная сумма.
function action.SaveActionPanel(sysClass, buildIndex, data) end

--- Агрит пета аватара на цель.
function action.PetAttack() end

--- Возвращает сериализованное состояние панели действий для заданного класса и билда. Номера билдов 0-2 соответствуют 1-3 грани талантов, номера билдов 3-9 ничему не соответствуют, но хранятся на сервере и могут быть загружены / выгружены.
---@param sysClass SpellId системное имя класса
---@param buildIndex integer индекс билда от 0 до 9
---@return table|nil
function action.SaveActionPanel(sysClass, buildIndex) end

--- Прекратить кастование текущего спелла (действия).
function action.StopCasting() end

--- Снимает привязку какого-либо действия к слоту экшен панели.
---@param index integer индекс слота от 0 до max
function action.UnBindFromActionPanel(index) end

--- Возвращает информацию о прогрессе произнесения заклинания мобом.
---@param unitId ObjectId
---@return table|nil
function action.GetMobActionProgress(unitId) end

--- Установливает для пета аватара тип поведения:
function SetPetAggroMode() end

--- Установливает для пета аватара тип движения:
function SetPetMoveMode() end

--- Поменять умения экшен панели местами.
function SwapActionsInActionPanel() end

-- Events

--- Уведомление о неудачном исполнении эксплойта.
EVENT_ACTION_FAILED_EXPLOIT = "EVENT_ACTION_FAILED_EXPLOIT"

--- Уведомление о неудачном исполнении действия, не являющего заклинанием или эксплойтом.
EVENT_ACTION_FAILED_OTHER = "EVENT_ACTION_FAILED_OTHER"

--- Уведомление о неудачном исполнении заклинания.
EVENT_ACTION_FAILED_SPELL = "EVENT_ACTION_FAILED_SPELL"

--- Событие посылается каждый раз, когда изменилось состояние панели действий (ActionPanel).
EVENT_ACTION_PANEL_CHANGED = "EVENT_ACTION_PANEL_CHANGED"

--- Событие посылается каждый раз, когда изменилось состояние элемента на панели действий (ActionPanel). К созданию/удалению элемента это не относится, при этом изменяется панель целиком.
EVENT_ACTION_PANEL_ELEMENT_CHANGED = "EVENT_ACTION_PANEL_ELEMENT_CHANGED"

--- Оповещение о начале эффекта для элемента на панели управления.
EVENT_ACTION_PANEL_ELEMENT_EFFECT = "EVENT_ACTION_PANEL_ELEMENT_EFFECT"

--- Уведомление о прерывании текущего действия.
EVENT_PROCESS_TERMINATED = "EVENT_PROCESS_TERMINATED"

--- Событие присылается при окончании действия юнитом.
EVENT_ACTION_PROGRESS_FINISH = "EVENT_ACTION_PROGRESS_FINISH"

--- Событие присылается во время заморозки action.
EVENT_ACTION_PROGRESS_FREEZE = "EVENT_ACTION_PROGRESS_FREEZE"

--- Событие присылается при запуске действия юнитом.
EVENT_ACTION_PROGRESS_START = "EVENT_ACTION_PROGRESS_START"

--- Событие присылается во время действия action.
EVENT_ACTION_PROGRESS_UPDATE = "EVENT_ACTION_PROGRESS_UPDATE"

--- Уведомление об особых результатах выполнения заклинания.
EVENT_ACTION_RESULT_SPECIAL_SPELL = "EVENT_ACTION_RESULT_SPECIAL_SPELL"

--- Событие присылается при клике в террейн при активном AEMark. См. также  GamePosition.
EVENT_AEMARK_POINT_CLICKED = "EVENT_AEMARK_POINT_CLICKED"

--- Уведомление о неудачной немагической атаке. Более подробная информация - функция avatar.GetAttackResult (закрытая ссылка) библиотеки "avatar".
EVENT_ATTACK_RESULT = "EVENT_ATTACK_RESULT"

--- Событие посылается каждый раз, когда меняется количество Очков Судьбы у персонажа игрока.
EVENT_AVATAR_DESTINY_POINTS_CHANGED = "EVENT_AVATAR_DESTINY_POINTS_CHANGED"

--- Событие посылается каждый раз, когда изменился опыт персонажа игрока.
EVENT_AVATAR_EXPERIENCE_CHANGED = "EVENT_AVATAR_EXPERIENCE_CHANGED"

--- Уведомление об окончании показа 2D-изображение на весь экран, если такое было показано и для него имелось время автоматического скрытия.
EVENT_CLIENT_IMAGE_HIDE_ALL = "EVENT_CLIENT_IMAGE_HIDE_ALL"

--- Уведомление о приходе на клиент события, для которого необходимо показать 2D-изображение на весь экран.
EVENT_CLIENT_IMAGE_SHOW = "EVENT_CLIENT_IMAGE_SHOW"

--- Уведомление о приходе на клиент текстового сообщения.
EVENT_CLIENT_MESSAGE = "EVENT_CLIENT_MESSAGE"

--- Событие присылается, если необходимо начать отслеживание точки применения контекстного дейтсвия.
EVENT_CONTEXT_ACTION_POINT_STARTED = "EVENT_CONTEXT_ACTION_POINT_STARTED"

--- Событие присылается при изменении контекстных действий. Мог измениться список контекстных действий или флаг  enabled какого-либо контекстного действия.
EVENT_CONTEXT_ACTIONS_CHANGED = "EVENT_CONTEXT_ACTIONS_CHANGED"

--- Инициация перехода игрока в варп.
EVENT_DO_WARP = "EVENT_DO_WARP"

--- Уведомление о лечении юнита.
EVENT_HEALING_RECEIVED = "EVENT_HEALING_RECEIVED"

--- Настало время скрыть/показать интерфейс.
EVENT_INTERFACE_TOGGLE = "EVENT_INTERFACE_TOGGLE"

--- Уведомление о приходе на клиент текстового сообщения в лобби.
EVENT_LOBBY_CLIENT_MESSAGE = "EVENT_LOBBY_CLIENT_MESSAGE"

--- Уведомление о появлении/исчезновении лута в юните-трупе.
EVENT_LOOT_MARK = "EVENT_LOOT_MARK"

--- Событие присылается при окончании действия мобом.
EVENT_MOB_ACTION_PROGRESS_FINISH = "EVENT_MOB_ACTION_PROGRESS_FINISH"

--- Событие присылается при заморозке прогресса действия моба.
EVENT_MOB_ACTION_PROGRESS_FREEZE = "EVENT_MOB_ACTION_PROGRESS_FREEZE"

--- Событие присылается при запуске действия мобом.
EVENT_MOB_ACTION_PROGRESS_START = "EVENT_MOB_ACTION_PROGRESS_START"

--- Уведомление об эвейде моба.
EVENT_MOB_EVADED = "EVENT_MOB_EVADED"

--- Настало время показать субтитры в катсцене.
EVENT_SHOW_SUBTITLES = "EVENT_SHOW_SUBTITLES"

--- Уведомление о неудачном взятии предмета в инвентори.
EVENT_TAKE_ITEMS_FAILED = "EVENT_TAKE_ITEMS_FAILED"
