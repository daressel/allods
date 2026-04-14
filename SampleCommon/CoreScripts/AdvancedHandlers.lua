--[===[ Документация
Библиотека управления эвентами и реакциями

Зависимости:
	AddonBase.lua
	ClassesImplementation.lua
	WidgetCore.lua / WidgetCoreUserMods.lua

Отличия от стандартного АПИ
	Умная фильтрация эвентов
		Минимализация числа реально зарегистрированных хендлеров
		Обработка неограниченного (кроме памяти) числа фильтров
		Дерево фильтров обходится оптимизированно
	Фильрация реакций по источнику
	Работа с widgetcore
		В реакциях приходит TWidget (вместо WidgetSafe), исключение: задан флаг raw
	Поддержка передачи контекста вызова хендлера
	Поддержка подробного логгирования стейта
	Защита от утечек памяти (множественная регистрация, дерегистрация незарегистрированного и тп)

Предоставляемое АПИ по эвентам:	
	advEvent:RegisterEventHandler( handler, sysEvent, filter, flags )
		Зарегистрировать обработчик события
		Поля
			self - контекст вызова хендлера. Не может быть nil, про контекст смотри ниже
			handler - хендлер который будет вызываться - function
			sysEvent - имя регистрируемого события - string
			filter - фильтр - таблица или nil, описание смотри ниже
			flags - флаги - таблица или nil, описание смотри ниже
	
	advEvent:UnRegisterEventHandler( handler, sysEvent, filter, flags )
		Разрегистрировать обработчик события
		Обратное advEvent:RegisterEventHandler
		Поля идентичны advEvent:RegisterEventHandler( handler, sysEvent, filter, flags )
	
	advEvent:RegisterEventHandlers( eventsTable )
		Зарегистрировать обработчики событий
		Поля
			self - контекст вызова хендлера. Не может быть nil, про контекст смотри ниже
			eventsTable - таблица таблиц описателей хендлеров, поля описателя хендлера
				[1] - хендлер который будет вызываться - function
				[2] - имя регистрируемого события - string
				[3] - фильтр - таблица или nil, описание смотри ниже
				[4] - флаги - таблица или nil, описание смотри ниже
	
	advEvent:UnRegisterEventHandlers( eventsTable )
		Разрегистрировать обработчики событий
		Обратное advEvent:RegisterEventHandlers
		Поля идентичны advEvent:RegisterEventHandlers( eventsTable )
	
	advEvent:SendEvent( sysEvent, eventData )
		Для системных аддонов
			Послать событие всем системным (не пользовательским) аддонам
		Для пользовательских аддонов
			Послать событие всем пользовательским (не системным) аддонам
		Есть ограничения, смотри ниже
		Поля
			self - не используется
			sysEvent - имя посылаемого события, рекомендуется вида SCRIPT_[A-Z_]* - string
			eventData - пересылаемые данные - table или nil
	
	advEvent:SendEventLocal( sysEvent, eventData )
		Послать событие текущему аддону (самому себе)
		Есть ограничения, смотри ниже
		Поля
			self - не используется
			sysEvent - имя посылаемого события, рекомендуется вида SCRIPT_LOCAL_[A-Z_]* - string
			eventData - пересылаемые данные - table или nil
	
	Про фильтрацию
		Поддерживается фильтрация по ключам string
		Поддерживается фильтрация по значениям string, boolean, number, indexable userdata
		Фильтр задается в виде непустой таблицы ключ-значение
		Для того чтобы эвент сматчился по фильтру все значения из эвента по ключам из фильтра должны совпадать со значениями в фильтре
			Для userdata проверяется совпадение по значению
		Обход дерева фильтров выполняется оптимизированно
		Для очень специальных случаев поддерживается фильтрация по objectId, но
			ТОЛЬКО для CFilter и ТОЛЬКО при полном понимании механизма работы
				Подробнее смотри в функцию PreprocessFilter
			Работает только с эвентами со специальной поддержкой в коде (см. документацию АПИ)
			Использование такого фильтра совместно с обычным (не cfilter) фильтром приведет к невыполнению хендлеров! (без ассертов)
	
	Про флаги
		Флаги - таблица вида key-true, каждый флаг определяет ту или иную фичу
		cfilter
			Использовать для данного хендлера фильтрацию реализованную в клиенте
			Используется оптимизация деревьев фильтрации
				Все деревья фильтров в корне которых есть хендлер будут схлопнуты в него
					Если при регистрации хендлера существует зарегистрированный хендлер с более общим фильтром реальной регистрации не произойдет
					Если при регистрации хендлера существуют зарегистрированные хендлеры с более частными фильтрами они будут дерегистрированы в клиенте
					При дерегистрации хендлера происходит проверка на наличие дерегистрированных из-за него хендлеров и они будут зарегистрированы
						При этом оптимизация дерева сохранится
				Все хендлеры при этом будут корректно выполняться
		sa
			Требование исполнять хендлер без контекста
		_local
			Не регистрировать хендлеры в клиенте, будут работать только локальные скриптовые  события.
			Несовместимо с cfilter
			Флаг является монопольным (состояние должно быть константно для конкретного эвента)
		frame
			Считать данный хендлер хендлером фрейма (вызываемым каждый кадр)
			Имя хендлера игнорируется
			Флаги cfilter, _local игнорируются
			Фильтр недопустимы
			При  срабатывании хендлера в него НЕ будет передана таблица eventData, будут два параметра: elapsedMs и totalMs
				соответственно сколько миллисекунд прошло с прошлого фрейма и общее значение глобального таймера
	
	Про ограничения SendEvent
		Данные должны быть таблицей или nil (продвинется до пустой таблицы)
		Таблица не должна быть / содержать TWidget
		Таблица не должна иметь метатаблицы
		Допустимые типы ключей: number, string
		Допустимые типы значений: boolean, number, string, table (применяются все ограничения описанные выше), indexable userdata
		Допустимая глубина вложенности не более 8
		Общее количество ключей в таблице и вложенных таблицах не должно превышать 1024

Предоставляемое АПИ по реакциям
	advReaction:RegisterReactionHandler( handler, sysReaction, sourceWidget, flags )
		Зарегистрировать обработчик реакции
		Поля
			self - контекст вызова хендлера. Не может быть nil, про контекст смотри ниже
			handler - хендлер который будет вызываться - function
			sysReaction - имя регистрируемой реакции - string
			sourceWidget - виджет источник - TWidget или nil, описание смотри ниже
			flags - флаги - таблица или nil, описание смотри ниже
			
	advReaction:UnRegisterReactionHandler( handler, sysReaction, sourceWidget, flags )
		Разрегистрировать обработчик реакции
		Обратное advReaction:RegisterReactionHandler
		Поля идентичны advReaction:RegisterReactionHandler( self, handler, sysReaction, sourceWidget, flags )
		
	advReaction:RegisterReactionHandlers( reactionsTable )
		Зарегистрировать обработчики реакций
		Поля
			self - контекст вызова хендлера. Не может быть nil, про контекст смотри ниже
			reactionsTable - таблица таблиц описателей хендлеров, поля описателя хендлера
				[1] - хендлер который будет вызываться - function
				[2] - имя регистрируемой реакции - string
				[3] - виджет источник - TWidget или nil, описание смотри ниже
				[4] - флаги - таблица или nil, описание смотри ниже
				
	advReaction:UnRegisterReactionHandlers( reactionsTable )
		Разрегистрировать обработчики реакций
		Обратное advReaction:RegisterReactionHandlers
		Поля идентичны advReaction:RegisterReactionHandlers( reactionsTable )
	
	Про виджет-источник
		Если задан явно - используется явно
		Если не задан явно - считается что контекст и есть виджет
		Если это не так (контекста нет или контекст это не виджет) и НЕ задан флаг any то будет ассерт
	
	Про флаги			
		any
			Не фильтровать реакцию по источнику
			Использовать ОСТОРОЖНО
		raw
			Отдавать в реакции чистый WidgetSafe а не TWidget
			Флаг монополен
				То есть для одной и той же реации хендлеры с разным состоянием флага недопустимы
			Основное предназначение - проброс чистых реакций биндов в Main'е
			Использовать ОЧЕНЬ ОСТОРОЖНО
		sa
			Требование исполнять хендлер без контекста
			
Про контекст
	При регистрации хендлера можно указать контекст его вызова. Это нужно для корректной работы хендлеров являющихся методом класса
	Исполнение хендлера при наличии контекста
		handler( handlerContext, data )
	Исполнение хендлера при отсутствии (отсутствием считается значение false, nil - запрещенное значение) контекста
		handler( data )
	Пример
		Class( "myClass" )
		function myClass:Update( ... )
			...
			self:DoSomething()
			...
		end
		
		Если Update зарегестрировать без контекста то вызов self:DoSomething() будет зафейлен: self будет не тот
	Как передавать контекст
		Если вызов методов идет из widgetcore или из наследников advEvent/advReaction (без обращения к advEvent/advReaction напрямую) то контекст будет передан автоматически
			Если контекст не нужен - следует задать флаг sa
		При прямом обращении и необходимости контекста использовать advEvent/advReaction.FuncName( context, ... )
		При прямом обращении без контекста использовать advEvent/advReaction.FuncName( false, ... )		

Предоставляемое отладочное АПИ
	LogRegisteredEvents() - вывести в лог подробную информацию по всем зарегистрированным эвентам
	LogRegisteredReactions() - вывести в лог подробную информацию по всем зарегистрированным реакциям
	ListenToEvent( ... ) - выводить в лог содержимое приходящих эвентов (добавить эвенты в список)
	StopListenToEvent( ... ) - не выводить в лог содержимое приходящих эвентов (убрать эвенты из списка)
	ListenToReaction( ... ) - выводить в лог содержимое приходящих реакций (добавить реакции в список)
	StopListenToReaction( ... ) - не выводить в лог содержимое приходящих реакций (убрать реакции из списка)

Ассертами покрыто
	Передаа невалидных агрументов во все предоставляемые АПИ
	Попытки повторной регистрации хендлера с полностью идентичным набором параметров
	Попытки дерегистрации хендлера который не заргистрирован с данным набором параметров
	Некоторые наиболее вероятные ошибки которые могут возникнуть при нарушении целостности данных
]===]
--------------------------------------------------------------------------------
---BEGIN_DEBUG---
--------------------------------------------------------------------------------
-- Трассировка нативного апи
local DEBUG_EVENT_API_TRACE = false
local DEBUG_REACTION_API_TRACE = false
-- Включение ассертов на попытки дублирующей (де)регистрации
local DEBUG_EVENT_MULTIPLE_REGISTRATION = true
local DEBUG_REACTION_MULTIPLE_REGISTRATION = true
local DEBUG_EVENT_WRONG_UNREGISTRATION = true
local DEBUG_REACTION_WRONG_UNREGISTRATION = true
-- Включение ворнингов на различные вызовы которые допустимы но при неправильном использовании легко порождают сложновылавливаемые баги
local DEBUG_EVENT_UNSAFE_METHODS = true
local DEBUG_REACTION_UNSAFE_METHODS = true
--------------------------------------------------------------------------------
---END_DEBUG---
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
local RegisterEventInternal, UnRegisterEventInternal, SendEventInternal, SendEventLocalInternal, TriggerFrameHandlerInternal, DeferredCallInternal
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	-- API trace
	--------------------------------------------------------------------------------
	local api_RegisterEventHandler, api_UnRegisterEventHandler, api_SendEvent
	local api_RegisterFrameHandler, api_UnRegisterFrameHandler, api_HitFrameHandler
	---BEGIN_DEBUG---
	if DEBUG_EVENT_API_TRACE then
		local _api_RegisterEventHandler = common.RegisterEventHandler
		local _api_UnRegisterEventHandler = common.UnRegisterEventHandler
		local _api_SendEvent = common.SendEvent
		local _api_RegisterFrameHandler = common.RegisterFrameHandler
		local _api_UnRegisterFrameHandler = common.UnRegisterFrameHandler
		local _api_HitFrameHandler = common.HitFrameHandler
		
		function api_RegisterEventHandler( handler, sysEvent, filter )
			LogInfo( string.format( "advEvent::api_RegisterEventHandler called: [%s] for event [%35s] with filter [%s]", "func_" .. string.sub( tostring( handler ), -8 ), sysEvent, advtostring( filter ) ) )
			return _api_RegisterEventHandler( handler, sysEvent, filter )
		end
		
		function api_UnRegisterEventHandler( handler, sysEvent, filter )
			LogInfo( string.format( "advEvent::api_UnRegisterEventHandler called: [%s] for event [%35s] with filter [%s]", "func_" .. string.sub( tostring( handler ), -8 ), sysEvent, advtostring( filter ) ) )
			return _api_UnRegisterEventHandler( handler, sysEvent, filter )
		end
		
		function api_SendEvent( sysEvent, eventData )
			LogInfo( string.format( "advEvent::api_SendEvent called: Event [%s], data [%s]", sysEvent, advtostring( eventData ) ) )
			return _api_SendEvent( sysEvent, eventData )
		end
		
		function api_RegisterFrameHandler( handler, needHit )
			LogInfo( string.format( "advEvent::api_RegisterFrameHandler called: [%s] with needHit [%s]", "func_" .. string.sub( tostring( handler ), -8 ), tostring( needHit ) ) )
			return _api_RegisterFrameHandler( handler, sysEvent, needHit )
		end
		
		function api_UnRegisterFrameHandler()
			LogInfo( "advEvent::api_UnRegisterFrameHandler called" )
			return _api_UnRegisterFrameHandler()
		end
		
		function api_HitFrameHandler()
			LogInfo( "advEvent::api_HitFrameHandler called" )
			return _api_HitFrameHandler()
		end
		
	else
	---END_DEBUG---
		api_RegisterEventHandler = common.RegisterEventHandler
		api_UnRegisterEventHandler = common.UnRegisterEventHandler
		api_SendEvent = common.SendEvent
		api_RegisterFrameHandler = common.RegisterFrameHandler
		api_UnRegisterFrameHandler = common.UnRegisterFrameHandler
		api_HitFrameHandler = common.HitFrameHandler
	---BEGIN_DEBUG---
	end
	---END_DEBUG---
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	-- Common events
	--------------------------------------------------------------------------------
	local handlers = {}
	--------------------------------------------------------------------------------
	local function RunHandlers( eventTable, eventData )
		for context, contextHandlers in pairs( eventTable._handlers ) do
			if context then
				for contextHandler in pairs( contextHandlers ) do
					contextHandler( context, eventData )
				end
			else
				for contextHandler in pairs( contextHandlers ) do
					contextHandler( eventData )
				end
			end
		end
		
		for filterKey, filterVals in pairs( eventTable ) do
			local realVal = eventData[ filterKey ]
			local eventSubTable = realVal ~= nil and filterVals[ realVal ]
			if eventSubTable then
				RunHandlers( eventSubTable, eventData )
			end
		end
	end
	--------------------------------------------------------------------------------
	local function CleanUp( tab )
		if next( tab ) == nil then
			local parent = tab._parent
			if parent then
				parent[ tab._parentKey ] = nil
				return CleanUp( parent )
			end
		end
	end
	--------------------------------------------------------------------------------
	local function CompareFilterEntry( e1, e2 )
		return e1.k < e2.k
	end
	--------------------------------------------------------------------------------
	local function PreprocessFilter( filter )
		if not filter then
			return false
		end
		
		local preprocessedFilter = {}
		
		for key, val in pairs( filter ) do
			table.insert( preprocessedFilter, { k = key, v = val } )
		end
		table.sort( preprocessedFilter, CompareFilterEntry )
		return preprocessedFilter
	end
	--------------------------------------------------------------------------------
	local function GetFilteredTable( tab, pFilter, force, currentDepth, isHigherLevelHandlerActive )
		if pFilter == false then
			return tab, nil
		end
		currentDepth = currentDepth or 1
		
		local frec = pFilter[ currentDepth ]
		if not frec then
			return tab, isHigherLevelHandlerActive
		end
		
		if not isHigherLevelHandlerActive then
			isHigherLevelHandlerActive = getmetatable( tab )._registered
		end
		
		local fk, fv = frec.k, frec.v
		local tab_fk, tab_fk_fv = tab[ fk ]
		
		if not tab_fk then
			if force then
				tab_fk = setmetatable( {}, { __index = { _parent = tab, _parentKey = fk } } )
				tab_fk_fv = setmetatable( {}, { __index = { _parent = tab_fk, _parentKey = fv, _handlers = {} } } )
				tab_fk[ fv ] = tab_fk_fv
				tab[ fk ] = tab_fk
				return GetFilteredTable( tab_fk_fv, pFilter, true, currentDepth + 1, isHigherLevelHandlerActive )
			end
			return nil
		end
		tab_fk_fv = tab_fk[ fv ]
		if not tab_fk_fv then
			if force then
				tab_fk_fv = setmetatable( {}, { __index = { _parent = tab_fk, _parentKey = fv, _handlers = {} } } )
				tab_fk[ fv ] = tab_fk_fv
				return GetFilteredTable( tab_fk_fv, pFilter, true, currentDepth + 1, isHigherLevelHandlerActive )
			end
			return nil
		end
		return GetFilteredTable( tab_fk_fv, pFilter, force, currentDepth + 1, isHigherLevelHandlerActive )
	end
	--------------------------------------------------------------------------------
	local function GetEventTable( sysEvent, force )
		local baseTable = handlers
		local eventTable = baseTable[ sysEvent ]
		if eventTable then
			return eventTable
		elseif force then
			eventTable = setmetatable( {}, {
				_handlersCount = 0,
				_chandlersCount = 0,
				__index = { _handlers = {} }
			} )
			
			baseTable[ sysEvent ] = eventTable
			return eventTable
		end
	end
	--------------------------------------------------------------------------------
	local function RegisterSubTrees( root, sysEvent )
		for fk, fvalues in pairs( root ) do
			for fv, subTree in pairs( fvalues ) do
				local subTreeMeta = getmetatable( subTree )
				if subTreeMeta and subTreeMeta._apiFilter then
					api_RegisterEventHandler( subTreeMeta._apiHandler, sysEvent, subTreeMeta._apiFilter )
					subTreeMeta._registered = true
				else
					RegisterSubTrees( subTree, sysEvent )
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	local function UnRegisterSubTrees( root, sysEvent )
		for fk, fvalues in pairs( root ) do
			for fv, subTree in pairs( fvalues ) do
				local subTreeMeta = getmetatable( subTree )
				if subTreeMeta and subTreeMeta._registered then
					api_UnRegisterEventHandler( subTreeMeta._apiHandler, sysEvent, subTreeMeta._apiFilter )
					subTreeMeta._registered = nil
				else
					UnRegisterSubTrees( subTree, sysEvent )
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	local function AddHandler( handlerContext, handler, sysEvent, filter, isCFilter, isLocal )
		local preprocessedFilter = PreprocessFilter( filter )
		local eventTable = GetEventTable( sysEvent, true )
		local eventTableMeta = getmetatable( eventTable )
		
		---BEGIN_DEBUG---
		if ( eventTableMeta._local ~= nil and ( not isLocal ~= not eventTableMeta._local ) ) then
			error(
				"advEvent::AddHandler FATAL: Event [%s] _local flag missmatch! Register [%s], already registered [%s]",
				sysEvent,
				isLocal and "true" or "false",
				eventTableMeta._local and "true" or "false"
			)
		end
		
		if DEBUG_EVENT_UNSAFE_METHODS then
			if ( isCFilter and eventTableMeta._handlersCount ~= 0 ) or ( not isCFilter and eventTableMeta._chandlersCount ~= 0 ) then
				LogWarning( "advEvent::AddHandler Warning: Both common and CFilter handler types registered for event [" .. sysEvent .. "], it's a potential bug" )
			end
		end
		---END_DEBUG---
		
		local filteredTable, isHigherLevelHandlerActive = GetFilteredTable( eventTable, preprocessedFilter, true )
		local handlersTable = filteredTable._handlers
		local contextTable = handlersTable[ handlerContext ]
		if not contextTable then
			contextTable = {}
			handlersTable[ handlerContext ] = contextTable
		end
		
		---BEGIN_DEBUG---
		if DEBUG_EVENT_MULTIPLE_REGISTRATION then
			if contextTable[ handler ] then
				error(
					"advEvent::AddHandler Error: Handler [%s] for event [%s] with filter [%s] already registered",
					GetFunctionPathByAddress( handler, handlerContext ),
					sysEvent,
					filter
				)
			end
		end
		---END_DEBUG---
		contextTable[ handler ] = true
		
		if isLocal then
			eventTableMeta._handlersCount = eventTableMeta._handlersCount + 1
			eventTableMeta._local = eventTableMeta._local and eventTableMeta._local + 1 or 1
			return
		end
		
		if isCFilter then
			eventTableMeta._chandlersCount = eventTableMeta._chandlersCount + 1
			local meta = getmetatable( filteredTable )
			if not meta._apiHandler then
				local apiHandler = function( eventData )
					return RunHandlers( filteredTable, eventData )
				end
				meta._apiHandler = apiHandler
				meta._apiFilter = filter
				if not isHigherLevelHandlerActive then
					meta._registered = true
					api_RegisterEventHandler( apiHandler, sysEvent, filter )
					UnRegisterSubTrees( filteredTable, sysEvent )
				end
			end
		else
			eventTableMeta._handlersCount = eventTableMeta._handlersCount + 1
			if not eventTableMeta._registered then
				if not eventTableMeta._apiHandler then
					local apiHandler = function( eventData )
						return RunHandlers( eventTable, eventData )
					end
					eventTableMeta._apiHandler = apiHandler
				end
				eventTableMeta._registered = true
				api_RegisterEventHandler( eventTableMeta._apiHandler, sysEvent )
				UnRegisterSubTrees( eventTable, sysEvent )
			end
		end
	end
	--------------------------------------------------------------------------------
	local function RemoveHandler( handlerContext, handler, sysEvent, filter, isCFilter, isLocal )
		local preprocessedFilter = PreprocessFilter( filter )
		local eventTable = GetEventTable( sysEvent )
		if eventTable then
			local eventTableMeta = getmetatable( eventTable )
			local filteredTable = GetFilteredTable( eventTable, preprocessedFilter, false )
			local handlersTable = filteredTable and filteredTable._handlers
			if handlersTable then
				---BEGIN_DEBUG---
			
				if ( eventTableMeta._local ~= nil and ( not isLocal ~= not eventTableMeta._local ) ) then
					error(
						"advEvent::RemoveHandler FATAL: Event [%s] _local flag missmatch! Unregister [%s], registered [%s]",
						sysEvent,
						isLocal and "true" or "false",
						eventTableMeta._local and "true" or "false"
					)
				end
				
				-- Если вылетает этот ассерт то скорее всего баг в том, что при дерегистрации эвента забыли передать флаг cfilter
				-- Если это не так, то, вероятно, данные в advEvent неконсистентны
				if isCFilter ~= ( getmetatable( filteredTable )._apiFilter ~= nil ) then
					error(
						"advEvent::RemoveHandler FATAL: Handler [%s] for event [%s] with filter [%s] unregister undefined behavior: %s",
						GetFunctionPathByAddress( handler, handlerContext ),
						sysEvent,
						filter,
						isCFilter and "Registered common, try unregister CFilter" or "Registered CFilter, try unregister common"
					)
				end
				---END_DEBUG---
				local contextTable = handlersTable[ handlerContext ]
				if contextTable and contextTable[ handler ] then
					contextTable[ handler ] = nil
					
					if next( contextTable ) == nil then
						handlersTable[ handlerContext ] = nil
						if next( handlersTable ) == nil then
							if isCFilter then
								local meta = getmetatable( filteredTable )
								if meta._registered then
									api_UnRegisterEventHandler( meta._apiHandler, sysEvent, meta._apiFilter )
									meta._apiHandler = nil
									meta._apiFilter = nil
									meta._registered = nil
									RegisterSubTrees( filteredTable, sysEvent )
								end
							end
							CleanUp( filteredTable )
						end
					end
					
					if isLocal then
						eventTableMeta._handlersCount = eventTableMeta._handlersCount - 1
						if eventTableMeta._local == 1 then
							eventTableMeta._local = nil
						else
							eventTableMeta._local = eventTableMeta._local - 1
						end
						return
					end
					
					if isCFilter then
						eventTableMeta._chandlersCount = eventTableMeta._chandlersCount - 1
					else
						eventTableMeta._handlersCount = eventTableMeta._handlersCount - 1
						if eventTableMeta._handlersCount == 0 then
							api_UnRegisterEventHandler( eventTableMeta._apiHandler, sysEvent )
							eventTableMeta._registered = nil
							RegisterSubTrees( eventTable, sysEvent )
						end
					end
					
					return
				end
			end
		end
		
		---BEGIN_DEBUG---
		if DEBUG_EVENT_WRONG_UNREGISTRATION then
			error( "advEvent::RemoveHandler Error: Try unregister NOT registered handler [%s] for event [%s] with filter [%s]",
				GetFunctionPathByAddress( handler, handlerContext ),
				sysEvent,
				filter
			)
		end
		---END_DEBUG---
	end
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	-- Frame events
	--------------------------------------------------------------------------------
	local frameHandlersData = {
		_handlers = {}, -- Вызываются каждый фрейм, регистрируются полноценно
		_hitHandlers = {}, -- Вызываются если был hit, не регистрируются, одноразовые, передаются вместе с хитом
		_hit = false,
		_active = false,
		_activeHit = false
	}
	--------------------------------------------------------------------------------
	local function FrameHandler( elapsedMs, timeMs )
		if frameHandlersData._active then
			for context, contextHandlers in pairs( frameHandlersData._handlers ) do
				if context then
					for contextHandler in pairs( contextHandlers ) do
						contextHandler( context, elapsedMs, timeMs )
					end
				else
					for contextHandler in pairs( contextHandlers ) do
						contextHandler( elapsedMs, timeMs )
					end
				end
			end
		end
		if frameHandlersData._hit then
			local hitHandlers = frameHandlersData._hitHandlers
			frameHandlersData._hitHandlers = {}
			frameHandlersData._hit = false
			for context, contextHandlers in pairs( hitHandlers ) do
				if context then
					for contextHandler in pairs( contextHandlers ) do
						contextHandler( context, elapsedMs, timeMs )
					end
				else
					for contextHandler in pairs( contextHandlers ) do
						contextHandler( elapsedMs, timeMs )
					end
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	local function AddFrameHandler( handlerContext, handler )
		local eventTable = frameHandlersData._handlers
		
		local contextHandlers = eventTable[ handlerContext ]
		if not contextHandlers then
			contextHandlers = {}
			eventTable[ handlerContext ] = contextHandlers
		end
		
		---BEGIN_DEBUG---
		if contextHandlers[ handler ] ~= nil then
			error(
				"advEvent::AddFrameHandler Error: Frame handler [%s] already registered",
				GetFunctionPathByAddress( handler, handlerContext )
			)
		end
		---END_DEBUG---
		
		contextHandlers[ handler ] = true
		
		if not frameHandlersData._active then
			if frameHandlersData._activeHit then
				api_UnRegisterFrameHandler()
			end
			api_RegisterFrameHandler( FrameHandler, false )
			frameHandlersData._active = true
		end
		
	end
	--------------------------------------------------------------------------------
	local function RemoveFrameHandler( handlerContext, handler )
		local eventTable = frameHandlersData._handlers
		
		local contextHandlers = eventTable[ handlerContext ]
		if contextHandlers then
			contextHandlers[ handler ] = nil
			if next( contextHandlers ) == nil then
				eventTable[ handlerContext ] = nil
				if next( eventTable ) == nil then
					frameHandlersData._active = false
					api_UnRegisterFrameHandler()
					if frameHandlersData._activeHit then
						api_RegisterFrameHandler( FrameHandler, true )
					end
				end
			end
			
			return
		end
		
		---BEGIN_DEBUG---
		error(
			"advEvent::RemoveFrameHandler Error: Frame handler [%s] not registered",
			GetFunctionPathByAddress( handler, handlerContext )
		)
		---END_DEBUG---
	end
	--------------------------------------------------------------------------------
	local function HitFrameHandler( handlerContext, handler )
		local eventTable = frameHandlersData._hitHandlers
		
		local contextHandlers = eventTable[ handlerContext ]
		if not contextHandlers then
			contextHandlers = {}
			eventTable[ handlerContext ] = contextHandlers
		end
		
		contextHandlers[ handler ] = true
		
		if not frameHandlersData._hit then
			frameHandlersData._hit = true
			if not frameHandlersData._activeHit then
				frameHandlersData._activeHit = true
				if not frameHandlersData._active then
					api_RegisterFrameHandler( FrameHandler, true )
				end
			end
			api_HitFrameHandler()
		end
	end
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	-- Simple timer
	--------------------------------------------------------------------------------
	local timerHandlersData = {
		ct = nil,
		lp = false,
		hp = false,
		list = {}
	}
	--------------------------------------------------------------------------------
	local EVENT_SECOND_TIMER = "EVENT_SECOND_TIMER"
	local PRECISION_INTERVAL_MS = 2000
	--------------------------------------------------------------------------------
	local TimerFrameHandler, TimerSecondHandler, UpdateTimerState, ExecuteDefferedFn
	--------------------------------------------------------------------------------
	function TimerFrameHandler( elapsedMs, timeMs )
		timerHandlersData.ct = timeMs
		
		local firstElem = timerHandlersData.list[ 1 ]
		if not firstElem then -- Случай когда ExecuteDefferedFn в прошлом фрейме упал
			return UpdateTimerState()
		end
		
		local minDelta = firstElem.ts - timeMs
		while minDelta <= 0 do
			ExecuteDefferedFn( table.remove( timerHandlersData.list, 1 ) )
			local secondElem = timerHandlersData.list[ 1 ]
			if secondElem then
				minDelta = secondElem.ts - timeMs
			else
				minDelta = PRECISION_INTERVAL_MS + 1
				break
			end
		end
		
		if minDelta > PRECISION_INTERVAL_MS then
			UpdateTimerState()
		end
	end
	--------------------------------------------------------------------------------
	function TimerSecondHandler( eventData )
		timerHandlersData.ct = eventData.timeMs
		
		local firstElem = timerHandlersData.list[ 1 ]
		if not firstElem then -- Случай когда ExecuteDefferedFn в прошлом тике упал
			return UpdateTimerState()
		end
		
		local minDelta = firstElem.ts - timerHandlersData.ct
		while minDelta <= 0 do
			ExecuteDefferedFn( table.remove( timerHandlersData.list, 1 ) )
			local secondElem = timerHandlersData.list[ 1 ]
			if secondElem then
				minDelta = secondElem.ts - timerHandlersData.ct
			else
				break
			end
		end
		if minDelta < PRECISION_INTERVAL_MS then
			UpdateTimerState()
		end
	end
	--------------------------------------------------------------------------------
	function UpdateTimerState()
		local function RegisterHighPrecision()
			if not timerHandlersData.hp then
				AddFrameHandler( false, TimerFrameHandler )
				timerHandlersData.hp = true
			end
		end
		local function RegisterLowPrecision()
			if not timerHandlersData.lp then
				AddHandler( false, TimerSecondHandler, EVENT_SECOND_TIMER, nil, false, false )
				timerHandlersData.lp = true
			end
		end
		local function UnRegisterHighPrecision()
			if timerHandlersData.hp then
				RemoveFrameHandler( false, TimerFrameHandler )
				timerHandlersData.hp = false
			end
		end
		local function UnRegisterLowPrecision()
			if timerHandlersData.lp then
				RemoveHandler( false, TimerSecondHandler, EVENT_SECOND_TIMER, nil, false, false )
				timerHandlersData.lp = false
			end
		end
	
		if not timerHandlersData.list[ 1 ] then
			UnRegisterHighPrecision()
			UnRegisterLowPrecision()
			timerHandlersData.ct = nil
		else
			local minDelta = timerHandlersData.list[ 1 ].ts - timerHandlersData.ct
			if minDelta > PRECISION_INTERVAL_MS then
				UnRegisterHighPrecision()
				RegisterLowPrecision()
			else
				RegisterHighPrecision()
				UnRegisterLowPrecision()
			end
		end
	end
	--------------------------------------------------------------------------------
	function ExecuteDefferedFn( record )
		if record.ctx then
			record.fn( record.ctx, unpack( record.args, 1, record.argsCount ) )
		else
			record.fn( unpack( record.args, 1, record.argsCount ) )
		end
	end
	--------------------------------------------------------------------------------
	local function AddDelayedCall( handlerContext, handler, delay, ... )
		if timerHandlersData.ct == nil then
			timerHandlersData.ct = common.GetAbsTimeMs()
		end
		local record = { ts = timerHandlersData.ct + delay, ctx = handlerContext, fn = handler, args = {...}, argsCount = select( "#", ... ) }
		local _, insertKey = table.binsearch( timerHandlersData.list, record, function(a,b) return a.ts<b.ts end, function(a,b) return a.ts==b.ts end )
		table.insert( timerHandlersData.list, insertKey, record )
		UpdateTimerState()
	end
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	---BEGIN_DEBUG---
	--------------------------------------------------------------------------------
	local function ValidateFilter( filter, flags )
		local allowedValTypes = { boolean = true, number = true, string = true, userdata = true }
		if not filter then
			return true
		end
		
		if flags then
			if flags.frame and filter then
				LogError( "advEvent::ValidateFilter Error: Frame handler must be without filter" )
				return false
			end
		end
		if type( filter ) ~= "table" then
			LogError( "advEvent::ValidateFilter Error: filter defined, but not a table" )
			return false
		end
		if next( filter ) == nil then
			if DEBUG_EVENT_UNSAFE_METHODS then
				LogError( "advEvent::ValidateFilter Error: filter defined, but empty" )
				return false
			else
				LogWarning( "advEvent::ValidateFilter Warning: filter defined, but empty. It may be a serious BUG" )
			end
		end
		for k, v in pairs( filter ) do
			if type( k ) ~= "string" then
				LogError( "advEvent::ValidateFilter Error: filter table contain non-string key" )
				return false
			end
			local valType = type( v )
			if not allowedValTypes[ valType ] then
				LogError( "advEvent::ValidateFilter Error: unsupported filter type: " .. valType )
				return false
			end
			if valType == "userdata" and not isindexableudata( v ) then
				LogError( "advEvent::ValidateFilter Error: unsupported filter type: non-indexable userdata")
				return false
			end
		end
		return true
	end
	--------------------------------------------------------------------------------
	local function ValidateFlags( flags, filter )
		local allowedFlags = { sa = true, cfilter = true, _local = true, frame = true }
		if not flags then
			if filter and type( filter ) == "table" then
				for flag in pairs( allowedFlags ) do
					if filter[ flag ] ~= nil then
						LogError( "advEvent::ValidateFlags Error: flags mixed up with filters" )
						return false
					end
				end
			end
		
			return true
		end
		if type( flags ) ~= "table" then
			LogError( "advEvent::ValidateFlags Error: flags defined, but not a table" )
			return false
		end
		for k, v in pairs( flags ) do
			if not allowedFlags[ k ] then
				LogError( "advEvent::ValidateFlags Error: flags contain unknown flag: " .. tostring( k ) )
				return false
			end
			if type( v ) ~= "boolean" then
				LogError( string.format( "advEvent::ValidateFlags Error: Wrong flag [%s] type: boolean expected, got %s", k, type( v ) ) )
				return false
			end
		end
		if flags.cfilter and flags._local then
			LogError( "advEvent::ValidateFlags Error: Both cfilter and _local flags is prohibited" )
			return false
		end
		return true
	end
	--------------------------------------------------------------------------------
	local function ValidateSendEventTable( tab, isLocal )
		local validKeyTypes = { string = true, number = true }
		local validValueTypes = { boolean = true, string = true, number = true, table = true, userdata = true }
		local MAX_COUNT = 1024
		local MAX_DEPTH = 8
		local count = 0
		if type( tab ) ~= "table" then
			LogError( "advEvent::ValidateSendEventTable Error: Event table not-a-table" )
			return false
		end
		local function CheckTable( t, visited, depth )
			if depth > MAX_DEPTH then
				LogError( "advEvent::ValidateSendEventTable Error: Event table too deep" )
				return false
			end
			if visited[ t ] then
				LogError( "advEvent::ValidateSendEventTable Error: Event table has loop" )
				return false
			end
			visited[ t ] = true
			if IsWidgetcoreWidget( t ) then
				LogError( "advEvent::ValidateSendEventTable Error: Event table contain TWidget" )
				return false
			end
			if getmetatable( t ) ~= nil then
				LogError( "advEvent::ValidateSendEventTable Error: Event table contain table with metatable" )
				return false
			end
			for k, v in pairs( t ) do
				count = count + 1
				if not validKeyTypes[ type( k ) ] then
					LogError( "advEvent::ValidateSendEventTable Error: Event table contain key with forbidden type:", type( k ) )
					return false
				end
				if not validValueTypes[ type( v ) ] then
					LogError( "advEvent::ValidateSendEventTable Error: Event table contain value with forbidden type:", type( v ) )
					return false
				end
				if type( v ) == "table" then
					local result = CheckTable( v, table.clone( visited ), depth + 1 )
					if not result then
						return false
					end
				end
			end
			return true
		end
		if isLocal or CheckTable( tab, {}, 1 ) then
			if not isLocal and count > MAX_COUNT then
				LogError( "advEvent::ValidateSendEventTable Error: Too big event table", count, "entries, limit is", MAX_COUNT )
				return false
			end
			return true
		end
		return false
	end
	--------------------------------------------------------------------------------
	function BuildHandlersTable( target, handlersTable, typeNamer )
		for handlerContext, contextHandlers in pairs( handlersTable ) do
			if handlerContext then
				local cpath
				if type( handlerContext ) == "table" then
					cpath = GetPathByAddress( handlerContext ) or
						( IsWidgetcoreWidget( handlerContext ) and handlerContext:GetFullPath() ) or
						string.format( "table_%s", string.sub( tostring( handlerContext ), -8 ) )
				else
					cpath = advtostring( handlerContext )
				end
				for handler in pairs( contextHandlers ) do
					local fpath = GetFunctionPathByAddress( handler, handlerContext )
					table.insert( target, string.format( 
						"%s( %s%s )",
						fpath, cpath, typeNamer and string.format( ", %sData", typeNamer ) or ", elapsedMs, timeMs"
					) )
				end
			else
				for handler in pairs( contextHandlers ) do
					local fpath = GetFunctionPathByAddress( handler, handlerContext )
					table.insert( target, string.format( 
						"%s()",
						fpath, typeNamer and string.format( " %sData ", typeNamer ) or " elapsedMs, timeMs "
					) )
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	local function BuildFilteredHandlersTable( target, dataTable, parentFilter )
		parentFilter = parentFilter or {}
		for fk, fvalues in pairs( dataTable ) do
			for fv, nextDataTable in pairs( fvalues ) do
				local filter = table.clone( parentFilter )
				filter[ fk ] = fv
				if next( nextDataTable._handlers ) ~= nil then
					local filterString = string.format( "%s%s", getmetatable( nextDataTable )._apiFilter ~= nil and "[CFilter] " or "", advtostring( filter ) )
					target[ filterString ] = target[ filterString ] or {}
					BuildHandlersTable( target[ filterString ], nextDataTable._handlers, "event" )
				end
				BuildFilteredHandlersTable( target, nextDataTable, filter )
			end
		end
	end
	--------------------------------------------------------------------------------
	local function BuildCompactEventsTable()
		local result = {}
		for sysEvent, eventData in pairs( handlers ) do	
			local eventDataMeta = getmetatable( eventData )
			if eventDataMeta._handlersCount > 0 or eventDataMeta._chandlersCount > 0 then
				local eventResult = {
					_local = eventDataMeta._local,
					count = eventDataMeta._handlersCount,
					countC = eventDataMeta._chandlersCount
				}
				if next( eventData._handlers ) ~= nil then
					eventResult.nofiltered = {}
					BuildHandlersTable( eventResult.nofiltered, eventData._handlers, "event" )
				end
				if next( eventData ) then
					eventResult.filtered = {}
					BuildFilteredHandlersTable( eventResult.filtered, eventData, false )
				end
				result[ sysEvent ] = eventResult
			end
		end
		return result
	end
	--------------------------------------------------------------------------------
	local function LogRegisteredEvent( sysEvent, eventInfo )
		LogInfo( string.format(
			"%sEvent [%s]: Handlers: [%03d], CHandlers: [%03d]",
			eventInfo._local and "LOCAL " or "",
			sysEvent,	
			eventInfo.count,
			eventInfo.countC
		) )
		if eventInfo.nofiltered then
			LogInfo( "    Filter: NONE:" )
			table.sort( eventInfo.nofiltered )
			for _, eventString in ipairs( eventInfo.nofiltered ) do
				LogInfo( "        " .. eventString )
			end
		end
		if eventInfo.filtered then
			for filterString, handlers in sortpairs( eventInfo.filtered ) do
				LogInfo( "    Filter: " .. filterString .. ":" )
				table.sort( handlers )
				for _, eventString in ipairs( handlers ) do
					LogInfo( "        " .. eventString )
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	function LogDeferredFunctions()
		LogInfo( "----------------------------------------------------------------------------" )
		LogInfo( "---------------------[advEvent deferred function calls]---------------------" )
		LogInfo( string.format( "Active mode: %s", timerHandlersData.lp and "Low precision" or timerHandlersData.hp and "High precision" or "None" ) )
		if timerHandlersData.lp or timerHandlersData.hp then
			local ct = timerHandlersData.ct
			for _, record in ipairs( timerHandlersData.list ) do
				LogInfo( string.format( "Launch on [%d] (remaining %d ms): %s", record.ts, record.ts - ct, tostring( record.fn ) ) )
			end
			LogInfo( "----------------------------------------------------------------------------" )
			LogInfo( string.format( "Current time: %d", ct ) )
		end
		LogInfo( "----------------------------------------------------------------------------" )
	end
	--------------------------------------------------------------------------------
	function LogRegisteredEventDetail( sysEvent )
		local fullTable = BuildCompactEventsTable()
		local eventTable = fullTable[ sysEvent ]
		if eventTable then
			LogRegisteredEvent( sysEvent, eventTable )
		else
			LogInfo( "Not registered" )
		end
	end
	--------------------------------------------------------------------------------
	function LogRegisteredEvents()
		local fullTable = BuildCompactEventsTable()
		local frameTable = {}
		BuildHandlersTable( frameTable, frameHandlersData._handlers, nil )
		local counters = {
			event = 0,
			count = 0,
			countC = 0,
			countF = 0
		}
		LogInfo( "----------------------------------------------------------------------------" )
		LogInfo( "------------------------[advEvent registered events]------------------------" )
		for sysEvent, eventInfo in sortpairs( fullTable ) do
			LogRegisteredEvent( sysEvent, eventInfo )
			counters.count = counters.count + eventInfo.count
			counters.countC = counters.countC + eventInfo.countC
			if eventInfo.count + eventInfo.countC > 0 then
				counters.event = counters.event + 1
			end
		end
		if next( frameTable ) then
			LogInfo( "---------------------[advEvent registered frame events]---------------------" )
			table.sort( frameTable )
			for _, eventString in ipairs( frameTable ) do
				LogInfo( eventString )
				counters.countF = counters.countF + counters.countF
			end
		end
		LogInfo( "----------------------------------------------------------------------------" )
		LogInfo( string.format(
			"Total: Events: [%03d], Handlers: [%03d], CHandlers: [%03d], FHandlers: [%03d]",
			counters.event,
			counters.count,
			counters.countC,
			counters.countF
		) )
		LogInfo( "----------------------------------------------------------------------------" )
	end
	--------------------------------------------------------------------------------
	local eventListeners = {}
	--------------------------------------------------------------------------------
	function ListenToEvent( ... )
		for _, sysEvent in ipairs( {...} ) do
			if type( sysEvent ) == "string" then
				if not eventListeners[ sysEvent ] then
					local eventTable = GetEventTable( sysEvent )
					local eventTableMeta = eventTable and getmetatable( eventTable ) or {}
				
					eventListeners[ sysEvent ] = function( eventData ) LogInfo( sysEvent, eventData ) end
					RegisterEventInternal( false, eventListeners[ sysEvent ], sysEvent, nil, { _local = eventTableMeta._local == true } )
				end
			else
				LogError( "Can't listen to event " .. tostring( sysEvent ) .. ": string expected." )
			end
		end
	end
	--------------------------------------------------------------------------------
	function StopListenToEvent( ... )
		for _, sysEvent in ipairs( {...} ) do
			if type( sysEvent ) == "string" then
				if eventListeners[ sysEvent ] then
					local eventTable = GetEventTable( sysEvent )
					local eventTableMeta = eventTable and getmetatable( eventTable ) or {}
					
					UnRegisterEventInternal( false, eventListeners[ sysEvent ], sysEvent, nil, { _local = eventTableMeta._local == true } )
					eventListeners[ sysEvent ] = nil
				end
			else
				LogError( "Can't stop listen to event " .. tostring( sysEvent ) .. ": string expected." )
			end
		end
	end
	--------------------------------------------------------------------------------
	---END_DEBUG---
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	function RegisterEventInternal( handlerContext, handler, sysEvent, filter, flags )
		---BEGIN_DEBUG---
		local handlerType = type( handler )
		assert( handlerContext ~= nil,
			"advEvent::RegisterEventInternal Error: handlerContext must be defined" )
		assert( type( sysEvent ) == "string" and #sysEvent > 0, 
			"advEvent::RegisterEventInternal Error: Incorrect sysEvent type: non-empty string expected got [%s]", sysEvent )
		assert( handlerType == "function" or ( handlerType == "table" and getmetatable( handler ) and getmetatable( handler ).__call ),
			"advEvent::RegisterEventInternal Error: Incorrect handler type for event [%s]: function expected, got [%s]", sysEvent, handlerType )
		assert( ValidateFlags( flags, filter ),
			"advEvent::RegisterEventInternal Error: Incorrect flags for event [%s], see manual", sysEvent )
		assert( ValidateFilter( filter, flags ),
			"advEvent::RegisterEventInternal Error: Incorrect filter for event [%s], see manual", sysEvent )
		---END_DEBUG---
		
		local isCFilter = false
		local isLocal = false
		if flags then
			if flags.sa then
				handlerContext = false
			end
			if flags._local then
				isLocal = true
			end
			if flags.cfilter and filter then
				isCFilter = true
			end
			if flags.frame then
				return AddFrameHandler( handlerContext, handler )
			end
		end
		
		return AddHandler( handlerContext, handler, sysEvent, filter, isCFilter, isLocal )
	end
	--------------------------------------------------------------------------------
	function UnRegisterEventInternal( handlerContext, handler, sysEvent, filter, flags )
		---BEGIN_DEBUG---
		local handlerType = type( handler )
		assert( handlerContext ~= nil,
			"advEvent::UnRegisterEventInternal Error: handlerContext must be defined" )
		assert( type( sysEvent ) == "string" and #sysEvent > 0, 
			"advEvent::UnRegisterEventInternal Error: Incorrect sysEvent type: non-empty string expected got [%s]", sysEvent )
		assert( handlerType == "function" or ( handlerType == "table" and getmetatable( handler ) and getmetatable( handler ).__call ),
			"advEvent::UnRegisterEventInternal Error: Incorrect handler type for event [%s]: function expected, got [%s]", sysEvent, handlerType )
		assert( ValidateFlags( flags, filter ),
			"advEvent::UnRegisterEventInternal Error: Incorrect flags for event [%s], see manual", sysEvent )
		assert( ValidateFilter( filter, flags ),
			"advEvent::UnRegisterEventInternal Error: Incorrect filter for event [%s], see manual", sysEvent )
		---END_DEBUG---
		
		local isCFilter = false
		local isLocal = false
		if flags then
			if flags.sa then
				handlerContext = false
			end
			if flags._local then
				isLocal = true
			end
			if flags.cfilter and filter then
				isCFilter = true
			end
			if flags.frame then
				return RemoveFrameHandler( handlerContext, handler )
			end
		end
		
		return RemoveHandler( handlerContext, handler, sysEvent, filter, isCFilter, isLocal )
	end
	--------------------------------------------------------------------------------
	function SendEventInternal( sysEvent, eventData )
		eventData = eventData or {}
		---BEGIN_DEBUG---
		assert( type( sysEvent ) == "string" and #sysEvent > 0, "advEvent::SendEventInternal Error: Incorrect sysEvent type: non-empty string expected got [%s]", sysEvent )
		assert( ValidateSendEventTable( eventData, false ), "advEvent::SendEventInternal Error: Incorrect eventData for event [%s], see manual", sysEvent )
		---END_DEBUG---
		api_SendEvent( sysEvent, eventData )
	end 
	--------------------------------------------------------------------------------
	function SendEventLocalInternal( sysEvent, eventData )
		eventData = eventData or {}
		---BEGIN_DEBUG---
		assert( type( sysEvent ) == "string" and #sysEvent > 0, "advEvent::SendEventLocalInternal Error: Incorrect sysEvent type: non-empty string expected got [%s]", sysEvent )
		if not ValidateSendEventTable( eventData, true ) then
			LogError( "advEvent::SendEventLocalInternal Error: Incorrect eventData for event", sysEvent, "It will work with LOCAL event, but it's a bug, report it to interface programmer" )
		end
		---END_DEBUG---
		
		
		local eventTable = handlers[ sysEvent ]
		local eventTableMeta = eventTable and getmetatable( eventTable )
		local handlersCount = eventTableMeta and eventTableMeta._handlersCount + eventTableMeta._chandlersCount or 0
		
		if handlersCount > 0 then
			RunHandlers( eventTable, eventData )
		end
	end
	--------------------------------------------------------------------------------
	function TriggerFrameHandlerInternal( handlerContext, handler )
		---BEGIN_DEBUG---
		local handlerType = type( handler )
		assert( handlerContext ~= nil,
			"advEvent::TriggerFrameHandlerInternal Error: handlerContext must be defined" )
		assert( handlerType == "function" or ( handlerType == "table" and getmetatable( handler ) and getmetatable( handler ).__call ),
			"advEvent::TriggerFrameHandlerInternal Error: Incorrect handler type: function expected, got [%s]", handlerType )
		---END_DEBUG---
		
		return HitFrameHandler( handlerContext, handler )
	end
	--------------------------------------------------------------------------------
	function DeferredCallInternal( handlerContext, handler, delayMs, ... )
		---BEGIN_DEBUG---
		local handlerType = type( handler )
		assert( handlerContext ~= nil,
			"advEvent::DeferredCallInternal Error: handlerContext must be defined" )
		assert( handlerType == "function" or ( handlerType == "table" and getmetatable( handler ) and getmetatable( handler ).__call ),
			"advEvent::DeferredCallInternal Error: Incorrect handler type: function expected, got [%s]", handlerType )
		assert( type( delayMs ) == "number" and delayMs > 0, 
			"advEvent::DeferredCallInternal Error: Incorrect delayMs type: number > 0 expected, got [%s]", delayMs )
		---END_DEBUG---
		
		return AddDelayedCall( handlerContext, handler, delayMs, ... )
	end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Class( "advEvent" )
--------------------------------------------------------------------------------
function advEvent:RegisterEventHandler( handler, sysEvent, filter, flags )
	RegisterEventInternal( self, handler, sysEvent, filter, flags )
end
--------------------------------------------------------------------------------
function advEvent:UnRegisterEventHandler( handler, sysEvent, filter, flags )
	UnRegisterEventInternal( self, handler, sysEvent, filter, flags )
end
--------------------------------------------------------------------------------
function advEvent:RegisterEventHandlers( handlers )
	---BEGIN_DEBUG---
	assert( type( handlers ) == "table", "advEvent:RegisterEventHandlers Error: Bad handlers format: table expected got %s", type( handlers ) )
	---END_DEBUG---
	for _, pack in ipairs( handlers ) do
		---BEGIN_DEBUG---
		assert( type( pack ) == "table", "advEvent:RegisterEventHandlers Error: Bad handler record format: table expected got %s", type( pack ) )
		---END_DEBUG---
		RegisterEventInternal( self, pack[ 1 ], pack[ 2 ], pack[ 3 ], pack[ 4 ] )
	end
end
--------------------------------------------------------------------------------
function advEvent:UnRegisterEventHandlers( handlers )
	---BEGIN_DEBUG---
	assert( type( handlers ) == "table", "advEvent:UnRegisterEventHandlers Error: Bad handlers format: table expected got %s", type( handlers ) )
	---END_DEBUG---
	for _, pack in ipairs( handlers ) do
		---BEGIN_DEBUG---
		assert( type( pack ) == "table", "advEvent:UnRegisterEventHandlers Error: Bad handler record format: table expected got %s", type( pack ) )
		---END_DEBUG---
		UnRegisterEventInternal( self, pack[ 1 ], pack[ 2 ], pack[ 3 ], pack[ 4 ] )
	end
end
--------------------------------------------------------------------------------
function advEvent:SendEvent( sysEvent, eventData )
	SendEventInternal( sysEvent, eventData )
end
--------------------------------------------------------------------------------
function advEvent:SendEventLocal( sysEvent, eventData )
	SendEventLocalInternal( sysEvent, eventData )
end
--------------------------------------------------------------------------------
function advEvent:TriggerFrameHandler( handler )
	TriggerFrameHandlerInternal( self, handler )
end
--------------------------------------------------------------------------------
function advEvent:DeferredCall( func, delayMs, ... )
	DeferredCallInternal( self, func, delayMs, ... )
end
--------------------------------------------------------------------------------
RegisterWidgetcoreExternalLib( advEvent )
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
local RegisterReactionInternal, UnRegisterReactionInternal
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	local api_RegisterReactionHandler, api_UnRegisterReactionHandler
	---BEGIN_DEBUG---
	if DEBUG_REACTION_API_TRACE then
		local _api_RegisterReactionHandler = common.RegisterReactionHandler
		local _api_UnRegisterReactionHandler = common.UnRegisterReactionHandler
		function api_RegisterReactionHandler( handler, sysReaction )
			LogInfo( string.format( "advReaction::api_RegisterReactionHandler called: [%s] for reaction [%s]", "func_" .. string.sub( tostring( handler ), -8 ), sysReaction ) )
			return _api_RegisterReactionHandler( handler, sysReaction )
		end
		function api_UnRegisterReactionHandler( handler, sysReaction )
			LogInfo( string.format( "advReaction::api_UnRegisterReactionHandler called: [%s] for reaction [%s]", "func_" .. string.sub( tostring( handler ), -8 ), sysReaction ) )
			return _api_UnRegisterReactionHandler( handler, sysReaction )
		end
	else
	---END_DEBUG---
		api_RegisterReactionHandler = common.RegisterReactionHandler
		api_UnRegisterReactionHandler = common.UnRegisterReactionHandler
	---BEGIN_DEBUG---
	end
	---END_DEBUG---
	--------------------------------------------------------------------------------
	local handlers = {}
	--------------------------------------------------------------------------------
	local function RunHandlers( handlersTable, reactionData )
		if handlersTable then
			for context, contextHandlers in pairs( handlersTable ) do
				if context then
					for contextHandler in pairs( contextHandlers ) do
						contextHandler( context, reactionData )
					end
				else
					for contextHandler in pairs( contextHandlers ) do
						contextHandler( reactionData )
					end
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	local function GenericHandler( reactionData )
		local sysReaction = reactionData.name
		local reactionTable = handlers[ sysReaction ]
		---BEGIN_DEBUG---
		assert( reactionTable ~= nil, "advReaction::GenericHandler FATAL: handle unknown reaction [%s]. It's a critical bug in advReaction", sysReaction )
		---END_DEBUG---
		if not reactionTable.raw then
			if reactionTable[ false ] == nil then
				reactionData.widget = GetTWidget( reactionData.widget )
			else
				reactionData.widget = TWidget( reactionData.widget )
			end
		end
		RunHandlers( reactionTable[ reactionData.widget:GetInstanceId() ], reactionData )
		RunHandlers( reactionTable[ false ], reactionData )
	end
	--------------------------------------------------------------------------------
	local function AddHandler( handlerContext, handler, sysReaction, sourceId, raw )
		local baseTable = handlers
		local reactionTable = baseTable[ sysReaction ]
		if not reactionTable then
			reactionTable = { handlersCount = 0 }
			baseTable[ sysReaction ] = reactionTable
		end
		
		---BEGIN_DEBUG---
		assert( ( not raw ) == ( reactionTable.raw == nil ) or reactionTable.handlersCount == 0,
			"advReaction::AddHandler Error: Reaction [%s] RAW flag usage error, see manual" )
		---END_DEBUG---
		if raw then
			reactionTable.raw = reactionTable.raw and reactionTable.raw + 1 or 1
		end
		
		local handlersTable = reactionTable[ sourceId ]
		if not handlersTable then
			handlersTable = {}
			reactionTable[ sourceId ] = handlersTable
		end
		local contextTable = handlersTable[ handlerContext ]
		if not contextTable then
			contextTable = {}
			handlersTable[ handlerContext ] = contextTable
		end
		
		---BEGIN_DEBUG---
		if DEBUG_REACTION_MULTIPLE_REGISTRATION then
			if contextTable[ handler ] then
				error(
					"advReaction::AddHandler Error: Handler [%s] for reaction [%s] from [%s] already registered",
					GetFunctionPathByAddress( handler, handlerContext ),
					sysReaction,
					sourceId and ( GetTWidgetById( sourceId ) and GetTWidgetById( sourceId ):GetFullPath() or "UNKNOWN" ) or "any source"
				)
			end
		end
		---END_DEBUG---
		contextTable[ handler ] = true

		
		reactionTable.handlersCount = reactionTable.handlersCount + 1
		if reactionTable.handlersCount == 1 then
			api_RegisterReactionHandler( GenericHandler, sysReaction )
		end
	end
	--------------------------------------------------------------------------------
	local function RemoveHandler( handlerContext, handler, sysReaction, sourceId, raw )
		local baseTable = handlers
		local reactionTable = baseTable[ sysReaction ]
		if reactionTable then
			local handlersTable = reactionTable[ sourceId ]
			if handlersTable then
				local contextTable = handlersTable[ handlerContext ]
				if contextTable and contextTable[ handler ] then
					contextTable[ handler ] = nil

					reactionTable.handlersCount = reactionTable.handlersCount - 1
					if reactionTable.handlersCount == 0 then
						api_UnRegisterReactionHandler( GenericHandler, sysReaction )
					end
					
					---BEGIN_DEBUG---
					assert( ( not raw ) == ( reactionTable.raw == nil ),
						"advReaction::RemoveHandler Error: Reaction [%s] RAW flag usage error, see manual" )
					---END_DEBUG---
					if raw then
						if reactionTable.raw == 1 then
							reactionTable.raw = nil
						else
							reactionTable.raw = reactionTable.raw - 1
						end
					end
					
					return
				end
			end
		end
		---BEGIN_DEBUG---
		if DEBUG_REACTION_WRONG_UNREGISTRATION then
			error( "advReaction::RemoveHandler Error: Try unregister NOT registered handler [%s] for reaction [%s] from [%s]",
				GetFunctionPathByAddress( handler, handlerContext ),
				sysReaction,
				sourceId and ( GetTWidgetById( sourceId ) and GetTWidgetById( sourceId ):GetFullPath() or "UNKNOWN" ) or "any source"
			)
		end
		---END_DEBUG---
	end
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	---BEGIN_DEBUG---
	--------------------------------------------------------------------------------
	local function ValidateWidget( handlerContext, widget )
		widget = widget or handlerContext
		if IsTWidget( widget )	then
			return true
		end
		LogError( "advReaction::ValidateWidget Error: Invalid TWidget:", widget )
		return false
	end
	--------------------------------------------------------------------------------
	local function ValidateFlags( flags )
		local allowedFlags = { any = true, sa = true, raw = true }
		if not flags then
			return true
		end
		if type( flags ) ~= "table" then
			LogError( "advReaction::ValidateFlags Error: flags defined, but not a table" )
			return false
		end
		for k, v in pairs( flags ) do
			if not allowedFlags[ k ] then
				LogError( "advReaction::ValidateFlags Error: flags contain unknown flag: " .. tostring( k ) )
				return false
			end
			if type( v ) ~= "boolean" then
				LogError( string.format( "advReaction::ValidateFlags Error: Wrong flag [%s] type: boolean expected, got %s", k, type( v ) ) )
				return false
			end
		end
		return true
	end
	--------------------------------------------------------------------------------
	local function BuildCompactReactionsTable()
		local result = {}
		for sysRection, reactionData in pairs( handlers ) do
			if reactionData.handlersCount > 0 then
				local reactionResult = {
					count = reactionData.handlersCount,
					raw = reactionData.raw
				}
				for sourceId, handlers in pairs( reactionData ) do
					if sourceId ~= "handlersCount" then
						if sourceId == false then
							reactionResult.nofiltered = {}
							BuildHandlersTable( reactionResult.nofiltered, handlers, "reaction" )
						else
							reactionResult.filtered = reactionResult.filtered or {}
							local widget = GetTWidgetById( sourceId )
							local filterString = widget:GetFullPath()
							reactionResult.filtered[ filterString ] = {}
							BuildHandlersTable( reactionResult.filtered[ filterString ], handlers, "reaction" )
						end
					end
				end
				result[ sysRection ] = reactionResult
			end
		end
		
		return result
	end
	--------------------------------------------------------------------------------
	local function LogRegisteredReaction( sysReaction, reactionInfo )
		LogInfo( string.format(
			"[%s]: %s[%03d]",
			sysReaction,
			reactionInfo.raw and "[RAW] " or "",
			reactionInfo.count
		) )
		if reactionInfo.nofiltered then
			LogInfo( "    Reaction source: ANY:" )
			table.sort( reactionInfo.nofiltered )
			for _, reactionString in ipairs( reactionInfo.nofiltered ) do
				LogInfo( "        " .. reactionString )
			end
		end
		if reactionInfo.filtered then
			for filterString, handlers in sortpairs( reactionInfo.filtered ) do
				LogInfo( "    Reaction source: " .. filterString .. ":" )
				table.sort( handlers )
				for _, reactionString in ipairs( handlers ) do
					LogInfo( "        " .. reactionString )
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	function LogRegisteredReactions()
		local fullTable = BuildCompactReactionsTable()
		local counters = {
			reaction = 0,
			count = 0,
		}
		LogInfo( "----------------------------------------------------------------------------" )
		LogInfo( "---------------------[advReaction registered reactions]---------------------" )
		for sysReaction, reactionInfo in sortpairs( fullTable ) do
			LogRegisteredReaction( sysReaction, reactionInfo )
			counters.count = counters.count + reactionInfo.count
			if reactionInfo.count > 0 then
				counters.reaction = counters.reaction + 1
			end
		end
		LogInfo( "----------------------------------------------------------------------------" )
		LogInfo( string.format(
			"Total: Reactions: [%03d], Handlers: [%03d]",
			counters.reaction,
			counters.count
		) )
		LogInfo( "----------------------------------------------------------------------------" )
	end
	--------------------------------------------------------------------------------
	local reactionListeners = {}
	--------------------------------------------------------------------------------
	function ListenToReaction( ... )
		for _, sysReaction in ipairs( {...} ) do
			if type( sysReaction ) == "string" then
				if not reactionListeners[ sysReaction ] then
					reactionListeners[ sysReaction ] = function( reactionData )
						local clearReaction =  {}
						for k, v in pairs( reactionData ) do
							if k == "widget" and IsTWidget( v ) then
								clearReaction[k] = v:GetRaw()
							else
								clearReaction[ k ] = v
							end
						end
						LogInfo( sysReaction, clearReaction )
					end
					AddHandler( false, reactionListeners[ sysReaction ], sysReaction, false, false )
				end
			else
				LogError( "Can't listen to reaction " .. tostring( sysReaction ) .. ": string expected." )
			end
		end
	end
	--------------------------------------------------------------------------------
	function StopListenToReaction( ... )
		for _, sysReaction in ipairs( {...} ) do
			if type( sysReaction ) == "string" then
				if reactionListeners[ sysReaction ] then
					RemoveHandler( false, reactionListeners[ sysReaction ], sysReaction, false, false )
					reactionListeners[ sysReaction ] = nil
				end
			else
				LogError( "Can't stop listen to reaction " .. tostring( sysReaction ) .. ": string expected." )
			end
		end
	end
	--------------------------------------------------------------------------------
	---END_DEBUG---
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	function RegisterReactionInternal( handlerContext, handler, sysReaction, widget, flags )
		---BEGIN_DEBUG---
		local handlerType = type( handler )
		local sysReactiontType = type( sysReaction )
		assert( handlerContext ~= nil,
			"advReacton::RegisterReactionInternal Error: handlerContext must be defined" )
		assert( sysReactiontType == "string" and #sysReaction > 0,
			"advReacton::RegisterReactionInternal Error: Incorrect sysReaction type: string expected got [%s]", sysReactiontType )
		assert( handlerType == "function" or ( handlerType == "table" and getmetatable( handler ) and getmetatable( handler ).__call ),
			"advReacton::RegisterReactionInternal Error: Incorrect handler type for reaction [%s]: function expected, got [%s]", sysReaction, handlerType )
		assert( ValidateFlags( flags ),
			"advReacton::RegisterReactionInternal Error: Incorrect flags for reaction [%s], see manual", sysReaction )
		assert( ( flags and flags.any ) or ValidateWidget( ( not flags or not flags.sa ) and handlerContext, widget ),
			"advReacton::RegisterReactionInternal Error: Incorrect source widget for reaction [%s], see manual", sysReaction )
		---END_DEBUG---
		
		local sourceId
		local raw = false
		
		if flags then
			if flags.any then
				---BEGIN_DEBUG---
				if DEBUG_REACTION_UNSAFE_METHODS then
					LogWarning( string.format( "advReaction::RegisterReactionInternal Warning: Reaction [%s] registered for ANY source, it's UNSAFE", sysReaction ) )
				end
				---END_DEBUG---
				sourceId = false
			end
			if flags.sa then
				handlerContext = false
			end
			if flags.raw then
				raw = true
			end
		end
		
		if sourceId == nil then
			if widget then
				sourceId = widget:GetInstanceId()
			else
				sourceId = handlerContext:GetInstanceId()
			end
		end
		
		return AddHandler( handlerContext, handler, sysReaction, sourceId, raw )
	end
	--------------------------------------------------------------------------------
	function UnRegisterReactionInternal( handlerContext, handler, sysReaction, widget, flags )
		---BEGIN_DEBUG---
		local handlerType = type( handler )
		local sysReactiontType = type( sysReaction )
		assert( handlerContext ~= nil,
			"advReacton::UnRegisterReactionInternal Error: handlerContext must be defined" )
		assert( sysReactiontType == "string" and #sysReaction > 0,
			"advReacton::UnRegisterReactionInternal Error: Incorrect sysReaction type: string expected got [%s]", sysReactiontType )
		assert( handlerType == "function" or ( handlerType == "table" and getmetatable( handler ) and getmetatable( handler ).__call ),
			"advReacton::UnRegisterReactionInternal Error: Incorrect handler type for reaction [%s]: function expected, got [%s]", sysReaction, handlerType )
		assert( ValidateFlags( flags ),
			"advReacton::UnRegisterReactionInternal Error: Incorrect flags for reaction [%s], see manual", sysReaction )
		assert( ( flags and flags.any ) or ValidateWidget( ( not flags or not flags.sa ) and handlerContext, widget ),
			"advReacton::UnRegisterReactionInternal Error: Incorrect source widget for reaction [%s], see manual", sysReaction )
		---END_DEBUG---
		
		local sourceId
		local raw = false
		
		if flags then
			if flags.any then
				sourceId = false
			end
			if flags.sa then
				handlerContext = false
			end
			if flags.raw then
				raw = true
			end
		end
		
		if sourceId == nil then
			if widget then
				sourceId = widget:GetInstanceId()
			else
				sourceId = handlerContext:GetInstanceId()
			end
		end
		
		return RemoveHandler( handlerContext, handler, sysReaction, sourceId, raw )
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Class( "advReaction" )
--------------------------------------------------------------------------------
function advReaction:RegisterReactionHandler( handler, sysReaction, widget, flags )
	RegisterReactionInternal( self, handler, sysReaction, widget, flags )
end
--------------------------------------------------------------------------------
function advReaction:UnRegisterReactionHandler( handler, sysReaction, widget, flags )
	UnRegisterReactionInternal( self, handler, sysReaction, widget, flags )
end
--------------------------------------------------------------------------------
function advReaction:RegisterReactionHandlers( handlers )
	---BEGIN_DEBUG---
	assert( type( handlers ) == "table", "advReaction:RegisterReactionHandlers Error: Bad handlers format: table expected got %s", type( handlers ) )
	---END_DEBUG---
	for _, pack in ipairs( handlers ) do
		---BEGIN_DEBUG---
		assert( type( pack ) == "table", "advReaction:RegisterReactionHandlers Error: Bad handler record format: table expected got %s", type( pack ) )
		---END_DEBUG---
		RegisterReactionInternal( self, pack[ 1 ], pack[ 2 ], pack[ 3 ], pack[ 4 ] )
	end
end
--------------------------------------------------------------------------------
function advReaction:UnRegisterReactionHandlers( handlers )
	---BEGIN_DEBUG---
	assert( type( handlers ) == "table", "advReaction:UnRegisterReactionHandlers Error: Bad handlers format: table expected got %s", type( handlers ) )
	---END_DEBUG---
	for _, pack in ipairs( handlers ) do
		---BEGIN_DEBUG---
		assert( type( pack ) == "table", "advReaction:UnRegisterReactionHandlers Error: Bad handler record format: table expected got %s", type( pack ) )
		---END_DEBUG---
		UnRegisterReactionInternal( self, pack[ 1 ], pack[ 2 ], pack[ 3 ], pack[ 4 ] )
	end
end
--------------------------------------------------------------------------------
RegisterWidgetcoreExternalLib( advReaction )
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--COMPABILITY
--------------------------------------------------------------------------------
function common.RegisterEventHandler( handler, sysEvent, filter )
	advEvent.RegisterEventHandler( false, handler, sysEvent, filter, filter and { cfilter = true } )
end
--------------------------------------------------------------------------------
function common.UnRegisterEventHandler( handler, sysEvent, filter )
	advEvent.UnRegisterEventHandler( false, handler, sysEvent, filter, filter and { cfilter = true } )
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function common.RegisterReactionHandler( handler, sysReaction )
	advReaction.RegisterReactionHandler( false, handler, sysReaction, nil, { any = true } )
end
--------------------------------------------------------------------------------
function common.UnRegisterReactionHandler( handler, sysReaction )
	advReaction.UnRegisterReactionHandler( false, handler, sysReaction, nil, { any = true } )
end
--------------------------------------------------------------------------------