--------------------------------------------------------------------------------
-- EscapeSequencePlugInUserMods.lua
--[[
	Зависимости:
		AddonBase.lua
		AdvancedHandlers.lua
		WidgetBaseClasses.lua
	
	Скрипт управления подпиской на нажатие клавиши Escape
	Позволяет встроить аддон в последовательность обработки нажатия Escape
	
	Предоставляемое API
		escSequenceHolder:Register( [defRank] )
			Зарегистрировать аддон в EscSequenceManager
			Можно переопределить ранг по управления (изначально ESCAPE_SEQUENCE_RANK_NONE)
		escSequenceHolder:UnRegister()
			Дерегистрировать аддон в EscSequenceManager
		escSequenceHolder:Lock( handler, [rank], [context] )
			Взять лок на Esc на с приоритетом rank. Если ранг не задан - используется defRank
			При срабатывании лок будет автоматически отпущен, при этом вызван метод handler в контексте context
			Для вызова обычной функции использовать в качестве контекста nil
		escSequenceHolder:Release( handler, [rank], [context] )
			Отпустить лок на Esc
			Параметры идентичны параметрам при взятии лока.
		
	Уровни приоритета (от меньшего к большему)
		ESCAPE_SEQUENCE_RANK_NONE 			= 0 -- особый уровень, не включен в обработку. 
		ESCAPE_SEQUENCE_RANK_TARGET 		= 1
		ESCAPE_SEQUENCE_RANK_WINDOWS 		= 2
		ESCAPE_SEQUENCE_RANK_CASTING 		= 3
		ESCAPE_SEQUENCE_RANK_AEMARKER 		= 4
		ESCAPE_SEQUENCE_RANK_SUPER_WINDOWS	= 5
		ESCAPE_SEQUENCE_RANK_POPUP_MENU 	= 6
		ESCAPE_SEQUENCE_RANK_MENU 			= 7
		ESCAPE_SEQUENCE_RANK_SUB_MENU 		= 8
		ESCAPE_SEQUENCE_RANK_DRAG_N_DROP 	= 9
]]
--------------------------------------------------------------------------------
local MAX_ESCAPES_PER_ADDON = 5
--------------------------------------------------------------------------------
Class( "escapeSequenceManagerPlugin", advUIBasicElement( advEvent() ) )
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:Init()
	self.addon = "UserAddon/" .. ADDON_NAME
	self.defaultRank = ESCAPE_SEQUENCE_RANK_NONE
	self.managerReady = false
	self.registrationRequested = false
	self.handlers = {}
	---BEGIN_DEBUG---
	self.handlersCount = 0
	---END_DEBUG---
	return advUIBasicElement.Init( self )
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:Register( defRank )
	self.registrationRequested = true
	self.defaultRank = defRank or self.defaultRank
	if self.managerReady then
		self:Activate( true )
	end
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:UnRegister()
	self.registrationRequested = false
	self.defaultRank = ESCAPE_SEQUENCE_RANK_NONE
	self:Activate( false )
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:Toggle( state )
	local changed = advUIBasicElement.Toggle( self, state )
	if changed then
		userMods.RegisterEscSequence( state )
	end
	return changed
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:Lock( handler, rank, context )
	if self.active then
		rank = rank or self.defaultRank
		---BEGIN_DEBUG---
		self.handlersCount = self.handlersCount + 1
		assert( type( handler ) == "function", "escapeSequenceManagerPlugin:Lock Error: Invalid handler, function expected, got %s", type( handler ) )
		assert( self.handlersCount <= MAX_ESCAPES_PER_ADDON, "escapeSequenceManagerPlugin:Lock Error: Too many handlers, limit is %s", MAX_ESCAPES_PER_ADDON )
		assert( type( rank ) == "number" and rank >= ESCAPE_SEQUENCE_RANK_NONE and rank <= ESCAPE_SEQUENCE_RANK_DRAG_N_DROP,
			"escapeSequenceManagerPlugin:Lock Error: Invalid rank" )
		---END_DEBUG---
		self.handlers[ rank ] = self.handlers[ rank ] or {}
		table.insert( self.handlers[ rank ], { c = context, func = handler } )
		userMods.NotifyEscSequence( true, rank )
	end
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:ToggleLock( state, handler, rank, context )
	if state then
		self:Lock( handler, rank, context )
	else
		self:Release( handler, rank, context )
	end
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:FindSeqIndex( handler, rank, context )
	if self.handlers[ rank ] then
		for index, data in ipairs( self.handlers[ rank ] ) do
			if data.c == context and data.func == handler then
				return index
			end
		end
	end
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:Release( handler, rank, context )
	if self.active then
		rank = rank or self.defaultRank
		local index = self:FindSeqIndex( handler, rank, context )
		if index then
			table.remove( self.handlers[ rank ], index )
			---BEGIN_DEBUG---
			self.handlersCount = self.handlersCount - 1
			---END_DEBUG---
			userMods.NotifyEscSequence( false, rank )
		end
	end
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:OnClose( eventData )
	if eventData.rank and self.handlers[ eventData.rank ] then
		local data = table.remove( self.handlers[ eventData.rank ] )
		if data then
			data.func( data.c )
			---BEGIN_DEBUG---
			self.handlersCount = self.handlersCount - 1
			---END_DEBUG---
			userMods.NotifyEscSequence( false, eventData.rank )
			return
		end
	end
	---BEGIN_DEBUG---
	error( "escapeSequenceManagerPlugin:OnClose Error: Unexpected command, state inconsistent?" )
	---END_DEBUG---
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:OnManagerReady( event )
	self.managerReady = true
	if self.registrationRequested then
		if not self.active then
			self:Activate( true )
		elseif not event.target or event.target == self.addon then
			userMods.RegisterEscSequence()
		end
	end
end
--------------------------------------------------------------------------------
---BEGIN_DEBUG---
function escapeSequenceManagerPlugin:OnError( eventData )
	local addonName, reason = tostring( eventData.addonName ), eventData.reason

	if     reason == ESCAPE_SEQUENCE_ERROR_REG then
		LogError( "escapeSequenceManagerPlugin: Can't register addon: invalid event format" )
	elseif reason == ESCAPE_SEQUENCE_ERROR_UNREG then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] not registered, can't unregister", addonName ) )
	elseif reason == ESCAPE_SEQUENCE_ERROR_DOUBLE_REG then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] double registration attempt", addonName ) )
	elseif reason == ESCAPE_SEQUENCE_ERROR_NOTIFY_NOREG then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] not registered, can't process notify", addonName ) )
	elseif reason == ESCAPE_SEQUENCE_ERROR_NOTIFY_RANK then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] notify rank invalid", addonName ) )
	elseif reason == ESCAPE_SEQUENCE_ERROR_NOTIFY_LIMIT then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] escape limit 5 overflow", addonName ) )
	elseif reason == ESCAPE_SEQUENCE_ERROR_NOTIFY_RELEASE then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] try kill nonexistent escape", addonName ) )
	elseif reason == ESCAPE_SEQUENCE_ERROR_ZOMBIE then
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] is zombie (not handle registered esc pressed)", addonName ) )
	else
		LogError( string.format( "escapeSequenceManagerPlugin: Addon [%s] unhandled error", addonName ) )
	end
end
---END_DEBUG---
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:GetActiveEventHandlers()
	return {
		{ self.OnClose, "SCRIPT_ESCSEQUENCE_CLOSE", { addonName = self.addon }, { cfilter = true } },
		---BEGIN_DEBUG---
		{ self.OnError, "SCRIPT_ESCSEQUENCE_ERROR", { addonName = self.addon }, { cfilter = true } }
		---END_DEBUG---
	}
end
--------------------------------------------------------------------------------
function escapeSequenceManagerPlugin:GetPassiveEventHandlers()
	return {
		{ self.OnManagerReady, "SCRIPT_ESCSEQUENCE_READY" }
	}
end
--------------------------------------------------------------------------------
Global( "escSequenceHolder", escapeSequenceManagerPlugin():Init() )
--------------------------------------------------------------------------------