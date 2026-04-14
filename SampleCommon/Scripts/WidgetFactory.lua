--------------------------------------------------------------------------------
--[[
	WidgetFactory.lua
	
	Зависимости:
		AddonBase.lua
		WidgetCore.lua / WidgetCoreUserMods.lua
		
	Фабрика динамических виджетов
	
	Производит, хранит и выдает динамические виджеты
	Регистрирует глобал advWidgetFactory
	
	Методы advWidgetFactory
		Init( [templatesList] ) - инициализирует фабрику, регистрирует шаблоны из списка templatesList
		RegisterTemplate( templateData ) - если фабрика не инициализирована - инициализирует ее, регистрирует шаблон. Шаблон это таблица с полями
			name - имя шаблона, должно быть уникальным // DEPRECATED_PART имя виджета шаблона, виджет с таким именем должен быть среди детей mainForm. Виджет будет захвачен //
			template - шаблон виджета, таблица  с полями
				group - имя группы шаблонов виджетов
				name - имя шаблона виджета в группе
				[type = WIDGET_TEMPLATE_TYPE_ADDON] - тип группы шаблонов
			[class = nil] - класс шаблона, при наличии будет навешиваться на все виджеты создаваемые по шаблону. Рекомендуется быть наследником advWidgetObjectMonitor
			[limit = 100] - максимальное число виджетов которое можно создать по данному шаблону
			[cacheLimit = 5] - максимальное число виджетов хранимых в кэше без ограничения по времени
			[cacheLifetime = 30] - время жизни (в секундах) виджетов хранящихся в кеше и выходящих за cacheLimit
		Get( templateName ) - получить виджет по шаблону
		Store( widget ) - вернуть виджет
		Boost( templateName, count, isUseImmediately ) - подготовить count виджетов по шаблону
			Если задано isUseImmediately то подготовленные виджеты должны быть в том же кадре
	
	Отладочное API
		advWidgetFactory:IsFromFactory( widget ) - возвращает true если виджет создан фабрикой
		advWidgetFactory:GetTemplateName( widget ) - возвращает имя шаблона по виджету
		advWidgetFactory:DropTemplateCache( templateName ) - сбрасывает кэш виджетов для данного шаблона
		advWidgetFactory:DropCache() - сбрасывает кэш всех виджетов
		LogWidgetFactoryStats() - логгирует состояние фабрики
	
]]
--------------------------------------------------------------------------------
Global( "advWidgetFactory", {} )
Global( "WIDGET_TEMPLATE_TYPE_ADDON", 0 )
Global( "WIDGET_TEMPLATE_TYPE_STATE", 1 )
--------------------------------------------------------------------------------
local wtCache, poolByWidgetInstanceId, widgetPools
--------------------------------------------------------------------------------
local cacheCleanUpToggled = false
local CacheCleanUpToggle, CacheCleanUpTick
local cacheCleanUpQueque = {}
--------------------------------------------------------------------------------
local DEFAULT_HARD_LIMIT = 100
local DEFAULT_CACHE_LIMIT = 5
local DEFAULT_LIFETIME = 30
--------------------------------------------------------------------------------
local GetWidgetDesc
--------------------------------------------------------------------------------
do
	local stateGroups = {}
	local addonGroups = {}
	--------------------------------------------------------------------------------
	function GetWidgetDesc( name, templateData )
		---BEGIN_DEBUG---
		assert( type( name ) == "string", "advWidgetFactory::GetWidgetDesc: Wrong template name: string expected, got %s", type( name ) )
		assert( widgetPools[ name ] == nil, 'advWidgetFactory::GetWidgetDesc: Wrong template name: Name [%s] not unique', name )
		assert( templateData == nil or type( templateData ) == "table", "advWidgetFactory::GetWidgetDesc: Wrong template: table or nil expected, got %s", type( templateData ) )
		---END_DEBUG---
		
		if templateData then
			templateData.type = templateData.type or WIDGET_TEMPLATE_TYPE_ADDON
			
			---BEGIN_DEBUG---
			assert( templateData.type == WIDGET_TEMPLATE_TYPE_ADDON or templateData.type == WIDGET_TEMPLATE_TYPE_STATE,
				"advWidgetFactory::GetWidgetDesc: Wrong template group type" )
			assert( type( templateData.group ) == "string",
				"advWidgetFactory::GetWidgetDesc: Wrong template group name: string expected, got %s", type( templateData.group ) )
			assert( type( templateData.name ) == "string",
				"advWidgetFactory::GetWidgetDesc: Wrong template group member name: string expected, got %s", type( templateData.name ) )
			---END_DEBUG---
			
			local group
			if templateData.type == WIDGET_TEMPLATE_TYPE_ADDON then
				group = addonGroups[ templateData.group ] or common.GetAddonRelatedWidgetGroup( templateData.group, true )
				addonGroups[ templateData.group ] = group
			elseif templateData.type == WIDGET_TEMPLATE_TYPE_STATE then
				group = stateGroups[ templateData.group ] or common.GetStateRelatedWidgetGroup( templateData.group, true )
				stateGroups[ templateData.group ] = group
			end
			
			---BEGIN_DEBUG---
			assert( group ~= nil, "advWidgetFactory::GetWidgetDesc: Can't find group [%s]", templateData.group )
			assert( group:HasWidget( templateData.name ),
				"advWidgetFactory::GetWidgetDesc: Can't find widget [%s] in group [%s]", templateData.name, templateData.group )
			---END_DEBUG---
			
			return group:GetWidget( templateData.name )
		else
			---BEGIN_DEBUG---
			assert( mainForm:GetChildUnchecked( name ) ~= nil, "advWidgetFactory::GetWidgetDesc: Can't find widget [%s] in mainForm", name )
			---END_DEBUG---
			local widget = mainForm:GetChildChecked( name )
			local desc = widget:GetWidgetDesc()
			widget:DestroyWidget()
			return desc	
		end
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Инициализировать фабрику виджетов
-- У mainForm аддона должен быть невидимый пустой виджет FactoryCache
-- Можно передать массив описателей шаблонов которые нужно зарегистрировать (смотри advWidgetFactory:RegisterTemplate)
function advWidgetFactory:Init( templatesList )
	wtCache = mainForm:GetFactoryCache()
	poolByWidgetInstanceId = {}
	widgetPools = {}
	
	if templatesList then
		for templateIndex, templateData in ipairs( templatesList ) do
			self:RegisterTemplate( templateData )
		end
	end
	self.Init = nil
end
--------------------------------------------------------------------------------
-- Зарегистрировать шаблон виджета
-- Поля templateData:
--   name - string - имя шаблона, должно быть уникальным, у mainForm должен быть ребенок с данным именем
--   class - class or nil - класс шаблона, может отсутствовать
--   limit - number or nil [DEFAULT_HARD_LIMIT] - максимум доступных виджетов (только при запуке с кода!)
--   cacheLimit - number or nil [DEFAULT_CACHE_LIMIT] - максимум виджетов в вечном кэше
--   cacheLifetime - number or nil [DEFAULT_LIFETIME] - время жизни (в секундах) временного кэша
function advWidgetFactory:RegisterTemplate( templateData )
	if widgetPools == nil then
		self:Init()
	end
	
	local templateName = templateData.name
	local templateClass = templateData.class
	local templateLimit = templateData.limit or DEFAULT_HARD_LIMIT
	local templateHotLimit = templateData.cacheLimit or DEFAULT_CACHE_LIMIT
	local templateHotLifetime = templateData.cacheLifetime or DEFAULT_LIFETIME
	
	---BEGIN_DEBUG---
	local templateClassType = type( templateClass )
	local templateLimitType = type( templateLimit )
	local templateHotLimitType = type( templateHotLimit )
	local templateHotLifetimeType = type( templateHotLifetime )
	
	assert( not templateClass or templateClassType == "table", "advWidgetFactory:RegisterTemplate: Wrong template class for [%s]: class table or nil expected", templateName )
	assert( templateLimitType == "number", "advWidgetFactory:RegisterTemplate: Wrong template limit for [%s]: number expected, got %s", templateName, templateLimitType )			
	assert( templateHotLimitType == "number", "advWidgetFactory:RegisterTemplate: Wrong template cache limit for [%s]: number expected, got %s", templateName, templateHotLimitType )			
	assert( templateHotLifetimeType == "number", "advWidgetFactory:RegisterTemplate: Wrong template cache lifetimet for [%s]: number expected, got %s", templateName, templateHotLifetimeType )
	---END_DEBUG---

	local widgetDesc = GetWidgetDesc( templateName, templateData.template )
	local widgetPool = {
		name = templateName,
		desc = widgetDesc,
		class = templateClass,
		t = 0,
		c = 0,
		l = templateLimit,
		hl = templateHotLimit,
		lt = templateHotLifetime,
		clt = templateHotLifetime
	}
	widgetPools[ templateName ] = widgetPool
end
--------------------------------------------------------------------------------
-- Получить виджет по шаблону templateName
function advWidgetFactory:Get( templateName )
	---BEGIN_DEBUG---
	assert( widgetPools ~= nil, "advWidgetFactory:Get: Error: advWidgetFactory not initialized" )
	---END_DEBUG---
	local widgetPool = templateName and widgetPools[ templateName ]	
	---BEGIN_DEBUG---
	assert( widgetPool ~= nil, "advWidgetFactory:Get: Invalid request: unknown template [%s]", tostring( templateName ) )
	---END_DEBUG---
	
	local widget
	local cachedCount = widgetPool.c
	
	if cachedCount > 0 then
		widget = widgetPool[ cachedCount ]
		widgetPool[ cachedCount ] = nil
		widgetPool.c = cachedCount - 1
	else
		local totalCount = widgetPool.t + 1
		---BEGIN_DEBUG---
		assert( totalCount <= widgetPool.l, 'advWidgetFactory:Get: Memory leak protection: Limit for template [%s] exceeded', templateName )
		---END_DEBUG---
		widgetPool.t = totalCount
		
		widget = TWidget( wtCache:CreateChildByDesc( widgetPool.desc ) )
		poolByWidgetInstanceId[ widget:GetInstanceId() ] = widgetPool
		
		local templateClass = widgetPool.class
		if templateClass then
			templateClass( widget ):Init()
		end
	end
	
	return widget
end
--------------------------------------------------------------------------------
-- Сообщить что widget более не используется
function advWidgetFactory:Store( widget )
	---BEGIN_DEBUG---
	assert( widgetPools ~= nil, "advWidgetFactory:Store: Error: advWidgetFactory not initialized" )
	assert( self:IsFromFactory( widget ), "advWidgetFactory:Store: Error: Widget [%s] isn't created by factory (or invalid)", widget )
	---END_DEBUG---
	local widgetPool = poolByWidgetInstanceId[ widget:GetInstanceId() ]
	if widgetPool then
		local cachedCount = widgetPool.c + 1
		widgetPool[ cachedCount ] = widget
		widgetPool.c = cachedCount
		widgetPool.clt = widgetPool.lt
		widget:ResetParent()
		wtCache:AddChild( widget:GetRaw() )
		if cachedCount > widgetPool.hl then
			cacheCleanUpQueque[ widgetPool ] = true
			CacheCleanUpToggle( true )
		end
	end
end
--------------------------------------------------------------------------------
-- Подгоовиться к запросу большого числа requestedCount виджетов по шаблону templateName
function advWidgetFactory:Boost( templateName, requestedCount )
	---BEGIN_DEBUG---
	assert( widgetPools ~= nil, "advWidgetFactory:Boost: Error: advWidgetFactory not initialized" )
	assert( templateName and widgetPools[ templateName ] , "advWidgetFactory:Boost: Invalid request: unknown template [%s]", tostring( templateName ) )
	assert( type( requestedCount ) == 'number' and requestedCount > 1, "advWidgetFactory:Boost: Invalid request: requestedCount must be > 1" )
	---END_DEBUG---
	local widgetPool = templateName and widgetPools[ templateName ]
	---BEGIN_DEBUG---
	assert( requestedCount <= widgetPool.l, 'advWidgetFactory:Boost: Memory leak protection: Limit for template [%s] exceeded', templateName )
	---END_DEBUG---
	local totalCount = widgetPool.t
	local createCount = requestedCount - totalCount
	if createCount > 0 then
		local cachedCount = widgetPool.c
		local widgetDesc = widgetPool.desc
		local templateClass = widgetPool.class

		while totalCount < requestedCount do
			local widget = TWidget( wtCache:CreateChildByDesc( widgetPool.desc ) )
			poolByWidgetInstanceId[ widget:GetInstanceId() ] = widgetPool
			cachedCount = cachedCount + 1
			widgetPool[ cachedCount ] = widget
			totalCount = totalCount + 1
			if templateClass then
				templateClass( widget ):Init()
			end
		end
		
		widgetPool.c = cachedCount
		widgetPool.t = totalCount
		return createCount
	else
		return 0
	end
end
--------------------------------------------------------------------------------
-- Internal
function CacheCleanUpToggle( state )
	if state and not cacheCleanUpToggled then
		common.RegisterEventHandler( CacheCleanUpTick, "EVENT_SECOND_TIMER" )
		cacheCleanUpToggled = true
	elseif cacheCleanUpToggled and next( cacheCleanUpQueque ) == nil then
		common.UnRegisterEventHandler( CacheCleanUpTick, "EVENT_SECOND_TIMER" )
		cacheCleanUpToggled = false
	end
end
--------------------------------------------------------------------------------
-- Internal
function CacheCleanUpTick()
	local needToggle = false
	for pool in pairs( cacheCleanUpQueque ) do
		if pool.c > pool.hl then
			local clt = pool.clt - 1
			if clt > 0 then
				pool.clt = clt
			else
				local oldPoolC = pool.c
				pool.c = pool.hl
				pool.t = pool.t - ( oldPoolC - pool.hl )
				for index = pool.hl + 1, oldPoolC do
					local widget = pool[ index ]
					pool[ index ] = nil
					poolByWidgetInstanceId[ widget:GetInstanceId() ] = nil
					if widget.Destroy then
						widget:Destroy()
					else
						widget:DestroyWidget()
					end
				end
				cacheCleanUpQueque[ pool ] = nil
				needToggle = true
			end
		else
			cacheCleanUpQueque[ pool ] = nil
			needToggle = true
		end
	end
	if needToggle then
		CacheCleanUpToggle()
	end
end
--------------------------------------------------------------------------------

---BEGIN_DEBUG---
--------------------------------------------------------------------------------
--[[
	widgetPools = {
		[ template_name_1 ] = {
			name = template_name_1: имя шаблона (имя виджета с которого снимали шаблон)
			desc: шаблон виджета
			class: ссылка на класс шаблона (или nil)
			hl: Лимит перманентного кэша
			lt: Время жизни (в секундах) временного кеша. Считается с момента последнего помещения виджета в кэш.
			clt: Оставшееся время жизни (в секундах) временного кеша
			t: общее число созданных по данному шаблону виджетов
			с: число закешированных виджетов созданных по данному шаблону
			l: максимальное число виджетов которые можно создать по этому шаблону (действует только при запуске с кода!)
			[1] = widget1 \
			[2] = widget2  \ кеш виджетов данного шаблона
			...            / индексация с 1, виджеты берутся с конца
			[N] = widgetN /
		},
		...
		[ template_name_N ] = {
			...
		},
	}
]]
--------------------------------------------------------------------------------
-- Проверяет сделан ли виджет widget (userdata or widgetcore) через фабрику
function advWidgetFactory:IsFromFactory( widget )
	return widget and widget.GetInstanceId and poolByWidgetInstanceId[ widget:GetInstanceId() ] ~= nil or false
end
--------------------------------------------------------------------------------
-- Возвращает имя шаблона по которому сделан widget (или nil если такового не нашлось)
function advWidgetFactory:GetTemplateName( widget )
	local widgetPool = widget and widget.GetInstanceId and poolByWidgetInstanceId[ widget:GetInstanceId() ]
	return widgetPool and widgetPool.name
end
--------------------------------------------------------------------------------
-- Дропает кэш для шаблона templateName
function advWidgetFactory:DropTemplateCache( templateName )
	local widgetPool = templateName and widgetPools[ templateName ]
	assert( widgetPool ~= nil, "advWidgetFactory:DropTemplateCache: Error: unknown template [%s]", tostring( templateName ) )
	for index = 1, widgetPool.c do
		local widget = widgetPool[ index ]
		widgetPool[ index ] = nil
		poolByWidgetInstanceId[ widget:GetInstanceId() ] = nil
		if widget.Destroy then
			widget:Destroy()
		else
			widget:DestroyWidget()
		end
	end
	widgetPool.t = widgetPool.t - widgetPool.c
	widgetPool.c = 0
end
--------------------------------------------------------------------------------
-- Дропает кэш для всех шаблонов
function advWidgetFactory:DropCache()
	for templateName in pairs( widgetPools ) do
		self:DropTemplateCache( templateName )
	end
end
--------------------------------------------------------------------------------
-- Выводит в лог подробную статистику по динамическим виджетам
function LogWidgetFactoryStats()
	LogInfo( "---------------------------[Dynamic widgets statistic]-----------------------------" )
	LogInfo( "                                                          [         Cache         ]" )
	LogInfo( "                       templateName   Limit   All   Use   Perm   Temp  TempLifetime" )
	LogInfo( "-----------------------------------------------------------------------------------" )
	for templateName, widgetPool in pairs( widgetPools ) do
		LogInfo( string.format( "%35s    %4d  %4d  %4d   %4d   %4d       %3d/%3d",
			templateName,
			widgetPool.l,
			widgetPool.t,
			widgetPool.t - widgetPool.c,
			widgetPool.hl > widgetPool.c and widgetPool.c or widgetPool.hl,
			widgetPool.hl < widgetPool.c and widgetPool.c - widgetPool.hl or 0,
			cacheCleanUpQueque[ widgetPool ] and widgetPool.clt or widgetPool.lt,
			widgetPool.lt
		) )
	end
	LogInfo( "-----------------------------------------------------------------------------------" )
end
--------------------------------------------------------------------------------
---END_DEBUG---