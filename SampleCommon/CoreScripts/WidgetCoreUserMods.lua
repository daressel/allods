--------------------------------------------------------------------------------
-- widgetcore
--[[
	Зависимости:
		AddonBase.lua
		
	Библиотека работы с виджетами
	
	Превращает все достижимые виджеты аддона в таблицы и строит из них древовидную структуру
	Дочерние виджеты добавляются в родительские по ключу "wt" + ChildWidgetName
	Заменяет полученной структурой mainForm
	Достижимыми считаются виджеты у которых имеется непрерывная цепочка именованых родителей до mainForm
		Примечание: Использование неименованых виджетов настоятельно не рекомендуется
	Далее такие виджеты-таблички называются TWidget
	Все TWidget хранятся в одном экземпляре и однозначно идентифицируются по instanceId
	TWidget1 == TWidget2 (по ссылке) <=> widget1 == widget2 (по значению)
	
	Предоставляемое API:
		IsTWidget( any ) - Проверяет что аргумент является TWidget
		TWidget( widget ) - Возвращает TWidget по обычному widget. Если виджет не был зарегестрирован в widgetcore, то зарегистрирует и вернет его
		GetTWidget( widget ) - Возвращает TWidget по обычному widget. Если виджет не зарегестрирован в widgetcore, то вернет nil
		GetTWidgetById( instanceId ) -Возвращает TWidget по instanceId. Если виджет с таким id не зарегестрирован в widgetcore, то вернет nil
		RegisterWidgetcoreExternalLib( lib ) - Регистрирует стороннюю библиотеку в widgetcore
	Предоставляемое отладочное API:
		IsWidgetcoreWidget( any ) - Проверяет что аргумент является TWidget, включает в себя проверку консистентности
		LogWidgetTreeCounters( start ) - Логирует статистику по дереву виджетов начиная со start (или, если не задано, то с mainForm)
		LogWidgetTree( start ) - Логирует дерево виджетов и статистику по нему начиная со start (или, если не задано, то с mainForm)
		
	Методы TWidget:
		Все стандартные методы виджетов, но некоторые изменены
			IsEqual - выполнет простое сравнение
			CreateChildByDesc( desc, newName ) - возвращает TWidget, опционально переименовывает новый виджет
				Если newName == false то предупреждение о неуникальности имени подавляется
			AddChild( tWidgetChild, newName ) - принимает в качестве аргумента TWidget, опционально переименовывает дочерний виджет
				Если newName == false то предупреждение о неуникальности имени подавляется
			GetParent() - не найдет родителя если он не зарегистрирован в widgetcore
		GetRaw() - Возвращает widget
		SetParent( TWidget, newName ) - Задает родителя виджета, опционально переименовывает виджет
			Если newName == false то предупреждение о неуникальности имени подавляется
		GetFullName() - Возвращает полное имя виджета включающее в себя имена всех родителей
		SetRealRect( rect, forceAlign, autoRealign ) - Задает положение виджета в реальных координатах
		-- далее методы доступные только при отладке --
		GetFullPath() - Возвращает путь виджета в формате mainForm.wtParentNName.wtParent01Name.wtWidgetName
		
]]
--------------------------------------------------------------------------------
---BEGIN_DEBUG---
-- Слать варнинги на небезопасные операции с виджетами
local DEBUG_WIDGETCORE_UNSAFE_METHODS = true
---END_DEBUG---
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
local WIDGET_NAME_PREFIX = "wt" -- Не менять!
--------------------------------------------------------------------------------
local tWidgetByInstanceId = {}
local _widgetcore = {}
--------------------------------------------------------------------------------
-- Internal
local function _index( obj, key )
	local widget = getmetatable( obj ).widget
	if key == "widget" then
		return widget
	end
				
	local method = _widgetcore[ key ]
	
	if not method and type( widget[ key ] ) == "function" then
		method = function( self, ... )
			local widget = self:GetRaw()
			return widget[ key ]( widget, ... )
		end
		
		_widgetcore[ key ] = method
	end

	return method
end
--------------------------------------------------------------------------------
-- Internal
local function wrap( widget )
	---BEGIN_DEBUG---
	assert( IsTWidget( widget ) or common.IsWidget( widget ), "widgetcore::wrap FATAL: Widget expected, got %s", apitype( widget ) )
	assert( widget:GetAddonName() == ADDON_NAME, "widgetcore::wrap FATAL: Foreign widget (%s) wrapping is prohibited", widget )
	---END_DEBUG---
	return tWidgetByInstanceId[ widget:GetInstanceId() ] or widget:GetWidgetCoreTree( _index, tWidgetByInstanceId )
end
--------------------------------------------------------------------------------
-- Internal
local function unwrap( tWidget, noProcessParent )
	local instanceId = tWidget:GetInstanceId()
	if tWidgetByInstanceId[ instanceId ] ~= nil then
		local widget = tWidget.widget
		local tWidgetParent = not noProcessParent and tWidget:GetParent()
		if tWidgetParent then
			tWidgetParent[ WIDGET_NAME_PREFIX .. tWidget:GetName() ] = nil
		end
		tWidgetByInstanceId[ instanceId ] = nil
		for _, tWidgetChild in ipairs( tWidget:GetNamedChildren() ) do
			unwrap( tWidgetChild, true )
		end
		
		return widget
	end
end
--------------------------------------------------------------------------------
-- Превратить обычный виджет в TWidget
function TWidget( widget )
	return wrap( widget )
end
--------------------------------------------------------------------------------
-- Получить TWidget по обычному виджету
function GetTWidget( widget )
	return tWidgetByInstanceId[ widget:GetInstanceId() ]
end
--------------------------------------------------------------------------------
-- Получить TWidget по instanceId
function GetTWidgetById( instanceId )
	return instanceId and tWidgetByInstanceId[ instanceId ]
end
--------------------------------------------------------------------------------
-- Проверить что аргумент это TWidget
function IsTWidget( widget )
	local id = widget and type( widget ) == "table" and widget.GetInstanceId and widget:GetInstanceId() or false
	return id and tWidgetByInstanceId[ id ] ~= nil
end
--------------------------------------------------------------------------------
-- Зарегистрировать стороннюю библиотеку в widgetcore (копирует методы из библиотеки в widgetcore)
function RegisterWidgetcoreExternalLib( library )
	for key, val in pairs( library ) do
		---BEGIN_DEBUG---
		assert( type( val ) == "function", "RegisterWidgetcoreExternalLib: Error: method [%s] not a function!", key )
		assert( _widgetcore[ key ] == nil, "RegisterWidgetcoreExternalLib: Error: method [%s] already exist!", key )
		---END_DEBUG---
		_widgetcore[ key ] = val
	end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
if rawget( _G, "mainForm" ) then
	mainForm = mainForm:GetWidgetCoreTree( _index, tWidgetByInstanceId )
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- METHODS
--------------------------------------------------------------------------------
-- Получить instanceId виджета, эквивалентен нативному методу
function _widgetcore:GetInstanceId()
	return getmetatable( self ).id
end
--------------------------------------------------------------------------------
-- Получить нативный виджет
function _widgetcore:GetRaw()
	return getmetatable( self ).widget
end
--------------------------------------------------------------------------------
-- Задать имя виджета. НЕ РЕКОМЕНДУЕТСЯ к использованию
function _widgetcore:SetName( name )
	local oldKey = WIDGET_NAME_PREFIX .. self:GetName()
	local newKey = WIDGET_NAME_PREFIX .. name
	if oldKey == newKey then return end
	
	local tWidgetParent = self:GetParent()
	if tWidgetParent then
		tWidgetParent[ oldKey ] = nil
		---BEGIN_DEBUG---
		if DEBUG_WIDGETCORE_UNSAFE_METHODS and tWidgetParent[ newKey ] then
			LogWarning( "widgetcore::SetName Warning: Parent already contain widget with same name, link will be lost" )
		end
		---END_DEBUG---
		tWidgetParent[ newKey ] = self
	end
	
	return self.widget:SetName( name )
end
--------------------------------------------------------------------------------
-- Получить родителя виджета, отличие от нативного метода - возвращает TWidget
function _widgetcore:GetParent()
	local parent = self.widget:GetParent()
	return parent and GetTWidget( parent )
end
--------------------------------------------------------------------------------
-- Задать нового родителя для виджета
function _widgetcore:SetParent( tWidgetParent, newName )
	---BEGIN_DEBUG---
	assert( IsTWidget( tWidgetParent ), "widgetcore::SetParent Error: New parent not a TWidget" )
	---END_DEBUG---
	return tWidgetParent:AddChild( self, newName )
end
--------------------------------------------------------------------------------
-- Только для сброса родителя в дереве TWidget при помещении в FactoryCache
function _widgetcore:ResetParent()
	local key = WIDGET_NAME_PREFIX .. self:GetName()
	
	local tWidgetParentOld = self:GetParent()
	if tWidgetParentOld then
		tWidgetParentOld[ key ] = nil
	end
end
--------------------------------------------------------------------------------
-- Добавить дочерний виджет, отличие от нативного метода - принимает TWidget
function _widgetcore:AddChild( tWidgetChild, newName )
	---BEGIN_DEBUG---
	assert( IsTWidget( tWidgetChild ), "widgetcore::AddChild Error: Child not a TWidget" )
	---END_DEBUG---

	local key = WIDGET_NAME_PREFIX .. tWidgetChild:GetName()
	
	local tWidgetParentOld = tWidgetChild:GetParent()
	if tWidgetParentOld then
		tWidgetParentOld[ key ] = nil
	end
	
	if newName then
		key = WIDGET_NAME_PREFIX .. newName
		tWidgetChild.widget:SetName( newName )
	end
	
	---BEGIN_DEBUG---
	if DEBUG_WIDGETCORE_UNSAFE_METHODS and self[ key ] and newName ~= false then
		LogWarning( "widgetcore::AddChild Warning: Already contain widget with same name, link will be lost" )
	end
	---END_DEBUG---
	
	self[ key ] = tWidgetChild
	
	return self.widget:AddChild( tWidgetChild.widget )
end
--------------------------------------------------------------------------------
-- Создать виджет, отличия от нативного метода - возвращает TWidget, можно задать имя нового виджета
function _widgetcore:CreateChildByDesc( desc, name )
	local wt = wrap( self.widget:CreateChildByDesc( desc ) )
	---BEGIN_DEBUG---
	local showWarning = DEBUG_WIDGETCORE_UNSAFE_METHODS and name ~= false
	---END_DEBUG---
	if name then
		wt.widget:SetName( name )
	else
		---BEGIN_DEBUG---
		if showWarning then
			LogWarning( "widgetcore::CreateChildByDesc Warning: No name provided, use from resource" )
		end
		---END_DEBUG---
		name = wt:GetName()
	end
	
	---BEGIN_DEBUG---
	if showWarning and self[ WIDGET_NAME_PREFIX .. name ] then
		LogWarning( "widgetcore::CreateChildByDesc Warning: Already contain widget with same name, link will be lost" )
	end
	---END_DEBUG---

	self[ WIDGET_NAME_PREFIX .. name ] = wt

	return wt
end
--------------------------------------------------------------------------------
-- Уничтожить виджет, эквивалентен нативному методу
function _widgetcore:DestroyWidget()
	return unwrap( self ):DestroyWidget()
end
--------------------------------------------------------------------------------
--#assert_unsafe
-- Получить ребенка по имени (strict), отличие от нативного метода - возвращает TWidget
function _widgetcore:GetChildChecked( widgetName, isRecursive )
	if isRecursive then
		---BEGIN_DEBUG---
		if DEBUG_WIDGETCORE_UNSAFE_METHODS then
			LogWarning( "widgetcore::GetChildChecked: Recursive search is UNSAFE and should not be used!" )
		end
		---END_DEBUG---
		return wrap( self.widget:GetChildChecked( widgetName, true ) )
	else
		local tWidget = self[ WIDGET_NAME_PREFIX .. widgetName ]
		---BEGIN_DEBUG---
		assert( tWidget ~= nil, "widgetcore::GetChildChecked Error: Widget [%s] isn't found in [%s]", widgetName, self:GetFullName() )
		---END_DEBUG---
		return tWidget
	end
end
--------------------------------------------------------------------------------
--#assert_unsafe
-- Получить ребенка по имени, отличие от нативного метода - возвращает TWidget
function _widgetcore:GetChildUnchecked( widgetName, isRecursive )
	if isRecursive then
		---BEGIN_DEBUG---
		if DEBUG_WIDGETCORE_UNSAFE_METHODS then
			LogWarning( "widgetcore::GetChildUnchecked: Recursive search is UNSAFE and should not be used!" )
		end
		---END_DEBUG---
		local wt = self.widget:GetChildUnchecked( widgetName, true )
		return wt and wrap( wt )
	else
		return self[ WIDGET_NAME_PREFIX .. widgetName ]
	end
end
--------------------------------------------------------------------------------
-- Получить всех именованых детей, отличие от нативного метода - возвращает массив TWidget
function _widgetcore:GetNamedChildren()
	local widgets = self.widget:GetNamedChildren()
	
	for i, wt in ipairs( widgets ) do
		widgets[ i ] = wrap( wt )
	end
	
	return widgets
end
--------------------------------------------------------------------------------
-- Проверить равенство виджетов, отличие от нативного метода - использует простое сравнение
function _widgetcore:IsEqual( widget )
	return self == widget
end
--------------------------------------------------------------------------------
-- Получить полное имя виджета в формате FormName.ParentNName...Parent01Name.WidgetName
function _widgetcore:GetFullName()
	local stack = {}
	
	repeat
		table.insert( stack, 1, self:GetName() )
		self = self:GetParent()
	until self == nil
	
	return table.concat( stack, "." )
end
--------------------------------------------------------------------------------
-- Задать положение виджета в реальных координатах
-- Может привести к некорректному отображению (если произойдет выход за границы родителя)
-- Дополнительные флаги несовместимы между собой (по умолчанию align без изменений)
-- forceAlign - задать align принудительно
-- autoRealign - подобрать "наиболее естественный" align
function _widgetcore:SetRealRect( newRect, forceAlign, autoRealign )
	---BEGIN_DEBUG---
	assert( not forceAlign or not autoRealign, "widgetcore::SetRealRect Error: forceAlign and autoRealign cannot be set simultaneously" )
	---END_DEBUG---
	if not newRect then
		if forceAlign or autoRealign then
			newRect = {}
		else
			return self:GetSmartPlacementPlain()
		end
	end
	local rect = self:GetRealRect()
	local x1, x2 = newRect.x1 or rect.x1, newRect.x2 or rect.x2
	local y1, y2 = newRect.y1 or rect.y1, newRect.y2 or rect.y2
	local x, y = x2 - x1, y2 - y1
	
	local screen = common.GetPosConverterParams()
	local ratio = screen.fullVirtualSizeX / screen.realSizeX
	
	
	local parent = self:GetParent()
	local prect = parent and parent:GetRealRect() or { x1 = 0, y1 = 0, x2 = screen.realSizeX, y2 = screen.realSizeY }
	
	local px1, px2 = prect.x1, prect.x2
	local py1, py2 = prect.y1, prect.y2
	local px, py = px2 - px1, py2 - py1
	
	local placement = self.widget:GetPlacementPlain()
	local alX, alY
	if forceAlign then
		alX, alY = forceAlign.alignX or placement.alignX, forceAlign.alignY or placement.alignY
	elseif autoRealign then
		alX, alY = placement.alignX, placement.alignY
		local ratioX = ( x1 - px1 ) / ( px - x )
		local ratioY = ( y1 - py1 ) / ( py - y )
		
		if alX ~= WIDGET_ALIGN_BOTH
		and alX ~= WIDGET_ALIGN_LOW_ABS then
			alX = ratioX < 0.35 and WIDGET_ALIGN_LOW
				or ratioX < 0.65 and WIDGET_ALIGN_CENTER or WIDGET_ALIGN_HIGH
		end
		
		if alY ~= WIDGET_ALIGN_BOTH
		and alY ~= WIDGET_ALIGN_LOW_ABS then
			alY = ratioY < 0.35 and WIDGET_ALIGN_LOW
				or ratioY < 0.65 and WIDGET_ALIGN_CENTER or WIDGET_ALIGN_HIGH
		end
	else
		alX, alY = placement.alignX, placement.alignY
	end

	return self:SetSmartPlacementPlain{
		posX = alX == WIDGET_ALIGN_CENTER
			and ( x1 + x2 - px1 - px2 ) / 2 * ratio
			or ( x1 - px1 ) * ( alX ~= WIDGET_ALIGN_LOW_ABS and ratio or 1 ),
		posY = alY == WIDGET_ALIGN_CENTER
			and ( y1 + y2 - py1 - py2 ) / 2 * ratio
			or ( y1 - py1 ) * ( alY ~= WIDGET_ALIGN_LOW_ABS and ratio or 1 ),
		
		highPosX = ( px2 - x2 ) * ratio,
		highPosY = ( py2 - y2 ) * ratio,
		sizeX = x * ratio,
		sizeY = y * ratio,
		alignX = alX,
		alignY = alY
	}
end
--------------------------------------------------------------------------------

---BEGIN_DEBUG---
--------------------------------------------------------------------------------
-- Получить полное имя виджета (см GetFullName) в формате "как в скрипте"
function _widgetcore:GetFullPath()
	local stack = {}
	
	repeat
		if self == mainForm then
			table.insert( stack, 1, "mainForm" )
			break
		end
		local name = self:GetName()
		table.insert( stack, 1, name ~= "" and WIDGET_NAME_PREFIX .. name or "[Unnamed]" )
		self = self:GetParent()
	until self == nil
	
	return table.concat( stack, "." )
end
--------------------------------------------------------------------------------
-- Проверить что аргумент является TWidget (widgetcore_table)
-- Проверяет более глубоко чем обычный IsTWidget, при расхождении ассертит
function IsWidgetcoreWidget( val )
	if not IsTWidget( val ) then
		return false
	end
	local meta = getmetatable( val )
	local idOk = meta and meta.id and tWidgetByInstanceId[ meta.id ] == val
	local widgetOk = meta and meta.widget and common.IsWidget( meta.widget ) and meta.widget:GetInstanceId() == meta.id
	assert( idOk and widgetOk, "IsWidgetcoreWidget FATAL: Sanity check failed (id - [%s], widget - [%s]) for [%s]",
		idOk and "OK" or "FAIL", widgetOk and "OK" or "FAIL", tostring( val ) )
	return true
end
--------------------------------------------------------------------------------
-- Internal
local function GetWidgetTree( start )
	local result = {}
	if start then
		if tWidgetByInstanceId[ start ] then
			start = tWidgetByInstanceId[ start ]
		elseif ( type( start ) == "table" or type( start ) == "userdata" ) and start.GetInstanceId then
			start = tWidgetByInstanceId[ start:GetInstanceId() ]
		end
		if start then
			local function iter( target )
				local result = {
					type = apitype( target.widget ) or "Unexpected",
					name = target:GetName(),
					rendered = target:IsVisibleEx(),
					visible = target:IsVisible(),
					children = {}
				}
				for i, child in ipairs( target:GetNamedChildren() ) do
					result.children[ i ] = iter( child )
				end
				table.sort( result.children, function( c1, c2 ) return c1.name < c2.name end )
				return result
			end
			result = iter( start )
		end
	end
	return result
end
--------------------------------------------------------------------------------
-- Internal
local function LogWidgetTreeCountersInternal( tree )
	local total = { total = 0, visible = 0, rendered = 0 }
	local counters = {}
	local function iter( node )
		local byType = counters[ node.type ] or { total = 0, visible = 0, rendered = 0 }
		
		total.total = total.total + 1
		byType.total = byType.total + 1
		if node.visible then
			total.visible = total.visible + 1
			byType.visible = byType.visible + 1
		end
		if node.rendered then
			total.rendered = total.rendered + 1
			byType.rendered = byType.rendered + 1
		end
		
		counters[ node.type ] = byType
		
		for _, child in ipairs( node.children ) do
			iter( child )
		end
	end
	iter( tree )
	LogInfo( "                           Type  Total  Rendered  Visible" )
	LogInfo( "---------------------------------------------------------" )
	for type, count in sortpairs( counters ) do
		LogInfo( string.format( "%31s%7d%10d%9d", type, count.total, count.rendered, count.visible ) )
	end
	LogInfo( "---------------------------------------------------------" )
	LogInfo( string.format( "%31s%7d%10d%9d", "TOTAL", total.total, total.rendered, total.visible ) )
end
--------------------------------------------------------------------------------
-- Вывести в лог информацию по дереву виджетов, можно указать корень (по умолчанию mainForm)
function LogWidgetTreeCounters( start )
	start = start or mainForm
	local tree = GetWidgetTree( start )
	LogInfo( "--------------------[Widgets in tree]--------------------" )
	if tree then
		LogWidgetTreeCountersInternal( tree )
	end
	LogInfo( "----------------------------------------------------------" )
end
--------------------------------------------------------------------------------
-- Вывести в лог дерево виджетов, можно указать корень (по умолчанию mainForm)
function LogWidgetTree( start )
	start = start or mainForm
	local tree = GetWidgetTree( start )
	local function iter( node, depth )
		depth = depth or 0
		local prefix = depth > 0 and string.rep( " ", depth ) or ""
		LogInfo( string.format( "[%s][%s][%02d] %s[%25s]",
			node.rendered and "+" or "-",
			node.visible and "+" or "-",
			depth,
			prefix .. node.name .. string.rep( " ", math.max( 42-#prefix - #node.name, 1 ) ),
			node.type
		) )
		for _, child in ipairs( node.children ) do
			iter( child, depth + 1 )
		end
	end
	LogInfo( "----------------------------------[Widget tree]---------------------------------" )
	if tree then
		LogInfo( "ROOT: " .. ( IsTWidget( start ) and start:GetFullPath() or advtostring( start ) ) )
		LogInfo( "[Rendered][Visible][Depth]                      Name [                     Type]" )
		iter( tree )
		LogInfo( "[Rendered][Visible][Depth]                      Name [                     Type]" )
		LogInfo( "--------------------------------------------------------------------------------" )
		LogWidgetTreeCountersInternal( tree )
	end
	LogInfo( "---------------------------------------------------------" )
	
end
--------------------------------------------------------------------------------