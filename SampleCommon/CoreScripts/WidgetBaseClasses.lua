--------------------------------------------------------------------------------
---BEGIN_DEBUG---
-- WidgetBaseClasses.lua
--[[
	Зависимости:
		AddonBase.lua
		ClassesImplementation.lua
		WidgetCore.lua / WidgetCoreUserMods.lua
		AdvancedHandlers.lua
		
	Библиотека базовых классов для элементов интерфейса
	
	Предоставляет API
		CallTooltip( active, [content] ) - Вызвать или скрыть тултип
	
	Предоставляет четыре базовых класса	
		advUIBasicElement - элемент с бинарным состоянием: активен / неактивен. Не управляет видимостью
		advWidgetBasicElement - элемент с бинарным состоянием: активен / неактивен. Управляет видимостью через метод Show
		advUIObjectMonitor - элемент с множеством состояний, состояние - произвольное значение (активен) / nil (неактивен). Не управляет видимостью
		advWidgetObjectMonitor - элемент с множеством состояний, состояние - произвольное значение (активен) / nil (неактивен). Управляет видимостью через метод Show
	
	Общее
		Управляют наборами событий и реакций
			Пассивных
				Регистрируются при инициализации объекта
				Дерегистрируютс при уничтожении объекта
				Для использования нужно определить в наследнике функции
					GetPassiveEventHandlers() - возвращает таблицу событий в формате advEvent
					GetPassiveReactionHandlers() - возвращает таблицу реакций в формате advReaction
			Активных
				Перерегистрируются при смене состояния, статус зависит от состояния
				Дерегистрируютс при уничтожении объекта
				Для использования нужно определить в наследнике функции
					GetActiveEventHandlers( [state] ) - возвращает таблицу событий в формате advEvent
					GetActiveReactionHandlers( [state] ) - возвращает таблицу реакций в формате advReaction
					Для adv*ObjectMonitor в данные функции в качестве аргумента передается текущее состояние
			Пользовательских
				Регистрируются и дерегистрируются только явно
				Дерегистрируютс при уничтожении объекта
				Для использования нужно
					Cоздать набор с помощью метода CreateCustomHandlersTable( self, name, isReaction ), имя должно быть уникальным!
					Определить в наследнике соответствующую функцию Get[name][Event/Reaction]Handlers( [state] )
					Для (де)регистрации использовать функцию Toggle[name][Event/Reaction]Handlers( self, state )
		
		Общие публичные методы
			Init( self ) - Инициализация, должна быть проведена при создании объекта, возвращает self
			Destroy( self ) - Корректно уничтожает объект и виджет. Все зарегистрированные события / реакции будут дерегестрированы.
			CreateCustomHandlersTable( self, name, isReaction ) - создает пользовательскую группу событий / реакций
			CallTooltip( self, reactionData ) - принимает реакцию наведения, вызывает или убирает тултип. Тултип конструируется через AssembleTooltip
			
		Общие методы которые можно переопределять в наследниках
			Init( self ) / Destroy( self ) при условии обязательного вызова метода базового класса (для Destroy он обязан быть последним вызовом)
			Update( self ) - Вызывается когда меняется стейт объекта, по умолчанию - перерисовка тултипа
			AssembleTooltip( self, reactionData ) - Конструирует тултп по реакции наведения, по умолчанию - нет тултипа
			GetPassive[Event/Reaction]Handlers( self ) - Смотри "Управляют наборами событий и реакций"
			GetActive[Event/Reaction]Handlers( self, [state] ) - Смотри "Управляют наборами событий и реакций"
			
		Общие методы которые можно с осторожностью переопределять в наследниках
			Toggle( self, newState ) - Переключение стейта без вызова Update, возвращает флаг наличия изменения стейта
				Внимание! Переопределенная функция обязана вызывать Toggle базового класса для корректной обработки подписки на события / реакции
				Внимание! Переопределенная функция обязана возвращать changed (флаг наличия изменений) для корректной работы Assign / Activate
	
	advUIBasicElement
		Стейт бинарный, хранится в поле active
		Пайплайн смены стейта
			Activate -> Toggle -> (if changed) -> Update
		Общие публичные методы
			Activate( self, newState ) - Переключает стейт.
			
	advWidgetBasicElement
		Стейт бинарный, хранится в поле active
		Пайплайн смены стейта
			Activate -> Toggle -> (if changed) -> Show( state ) -> Update
		Общие публичные методы
			Activate( self, newState ) - Переключает стейт.
			
	advUIObjectMonitor
		Стейт - объект любого типа, хранится в поле object
		Пайплайн смены стейта
			Assign -> Toggle -> (if changed) -> Update
		Общие публичные методы
			Assign( self, newState ) - Переключает стейт.
			
	advWidgetObjectMonitor
		Стейт - объект любого типа, хранится в поле object
		Пайплайн смены стейта
			Assign -> Toggle -> (if changed) -> Show( state ~= nil ) -> Update
		Общие публичные методы
			Assign( self, newState ) - Переключает стейт.
]]
---END_DEBUG---
--------------------------------------------------------------------------------
local tooltipRequest = "SCRIPT_REQUEST_CONTEXT_TOOLTIP"
local tooltipHide = "SCRIPT_HIDE_CONTEXT_TOOLTIP"
--------------------------------------------------------------------------------
function CallTooltip( active, tooltip )
	---BEGIN_DEBUG---
	if active and tooltip ~= false and ( not tooltip or next( tooltip ) == nil ) then
		LogWarning( "Try call empty tooltip, it's not an error, but a potential bug" )
	end
	---END_DEBUG---
	local sysEvent = active and tooltip and next( tooltip ) and tooltipRequest or tooltipHide
	advEvent:SendEvent( sysEvent, tooltip )
end
--------------------------------------------------------------------------------
local _CallTooltip = CallTooltip
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Class( "advUIBasicElement" )
--------------------------------------------------------------------------------
function advUIBasicElement:Init()
	self.active = false
	
	if not self.passivereactions and self.GetPassiveReactionHandlers then
		self.passivereactions = self:GetPassiveReactionHandlers()
		self:RegisterReactionHandlers( self.passivereactions )
	end

	if not self.passiveevents and self.GetPassiveEventHandlers then
		self.passiveevents = self:GetPassiveEventHandlers()
		self:RegisterEventHandlers( self.passiveevents )
	end

	return self
end
--------------------------------------------------------------------------------
function advUIBasicElement:Destroy()
	self:Activate( false )
	
	if self.passivereactions then
		self:UnRegisterReactionHandlers( self.passivereactions )
		self.passivereactions = nil
	end
	
	if self.passiveevents then
		self:UnRegisterEventHandlers( self.passiveevents )
		self.passiveevents = nil
	end
	
	if self.customEvents then
		for _, handlers in pairs( self.customEvents ) do
			self:UnRegisterEventHandlers( handlers )
		end
		self.customEvents = nil
	end
	
	if self.customReactions then
		for _, handlers in pairs( self.customReactions ) do
			self:UnRegisterReactionHandlers( handlers )
		end
		self.customReactions = nil
	end
	
	return self.DestroyWidget and self:DestroyWidget()
end
--------------------------------------------------------------------------------
function advUIBasicElement:Activate( active, ... )
	active = active ~= false
	
	local toggled = self:Toggle( active, ... )
	return toggled and self:Update( active, ... )
end
--------------------------------------------------------------------------------
function advUIBasicElement:CreateCustomHandlersTable( name, isReaction )
	local getterName = string.format( "Get%s%sHandlers", name, isReaction and "Reaction" or "Event" )
	local toggleName = string.format( "Toggle%s%sHandlers", name, isReaction and "Reaction" or "Event" )
	---BEGIN_DEBUG---
	assert( self[ toggleName ] == nil, "advUIBasicElement:CreateCustomHandlersTable Error: name not unique!" )
	---END_DEBUG---
	local pool, RFunc, UFunc
	if isReaction then
		self.customReactions = self.customReactions or {}
		pool = self.customReactions
		RFunc = self.RegisterReactionHandlers
		UFunc = self.UnRegisterReactionHandlers
	else
		self.customEvents = self.customEvents or {}
		pool = self.customEvents
		RFunc = self.RegisterEventHandlers
		UFunc = self.UnRegisterEventHandlers
	end
	
	self[ toggleName ] = function( self, active )
		local handlers = pool[ name ]
		if handlers then
			UFunc( self, handlers )
			pool[ name ] = nil
		end
		if active then
			handlers = self[ getterName ]( self )
			if handlers then 
				RFunc( self, handlers )
				pool[ name ] = handlers
			end
		end
	end
end
--------------------------------------------------------------------------------
function advUIBasicElement:ToggleActiveEventHandlers( active )
	if self.activeevents then
		self:UnRegisterEventHandlers( self.activeevents )
		self.activeevents = nil
	end
	
	if active then
		local events = self.GetActiveEventHandlers and self:GetActiveEventHandlers()	
		if events then 
			self:RegisterEventHandlers( events )
			self.activeevents = events
		end
	end
end
--------------------------------------------------------------------------------
function advUIBasicElement:ToggleActiveReactionHandlers( active )
	if self.activereactions then
		self:UnRegisterReactionHandlers( self.activereactions )
		self.activereactions = nil
	end
	
	if active then
		local reactions = self.GetActiveReactionHandlers and self:GetActiveReactionHandlers()
		if reactions then
			self:RegisterReactionHandlers( reactions )
			self.activereactions = reactions
		end
	end
end
--------------------------------------------------------------------------------
function advUIBasicElement:Toggle( active )
	if self.active ~= active then
		self.active = active
		
		self:ToggleActiveEventHandlers( active )
		self:ToggleActiveReactionHandlers( active )
		
		return true
	end
	
	return false
end
--------------------------------------------------------------------------------
function advUIBasicElement:Update( active )
	if self.tipReaction then self:CallTooltip( self.tipReaction ) end
end
--------------------------------------------------------------------------------
function advUIBasicElement:CallTooltip( reaction )
	local called = reaction.active
	_CallTooltip( called, called and self:AssembleTooltip( reaction ) )
	self.tipReaction = called and reaction or nil
end
--------------------------------------------------------------------------------
function advUIBasicElement:AssembleTooltip( reaction )
	return {}
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Class( "advWidgetBasicElement", advUIBasicElement() )
--------------------------------------------------------------------------------
function advWidgetBasicElement:Init()
	self:Show( false )
	return advUIBasicElement.Init( self )
end
--------------------------------------------------------------------------------
function advWidgetBasicElement:Toggle( active )
	local changed = advUIBasicElement.Toggle( self, active )
	if changed then
		self:Show( active )
	end
	return changed
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Class( "advUIObjectMonitor" )
--------------------------------------------------------------------------------
function advUIObjectMonitor:Init()
	if not self.passivereactions and self.GetPassiveReactionHandlers then
		self.passivereactions = self:GetPassiveReactionHandlers()
		self:RegisterReactionHandlers( self.passivereactions )
	end
	
	if not self.passiveevents and self.GetPassiveEventHandlers then
		self.passiveevents = self:GetPassiveEventHandlers()
		self:RegisterEventHandlers( self.passiveevents )
	end

	return self
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:Destroy()
	self:Assign()
	
	if self.passivereactions then
		self:UnRegisterReactionHandlers( self.passivereactions )
		self.passivereactions = nil
	end
	
	if self.passiveevents then
		self:UnRegisterEventHandlers( self.passiveevents )
		self.passiveevents = nil
	end
	
	if self.customEvents then
		for _, handlers in pairs( self.customEvents ) do
			self:UnRegisterEventHandlers( handlers )
		end
		self.customEvents = nil
	end
	
	if self.customReactions then
		for _, handlers in pairs( self.customReactions ) do
			self:UnRegisterReactionHandlers( handlers )
		end
		self.customReactions = nil
	end
	
	return self.DestroyWidget and self:DestroyWidget()
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:Assign( object, ... )
	local toggled = self:Toggle( object, ... )
	return toggled and self:Update( object, ... )
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:CreateCustomHandlersTable( name, isReaction )
	local getterName = string.format( "Get%s%sHandlers", name, isReaction and "Reaction" or "Event" )
	local toggleName = string.format( "Toggle%s%sHandlers", name, isReaction and "Reaction" or "Event" )
	---BEGIN_DEBUG---
	assert( self[ toggleName ] == nil, "advUIObjectMonitor:CreateCustomHandlersTable Error: name not unique!" )
	---END_DEBUG---
	local pool, RFunc, UFunc
	if isReaction then
		self.customReactions = self.customReactions or {}
		pool = self.customReactions
		RFunc = self.RegisterReactionHandlers
		UFunc = self.UnRegisterReactionHandlers
	else
		self.customEvents = self.customEvents or {}
		pool = self.customEvents
		RFunc = self.RegisterEventHandlers
		UFunc = self.UnRegisterEventHandlers
	end
	self[ toggleName ] = function( self, object )
		local handlers = pool[ name ]
		if handlers then
			UFunc( self, handlers )
			pool[ name ] = nil
		end
		if object ~= nil then
			handlers = self[ getterName ]( self, object )
			if handlers then 
				RFunc( self, handlers )
				pool[ name ] = handlers
			end
		end
	end
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:ToggleActiveEventHandlers( object )
	if self.activeevents then
		self:UnRegisterEventHandlers( self.activeevents )
		self.activeevents = nil
	end
	
	if object ~= nil then
		local events = self.GetActiveEventHandlers and self:GetActiveEventHandlers( object )		
		if events then
			self:RegisterEventHandlers( events )
			self.activeevents = events
		end
	end
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:ToggleActiveReactionHandlers( object )
	if self.activereactions then
		self:UnRegisterReactionHandlers( self.activereactions )
		self.activereactions = nil
	end
	
	if object ~= nil then
		local reactions = self.GetActiveReactionHandlers and self:GetActiveReactionHandlers( object )		
		if reactions then
			self:RegisterReactionHandlers( reactions )
			self.activereactions = reactions
		end
	end
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:Toggle( object )
	if self.object ~= object then
		self.object = object
		
		self:ToggleActiveEventHandlers( object )
		self:ToggleActiveReactionHandlers( object )
		
		return true
	end
	
	return false
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:Update( object )
	if self.tipReaction then self:CallTooltip( self.tipReaction ) end
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:CallTooltip( reaction )
	local called = reaction.active
	_CallTooltip( called, called and self:AssembleTooltip( reaction ) )
	self.tipReaction = called and reaction or nil
end
--------------------------------------------------------------------------------
function advUIObjectMonitor:AssembleTooltip( reaction )
	return {}
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Class( "advWidgetObjectMonitor", advUIObjectMonitor() )
--------------------------------------------------------------------------------
function advWidgetObjectMonitor:Init()
	self:Show( false )
	return advUIObjectMonitor.Init( self )
end
--------------------------------------------------------------------------------
function advWidgetObjectMonitor:Toggle( object )
	local changed = advUIObjectMonitor.Toggle( self, object )
	if changed then
		self:Show( object ~= nil )
	end
	return changed
end
--------------------------------------------------------------------------------