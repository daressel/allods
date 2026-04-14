---@meta

---@alias ENUM_AccessionResult
---| "ENUM_AccessionResult_NoChat"
---| "ENUM_AccessionResult_Success"
---| "ENUM_AccessionResult_WrongFaction"
---| "ENUM_AccessionResult_AlreadyIn"

---@alias ENUM_ActionFailCause
---| "ENUM_ActionFailCause_NoFail"
---| "ENUM_ActionFailCause_Void"
---| "ENUM_ActionFailCause_Cooldown"
---| "ENUM_ActionFailCause_Disabled"
---| "ENUM_ActionFailCause_TooFar"
---| "ENUM_ActionFailCause_NotInGroup"
---| "ENUM_ActionFailCause_NotInRaid"
---| "ENUM_ActionFailCause_Immune"
---| "ENUM_ActionFailCause_NotInFront"
---| "ENUM_ActionFailCause_NoLoS"
---| "ENUM_ActionFailCause_NoPath"
---| "ENUM_ActionFailCause_NoTarget"
---| "ENUM_ActionFailCause_NoTargetPoint"
---| "ENUM_ActionFailCause_Occupied"
---| "ENUM_ActionFailCause_Resisted"
---| "ENUM_ActionFailCause_NotFriend"
---| "ENUM_ActionFailCause_NotEnemy"
---| "ENUM_ActionFailCause_NoPvpFlag"
---| "ENUM_ActionFailCause_BarrierInNotActive"
---| "ENUM_ActionFailCause_CannotTakeItem"
---| "ENUM_ActionFailCause_NoSpaceInBag"
---| "ENUM_ActionFailCause_WrongCharacterClass"
---| "ENUM_ActionFailCause_ItemCountTooSmall"
---| "ENUM_ActionFailCause_ItemCountTooBig"
---| "ENUM_ActionFailCause_WrongCreatureRace"
---| "ENUM_ActionFailCause_WrongAvatarRace"
---| "ENUM_ActionFailCause_WrongAvatarSex"
---| "ENUM_ActionFailCause_NotEquipped"
---| "ENUM_ActionFailCause_NoItem"
---| "ENUM_ActionFailCause_NotInZone"
---| "ENUM_ActionFailCause_NotInScriptZone"
---| "ENUM_ActionFailCause_NotManaCaster"
---| "ENUM_ActionFailCause_NotEnergyUser"
---| "ENUM_ActionFailCause_NotHonorUser"
---| "ENUM_ActionFailCause_WrongMobWorld"
---| "ENUM_ActionFailCause_NotInCombat"
---| "ENUM_ActionFailCause_InCombat"
---| "ENUM_ActionFailCause_CannotStrike"
---| "ENUM_ActionFailCause_TooClose"
---| "ENUM_ActionFailCause_NoShield"
---| "ENUM_ActionFailCause_NoMainhandWeapon"
---| "ENUM_ActionFailCause_NotEnoughMana"
---| "ENUM_ActionFailCause_NotEnoughEnergy"
---| "ENUM_ActionFailCause_NotEnoughHonor"
---| "ENUM_ActionFailCause_NoBuff"
---| "ENUM_ActionFailCause_InterruptedMove"
---| "ENUM_ActionFailCause_InterruptedRotate"
---| "ENUM_ActionFailCause_Canceled"
---| "ENUM_ActionFailCause_Fizzled"
---| "ENUM_ActionFailCause_Evaded"
---| "ENUM_ActionFailCause_QuestNotActive"
---| "ENUM_ActionFailCause_CreatureLevelTooSmall"
---| "ENUM_ActionFailCause_QuestNotFinished"
---| "ENUM_ActionFailCause_NotNeededForQuests"
---| "ENUM_ActionFailCause_QuestAlreadyVisitedScriptZone"
---| "ENUM_ActionFailCause_QuestActive"
---| "ENUM_ActionFailCause_HasNoQuestsOnCooldown"
---| "ENUM_ActionFailCause_WrongFaction"
---| "ENUM_ActionFailCause_InterruptedDamage"
---| "ENUM_ActionFailCause_InterruptedChangeTarget"
---| "ENUM_ActionFailCause_HealthNotLower"
---| "ENUM_ActionFailCause_HealthNotHigher"
---| "ENUM_ActionFailCause_LootableOccupied"
---| "ENUM_ActionFailCause_Dead"
---| "ENUM_ActionFailCause_MorePowerfulEffectActive"
---| "ENUM_ActionFailCause_HavePet"
---| "ENUM_ActionFailCause_DontHavePet"
---| "ENUM_ActionFailCause_PvpFlagSet"
---| "ENUM_ActionFailCause_PvpFlagNotSet"
---| "ENUM_ActionFailCause_NotEnoughSkillScore"
---| "ENUM_ActionFailCause_HasSkill"
---| "ENUM_ActionFailCause_NotAvatar"
---| "ENUM_ActionFailCause_NotMob"
---| "ENUM_ActionFailCause_NotDead"
---| "ENUM_ActionFailCause_NotAlive"
---| "ENUM_ActionFailCause_ResurrectNotActive"
---| "ENUM_ActionFailCause_ExploitForQuestsOnly"
---| "ENUM_ActionFailCause_CannotBeResized"
---| "ENUM_ActionFailCause_QuestCounterLessThenTest"
---| "ENUM_ActionFailCause_QuestStatusMismatch"
---| "ENUM_ActionFailCause_CannotAttack"
---| "ENUM_ActionFailCause_CartridgeBeltIsEmpty"
---| "ENUM_ActionFailCause_CartridgeBeltIsFull"
---| "ENUM_ActionFailCause_NoCartridgeBelt"
---| "ENUM_ActionFailCause_NoPsionicContact"
---| "ENUM_ActionFailCause_PsionicContactHasNoBuff"
---| "ENUM_ActionFailCause_StatTooLow"
---| "ENUM_ActionFailCause_DeviceAlreadyInUse"
---| "ENUM_ActionFailCause_CreatureIsTooFat"
---| "ENUM_ActionFailCause_DeviceBroken"
---| "ENUM_ActionFailCause_DeviceOffline"
---| "ENUM_ActionFailCause_TargetNotVisible"
---| "ENUM_ActionFailCause_NotEnoughCombatAdvantage"
---| "ENUM_ActionFailCause_BuffStackCountNotInRange"
---| "ENUM_ActionFailCause_NothingToDispel"
---| "ENUM_ActionFailCause_NoPlane"
---| "ENUM_ActionFailCause_VariableValueIsTooSmall"
---| "ENUM_ActionFailCause_VariableValueIsTooBig"
---| "ENUM_ActionFailCause_NoVariable"
---| "ENUM_ActionFailCause_InvalidPos"
---| "ENUM_ActionFailCause_NotOnBoundShip"
---| "ENUM_ActionFailCause_NoStolenLoot"
---| "ENUM_ActionFailCause_CannotGetAddressImmediately"
---| "ENUM_ActionFailCause_DruidPetIsNotActive"
---| "ENUM_ActionFailCause_NoBoundShip"
---| "ENUM_ActionFailCause_NoShipInProgress"
---| "ENUM_ActionFailCause_ShipInProgressNotComplete"
---| "ENUM_ActionFailCause_ShipInProgressNotSummoned"
---| "ENUM_ActionFailCause_NoShipInRepair"
---| "ENUM_ActionFailCause_HonorNotLess"
---| "ENUM_ActionFailCause_NoForagingInstrument"
---| "ENUM_ActionFailCause_NoForagingDeviceFound"
---| "ENUM_ActionFailCause_ForagingSkillNotEnough"
---| "ENUM_ActionFailCause_ReputationNotLess"
---| "ENUM_ActionFailCause_ReputationLevelNotLess"
---| "ENUM_ActionFailCause_NotOurShip"
---| "ENUM_ActionFailCause_TooHigh"
---| "ENUM_ActionFailCause_NoAbility"
---| "ENUM_ActionFailCause_NoFairy"
---| "ENUM_ActionFailCause_InvalidFairyRank"
---| "ENUM_ActionFailCause_FairyNotActive"
---| "ENUM_ActionFailCause_NoSpell"
---| "ENUM_ActionFailCause_DressedItemCannotBeUpgraded"
---| "ENUM_ActionFailCause_NothingToTalkAbout"
---| "ENUM_ActionFailCause_NoContentKey"
---| "ENUM_ActionFailCause_NoSpellInSpellBook"
---| "ENUM_ActionFailCause_NotEnoughMoney"
---| "ENUM_ActionFailCause_PetHealthNotHigher"
---| "ENUM_ActionFailCause_NotEnoughAlternativeCurrency"
---| "ENUM_ActionFailCause_CannotLearnSkill"
---| "ENUM_ActionFailCause_CantSummonShipHere"
---| "ENUM_ActionFailCause_CannotConvertItems"
---| "ENUM_ActionFailCause_HasNotGuildRight"
---| "ENUM_ActionFailCause_NotUnlocked"
---| "ENUM_ActionFailCause_GroupInviteOtherShip"
---| "ENUM_ActionFailCause_AlreadyHaveShip"
---| "ENUM_ActionFailCause_TeleportTargetNotFound"
---| "ENUM_ActionFailCause_InvalidShipName"
---| "ENUM_ActionFailCause_ShipNameAlreadyUsed"
---| "ENUM_ActionFailCause_GuildCreateWrongPlace"
---| "ENUM_ActionFailCause_GuildCreateMemberBusy"
---| "ENUM_ActionFailCause_GuildCreateAlreadyInGuild"
---| "ENUM_ActionFailCause_RaidInviteOtherShip"
---| "ENUM_ActionFailCause_NotEnoughRepairMats"
---| "ENUM_ActionFailCause_ShipDoesNotNeedRepair"
---| "ENUM_ActionFailCause_UnstuckNotAllowed"
---| "ENUM_ActionFailCause_ItemMoveNotAvailable"
---| "ENUM_ActionFailCause_LootOpenOccupied"
---| "ENUM_ActionFailCause_NoLoot"
---| "ENUM_ActionFailCause_DepositeBoxAlreadyOpened"
---| "ENUM_ActionFailCause_DepositeBoxNotOpened"
---| "ENUM_ActionFailCause_DepositeBoxUpdateEmptySlot"
---| "ENUM_ActionFailCause_DepositeBoxUpdateNotBox"
---| "ENUM_ActionFailCause_DepositeBoxUpdateTooSmall"
---| "ENUM_ActionFailCause_DepositeBoxPutNoSpace"
---| "ENUM_ActionFailCause_DepositeBoxItemCannotBePut"
---| "ENUM_ActionFailCause_NoSkill"
---| "ENUM_ActionFailCause_NoProficiency"
---| "ENUM_ActionFailCause_NoItemWithRune"
---| "ENUM_ActionFailCause_NotEnoughInsight"
---| "ENUM_ActionFailCause_NoReturnPoint"
---| "ENUM_ActionFailCause_ScanPortalNotFound"
---| "ENUM_ActionFailCause_ScanIslandNotFound"
---| "ENUM_ActionFailCause_ScanContinentNotFound"
---| "ENUM_ActionFailCause_ScanWreckNotFound"
---| "ENUM_ActionFailCause_ScanShipNotFound"
---| "ENUM_ActionFailCause_NotOnLand"
---| "ENUM_ActionFailCause_DeviceActionDisabled"
---| "ENUM_ActionFailCause_DeviceActionOnCooldown"
---| "ENUM_ActionFailCause_NotOnEnemyShip"
---| "ENUM_ActionFailCause_NotOnFriendlyShip"
---| "ENUM_ActionFailCause_NoMorePowerfulBuff"
---| "ENUM_ActionFailCause_DeviceNotNear"
---| "ENUM_ActionFailCause_MobNotNear"
---| "ENUM_ActionFailCause_ProjectileNotNear"
---| "ENUM_ActionFailCause_CaptainCantTeleportToAllod"
---| "ENUM_ActionFailCause_AvatarNotCapableForAllod"
---| "ENUM_ActionFailCause_AvatarBindedToAnotherAllod"
---| "ENUM_ActionFailCause_CannotEnterMapInCombat"
---| "ENUM_ActionFailCause_NoFreeStableSlots"
---| "ENUM_ActionFailCause_DontHaveMount"
---| "ENUM_ActionFailCause_AlreadyHaveMount"
---| "ENUM_ActionFailCause_ShipNotInCustomizeMode"
---| "ENUM_ActionFailCause_NoShipInUpgrade"
---| "ENUM_ActionFailCause_NotOnIsland"
---| "ENUM_ActionFailCause_CantRideIndoor"
---| "ENUM_ActionFailCause_FairyAutoFeedIsOff"
---| "ENUM_ActionFailCause_NoFairyAutoFeedItem"
---| "ENUM_ActionFailCause_HangarIsNotEmpty"
---| "ENUM_ActionFailCause_InAstral"
---| "ENUM_ActionFailCause_PurifySlotOutOfBounds"
---| "ENUM_ActionFailCause_PurifyEmptySlot"
---| "ENUM_ActionFailCause_ItemNotCursed"
---| "ENUM_ActionFailCause_CannotPurifyStack"
---| "ENUM_ActionFailCause_ItemIsNotPurifier"
---| "ENUM_ActionFailCause_PurifierCannotPurifyThis"
---| "ENUM_ActionFailCause_MustOwnShipToUpgrade"
---| "ENUM_ActionFailCause_NotAllowedToStartReadyCheck"
---| "ENUM_ActionFailCause_ReadyCheckAlreadyInProgress"
---| "ENUM_ActionFailCause_HaveNoTargetShip"
---| "ENUM_ActionFailCause_UsingIncorrectDevice"
---| "ENUM_ActionFailCause_EnemiesNear"
---| "ENUM_ActionFailCause_SlotCannotBeEmpty"
---| "ENUM_ActionFailCause_TransportIsOverloaded"
---| "ENUM_ActionFailCause_NotADweller"
---| "ENUM_ActionFailCause_NotAllowedToListTWarAuctions"
---| "ENUM_ActionFailCause_NotAllowedToBidTWarAuction"
---| "ENUM_ActionFailCause_NotInAffectGroup"
---| "ENUM_ActionFailCause_CannotLootThisTreasure"
---| "ENUM_ActionFailCause_QuestBookTooBig"
---| "ENUM_ActionFailCause_ShipIsNotPersistent"
---| "ENUM_ActionFailCause_NotGuildLeader"
---| "ENUM_ActionFailCause_GuildProgressAlreadyEnabled"
---| "ENUM_ActionFailCause_IncorrectGuildLevel"
---| "ENUM_ActionFailCause_MetaSourceSlotOutOfBounds"
---| "ENUM_ActionFailCause_MetaEnhancerSlotOutOfBounds"
---| "ENUM_ActionFailCause_MetaAgentSlotOutOfBounds"
---| "ENUM_ActionFailCause_MetaSourceSlotEqualsEnhancerSlot"
---| "ENUM_ActionFailCause_MetaSourceSlotEmpty"
---| "ENUM_ActionFailCause_MetaEnhancerSlotEmpty"
---| "ENUM_ActionFailCause_MetaAgentSlotEmpty"
---| "ENUM_ActionFailCause_MetaItemNotMeta"
---| "ENUM_ActionFailCause_MetaCannotUpgradeStack"
---| "ENUM_ActionFailCause_MetaEnhancerIsDifferent"
---| "ENUM_ActionFailCause_MetaAgentIsNotAgent"
---| "ENUM_ActionFailCause_MetaWrongAgentCount"
---| "ENUM_ActionFailCause_MetaCannotUpgradeMaxQuality"
---| "ENUM_ActionFailCause_NoNecessaryGuildTabardRight"
---| "ENUM_ActionFailCause_NoCustomizeCurrency"
---| "ENUM_ActionFailCause_NoGuildProgress"
---| "ENUM_ActionFailCause_PeerNoSpaceInBag"
---| "ENUM_ActionFailCause_MountIsHungry"
---| "ENUM_ActionFailCause_NotOnTWar"
---| "ENUM_ActionFailCause_OtherMap"
---| "ENUM_ActionFailCause_SectorUnavailable"
---| "ENUM_ActionFailCause_SectorIsFactionRestricted"
---| "ENUM_ActionFailCause_InHangar"
---| "ENUM_ActionFailCause_NotInHangar"
---| "ENUM_ActionFailCause_TreasuryIsNotEmpty"
---| "ENUM_ActionFailCause_OnAstralIsland"
---| "ENUM_ActionFailCause_CantRideInZone"
---| "ENUM_ActionFailCause_NotMounted"
---| "ENUM_ActionFailCause_NoAssistant"
---| "ENUM_ActionFailCause_NoUsedStatPoints"
---| "ENUM_ActionFailCause_NotMarried"
---| "ENUM_ActionFailCause_NoGuildRenameMark"
---| "ENUM_ActionFailCause_NoGuild"
---| "ENUM_ActionFailCause_CCItemsProhibited"
---| "ENUM_ActionFailCause_GoalIsNotCompleted"
---| "ENUM_ActionFailCause_RuleIsNotActive"
---| "ENUM_ActionFailCause_MetaItemNotAppear"
---| "ENUM_ActionFailCause_AvatarNotUsedTeleport"
---| "ENUM_ActionFailCause_NotLookingForGroup"

---@alias ENUM_ACTION
---| "ENUM_ACTION_RESULT_SPECIAL_UNKNOWN"
---| "ENUM_ACTION_RESULT_SPECIAL_STARTED"
---| "ENUM_ACTION_RESULT_SPECIAL_LAUNCHED"
---| "ENUM_ACTION_RESULT_SPECIAL_NO_RANGED_WEAPON"

---@alias ENUM_ADDON
---| "ENUM_ADDON_HEALTH_STATUS_GOOD"
---| "ENUM_ADDON_HEALTH_STATUS_AVERAGE"

---@enum AFCT
AFCT = {
  AFCT_Simple = 0,
  AFCT_List = 1,
  AFCT_Or = 2,
  AFCT_And = 3,
  AFCT_Pet = 4,
  AFCT_Not = 5,
}

---@alias ENUM
---| "ENUM_AffectGroup_All"
---| "ENUM_AffectGroup_Group"
---| "ENUM_AffectGroup_Raid"
---| "ENUM_AffectGroup_Friends"
---| "ENUM_AffectGroup_Enemies"

---@alias ENUM_AlignX
---| "ENUM_AlignX_DEFAULT"
---| "ENUM_AlignX_LEFT"
---| "ENUM_AlignX_CENTER"
---| "ENUM_AlignX_RIGHT"
---| "ENUM_AlignX_JUSTIFY"
---| "ENUM_AlignX_NONE"

---@alias ENUM_AlignY
---| "ENUM_AlignY_TOP"
---| "ENUM_AlignY_MIDDLE"
---| "ENUM_AlignY_BOTTOM"
---| "ENUM_AlignY_DEBUG"

---@enum ATTACHED
ATTACHED = {
  ATTACHED_OBJECT_POS_BOTTOM = 0,
  ATTACHED_OBJECT_POS_CENTER = 1,
  ATTACHED_OBJECT_POS_UP = 2,
}

---@alias ENUM_AuctionBidResultMsgResult
---| "ENUM_AuctionBidResultMsgResult_SUCCESS"
---| "ENUM_AuctionBidResultMsgResult_ERROR"
---| "ENUM_AuctionBidResultMsgResult_NOMONEY"
---| "ENUM_AuctionBidResultMsgResult_OLDVERSION"
---| "ENUM_AuctionBidResultMsgResult_SAMEUSER"
---| "ENUM_AuctionBidResultMsgResult_NOTFOUND"

---@alias ENUM_AuctionCreateResultMsg
---| "ENUM_AuctionCreateResultMsgResult_SUCCESS"
---| "ENUM_AuctionCreateResultMsgResult_ERROR"
---| "ENUM_AuctionCreateResultMsgResult_NOITEM"
---| "ENUM_AuctionCreateResultMsgResult_NOMONEY"

---@enum AUCTION
AUCTION = {
  AUCTION_CREATETIME_HOURS12 = 0,
  AUCTION_CREATETIME_HOURS24 = 1,
  AUCTION_CREATETIME_HOURS36 = 2,
  AUCTION_CREATETIME_HOURS48 = 3,
}

---@alias ENUM_AuctionDescriptorParticipationStatus
---| "ENUM_AuctionDescriptorParticipationStatus_NONE"
---| "ENUM_AuctionDescriptorParticipationStatus_OWNER"
---| "ENUM_AuctionDescriptorParticipationStatus_WINNER"

---@alias ENUM_AuctionDiscardResultMsgResult
---| "ENUM_AuctionDiscardResultMsgResult_SUCCESS"
---| "ENUM_AuctionDiscardResultMsgResult_ERROR"
---| "ENUM_AuctionDiscardResultMsgResult_NOMONEY"
---| "ENUM_AuctionDiscardResultMsgResult_OLDVERSION"

---@alias ENUM_AuctionGetParamsResultMsgStatus
---| "ENUM_AuctionGetParamsResultMsgStatus_SUCCESS"
---| "ENUM_AuctionGetParamsResultMsgStatus_ERROR"

---@alias ENUM_AuctionGetResultMsgResult
---| "ENUM_AuctionGetResultMsgResult_SUCCESS"
---| "ENUM_AuctionGetResultMsgResult_NOTFOUND"
---| "ENUM_AuctionGetResultMsgResult_ERROR"

---@enum AUCTION
AUCTION = {
  AUCTION_ORDERFIELD_NAME = 0,
  AUCTION_ORDERFIELD_CLASS = 1,
  AUCTION_ORDERFIELD_SLOT = 2,
  AUCTION_ORDERFIELD_RARETY = 3,
  AUCTION_ORDERFIELD_LEVEL = 4,
  AUCTION_ORDERFIELD_TYPE = 5,
  AUCTION_ORDERFIELD_BID = 6,
  AUCTION_ORDERFIELD_BUYOUT = 7,
  AUCTION_ORDERFIELD_LEFTTIME = 8,
  AUCTION_ORDERFIELD_NONE = 9,
}

---@alias ENUM_AuctionSearchResultMsgResult
---| "ENUM_AuctionSearchResultMsgResult_SUCCESS"
---| "ENUM_AuctionSearchResultMsgResult_NOLANG"
---| "ENUM_AuctionSearchResultMsgResult_ERROR"

---@alias ENUM_AvatarFriendIgnoreListsError
---| "ENUM_AvatarFriendIgnoreListsError_ServiceNotReady"
---| "ENUM_AvatarFriendIgnoreListsError_EntryAlreadyExists"
---| "ENUM_AvatarFriendIgnoreListsError_NoSuchEntry"
---| "ENUM_AvatarFriendIgnoreListsError_InternalError"
---| "ENUM_AvatarFriendIgnoreListsError_AvatarNotFound"
---| "ENUM_AvatarFriendIgnoreListsError_ListOverflow"

---@alias AvatarKickCause
---| "ENUM_AvatarKickCause_Void"
---| "ENUM_AvatarKickCause_ExtraAvatar"
---| "ENUM_AvatarKickCause_InvalidGuild"
---| "ENUM_AvatarKickCause_NoGuild"
---| "ENUM_AvatarKickCause_NoTabard"
---| "ENUM_AvatarKickCause_NoGroup"
---| "ENUM_AvatarKickCause_NoRaid"
---| "ENUM_AvatarKickCause_LevelControl"
---| "ENUM_AvatarKickCause_EventFinished"
---| "ENUM_AvatarKickCause_NoShip"
---| "ENUM_AvatarKickCause_InvalidMap"
---| "ENUM_AvatarKickCause_RaidVarsConflict"

---@alias ENUM_AvatarOnlineStatus
---| "ENUM_AvatarOnlineStatus_Offline"
---| "ENUM_AvatarOnlineStatus_Online"
---| "ENUM_AvatarOnlineStatus_OnAlt"
---| "ENUM_AvatarOnlineStatus_Shadow"

---@alias ENUM_RecapturablePlayerSpawnPlaceState
---| "ENUM_RecapturablePlayerSpawnPlaceState_Free"
---| "ENUM_RecapturablePlayerSpawnPlaceState_UnderAssault"
---| "ENUM_RecapturablePlayerSpawnPlaceState_AssaultFrozen"
---| "ENUM_RecapturablePlayerSpawnPlaceState_Captured"
---| "ENUM_RecapturablePlayerSpawnPlaceState_Void"

---@alias ENUM_BeastType
---| "ENUM_BeastType_AE"
---| "ENUM_BeastType_Pack"
---| "ENUM_BeastType_Solo"
---| "ENUM_BeastType_Boss"
---| "ENUM_BeastType_Endboss"

---@enum BLEND
BLEND = {
  BLEND_EFFECT_ALPHABLND = 0,
  BLEND_EFFECT_HIGHLIGHT = 1,
  BLEND_EFFECT_ADD = 2,
  BLEND_EFFECT_MUL = 3,
  BLEND_EFFECT_REPLACE = 4,
}

---@alias ENUM_BoxOperationResult
---| "ENUM_BoxOperationResult_SlotNumberOutOfBounds"
---| "ENUM_BoxOperationResult_SlotIsEmpty"
---| "ENUM_BoxOperationResult_NoFreeSpace"
---| "ENUM_BoxOperationResult_ItemIsNotBox"
---| "ENUM_BoxOperationResult_ItemIsNotKey"
---| "ENUM_BoxOperationResult_BoxLocked"
---| "ENUM_BoxOperationResult_BoxUnlocked"
---| "ENUM_BoxOperationResult_KeyDoesNotMatch"
---| "ENUM_BoxOperationResult_OperationSuccess"
---| "ENUM_BoxOperationResult_TransactionFailed"
---| "ENUM_BoxOperationResult_WrongStackCount"

---@alias ENUM_CANNON
---| "ENUM_CANNON_VISUAL_TYPE_CORVET"
---| "ENUM_CANNON_VISUAL_TYPE_BRIG"

---@alias ENUM_ChatFailedType
---| "ENUM_ChatFailedType_Mute"
---| "ENUM_ChatFailedType_InternalError"
---| "ENUM_ChatFailedType_Silence"
---| "ENUM_ChatFailedType_NoPoints"
---| "ENUM_ChatFailedType_EnemyFaction"
---| "ENUM_ChatFailedType_Ignored"

---@enum CHOICE
CHOICE = {
  CHOICE_GREED_NEED_PASS = 0,
  CHOICE_GREED_NEED_GREED = 1,
  CHOICE_GREED_NEED_NEED = 2,
}

---@alias ENUM_ColorType
---| "ENUM_ColorType_TEXT"
---| "ENUM_ColorType_SHADOW"
---| "ENUM_ColorType_OUTLINE"

---@alias ENUM_CreateMailResult
---| "ENUM_CreateMailResult_Succeeded"
---| "ENUM_CreateMailResult_InvalidMoneyAmount"
---| "ENUM_CreateMailResult_TooManyItemsAttached"
---| "ENUM_CreateMailResult_UnknownReceiver"
---| "ENUM_CreateMailResult_AbonentsCannotParticipateByMail"
---| "ENUM_CreateMailResult_InternalSystemError"
---| "ENUM_CreateMailResult_NotEnoughMoney"
---| "ENUM_CreateMailResult_NotEnoughItems"
---| "ENUM_CreateMailResult_NotEnoughMoneyAndItems"
---| "ENUM_CreateMailResult_NotTalkingToMailBox"
---| "ENUM_CreateMailResult_NoSubject"
---| "ENUM_CreateMailResult_ItemBound"

---@alias CreateRevivalRollResultStatus
---| "ENUM_CreateRevivalRollResultStatus_Success"
---| "ENUM_CreateRevivalRollResultStatus_InternalError"
---| "ENUM_CreateRevivalRollResultStatus_AccountNotFound"
---| "ENUM_CreateRevivalRollResultStatus_WrongReferOwner"
---| "ENUM_CreateRevivalRollResultStatus_ActiveAccount"
---| "ENUM_CreateRevivalRollResultStatus_AlreadySent"
---| "ENUM_CreateRevivalRollResultStatus_LimitExceeded"
---| "ENUM_CreateRevivalRollResultStatus_WrongAvatarLevel"
---| "ENUM_CreateRevivalRollResultStatus_NoContentKey"

---@alias ENUM_CreatureRace
---| "ENUM_CreatureRace_HUMANOID"
---| "ENUM_CreatureRace_BEAST"
---| "ENUM_CreatureRace_UNDEAD"
---| "ENUM_CreatureRace_GIANT"
---| "ENUM_CreatureRace_DRAGON"
---| "ENUM_CreatureRace_ELEMENTAL"
---| "ENUM_CreatureRace_DEMON"
---| "ENUM_CreatureRace_ABERRATION"
---| "ENUM_CreatureRace_MECHANICAL"
---| "ENUM_CreatureRace_GOBLIN"
---| "ENUM_CreatureRace_DIVINE"
---| "ENUM_CreatureRace_KOBOLD"
---| "ENUM_CreatureRace_SPIRIT"
---| "ENUM_CreatureRace_HUMANOID"
---| "ENUM_CreatureRace_BEAST"
---| "ENUM_CreatureRace_UNDEAD"
---| "ENUM_CreatureRace_GIANT"
---| "ENUM_CreatureRace_DRAGON"
---| "ENUM_CreatureRace_ELEMENTAL"
---| "ENUM_CreatureRace_DEMON"
---| "ENUM_CreatureRace_ABERRATION"
---| "ENUM_CreatureRace_MECHANICAL"
---| "ENUM_CreatureRace_GOBLIN"
---| "ENUM_CreatureRace_DIVINE"
---| "ENUM_CreatureRace_KOBOLD"
---| "ENUM_CreatureRace_SPIRIT"

---@alias ENUM_CreatureStat
---| "ENUM_CreatureStat_HealthRegen"
---| "ENUM_CreatureStat_ManaRegen"
---| "ENUM_CreatureStat_Power"
---| "ENUM_CreatureStat_Wisdom"
---| "ENUM_CreatureStat_Stamina"

---@alias ENUM_CriticalMalfunctionType
---| "ENUM_CriticalMalfunctionType_CMT_ReactorShutdown"
---| "ENUM_CriticalMalfunctionType_CMT_ManaBurst"
---| "ENUM_CriticalMalfunctionType_CMT_EngineShutdown"
---| "ENUM_CriticalMalfunctionType_CMT_RudderStuck"
---| "ENUM_CriticalMalfunctionType_CMT_RudderBrokenLeft"
---| "ENUM_CriticalMalfunctionType_CMT_RudderBrokenRight"
---| "ENUM_CriticalMalfunctionType_CMT_DoubleDeath"
---| "ENUM_CriticalMalfunctionType_CMT_CriticalMiss"

---@alias ENUM_CURRENCY
---| "ENUM_CURRENCY_STORAGE_AVATAR"
---| "ENUM_CURRENCY_STORAGE_GUILD"
---| "ENUM_CURRENCY_STORAGE_SOUL"

---@alias ENUM
---| "ENUM_Monday"
---| "ENUM_Tuesday"
---| "ENUM_Wednesday"
---| "ENUM_Thursday"
---| "ENUM_Friday"
---| "ENUM_Saturday"
---| "ENUM_Sunday"

---@alias ENUM_DevelopmentSource
---| "ENUM_DevelopmentSource_Kill"
---| "ENUM_DevelopmentSource_Quest"
---| "ENUM_DevelopmentSource_Cheat"
---| "ENUM_DevelopmentSource_Fatigue"
---| "ENUM_DevelopmentSource_Impact"
---| "ENUM_DevelopmentSource_ImpactDirect"

---@alias ENUM_DevelopmentTrack
---| "ENUM_DevelopmentTrack_Experience"
---| "ENUM_DevelopmentTrack_Reputation"

---@alias ENUM_DiceCraftCmdType
---| "ENUM_DiceCraftCmdType_PutItem"
---| "ENUM_DiceCraftCmdType_EmptySlot"
---| "ENUM_DiceCraftCmdType_StartGame"
---| "ENUM_DiceCraftCmdType_Reroll"
---| "ENUM_DiceCraftCmdType_FinishGame"
---| "ENUM_DiceCraftCmdType_CancelGame"
---| "ENUM_DiceCraftCmdType_UseInspiration"
---| "ENUM_DiceCraftCmdType_IncQualification"

---@alias ENUM

---@alias DisassemblingResult
---| "ENUM_DisassemblingFailCause_NoFail"
---| "ENUM_DisassemblingFailCause_ItemType"
---| "ENUM_DisassemblingFailCause_ItemLevel"
---| "ENUM_DisassemblingFailCause_System"
---| "ENUM_DisassemblingFailCause_NotDisassembler"
---| "ENUM_DisassemblingFailCause_NoSkill"
---| "ENUM_DisassemblingOperationResult_SlotNumberOutOfBounds"
---| "ENUM_DisassemblingOperationResult_SlotIsEmpty"
---| "ENUM_DisassemblingOperationResult_ItemIsNotDisassembler"
---| "ENUM_DisassemblingOperationResult_CannotDisassembleThis"
---| "ENUM_DisassemblingOperationResult_AvatarBusy"
---| "ENUM_DisassemblingOperationResult_Success"

---@alias ENUM

---@alias ENUM
---| "ENUM_DominationFightTeam_First"
---| "ENUM_DominationFightTeam_Second"
---| "ENUM_DominationFightTeam_Null"

---@alias ENUM_DressResult
---| "ENUM_DressResult_Success"
---| "ENUM_DressResult_FailureVoid"
---| "ENUM_DressResult_Undressable"
---| "ENUM_DressResult_WrongSlot"
---| "ENUM_DressResult_WrongCharacterClass"
---| "ENUM_DressResult_WrongCreatureLevel"
---| "ENUM_DressResult_NoSpace"
---| "ENUM_DressResult_TooSmallBag"
---| "ENUM_DressResult_NotProficient"
---| "ENUM_DressResult_InCombat"
---| "ENUM_DressResult_WrongDress"
---| "ENUM_DressResult_SecondaryDressLocked"
---| "ENUM_DressResult_SlotLocked"
---| "ENUM_DressResult_SmallerBag"
---| "ENUM_DressResult_SmallerDepositBox"
---| "ENUM_DressResult_EnchantLocked"
---| "ENUM_DressResult_DuplicateItem"

---@enum DRESS
DRESS = {
  DRESS_SLOT_HELM = 0,
  DRESS_SLOT_ARMOR = 1,
  DRESS_SLOT_PANTS = 2,
  DRESS_SLOT_BOOTS = 3,
  DRESS_SLOT_MANTLE = 4,
  DRESS_SLOT_GLOVES = 5,
  DRESS_SLOT_BRACERS = 6,
  DRESS_SLOT_BELT = 7,
  DRESS_SLOT_RING1 = 8,
  DRESS_SLOT_RING2 = 9,
  DRESS_SLOT_EARRING1 = 10,
  DRESS_SLOT_NECKLACE = 11,
  DRESS_SLOT_CLOAK = 12,
  DRESS_SLOT_SHIRT = 13,
  DRESS_SLOT_MAINHAND = 14,
  DRESS_SLOT_OFFHAND = 15,
  DRESS_SLOT_RANGED = 16,
  DRESS_SLOT_AMMO = 17,
  DRESS_SLOT_TABARD = 18,
  DRESS_SLOT_TRINKET = 19,
  DRESS_SLOT_BAG = 20,
  DRESS_SLOT_DEATHINSURANCE = 21,
  DRESS_SLOT_LIFESTYLEHEAD = 22,
  DRESS_SLOT_LIFESTYLEBACK = 23,
  DRESS_SLOT_LIFESTYLESUIT = 24,
  DRESS_SLOT_LIFESTYLEUNDERWEAR = 25,
  DRESS_SLOT_LIFESTYLESHOULDER = 26,
  DRESS_SLOT_LIFESTYLEPET = 27,
  DRESS_SLOT_POWEREDLSWEAPON = 28,
  DRESS_SLOT_EARRING2 = 29,
  DRESS_SLOT_DEPOSITBOX = 30,
  DRESS_SLOT_OFFENSIVERUNE1 = 31,
  DRESS_SLOT_OFFENSIVERUNE2 = 32,
  DRESS_SLOT_OFFENSIVERUNE3 = 33,
  DRESS_SLOT_DEFENSIVERUNE1 = 34,
  DRESS_SLOT_DEFENSIVERUNE2 = 35,
  DRESS_SLOT_DEFENSIVERUNE3 = 36,
  DRESS_SLOT_LIFESTYLESHOULDER = 37,
  DRESS_SLOT_POWEREDLSWEAPON = 38,
  DRESS_SLOT_HIDDENPOWER = 39,
  DRESS_SLOT_LIFESTYLEPET = 40,
  DRESS_SLOT_HAT = 41,
  DRESS_SLOT_UNDRESSABLE = 42,
  DRESS_SLOT_TWOHANDED = 43,
  DRESS_SLOT_DUALWIELD = 44,
  DRESS_SLOT_RING = 45,
  DRESS_SLOT_EARRINGS = 46,
  DRESS_SLOT_RUNE = 47,
  DRESS_SLOT_ARTIFACT = 48,
  DRESS_SLOT_ARTIFACT1 = 49,
  DRESS_SLOT_ARTIFACT2 = 50,
  DRESS_SLOT_ARTIFACT3 = 51,
  DRESS_SLOT_NONPREVIEW = 52,
}

---@enum DummyType
DummyType = {
  DUMMY_TYPE_PRIMARY = 0,
  DUMMY_TYPE_SECONDARY = 1,
  DUMMY_TYPE_TERTIARY = 2,
  DUMMY_TYPE_QUATERNARY = 3,
}

---@enum EFFECT
EFFECT = {
}

---@alias ENUM_EnchantInsertionResult
---| "ENUM_EnchantInsertionResult_SUCCESS"
---| "ENUM_EnchantInsertionResult_UNKNOWN"
---| "ENUM_EnchantInsertionResult_ITEM_UNBOUND"
---| "ENUM_EnchantInsertionResult_UNFITTED_ITEM_STATS"
---| "ENUM_EnchantInsertionResult_UNFITTED_DRESS_SLOT_UNLOCKS"

---@alias ENUM_EnchantSlot
---| "ENUM_EnchantSlot_Offence"
---| "ENUM_EnchantSlot_Defence"
---| "ENUM_EnchantSlot_Special"
---| "ENUM_EnchantSlot_Offence"
---| "ENUM_EnchantSlot_Defence"
---| "ENUM_EnchantSlot_Special"

---@alias EventGoalState
---| "ENUM_EventGoalState_Active"
---| "ENUM_EventGoalState_Success"
---| "ENUM_EventGoalState_Failed"

---@alias EventGoalType
---| "ENUM_EventGoalType_KillMobs"
---| "ENUM_EventGoalType_DefenceMobs"
---| "ENUM_EventGoalType_Survive"
---| "ENUM_EventGoalType_ElementProgress"

---@alias ExchangeResult
---| "ENUM_MsgStartExchangeResultResult_SUCCESS"
---| "ENUM_MsgStartExchangeResultResult_ERROR"
---| "ENUM_MsgStartExchangeResultResult_INVITEDAVATARISBUSY"
---| "ENUM_MsgStartExchangeResultResult_INVITERAVATARISBUSY"
---| "ENUM_MsgStartExchangeResultResult_INVITEDAVATARNOTFOUND"
---| "ENUM_MsgStartExchangeResultResult_TOOFAR"
---| "ENUM_MsgStartExchangeResultResult_INVITEDAVATARISDEAD"
---| "ENUM_MsgStartExchangeResultResult_INVITERAVATARISDEAD"
---| "ENUM_MsgStartExchangeResultResult_YOUAREINVISIBLE"
---| "ENUM_MsgExchangeErrorErrorType_MONEYNOTENOUGH"
---| "ENUM_MsgExchangeErrorErrorType_PRIMARYCONFIRMATIONREQUIRED"
---| "ENUM_MsgExchangeErrorErrorType_ITEMNOTFOUND"
---| "ENUM_MsgExchangeErrorErrorType_SLOTISUSED"
---| "ENUM_MsgExchangeErrorErrorType_ITEMISUSED"
---| "ENUM_MsgExchangeErrorErrorType_ITEMISBOUND"

---@alias ENUM_FailType
---| "ENUM_FailType_Offline"
---| "ENUM_FailType_NotOnShip"
---| "ENUM_FailType_NoHalo"
---| "ENUM_FailType_LowTierLevel"
---| "ENUM_FailType_NoTicket"
---| "ENUM_FailType_NoAstralMap"
---| "ENUM_FailType_NoJumpCurrency"

---@alias ENUM
---| "ENUM_FloatingBudgetType_MainBudget"
---| "ENUM_FloatingBudgetType_DefenceBudget"
---| "ENUM_FloatingBudgetType_OffenceBudget"

---@alias ENUM_GlobalScalerType
---| "ENUM_GlobalScalerType_MobExp"
---| "ENUM_GlobalScalerType_Authority"
---| "ENUM_GlobalScalerType_QuestExp"
---| "ENUM_GlobalScalerType_Reputation"
---| "ENUM_GlobalScalerType_QuestLoot"
---| "ENUM_GlobalScalerType_AstralLoot"
---| "ENUM_GlobalScalerType_GoldAndTrashDrop"
---| "ENUM_GlobalScalerType_WorldDrop"
---| "ENUM_GlobalScalerType_QuestMoney"
---| "ENUM_GlobalScalerType_PersonalDrop"

---@enum GOAL
GOAL = {
  GOAL_STATE_NOT_SHOWN = 0,
  GOAL_STATE_ACTIVE = 1,
  GOAL_STATE_COMPLETED = 2,
}

---@alias ENUM_GROUP
---| "ENUM_GROUP_INVITE_FAILED_NOT_EXIST"
---| "ENUM_GROUP_INVITE_FAILED_NOT_LOGGED_IN"
---| "ENUM_GROUP_INVITE_FAILED_CANT_INVITE_SELF"
---| "ENUM_GROUP_INVITE_FAILED_FULL_GROUP"
---| "ENUM_GROUP_INVITE_FAILED_ALREADY_IN"
---| "ENUM_GROUP_INVITE_FAILED_ZONE_NOT_ALLOWED"
---| "ENUM_GROUP_INVITE_FAILED_NOT_LEADER"

---@alias ENUM_GROUP
---| "ENUM_GROUP_KICK_FAILED_NOT_IN_GROUP"
---| "ENUM_GROUP_KICK_FAILED_OTHER_PLAYER_NOT_IN_GROUP"
---| "ENUM_GROUP_KICK_FAILED_NOT_LEADER"

---@enum GroupMemberState
GroupMemberState = {
  GROUP_MEMBER_STATE_OFFLINE = 0,
  GROUP_MEMBER_STATE_NEAR = 1,
  GROUP_MEMBER_STATE_FAR = 2,
  GROUP_MEMBER_STATE_MERC = 3,
  GROUP_MEMBER_STATE_AFK = 4,
}

---@alias ENUM_GuildBankOperation
---| "ENUM_GuildBankOperation_RaiseFunds"
---| "ENUM_GuildBankOperation_TransferMoney"
---| "ENUM_GuildBankOperation_GetHistory"

---@alias ENUM_BattleMemberRole
---| "ENUM_BattleMemberRole_Attacker"
---| "ENUM_BattleMemberRole_Defender"

---@alias ENUM
---| "ENUM_GuildBossAbilitySlot_CommonPassive"
---| "ENUM_GuildBossAbilitySlot_CommonActive"
---| "ENUM_GuildBossAbilitySlot_RarePassive"
---| "ENUM_GuildBossAbilitySlot_RareActive"
---| "ENUM_GuildBossAbilitySlot_LegendaryPassive"
---| "ENUM_GuildBossAbilitySlot_LegendaryActive"

---@alias ENUM

---@alias ENUM

---@enum GUILD
GUILD = {
  GUILD_MEMBER_RIGHT_CHAT = 0,
  GUILD_MEMBER_RIGHT_OFFICER_CHAT = 1,
  GUILD_MEMBER_RIGHT_RECRUIT = 2,
  GUILD_MEMBER_RIGHT_PROMOTE_DEMOTE = 3,
  GUILD_MEMBER_RIGHT_KICK = 4,
  GUILD_MEMBER_RIGHT_WEAR_SYMBOLICS = 5,
  GUILD_MEMBER_RIGHT_MODIFY_SYMBOLICS = 6,
  GUILD_MEMBER_RIGHT_MODIFY_MESSAGE = 7,
  GUILD_MEMBER_RIGHT_MODIFY_DESCRIPTION = 8,
  GUILD_MEMBER_RIGHT_MODIFY_MEMBER_DESCRIPTION = 9,
  GUILD_MEMBER_RIGHT_PUT_MONEY = 10,
  GUILD_MEMBER_RIGHT_GET_MONEY = 11,
  GUILD_MEMBER_RIGHT_DUE = 12,
  GUILD_MEMBER_RIGHT_MWAR_COMMANDER = 13,
  GUILD_MEMBER_RIGHT_APPLY_TALENTS = 14,
  GUILD_MEMBER_RIGHT_FORGET_TALENTS = 15,
  GUILD_MEMBER_RIGHT_DISTRIBUTE_TABARDS = 16,
  GUILD_MEMBER_RIGHT_CREATE_GUILD_HALL = 17,
}

---@alias ENUM_GUILD
---| "ENUM_GUILD_RESULT_NOT_ENOUGH_RIGHTS"
---| "ENUM_GUILD_RESULT_CANT_CREATE_WRONG_GROUP_SIZE"
---| "ENUM_GUILD_RESULT_CANT_CREATE_GROUP_MEMBER_TOO_FAR"
---| "ENUM_GUILD_RESULT_CANT_CREATE_NO_GROUP"
---| "ENUM_GUILD_RESULT_CANT_CREATE_NOT_GROUP_LEADER"
---| "ENUM_GUILD_RESULT_CANT_CREATE_PLAYER_ALREADY_IN_GUILD"
---| "ENUM_GUILD_RESULT_PLAYER_IS_NOT_IN_GUILD"
---| "ENUM_GUILD_RESULT_PLAYER_ALREADY_IN_GUILD"
---| "ENUM_GUILD_RESULT_CANT_OPERATE_WITH_THIS_RANK"
---| "ENUM_GUILD_RESULT_LEADER_CANT_LEAVE"
---| "ENUM_GUILD_RESULT_ALREADY_FULL"
---| "ENUM_GUILD_RESULT_NO_GUILD"
---| "ENUM_GUILD_RESULT_BANK_NOT_EMPTY"

---@enum GUILD
GUILD = {
  GUILD_SIMBOLICS_TEXTURE_TYPE_PATTERN = 0,
  GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM1 = 1,
  GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM2 = 2,
  GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM3 = 3,
  GUILD_SIMBOLICS_TEXTURE_TYPE_EMBLEM4 = 4,
}

---@alias ENUM_InnateStats
---| "ENUM_InnateStats_Plain"
---| "ENUM_InnateStats_Rage"
---| "ENUM_InnateStats_Finisher"
---| "ENUM_InnateStats_Lethality"
---| "ENUM_InnateStats_Vitality"
---| "ENUM_InnateStats_Endurance"
---| "ENUM_InnateStats_Lifesteal"
---| "ENUM_InnateStats_Will"
---| "ENUM_InnateStats_CritChance"
---| "ENUM_InnateStats_Plain"
---| "ENUM_InnateStats_Rage"
---| "ENUM_InnateStats_Finisher"
---| "ENUM_InnateStats_Lethality"
---| "ENUM_InnateStats_Vitality"
---| "ENUM_InnateStats_Endurance"
---| "ENUM_InnateStats_Lifesteal"
---| "ENUM_InnateStats_Will"
---| "ENUM_InnateStats_CritChance"

---@alias ENUM_InterfaceToggle
---| "ENUM_InterfaceToggle_Target_All"
---| "ENUM_InterfaceToggle_Target_ShipConstructionProgress"
---| "ENUM_InterfaceToggle_Target_ShipRepairProgress"

---@alias ENUM_InvalidNameKind
---| "ENUM_InvalidNameKind_AlreadyInUse"
---| "ENUM_InvalidNameKind_InternalError"
---| "ENUM_InvalidNameKind_InvalidLength"
---| "ENUM_InvalidNameKind_InvalidSubstring"
---| "ENUM_InvalidNameKind_InvalidSymbols"
---| "ENUM_InvalidNameKind_None"

---@enum ItemBinding
ItemBinding = {
  ITEM_BINDING_BIND_NONE = 0,
  ITEM_BINDING_BIND_ON_PICKUP = 1,
  ITEM_BINDING_BIND_ON_EQUIP = 2,
  ITEM_BINDING_BIND_ON_USE = 3,
}

---@enum ITEM
ITEM = {
  ITEM_CONT_EQUIPMENT = 0,
  ITEM_CONT_EQUIPMENT_RITUAL = 1,
  ITEM_CONT_EQUIPMENT_RITUAL_1 = 2,
  ITEM_CONT_EQUIPMENT_RITUAL_2 = 3,
  ITEM_CONT_EQUIPMENT_RITUAL_3 = 4,
  ITEM_CONT_INVENTORY = 5,
  ITEM_CONT_DEPOSITE = 6,
  ITEM_CONT_INVENTORY_OVERFLOW = 7,
  ITEM_CONT_BESTIARY = 8,
  ITEM_CONT_CHECKROOM = 9,
  ITEM_CONT_DEVICE_BAG = 10,
  ITEM_CONT_POWEREDLSWEAPON = 11,
  ITEM_CONT_GEMS = 12,
}

---@enum ITEMMALL
ITEMMALL = {
  ITEMMALL_ITEM_NOTITEMMALLABLE = 0,
  ITEMMALL_ITEM_ITEMMALLABLE = 1,
  ITEMMALL_ITEM_CREDIT = 2,
  ITEMMALL_ITEM_SELLABLE = 3,
}

---@enum ITEM
ITEM = {
  ITEM_QUALITY_SYSTEM = 0,
  ITEM_QUALITY_JUNK = 1,
  ITEM_QUALITY_GOODS = 2,
  ITEM_QUALITY_COMMON = 3,
  ITEM_QUALITY_UNCOMMON = 4,
  ITEM_QUALITY_RARE = 5,
  ITEM_QUALITY_EPIC = 6,
  ITEM_QUALITY_LEGENDARY = 7,
  ITEM_QUALITY_RELIC = 8,
  ITEM_QUALITY_DRAGON = 9,
}

---@alias ENUM_ItemSource
---| "ENUM_ItemSource_Quest"
---| "ENUM_ItemSource_FixedDrop"
---| "ENUM_ItemSource_WorldDrop"
---| "ENUM_ItemSource_Crafted"
---| "ENUM_ItemSource_Conjured"
---| "ENUM_ItemSource_Vendor"
---| "ENUM_ItemSource_QuestItem"

---@enum KBF
KBF = {
  KBF_NONE = 0,
  KBF_SHIFT = 1,
  KBF_ALT = 2,
  KBF_CTRL = 3,
  KBF_ANY = 4,
  end = 5,
}

---@enum LEARN
LEARN = {
  LEARN_ERROR_LOW_LEVEL = 0,
  LEARN_ERROR_NO_CASH = 1,
  LEARN_ERROR_NO_PREVIOS_RANKS = 2,
  LEARN_ERROR_ALREADY_KNOWN = 3,
  LEARN_ERROR_PREVIOS_TRAINING_UNFINISHED = 4,
}

---@alias LfgActionFail
---| "ENUM_LfgActionFail_InvalidRole"
---| "ENUM_LfgActionFail_InvalidDestination"
---| "ENUM_LfgActionFail_LeaderRequire"

---@alias ENUM
---| "ENUM_LFGEventDifficulty_Easy"
---| "ENUM_LFGEventDifficulty_Normal"
---| "ENUM_LFGEventDifficulty_Hard"

---@alias ENUM
---| "ENUM_LFGRole_Tank"
---| "ENUM_LFGRole_Healer"
---| "ENUM_LFGRole_DamageDealer"

---@alias LfgVoteType
---| "ENUM_LFGVoteType_Join"
---| "ENUM_LFGVoteType_Invite"

---@enum LOOT
LOOT = {
  LOOT_SCHEME_TYPE_FREE_FOR_ALL = 0,
  LOOT_SCHEME_TYPE_MASTER = 1,
  LOOT_SCHEME_TYPE_GROUP = 2,
}

---@alias ENUM_LotteryState

---@alias ENUM_MailServiceReply
---| "ENUM_MailServiceReply_Succeeded"
---| "ENUM_MailServiceReply_InternalSystemError"
---| "ENUM_MailServiceReply_AvatarNotRecognized"
---| "ENUM_MailServiceReply_MailNotFound"
---| "ENUM_MailServiceReply_CannotReturnMail"
---| "ENUM_MailServiceReply_MailItemNotFound"
---| "ENUM_MailServiceReply_BagFull"
---| "ENUM_MailServiceReply_NotReadByOwner"
---| "ENUM_MailServiceReply_NotTalkingToMailBox"
---| "ENUM_MailServiceReply_NoMoneyInMail"
---| "ENUM_MailServiceReply_MailItemRemoved"
---| "ENUM_MailServiceReply_CannotRemoveMail"
---| "ENUM_MailServiceReply_MoneyOverflow"
---| "ENUM_MailServiceReply_OwnershipLimitExceeded"

---@alias MatchMakingMechanicsType
---| "ENUM_MatchMakingMechanicsType_UNKNOWN"
---| "ENUM_MatchMakingMechanicsType_BATTLEGROUND"
---| "ENUM_MatchMakingMechanicsType_FOOTBALL"
---| "ENUM_MatchMakingMechanicsType_SUMMERBOSS"
---| "ENUM_MatchMakingMechanicsType_LASTSTAND"
---| "ENUM_MatchMakingMechanicsType_CAPTURE_POINTS"
---| "ENUM_MatchMakingMechanicsType_RATING_ARENA"
---| "ENUM_MatchMakingMechanicsType_ANNIVERSARY_EVENT"
---| "ENUM_MatchMakingMechanicsType_GLADIATOR_ARENA"
---| "ENUM_MatchMakingMechanicsType_DOMINATION"

---@enum MetaUpgrade
MetaUpgrade = {
  META_UPGRADE_QUALITY = 0,
  META_UPGRADE_LEVEL = 1,
  META_UPGRADE_ITEM = 2,
}

---@alias ENUM_MobWorld

---@alias ENUM_MoneyChangeReason
---| "ENUM_MoneyChangeReason_Unspecified"
---| "ENUM_MoneyChangeReason_DirectTransfer"
---| "ENUM_MoneyChangeReason_TaxPayment"
---| "ENUM_MoneyChangeReason_Antifraud"
---| "ENUM_MoneyChangeReason_LevelUpPayment"
---| "ENUM_MoneyChangeReason_MWarPayment"
---| "ENUM_MoneyChangeReason_Taxes"
---| "ENUM_MoneyChangeReason_Correction"

---@alias ENUM_Month
---| "ENUM_Month_January"
---| "ENUM_Month_February"
---| "ENUM_Month_March"
---| "ENUM_Month_April"
---| "ENUM_Month_May"
---| "ENUM_Month_June"
---| "ENUM_Month_July"
---| "ENUM_Month_August"
---| "ENUM_Month_September"
---| "ENUM_Month_October"
---| "ENUM_Month_November"
---| "ENUM_Month_December"

---@enum MOUSE
MOUSE = {
  MOUSE_BUTTONS_NONE = 0,
  MOUSE_BUTTON_LEFT = 1,
  MOUSE_BUTTON_RIGHT = 2,
  MOUSE_BUTTON_MIDDLE = 3,
  MOUSE_BUTTON_X1 = 4,
  MOUSE_BUTTON_X2 = 5,
}

---@alias ENUM_MsgGetBonusListResultResult
---| "ENUM_MsgGetBonusListResultResult_Success"
---| "ENUM_MsgGetBonusListResultResult_InternalError"
---| "ENUM_MsgGetBonusListResultResult_BillingUnavailable"

---@alias ENUM_MsgGuildAllodAuctionBidResultResult
---| "ENUM_MsgGuildAllodAuctionBidResultResult_SUCCESS"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_ERROR"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_OLDVERSION"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_SAMEUSER"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_NOGUILD"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_NOMONEY"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_NOAUCTION"
---| "ENUM_MsgGuildAllodAuctionBidResultResult_FINISHED"

---@alias ENUM_MsgRenameResultResult
---| "ENUM_MsgRenameResultResult_Success"
---| "ENUM_MsgRenameResultResult_AvatarNotFound"
---| "ENUM_MsgRenameResultResult_RenameNotAllowed"
---| "ENUM_MsgRenameResultResult_InvalidName"
---| "ENUM_MsgRenameResultResult_InternalError"

---@alias ENUM_PridenFactionChoice
---| "ENUM_PridenFactionChoice_League"
---| "ENUM_PridenFactionChoice_Empire"

---@alias ENUM
---| "ENUM_QuestCategory_Common"
---| "ENUM_QuestCategory_Compendium"

---@enum QUEST
QUEST = {
  QUEST_FIND_NEXT_QUEST_MODE_ZONE = 0,
  QUEST_FIND_NEXT_QUEST_MODE_ALL = 1,
}

---@alias ENUM_Question

---@enum QUEST
QUEST = {
  QUEST_TYPE_SOLO = 0,
  QUEST_TYPE_PARTY = 1,
  QUEST_TYPE_RAID = 2,
  QUEST_TYPE_MINI_RAID = 3,
}

---@alias QuizQuestionType

---@alias ENUM_RAID
---| "ENUM_RAID_FAILED_NOT_ENOUGH_RIGHTS"
---| "ENUM_RAID_FAILED_PLAYER_IS_NOT_IN_RAID"
---| "ENUM_RAID_FAILED_PLAYER_ALREADY_IN_RAID"
---| "ENUM_RAID_FAILED_LEADER_CANT_LEAVE"
---| "ENUM_RAID_FAILED_ZONE_NOT_ALLOWED"
---| "ENUM_RAID_FAILED_ALREADY_FULL"

---@enum RAID
RAID = {
  RAID_MEMBER_RIGHT_LEADER_HELPER = 0,
  RAID_MEMBER_RIGHT_LOOT_MASTER = 1,
}

---@enum RAID
RAID = {
  RAID_MEMBER_STATE_OFFLINE = 0,
  RAID_MEMBER_STATE_NEAR = 1,
  RAID_MEMBER_STATE_FAR = 2,
  RAID_MEMBER_STATE_AFK = 3,
}

---@alias ENUM
---| "ENUM_RatingArenaType_3x3"
---| "ENUM_RatingArenaType_6x6"

---@enum READY
READY = {
  READY_CHECK_READY_STATE_UNKNOWN = 0,
  READY_CHECK_READY_STATE_READY = 1,
  READY_CHECK_READY_STATE_NOT_READY = 2,
}

---@enum ReputationLevel
ReputationLevel = {
  REPUTATION_LEVEL_HOSTILITY = 0,
  REPUTATION_LEVEL_ENEMY = 1,
  REPUTATION_LEVEL_UNFRIENDLY = 2,
  REPUTATION_LEVEL_NEUTRAL = 3,
  REPUTATION_LEVEL_KINDLY = 4,
  REPUTATION_LEVEL_FRIENDLY = 5,
  REPUTATION_LEVEL_CONFIDENTIAL = 6,
}

---@alias ENUM_EnumRequestAddressByNameFailCause
---| "ENUM_RequestAddressByNameFailCause_NotExist"
---| "ENUM_RequestAddressByNameFailCause_NotLoggedIn"

---@alias ENUM_RequestAddressByNameType
---| "ENUM_RequestAddressByNameType_Whisper"
---| "ENUM_RequestAddressByNameType_GroupInvite"
---| "ENUM_RequestAddressByNameType_Sudo"
---| "ENUM_RequestAddressByNameType_TeleportToAvatar"
---| "ENUM_RequestAddressByNameType_GuildInvite"
---| "ENUM_RequestAddressByNameType_RaidInvite"
---| "ENUM_RequestAddressByNameType_GameMaster"

---@alias ENUM_RuleNotificationType
---| "ENUM_RuleNotificationType_Default"
---| "ENUM_RuleNotificationType_Box"
---| "ENUM_RuleNotificationType_Chest"
---| "ENUM_RuleNotificationType_CrystalSale"
---| "ENUM_RuleNotificationType_PriceChanging"
---| "ENUM_RuleNotificationType_New"

---@enum RULE
RULE = {
  RULE_TYPE_ACTION = 0,
  RULE_TYPE_HOLYDAY = 1,
  RULE_TYPE_SINGLE = 2,
  RULE_TYPE_GROUP = 3,
  RULE_TYPE_GUILD = 4,
}

---@alias ENUM_RuneOperationResult
---| "ENUM_RuneOperationResult_SlotNumberOutOfBounds"
---| "ENUM_RuneOperationResult_SlotIsEmpty"
---| "ENUM_RuneOperationResult_ItemIsNotExtractor"
---| "ENUM_RuneOperationResult_ItemHasNoRune"
---| "ENUM_RuneOperationResult_WrongInstrumentLevel"
---| "ENUM_RuneOperationResult_NoFreeSpace"
---| "ENUM_RuneOperationResult_SecondRuneNotFound"
---| "ENUM_RuneOperationResult_ItemIsNotCombiner"
---| "ENUM_RuneOperationResult_ItemIsNotRune"
---| "ENUM_RuneOperationResult_ItemAlreadyHasRune"
---| "ENUM_RuneOperationResult_CannotInsertIntoThis"
---| "ENUM_RuneOperationResult_NoHigherLevelRune"
---| "ENUM_RuneOperationResult_OperationFailed"
---| "ENUM_RuneOperationResult_NotEnoughRunes"
---| "ENUM_RuneOperationResult_OperationSuccess"

---@alias ENUM
---| "ENUM_SaleTag_None"
---| "ENUM_SaleTag_Discount"
---| "ENUM_SaleTag_Discount50"
---| "ENUM_SaleTag_Discount70"
---| "ENUM_SaleTag_Discount80"
---| "ENUM_SaleTag_Discount90"
---| "ENUM_SaleTag_UniqueItem"

---@alias ENUM_ShipInfoMarker
---| "ENUM_ShipInfoMarker_BorrowedFromBestFriend"
---| "ENUM_ShipInfoMarker_LentToBestFriend"

---@enum SHIP
SHIP = {
  SHIP_SIDE_NONE = 0,
  SHIP_SIDE_GENERAL = 1,
  SHIP_SIDE_FRONT = 2,
  SHIP_SIDE_REAR = 3,
  SHIP_SIDE_LEFT = 4,
  SHIP_SIDE_RIGHT = 5,
}

---@alias ENUM

---@enum SPELLBOOK
SPELLBOOK = {
  SPELLBOOK_PAGE_NORMAL = 0,
  SPELLBOOK_PAGE_HALO = 1,
  SPELLBOOK_PAGE_SPOUSE = 2,
  SPELLBOOK_PAGE_OTHER = 3,
}

---@alias ENUM_Element
---| "ENUM_EELEMENTAL"
---| "ENUM_EDIVINE"
---| "ENUM_ENATURE"
---| "ENUM_EPHYSICAL"

---@alias ENUM_SubElement
---| "ENUM_SubElement_PHYSICAL"
---| "ENUM_SubElement_FIRE"
---| "ENUM_SubElement_COLD"
---| "ENUM_SubElement_LIGHTNING"
---| "ENUM_SubElement_HOLY"
---| "ENUM_SubElement_SHADOW"
---| "ENUM_SubElement_ASTRAL"
---| "ENUM_SubElement_POISON"
---| "ENUM_SubElement_DISEASE"
---| "ENUM_SubElement_ACID"

---@alias ENUM_TabardType
---| "ENUM_TabardType_None"
---| "ENUM_TabardType_Common"
---| "ENUM_TabardType_Champion"
---| "ENUM_TabardType_BannerTier1"
---| "ENUM_TabardType_BannerTier2"
---| "ENUM_TabardType_BannerTier3"

---@alias ENUM_EnumTakeItemActionType
---| "ENUM_TakeItemActionType_Loot"
---| "ENUM_TakeItemActionType_Quest"
---| "ENUM_TakeItemActionType_QuestAbandon"
---| "ENUM_TakeItemActionType_Spell"
---| "ENUM_TakeItemActionType_Vendor"
---| "ENUM_TakeItemActionType_Craft"
---| "ENUM_TakeItemActionType_Mail"
---| "ENUM_TakeItemActionType_Drop"
---| "ENUM_TakeItemActionType_SelfAnnihilation"
---| "ENUM_TakeItemActionType_Money"
---| "ENUM_TakeItemActionType_Box"
---| "ENUM_TakeItemActionType_RuneCombine"
---| "ENUM_TakeItemActionType_SkilledItemGeneration"
---| "ENUM_TakeItemActionType_AuctionBet"
---| "ENUM_TakeItemActionType_AuctionCreate"
---| "ENUM_TakeItemActionType_AuctionBuyout"
---| "ENUM_TakeItemActionType_Other"
---| "ENUM_TakeItemActionType_CurrencyExchange"
---| "ENUM_TakeItemActionType_Mentor"
---| "ENUM_TakeItemActionType_ItemMall"

---@enum TAKE
TAKE = {
  TAKE_ITEMS_RESULT_SUCCESS = 0,
  TAKE_ITEMS_RESULT_PARTIAL_STACK_LEFT = 1,
  TAKE_ITEMS_RESULT_FULL_STACK_LEFT = 2,
}

---@alias ENUM
---| "ENUM_TalentType_GUILD"
---| "ENUM_TalentType_BOSS"
---| "ENUM_TalentType_GUILDHALL"

---@alias ENUM_ToolProperty
---| "ENUM_ToolProperty_Quality"
---| "ENUM_ToolProperty_Stable"
---| "ENUM_ToolProperty_Handy"
---| "ENUM_ToolProperty_Optimized"

---@alias ENUM_TransferMoneyOperationDirection
---| "ENUM_TransferMoneyOperationDirection_Avatar2GuildBank"
---| "ENUM_TransferMoneyOperationDirection_GuildBank2Avatar"

---@alias ENUM_TurnReason
---| "ENUM_TR_Broken"
---| "ENUM_TR_Abordage"
---| "ENUM_TR_Silence"
---| "ENUM_TR_InterHubAcceleration"
---| "ENUM_TR_Construction"
---| "ENUM_TR_InHangar"
---| "ENUM_TR_TeleportToIsland"
---| "ENUM_TR_Teleport"
---| "ENUM_TR_Malfunction"
---| "ENUM_TR_ReactorsShutdown"
---| "ENUM_TR_ShipDestroyed"
---| "ENUM_TR_Init"

---@alias ENUM
---| "ENUM_TutorialRunType_ClientData"
---| "ENUM_TutorialRunType_LevelUp"
---| "ENUM_TutorialRunType_Custom"

---@alias ENUM
---| "ENUM_TutorialViewType_Window"
---| "ENUM_TutorialViewType_BlockerWindow"
---| "ENUM_TutorialViewType_PopUp"
---| "ENUM_TutorialViewType_Custom"

---@alias ENUM
---| "ENUM_UIBuffPriority_Medium"
---| "ENUM_UIBuffPriority_High"

---@alias ENUM_UpgradeChanceBehavior
---| "ENUM_UpgradeChanceBehavior_MaximizeImprovement"
---| "ENUM_UpgradeChanceBehavior_DoubleImprovement"

---@enum USDEV
USDEV = {
  USDEV_NOT_USABLE_DEVICE = 0,
  USDEV_USABLE_DEVICE = 1,
  USDEV_BEAM_CANNON = 2,
  USDEV_CANNON = 3,
  USDEV_ENGINE_HORIZONTAL = 4,
  USDEV_ENGINE_VERTICAL = 5,
  USDEV_NAVIGATOR = 6,
  USDEV_REACTOR = 7,
  USDEV_REMOTE_RUDDER = 8,
  USDEV_REMOTE_ENGINE_VERTICAL = 9,
  USDEV_REPAIR = 10,
  USDEV_RUDDER = 11,
  USDEV_SCANER = 12,
  USDEV_VISUAL = 13,
  USDEV_SHIELD = 14,
}

---@enum Vendor
Vendor = {
  VENDOR_NO_VENDOR = 0,
  VENDOR_GENERAL = 1,
  VENDOR_WEAPON_ARMOR = 2,
  VENDOR_CRAFTING_COMPONENTS = 3,
  VENDOR_USABLE_ITEMS = 4,
  VENDOR_GUILD = 5,
  VENDOR_MYRRH = 6,
  VENDOR_RUNE = 7,
  VENDOR_BADGE = 8,
}

---@alias ENUM_VisualizeMode
---| "ENUM_CURRENCY_VISUALIZE_MODE_SHOW"
---| "ENUM_CURRENCY_VISUALIZE_MODE_HIDE"
---| "ENUM_CURRENCY_VISUALIZE_MODE_CUSTOM"

---@enum DND
DND = {
}

---@alias ENUM_ZoneDanger
---| "ENUM_ZoneDanger_Neutral"
---| "ENUM_ZoneDanger_Enemy"
---| "ENUM_ZoneDanger_Friend"

---@enum ZONE
ZONE = {
  ZONE_TIER_DIFFICULTY_DEFAULT = 0,
  ZONE_TIER_DIFFICULTY_NONE = 1,
  ZONE_TIER_DIFFICULTY_EASY = 2,
  ZONE_TIER_DIFFICULTY_MEDIUM = 3,
  ZONE_TIER_DIFFICULTY_HARD = 4,
  ZONE_TIER_DIFFICULTY_INSANE = 5,
}
