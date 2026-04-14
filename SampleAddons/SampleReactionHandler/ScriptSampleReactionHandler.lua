--------------------------------------------------------------------------------
-- GLOBALS
--------------------------------------------------------------------------------

Global( "wtMainPanel", nil )
Global( "delta", 10 )
Global( "COUNTER_LIMIT", 5 )
Global( "counter", COUNTER_LIMIT )

--------------------------------------------------------------------------------
-- REACTION HANDLERS
--------------------------------------------------------------------------------

-- "execute"
function OnReactionExecute( params )
	LogInfo( "counter: ", counter )
	
	counter = counter - 1
	if counter < 0 then
		counter = COUNTER_LIMIT
		delta = -delta
	end
	
	local place = wtMainPanel:GetPlacementPlain()
	place.posX = place.posX + delta
	wtMainPanel:SetPlacementPlain( place )
end

--------------------------------------------------------------------------------
-- INITIALIZATION
--------------------------------------------------------------------------------
function Init()
	LogInfo( "Reaction handler sample" )

	common.RegisterReactionHandler( OnReactionExecute, "execute" ) 
	
	wtMainPanel = mainForm:GetChildChecked( "MainPanel", false )
end
--------------------------------------------------------------------------------
Init()
--------------------------------------------------------------------------------
