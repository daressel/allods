--------------------------------------------------------------------------------
local hash, widgethash = {}, {}
Class( "advWidgetDynamicList" )
--------------------------------------------------------------------------------
function advWidgetDynamicList:Init()
	hash[ self ], widgethash[ self ] = {}, {}
	
	return self
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:GetWidget( objectId )
	if objectId ~= nil then return hash[ self ][ objectId ] end
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:GetObjectId( widget )
	if widget then return widgethash[ self ][ widget:GetInstanceId() ] end
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:Add( objectId, sysId )
	---BEGIN_DEBUG---
	assert( objectId ~= nil, "advWidgetDynamicList:Add Error: objectId == nil" )
	assert( type( sysId ) == "string" and sysId ~= "", "advWidgetDynamicList:Add Error: sysId must be non-empty string" )
	---END_DEBUG---
	-- При попытке добавления имеющегося objectId новый виджет не будет добавлен.
	-- Будет возвращен существующий и new = false
	local new = false
	local widget = hash[ self ][ objectId ] 
	
	if not widget then
		widget = advWidgetFactory:Get( sysId )
		new = true
	end
	
	hash[ self ][ objectId ] = widget
	widgethash[ self ][ widget:GetInstanceId() ] = objectId

	return widget, new
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:Remove( objectId )
	---BEGIN_DEBUG---
	assert( objectId ~= nil, "advWidgetDynamicList:Remove Error: objectId == nil" )
	---END_DEBUG---
	local widget = hash[ self ][ objectId ]

	if widget then
		advWidgetFactory:Store( widget )
				
		hash[ self ][ objectId ] = nil
		widgethash[ self ][ widget:GetInstanceId() ] = nil

		return widget
	end
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:AddList( list, sysId, needMap )
	---BEGIN_DEBUG---
	assert( type( list ) == "table" and #list == table.size( list ), "advWidgetDynamicList:AddList Error: list must be array of objectId" )
	assert( type( sysId ) == "string" and sysId ~= "", "advWidgetDynamicList:AddList Error: sysId must be non-empty string" )
	---END_DEBUG---
	local addCount = #list
	if addCount > 1 then
		advWidgetFactory:Boost( sysId, addCount )
	end
	
	if needMap then
		local hash = {}
		for _, objectId in ipairs( list ) do
			hash[ objectId ] = self:Add( objectId, sysId )
		end
		return hash
	else
		for _, objectId in ipairs( list ) do
			self:Add( objectId, sysId )
		end
	end
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:RemoveList( list, needMap )
	---BEGIN_DEBUG---
	assert( type( list ) == "table" and #list == table.size( list ), "advWidgetDynamicList:RemoveList Error: list must be array of objectId" )
	---END_DEBUG---
	if needMap then
		local hash = {}
		for _, objectId in ipairs( list ) do
			hash[ objectId ] = self:Remove( objectId )
		end
		return hash
	else
		for _, objectId in ipairs( list ) do
			self:Remove( objectId )
		end
	end
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:Intersect( map )
	for objectId in pairs( hash[ self ] ) do
		if map[ objectId ] == nil then self:Remove( objectId ) end
	end
	
	return map
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:SetList( list, sysId )
	---BEGIN_DEBUG---
	assert( type( list ) == "table" and #list == table.size( list ), "advWidgetDynamicList:SetList Error: list must be array of objectId" )
	assert( type( sysId ) == "string" and sysId ~= "", "advWidgetDynamicList:SetList Error: sysId must be non-empty string" )
	---END_DEBUG---
	return self:Intersect( self:AddList( list, sysId, true ) )
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:IsEmpty()
	return next( hash[ self ] ) == nil
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:pairs()
	return next, hash[ self ] or {}
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:RemoveAll()
	for objectId, widget in pairs( hash[ self ] ) do
		self:Remove( objectId )
	end
end
--------------------------------------------------------------------------------
function advWidgetDynamicList:DropCache( sysId )
	advWidgetFactory:DropCache( sysId )
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
local containers = {}
--------------------------------------------------------------------------------
Class( "advWidgetDynamicListC", advWidgetDynamicList() )
--------------------------------------------------------------------------------
function advWidgetDynamicListC:Init( wtContainer )
	containers[ self ] = wtContainer.widget
	return advWidgetDynamicList.Init( self )
end
--------------------------------------------------------------------------------
function advWidgetDynamicListC:Add( objectId, sysId )
	local wt, new = advWidgetDynamicList.Add( self, objectId, sysId )
	if new then
		if wt.SetController then
			wt:SetController( self )
		end
		wt:Assign( objectId )
		containers[ self ]:PushBack( wt.widget )
	end
	return wt, new
end
--------------------------------------------------------------------------------
function advWidgetDynamicListC:Remove( objectId )
	local wt = self:GetWidget( objectId )
	if wt then
		wt:Assign()
		containers[ self ]:Remove( wt.widget )
	end
	
	return advWidgetDynamicList.Remove( self, objectId )
end
--------------------------------------------------------------------------------
function advWidgetDynamicListC:RemoveAll()
	containers[ self ]:RemoveItems()
	for objectId, widget in pairs( hash[ self ] ) do
		widget:Assign()
		advWidgetDynamicList.Remove( self, objectId )
	end
end
--------------------------------------------------------------------------------