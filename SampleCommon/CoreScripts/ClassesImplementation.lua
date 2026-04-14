--------------------------------------------------------------------------------
---BEGIN_DEBUG---
-- ClassesImplementation.lua
--[=[
	Зависимости:
		AddonBase.lua
		
	Библиотека реализации классов
		
	Наследование и полиморфизм поддержаны корректно, инкапсуляция - частично
	Все поля объектов / классов и методы классов являются публичными
	Любой метод можно (попытаться) вызвать как статический

	Для объявления класса используется форма Class( "someclass" )
	Для объявления класса наследующегося от другого класса используется форма Class( "someclass", otherclass() )
	Класс может наследоваться от таблицы, все пары ключ-значение станут статическими полями / методами класса
	Для создания объекта класса используется форма object = someclass()
	
	Имеется уникальная особенность - объект класса можно не только создать, но и превратить произвольную таблицу,
	к примеру TWidget в объект класса. Для этого исользуется форма someclass( object )
	На один и тот же объект можно "навесить" несколько классов не прибегая к наследованию, но делать так настоятельно не рекомендуется
	
	Небольшой абстрактный пример
	
		Class( "C", { value = 123 } )
		local a = C()
		local b = C()
		LogInfo( a.value ) -- 123 	в объекте поле не задано, берем из класса
		LogInfo( b.value ) -- 123 	в объекте поле не задано, берем из класса
		LogInfo( C.value ) -- 123 	статическое поле класса
		b.value = 456				задаем поле value в объекте
		LogInfo( a.value ) -- 123 	в объекте поле не задано, берем из класса
		LogInfo( b.value ) -- 456 	из объекта
		LogInfo( C.value ) -- 123 	статическое поле класса
		C.value = 789				меняем значение статического поля класса
		LogInfo( a.value ) -- 789	в объекте поле не задано, берем из класса
		LogInfo( b.value ) -- 456	из объекта
		LogInfo( C.value ) -- 789	статическое поле класса
		
		Class( "C2", C() )	--		Наследуем C2 от C
		function C:Log()	--		Методы с одинаковыми именами в C и C2
			LogInfo( self.value )
		end
		function C2:Log()	--		Методы с одинаковыми именами в C и C2
			LogInfo( self.value * self.anotherValue )
		end
		
		d = C2{ anotherValue = 2 }--Превращаем простую таблицу в объект класса C2
		d:Log() -- 1578				Вызов метода Log из С2 для объекта d
		C.Log( d ) -- 789			Вызов метода Log из С для объекта d
		C.Log() -- ERROR			Вызов (попытка) метода Log из С без передачи объекта
		C:Log() -- 789				Вызов метода Log из С как статического
		b:Log() -- 456				Вызов метода Log из С для объекта b
		C.Log( b ) -- 456			Вызов метода Log из С для объекта b
		C2.Log( b ) -- ERROR		Вызов (попытка) метода Log из С2 для объекта b - поля не совпали
		
	Предоставляемое API
		Class( name, parent ) - Объявить класс
		InstanceOf( object, class, noRecursive ) - Проверить что объект является членом класса
		RevertClass( object ) - Отменить последнее наложение класса на объект. КОЛДУНСТВО
		
	Предоставляемое отладочное API
		IsClass( any ) - Проверить что аргумент это класс
		IsClassMember( any ) - Проверить что аргумент это член класса
		GetClassName( class ) - Получить имя класса
		GetParentClass( object or class ) - Получить класс объекта / родительский класс класса
		GetObjectClassPath( object ) - Получить полный путь наследования объекта или класса
		GetClassFunctionPathByAddress( object, func ) - Искать функцию в цепочке наследования объекта или класса
		GetPathByAddress( any ) - Искать в глобальном окружении
		GetFunctionPathByAddress( object, func ) - Искать функцию в цепочке наследования объекта или класса, при провале искать в глобальном окружении
		LogObjectClassPath( object ) - Вывести в лог цепочку наследования объекта / класса
]=]
---END_DEBUG---
--------------------------------------------------------------------------------
local hash = setmetatable( {}, { __mode = "k" } )
local list = setmetatable( {}, { __mode = "k" } )
--------------------------------------------------------------------------------
-- Internal
local function wrap( tab, _mt )
	local mt = getmetatable( tab )
	local super = hash[ tab ]
	local proxy = setmetatable( {}, mt )
	hash[ tab ], hash[ proxy ] = proxy, super 
	
	if type( mt ) == "table" then
		for k, v in pairs( mt ) do
			if _mt[ k ] == nil then _mt[ k ] = v end
		end
	end
	
	return setmetatable( tab, _mt )
end
--------------------------------------------------------------------------------
-- Internal
local function unwrap( tab )
	local proxy = hash[ tab ]
	hash[ tab ], hash[ proxy ] = hash[ proxy ], nil
	return setmetatable( tab, getmetatable( proxy ) )
end
--------------------------------------------------------------------------------
-- Internal
local function replicate( cl, obj )
	---BEGIN_DEBUG---
	assert( not InstanceOf( cl, obj ), "Class replicator: cyclic class references are forbidden." )
	---END_DEBUG---
	return InstanceOf( obj, cl ) and obj or wrap( obj or {}, { __index = list[ cl ], __class = cl } )
end
--------------------------------------------------------------------------------
-- Internal
local function declare( proto, name )
	proto = wrap( proto or {}, { __call = replicate, __name = name } )
	
	local val
	list[ proto ] = list[ proto ] or function( tab, key )
		val = proto[ key ]
		if val == nil then val = hash[ tab ][ key ] end
		return val
	end

	return proto
end
--------------------------------------------------------------------------------
-- Проверяет что object является инстансом класса class
-- Если задано noRecursive то проверяется только прямое членство (без учета наследования)
function InstanceOf( object, class, noRecursive )
	if object and class then
		local objectClass = hash[ object ] and getmetatable( object ).__class
		if objectClass then
			local isDirectMember = class == objectClass
			if not isDirectMember and not noRecursive then
				return InstanceOf( objectClass, class ) or InstanceOf( hash[ object ], class )
			else
				return isDirectMember
			end
		end
	end
	return false
end
--------------------------------------------------------------------------------
-- Объявить класс
function Class( name, proto )
	Global( name, declare( proto, name ) )
end
--------------------------------------------------------------------------------
-- Отревертить последнее наложение класса
-- Это жуткое колдунство, использовать только при полном понимании как оно работает
function RevertClass( obj )
	return obj and hash[ obj ] and unwrap( obj )
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
---BEGIN_DEBUG---
--------------------------------------------------------------------------------
-- Проверить что аргумент это класс
function IsClass( val )
	return val and list[ val ] ~= nil
end
--------------------------------------------------------------------------------
-- Проверить что аргумент это член некоего класса
function IsClassMember( val )
	return val and hash[ val ] ~= nil and list[ val ] == nil
end
--------------------------------------------------------------------------------
-- Получить имя класса (если аргумент не класс, то вернет nil)
function GetClassName( class )
	return IsClass( class ) and getmetatable( class ).__name
end
--------------------------------------------------------------------------------
-- Получить класс объекта или родительский класс у класса (если аргумент не член класса и не класс, то вернет nil)
function GetParentClass( object )
	if object and hash[ object ] then
		local class = getmetatable( object ).__class
		return class and class or nil
	end
	return nil
end
--------------------------------------------------------------------------------
-- Получить (в читаемом виде) полный путь объекта в иерархии классов (если аргумент не член класса и не класс, то вернет nil)
function GetObjectClassPath( object )
	local isClassMember = IsClassMember( object )
	local isClass = not isClassMember and IsClass( object )
	if isClass or isClassMember then
		local result = "%s"
		local parent = GetParentClass( object )
		if isClassMember then
			result = string.format( "Instance of [%s(%%s)]", GetClassName( parent ) )
			parent = GetParentClass( parent )
		else
			result = string.format( "Class: [%s(%%s)]", GetClassName( object ) )
		end
		while parent do
			result = string.format( result, string.format( " %s(%%s) ", GetClassName( parent ) ) )
			parent = GetParentClass( parent )
		end
		result = string.format( result, "" )
		return result
	end
end
--------------------------------------------------------------------------------
-- Получить (в читаемом виде) название функции и её цепочку наследования по адресу функции и адресу объекта
-- Ищет только в цепочке наследования объекта
-- Если не найдено то вернет nil
function GetClassFunctionPathByAddress( object, address )
	local function InClassFinder( class, func, result )
		local className = GetClassName( class )
		result = result and result .. "<-" .. className or className
		for name, var in pairs( class ) do
			if type( var ) == "function" and func == var then
				return result .. "." .. name
			end
		end
		local parentClass = GetParentClass( class )
		if parentClass then
			return InClassFinder( parentClass, func, result )
		end
	end
	
	local searchClass = IsClass( object ) and object or IsClassMember( object ) and GetParentClass( object )
	return searchClass and InClassFinder( searchClass, address )
end
--------------------------------------------------------------------------------
-- Получить (в читаемом виде) полный путь объекта по ссылке начиная с _G
-- Ищет рекурсивно везде
-- Если не найдено (локальная переменная) то вернет nil
function GetPathByAddress( address )
	local visited = {
		[ _G ] = true
	}
	local pkg = rawget( _G, "package" )
	if pkg then
		visited[ pkg ] = true
	end
	local function GlobalFinder( point, address, result )
		for name, var in pairs( point ) do
			local sName
			local dotInPath = true
			if type( name ) == "string" then
				sName = name
			else
				dotInPath = false
				sName = "[ " .. tostring( name ) .. " ]"
			end
			
			if address == var then
				return result and result .. ( dotInPath and "." or "" ) .. sName or sName
			elseif type( var ) == "table" then
				local isVisited = visited[ var ]
				if not isVisited then
					visited[ var ] = true
					local finalResult = GlobalFinder( var, address, result and result .. ( dotInPath and "." or "" ) .. sName or sName )
					if finalResult then	
						return finalResult
					end
				end
			end
		end
	end
	return address and GlobalFinder( _G, address )
end
--------------------------------------------------------------------------------
-- Гибрид GetClassFunctionPathByAddress и GetPathByAddress
-- Если не найдено вернет строку вида func_АДРЕС
function GetFunctionPathByAddress( address, context )
	if address and type( address ) == "function" then
		if context then
			local path = GetClassFunctionPathByAddress( context, address )
			if path then
				return path, true
			end
		end
		local path = GetPathByAddress( address )
		if path then	
			return path
		end
		
		return string.format( "func_%s", string.sub( tostring( address ), -8 ) )
	end
	return "not_a_function"
end
--------------------------------------------------------------------------------
-- Вывести в лог GetObjectClassPath
function LogObjectClassPath( object )
	local classPath = GetObjectClassPath( object )
	if classPath then
		LogInfo( classPath )
	else
		LogInfo( 'Object not a class or member of any class' )
	end	
end
--------------------------------------------------------------------------------
---END_DEBUG---
--------------------------------------------------------------------------------