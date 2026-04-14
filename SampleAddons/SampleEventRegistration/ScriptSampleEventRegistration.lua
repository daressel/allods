--------------------------------------------------------------------------------
-- GLOBALS
--------------------------------------------------------------------------------

Global( "passedTimeSec", 0 )

--------------------------------------------------------------------------------
-- EVENT HANDLERS
--------------------------------------------------------------------------------

-- "EVENT_SECOND_TIMER"
function OnEventSecondTimer( params )
	passedTimeSec = passedTimeSec + 1
	LogInfo( "passed time: ", passedTimeSec, " sec" )
end

--------------------------------------------------------------------------------
-- INITIALIZATION
--------------------------------------------------------------------------------
function Init()
	LogInfo( "Event registration sample, passed time: ", passedTimeSec, " sec" )

	common.RegisterEventHandler( OnEventSecondTimer, "EVENT_SECOND_TIMER" ) 
end
--------------------------------------------------------------------------------
Init()
--------------------------------------------------------------------------------
