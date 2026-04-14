--------------------------------------------------------------------------------
-- GLOBALS
--------------------------------------------------------------------------------

-- CONSTANTS
Global( "MESSAGE_FADE_IN_TIME", 350 )
Global( "MESSAGE_FADE_SOLID_TIME", 4000 )
Global( "MESSAGE_FADE_OUT_TIME", 1000 )

Global( "WIDGET_FADE_TRANSPARENT", 1 )
Global( "WIDGET_FADE_IN", 2 )
Global( "WIDGET_FADE_SOLID", 3 )
Global( "WIDGET_FADE_OUT", 4 )

-- WIDGETS
Global( "wtMessage", nil )

-- OTHER
Global( "fadeStatus", WIDGET_FADE_TRANSPARENT )

--------------------------------------------------------------------------------
-- EVENT HANDLERS
--------------------------------------------------------------------------------

-- EVENT_AVATAR_CLIENT_ZONE_CHANGED
function OnEventAvatarClientZoneChanged( params )
	local zone = cartographer.GetCurrentZoneInfo()

	if not common.IsEmptyWString( zone.subZoneName ) then
		wtMessage:SetVal( "value", zone.subZoneName )
	else
		wtMessage:SetVal( "value", zone.zoneName )
	end
	wtMessage:Show( true )

	wtMessage:PlayFadeEffect( 0.0, 1.0, MESSAGE_FADE_IN_TIME, EA_MONOTONOUS_INCREASE )
	fadeStatus = WIDGET_FADE_IN
end

-- EVENT_EFFECT_FINISHED
function OnEventEffectFinished ( params )
	if params.wtOwner:IsEqual( wtMessage ) then
		if fadeStatus == WIDGET_FADE_IN then
			wtMessage:PlayFadeEffect( 1.0, 1.0, MESSAGE_FADE_SOLID_TIME, EA_MONOTONOUS_INCREASE )
			fadeStatus = WIDGET_FADE_SOLID		
		elseif fadeStatus == WIDGET_FADE_SOLID then
			wtMessage:PlayFadeEffect( 1.0, 0.0, MESSAGE_FADE_OUT_TIME, EA_MONOTONOUS_INCREASE )
			fadeStatus = WIDGET_FADE_OUT		
		elseif fadeStatus == WIDGET_FADE_OUT then
			fadeStatus = WIDGET_FADE_TRANSPARENT
			wtMessage:Show( false )
		end
	end
end

--------------------------------------------------------------------------------
-- INITIALIZATION
--------------------------------------------------------------------------------
function Init()
	common.RegisterEventHandler( OnEventAvatarClientZoneChanged, "EVENT_AVATAR_CLIENT_ZONE_CHANGED" )
	common.RegisterEventHandler( OnEventEffectFinished, "EVENT_EFFECT_FINISHED" )
	
	wtMessage = mainForm:GetChildChecked( "Announce", false )
	wtMessage:Show( false )

	common.StateUnloadManagedAddon( "ZoneAnnounce" )
end
--------------------------------------------------------------------------------
Init()
--------------------------------------------------------------------------------
