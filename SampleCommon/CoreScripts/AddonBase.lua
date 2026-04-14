--------------------------------------------------------------------------------
-- AddonBase.lua
--[[
	Зависимости:
		AddonBaseInternal.lua / AddonBaseUserMods.lua
		
	Библиотека базовых функций, включает в себя такие вещи как
		Расширение стандартной библиотеки
		Объявление ряда общеупотребительных констант
		Объявление ряда общеупотребительных алиасов на популярные API
		Функции получения ассоциированных текстов / текстур / звуков с кештрованием
		Индексация userdata
		Универальная система логгирования
	
	Объявляемые глобальные переменные (включая алиасы)
		ADDON_NAME - имя текущего аддона
		HALF_PI = math.pi / 2
		DOUBLE_PI = math.pi * 2
		TO_DEGREES = 180 / math.pi
		TO_RADIANS = math.pi / 180
		
		IsWs( any ) = apitype( any ) == "WString"
		IsVt( any ) = apitype( any ) == "ValuedText"
		IsVo( any ) = apitype( any ) == "ValuedObjectLua"
		IsValidText = common.IsValidText
		IntWs = common.FormatInt
		FloatWs = common.FormatFloat
		NumberWs = common.FormatNumber
		GetEWs = common.GetEmptyWString
		GetEVt = common.CreateValuedText
		GetEVo = common.CreateValuedObject
		CreateVt = common.CreateValuedText
		
	Объявляемые глобальные переменные (включая алиасы) - только при отладке
		DEBUG_BYPASS_ASSERTS = false - отключить падение при вызове error / assert
		LOG_MULTILINE_FORMAT = true - при логгировании заменять вывод одной строки с "\n" выводом нескольких строк
		
		print = LogInfo
		
	Расширение стандартной библиотеки ( * обозначает функции мутирующие аргументы )
		table.isempty( tab ) - является ли талица пустой
		table.size( tab ) - число ключей в таблице
		table.map( tab ) - возвращает "перевернутую" копию таблицы (ключ-значение) => (значение-ключ)
		table.imap( tab ) - возвращает "перевернутую" копию таблицы (ключ-значение) => (значение-ключ), только array ключи
		table.maxn2( tab ) - максимальный числовой ключ в таблице, если числовых ключей нет вернет nil
		table.minn( tab ) - минимальный числовой ключ в таблице, если числовых ключей нет вернет nil
		*table.append( tab, [pos], otherTab ) - аналог table.insert, но вставляет все array значения из othertab
		*table.normalize( tab ) - меняет индексацию таблицы с 0 на индексацию с 1
		*table.denormalize( tab ) - меняет индексацию таблицы с 1 на индексацию с 0
		table.index( tab, ... ) - эквивалент tab[ arg1 ][ arg2 ] ... [ argN ]
		*table.newindex( tab, ... ) - эквивалент tab[ arg1 ][ arg2 ] ... [ argN - 1 ] = argN
		table.getcount( tab, entry, [equal] ) - количество элементов entry в таблице tab, можно передать свою функцию компаратор (по умолчанию ==)
		table.search( tab, entry, [equal] ) - есть ли элемент entry в таблице tab, можно передать свою функцию компаратор (по умолчанию ==)
			при отсутствии вернет false
			При наличии вернет true, ключ по которому найден элемент
		table.binsearch( tab, entry, [fless], [fequal] ) - бинарный поиск entry в tab
			fless - опциональный компаратор меньше (по умолчанию <)
			fequal - опциональный компаратор равно (по умолчанию ==)
			При отсутствии вернет false, ключ при вставке по которому entry сортировка сохранится, текущее значение по данному ключу
			При наличии вернет true, ключ по которому найден entry, текущее значение по данному ключу
		*table.traverse( tab, mutator ) - рекурсивный обход таблицы с заменой нетабличных значений на результат вызова mutator( key, value )
		table.getrandom( tab ) - получить случайную пару ключ-значение из таблицы
		table.igetrandom( tab ) - получить случайную пару ключ-значение из таблицы, только array ключи
		string.escape( str ) - экранировать в строке управляющие символы lua-regexp
		string-split( str, [sep = %s], [noEscape = false] ) - разбить строку на подстроки по сепаратору(ам)
		sortpairs( tab ) - аналог pairs, но с устойчивым порядком
		zpairs( tab ) - аналог ipairs, но старт с 0
	
	Предоставляемое API
		ReloadAddon() - перезагрузить самого себя
		ValidateText( text ) - если аргумент это валидный текст - возвращает его, иначе возвращает: на отладке текст ошибки, на релизе пустую строку
		JoinTextValues( values, [glueFormatWString = DefaultJoinTextValuesFormat], [iter = ipairs] ) - сшивает куски текста из таблицы values в единый VT
		GetAddonText / GetAddonTexture / GetAddonSound / GetStateText / GetStateTexture / GetStateSound ( sysGroup, sysName, isOptionl )
			Получить ассоциированный с аддоном / стейтом ресурс из группы с именем sysGroup по ключу sysName
			Если задан isOptional то отсутствие ресурса не считается ошибкой
			Ресурс будет закеширован и последуюющие обращения к тому же ресурсу пойдут без вызовов нативного API
			
	Предоставляемое отладочное API
		error( template, ... ) - вызов ошибки
			template - сроковый шаблон подстановки (поддерживается только %s)
			... - аргументы подстановки, будут обернуты через advtostring
		assert( cond, template, ... ) - вызывает ошибку если cond не является истиной
		advtostring( any, [flat = false], [brief = INT_MAX] ) - превращает что угодно в читаемую строку для логгирования
			flat - не использовать красивое форматирование таблиц
			brief - максимальная глубина обхода вложнных таблиц
		LogInfo( ... ) - логгирует что угодно с уровнем INFO
		LogWarning( ... ) - логгирует что угодно с уровнем WARNING
		LogError( ... ) - логгирует что угодно с уровнем error
		LogInfoTS( ... ) - LogInfo( ... ) с дополнением: ставит (сбрасывает) метку времени
		LogInfoTN( ... ) - LogInfo( ... ) с дополнением: выводит прошедшее время (в мс) с момента установки метки и с последнего вызова LogInfoTN
		LogMemoryUsage() - логгирует использование памяти
		LogTrace() - логгирует стектрейс
]]
--------------------------------------------------------------------------------
Global( "ADDON_NAME", common.GetAddonSysName() )
--------------------------------------------------------------------------------
function ReloadAddon()
	common.StateReloadManagedAddon( ADDON_NAME )
	LogInfo( string.format( "Addon [%s] has been reloaded.", ADDON_NAME ) )
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Standard library extension 
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	---BEGIN_DEBUG---
	--------------------------------------------------------------------------------
	function print( ... )
		LogInfo( ... )
	end
	--------------------------------------------------------------------------------
	-- Умный ассерт \ ошибка
	-- Можно передать несколько параметров, первый - шаблон подстановки string.format, остальные - значениЯ
	-- В шаблоне подстановки поддерживаетсЯ только %s!
	-- Все параметры будут приведены к строкам через advtostring
	--------------------------------------------------------------------------------
	Global( "DEBUG_BYPASS_ASSERTS", false )
	--------------------------------------------------------------------------------
	local _error = error
	function error( template, ... )
		local args = { ... }
		local template = type( template ) ~= "string" and advtostring( template ) or template
		local params = {} 
		for i = 1, select( 2, string.gsub( template, "%%s", "" ) ) do
			params[ i ] = type( args[ i ] ) ~= "string" and advtostring( args[ i ] ) or args[ i ]
		end
		local callSuccess, result = pcall( string.format, template, unpack( params ) )
		result = callSuccess and result or "FATAL: Error in error logging. Bad error template"
		LogError( result )
		if DEBUG_BYPASS_ASSERTS then
			return
		end
		if common.Assert then
			common.Assert( result )
		end
		return _error( "Assertion failed" )
	end
	--------------------------------------------------------------------------------
	function assert( check, template, ... )
		if not check then
			return error( template, ... )
		end
	end
	--------------------------------------------------------------------------------
	---END_DEBUG---
	--------------------------------------------------------------------------------

	--------------------------------------------------------------------------------
	--[[
	Определены в коде клиента
	--------------------------------------------------------------------------------
	function math.sign( number )
		return number < 0 and -1 or 1
	end
	--------------------------------------------------------------------------------
	function math.round( number, limit, cutOff )
		limit = type( limit ) == "number" and limit or 0
		local multipler = 10 ^ limit
		local diff = cutOff and 0 or 0.5
		if number >= 0 then
			return math.floor( number * multipler + diff ) / multipler
		else
			return math.ceil( number * multipler - diff ) / multipler
		end
	end
	--------------------------------------------------------------------------------
	function math.clamp( number, min, max )
		if type( min ) == "number" then number = math.max( number, min ) end
		if type( max ) == "number" then number = math.min( number, max ) end
	
		return number
	end
	--------------------------------------------------------------------------------
	function math.wrap( number, min, max )
		min, max = math.min( min, max ), math.max( min, max )
		local diff = max - min
		local mod = math.fmod( number - min, diff )
		if mod < 0 then
			mod = mod + diff
		end
		return min + mod
	end
		--------------------------------------------------------------------------------
	do
		local hash = {}
		local depth = 0
		--------------------------------------------------------------------------------
		function table.clone( val, out )
			if type( val ) == "table" then
				out = type( out ) == "table" and out or {}
				
				if not hash[ val ] then
					hash[ val ] = out
			
					depth = depth + 1
					for k, v in pairs( val ) do
						out[ k ] = table.clone( v, out[ k ] )
					end
					depth = depth - 1
			
				else
					out = hash[ val ]
				end
			
				if depth == 0 then
					hash = {}
				end
			
				return out
			else
				if val ~= nil then
					return val
				else
					return out
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	]]
	--------------------------------------------------------------------------------
	table.size = table.nkeys
	--------------------------------------------------------------------------------
	function table.imap( tab, map )
		map = map or {}
		for k, v in ipairs( tab ) do map[ v ] = k end
		return map
	end
	--------------------------------------------------------------------------------
	function table.map( tab, map )
		map = map or {}
		for k, v in pairs( tab ) do map[ v ] = k end
		return map
	end
	--------------------------------------------------------------------------------
	-- ОтличаетсЯ от стандартной функции table.maxn!
	-- Обрабатывает все значениЯ ключей а не только положительные
	-- Возвращает nil при отсутствии числовых ключей а не 0
	function table.maxn2( tab )
		local max
		for key in pairs( tab ) do
			if type( key ) == "number" then
				max = math.max( max or key, key )
			end
		end
		return max
	end
	--------------------------------------------------------------------------------
	-- Поиск минимального числового ключа в таблице, nil если нет числовых ключей
	function table.minn( tab )
		local min
		for key in pairs( tab ) do
			if type( key ) == "number" then
				min = math.min( min or key, key )
			end
		end
		
		return min
	end
	--------------------------------------------------------------------------------
	-- Аналог table.insert длЯ вставки большого числа значений
	-- Параметры аналогичны table.insert но вместо значениЯ - таблица значений индексированнаЯ с 1
	function table.append( tab, arg1, arg2 )
		if type( arg1 ) == "table" then
			for _, val in ipairs( arg1 ) do
				table.insert( tab, val )
			end
			
		elseif type( arg2 ) == "table" and type( arg1 ) == "number" then
			for _, val in ipairs( arg2 ) do
				table.insert( tab, arg1, val )
				arg1 = arg1 + 1
			end
		end
		
		return tab
	end
	--------------------------------------------------------------------------------
	-- МенЯет индексацию таблицы с 0 на 1
	function table.normalize( tab )
		if tab and tab[ 0 ] then table.insert( tab, 0, nil ) end
		return tab
	end
	--------------------------------------------------------------------------------
	-- МенЯет индексацию таблицы с 1 на 0
	function table.denormalize( tab )
		if tab and tab[ 0 ] == nil then
			local size = #tab
			for i = 1, size do
				tab[ i - 1 ] = tab[ i ]
			end
			tab[ size ] = nil
		end
		return tab
	end
	--------------------------------------------------------------------------------
	-- Эквивалент val = tab[ arg1 ][ arg2 ]...[ argN ]
	function table.index( tab, ... )
		local val = tab
		
		for _, key in ipairs( {...} ) do
			if val == nil then return end
			val = tab[ key ]
			tab = val
		end
		
		return val
	end
	--------------------------------------------------------------------------------
	-- Эквивалент tab[ arg1 ][ arg2 ]...[ argN - 1 ] = argN
	function table.newindex( tab, ... )
		local arg = { ... }
		local n = select( "#", ... )
		local val = arg[ n ]
		local key = arg[ n - 1 ]
		
		local t, k
		
		for i = 1, n - 2 do
			k = arg[ i ]
			t = tab[ k ] or {}
			tab[ k ] = t
			tab = t
		end
		
		tab[ key ] = val
		
		return tab
	end
	--------------------------------------------------------------------------------
	local function def_comp( v1, v2 ) return v1 < v2 end
	local function def_equal( v1, v2 ) return v1 == v2 end
	--------------------------------------------------------------------------------
	-- Сколько раз в таблице tab встречается элемент entry, можно задать свой компаратор
	function table.getcount( tab, entry, equal )
		equal = equal or def_equal
		local counter = 0
		for id, value in pairs( tab ) do
			if equal( entry, value ) then
				counter = counter + 1
			end
		end
		return counter
	end
	--------------------------------------------------------------------------------
	-- Поиск по таблице полным перебором, можно задать свой компаратор
	function table.search( tab, entry, equal )
		equal = equal or def_equal
		for k, v in pairs( tab ) do
			if equal( v, entry ) then
				return true, k
			end
		end
		return false
	end
	--------------------------------------------------------------------------------
	-- Бинарный поиск по сортированной, индексированной с 1 таблице
	-- Сортировка должна соответствовать используемым компараторам
	-- В случае успеха возвращает true, ключ, значение
	-- В противном случае возвращает false, ключ при вставке по которому искомого
	--		значения через table.insert таблица останется сортированной, текущее значение по этому ключу
	function table.binsearch( tab, entry, fless, fequal )		
		fless, fequal = fless or def_comp, fequal or def_equal
		
		local minn, maxn = 1, #tab
		local key, val, less = 1
		
		while minn <= maxn do
			key = math.floor( ( minn + maxn ) / 2 )
			val = tab[ key ]
			less = fless( entry, val )
			
			if less then
				maxn = key - 1
				
			elseif fequal( entry, val ) then
				return true, key, val
				
			else
				minn = key + 1
			end
		end
		
		key = less ~= false and key or key + 1
		return false, key, tab[ key ]
	end
	--------------------------------------------------------------------------------
	-- Рекурсивный обход таблицы с заменой нетабличных значений через переданную функцию
	function table.traverse( tab, mutator )
		for k, v in pairs( tab ) do
			if type( v ) == 'table' then
				tab[ k ] = table.traverse( v, mutator )
			else
				tab[ k ] = mutator( k, v )
			end
		end
		return tab
	end
	--------------------------------------------------------------------------------
	-- Возвращает случайную пару ключ/значение из таблицы tab 
	function table.getrandom( tab )
		if #tab == table.size( tab ) then
			return table.igetrandom( tab )
		end
		
		local keys = {}
		
		for key in pairs( tab ) do
			table.insert( keys, key )
		end
		
		local randomKey = keys[ common.GetRandInt( 1, #keys ) ]
		return randomKey, tab[ randomKey ]
	end
	--------------------------------------------------------------------------------
	-- Возвращает случайную пару ключ/значение из таблицы tab, только array ключи 
	function table.igetrandom( tab )
		local size = #tab
		if size == 0 then
			return nil, nil
		end
		
		local randomKey = common.GetRandInt( 1, size )
		return randomKey, tab[ randomKey ]
	end
	--------------------------------------------------------------------------------
	-- Проверка таблц на вхождение
	function table.issubtable( tab, any )
		if type( any ) ~= "table" then
			return false
		end
		for k, v in pairs( any ) do
			if tab[ k ] ~= v then
				if type( v ) == "table" and type( tab[ k ] ) == "table" then
					local equals = table.isequal( tab[ k ], v )
					if not equals then
						return false
					end
				end
			end
		end
		return true
	end
	--------------------------------------------------------------------------------
	-- Проверка таблиц на равенство
	function table.isequal( tab1, tab2 )
		return table.size( tab1 ) == table.size( tab2 ) and table.issubtable( tab1, tab2 ) and table.issubtable( tab2, tab1 )
	end
	--------------------------------------------------------------------------------
	local stringSpecialChars = table.map{ "^", "$", "(", ")", "%", ".", "[", "]", "*", "+", "-", "?" }
	--------------------------------------------------------------------------------
	-- Экранирует в строке спецсимволы использующиеся в паттернах lua
	function string.escape( str )
		return string.gsub( str, "(.)", function( c )
			if stringSpecialChars[ c ] then 
				return "%" .. c
			else
				return c
			end
		end )
	end
	--------------------------------------------------------------------------------
	-- Делит строку str по символам перечисленным в строке separators. Если задан noEscape то символы не экранируются (можно задать %s, %d и тп)
	-- Если separators не задан то по-умолчанию делит по %s (пробельные символы)
	function string.split( str, separators, noEscape )
		if not separators then
			separators = "%s"
			noEscape = true
		end
		if not noEscape then
			separators = string.escape( separators )
		end
		local splitted = {}
		for part in string.gmatch( str, "([^" .. separators .. "]+)" ) do
			table.insert( splitted, part )
		end
		return splitted
	end
	--------------------------------------------------------------------------------
end

--------------------------------------------------------------------------------
-- AvatarId helper
--------------------------------------------------------------------------------
if rawget( _G, "avatar" ) then
	local avatarId
	local _GetId = avatar.GetId
	local function FillAvatarId()
		if avatar.IsExist() then
			avatarId = _GetId()
			return avatarId
		end
	end
	function avatar.GetId()
		return avatarId or FillAvatarId()
	end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Geom Helpers
--------------------------------------------------------------------------------
do
	Global( "HALF_PI", math.pi / 2 )
	Global( "DOUBLE_PI", math.pi * 2 )
	Global( "TO_DEGREES", 180 / math.pi )
	Global( "TO_RADIANS", math.pi / 180 )
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Text helpers
--------------------------------------------------------------------------------
do
	function IsWs( any ) return apitype( any ) == "WString" end
	function IsVt( any ) return apitype( any ) == "ValuedText" end
	function IsVo( any ) return apitype( any ) == "ValuedObjectLua" end
	IsValidText = common.IsValidText
	IntWs = common.FormatInt
	FloatWs = common.FormatFloat
	NumberWs = common.FormatNumber
	--------------------------------------------------------------------------------
	local ews = common.GetEmptyWString()
	function GetEWs() return ews end
	GetEVt = common.CreateValuedText   -- Пояснение: хотя GetEVt и CreateVt это одна и та же функция рекомендуется
	CreateVt = common.CreateValuedText -- использовать GetEVt только без параметров а CreateVt только с параметрами (для лучшей читаемости кода)
	GetEVo = common.CreateValuedObject
	--------------------------------------------------------------------------------
	-- Валидирует текст, заменЯет невалидный текст на пустую строку или на отладочное сообщение об ошибке (при запуске с кода)
	-- Пустая строка является наиболее безопасным невалидным текстом из всех вариантов
	function ValidateText( text )
		---BEGIN_DEBUG---
		local errorText
		
		if text == nil then
			errorText = GetStateText( nil, "DefaultNilValue" )
		
		elseif IsWs( text ) then
			if text:IsEmpty() then errorText = GetStateText( nil, "DefaultEmptyWString" ) end
			
		elseif IsVt( text ) then
			if text:IsEmpty() then errorText = GetStateText( nil, "DefaultEmptyValuedText" ) end
			
		elseif not IsVo( text ) then
			errorText = GetStateText( nil, "DefaultNotaWString" )
		end
		
		if errorText then
			return errorText
		else
			return text
		end
		---END_DEBUG---
		return IsValidText( text ) and text or GetEWs()
	end
	--------------------------------------------------------------------------------
	-- Склеить значения из values (WString \ ValuedText \ ValuedObject) в один ValuedText
	-- Можно передать свой формат склейки (должен иметь поля __accumulated_value, __added_value)
	-- Можно передать свой итератор обхода values
	function JoinTextValues( values, glueFormatWString, iter )
		local result
		local glueFormat = glueFormatWString or GetStateText( nil, "DefaultJoinTextValuesFormat" )
		iter = iter ~= nil and iter or ipairs
		
		for _, value in iter( values ) do
			if not result then
				result = value
			else
				result =  CreateVt{
					format = glueFormat,
					__accumulated_value = result,
					__added_value = value
				}
			end
		end
	
		return result
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Text caches
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	local _textDefaultGroupId = "Common"
	local _dummyGroup = { HasText = function() return false end }
	local _textAddonGroups = {}
	local _textAddonCache = {}
	local _textStateGroups = {}
	local _textStateCache = {}
	--------------------------------------------------------------------------------
	local function GetGroupText( group, groupCache, sysName, optional )
		local result = groupCache[ sysName ]
		if result == nil then
			local hasText = group:HasText( sysName )
			if hasText then
				result = group:GetText( sysName )
			elseif optional then
				result = false
			else
				result = GetEWs()
				---BEGIN_DEBUG---
				local _, sysGroup = table.search( _textAddonGroups, group )
				if not sysGroup then
					_, sysGroup = table.search( _textStateGroups, group )
				end
				if group == _dummyGroup then
					LogError( string.format( "Requested text [%s] from non-existent group [%s]", tostring( sysName ), tostring( sysGroup ) ) )
				else
					LogError( string.format( "Requested non-existent text [%s] from group [%s]", tostring( sysName ), tostring( sysGroup ) ) )
				end
				---END_DEBUG---
			end
			groupCache[ sysName ] = result
		end
		return result
	end
	--------------------------------------------------------------------------------
	-- Получить текст sysName из группы аддона sysGroup (или Common если nil)
	-- Если задано optional то отсутствие текста не считается ошибкой
	function GetAddonText( sysGroup, sysName, optional )
		sysGroup = sysGroup or _textDefaultGroupId
		local group = _textAddonGroups[ sysGroup ]
		if not group then
			group = common.GetAddonRelatedTextGroup( sysGroup, true ) or _dummyGroup
			_textAddonGroups[ sysGroup ] = group
			_textAddonCache[ sysGroup ] = {}
		end
		return GetGroupText( group, _textAddonCache[ sysGroup ], sysName, optional )
	end
	--------------------------------------------------------------------------------
	-- Получить текст sysName из группы стейта sysGroup (или Common если nil)
	-- Если задано optional то отсутствие текста не считается ошибкой
	function GetStateText( sysGroup, sysName, optional )
		sysGroup = sysGroup or _textDefaultGroupId
		local group = _textStateGroups[ sysGroup ]
		if not group then
			group = common.GetStateRelatedTextGroup( sysGroup, true ) or _dummyGroup
			_textStateGroups[ sysGroup ] = group
			_textStateCache[ sysGroup ] = {}
		end
		return GetGroupText( group, _textStateCache[ sysGroup ], sysName, optional )
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Texture caches
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	local _textureDefaultGroupId = "Common"
	local _dummyGroup = { HasTexture = function() return false end }
	local _textureAddonGroups = {}
	local _textureAddonCache = {}
	local _textureStateGroups = {}
	local _textureStateCache = {}
	--------------------------------------------------------------------------------
	local function GetGroupTexture( group, groupCache, sysName, optional )
		local result = groupCache[ sysName ]
		if result == nil then
			local hasTexture = group:HasTexture( sysName )
			if hasTexture then
				result = group:GetTexture( sysName )
			elseif optional then
				result = false
			---BEGIN_DEBUG---
			else
				local _, sysGroup = table.search( _textureAddonGroups, group )
				if not sysGroup then
					_, sysGroup = table.search( _textureStateGroups, group )
				end
				if group == _dummyGroup then
					LogError( string.format( "Requested texture [%s] from non-existent group [%s]", tostring( sysName ), tostring( sysGroup ) ) )
				else
					LogError( string.format( "Requested non-existent texture [%s] from group [%s]", tostring( sysName ), tostring( sysGroup ) ) )
				end
			---END_DEBUG---
			end
			groupCache[ sysName ] = result
		end
		return result
	end
	--------------------------------------------------------------------------------
	-- Получить текстуру sysName из группы аддона sysGroup (или Common если nil)
	-- Если задано optional то отсутствие текстуры не считается ошибкой
	function GetAddonTexture( sysGroup, sysName, optional )
		sysGroup = sysGroup or _textureDefaultGroupId
		local group = _textureAddonGroups[ sysGroup ]
		if not group then
			group = common.GetAddonRelatedTextureGroup( sysGroup, true ) or _dummyGroup
			_textureAddonGroups[ sysGroup ] = group
			_textureAddonCache[ sysGroup ] = {}
		end
		return GetGroupTexture( group, _textureAddonCache[ sysGroup ], sysName, optional )
	end
	--------------------------------------------------------------------------------
	-- Получить текстуру sysName из группы стейта sysGroup (или Common если nil)
	-- Если задано optional то отсутствие текстуры не считается ошибкой
	function GetStateTexture( sysGroup, sysName, optional )
		sysGroup = sysGroup or _textureDefaultGroupId
		local group = _textureStateGroups[ sysGroup ]
		if not group then
			group = common.GetStateRelatedTextureGroup( sysGroup, true ) or _dummyGroup
			_textureStateGroups[ sysGroup ] = group
			_textureStateCache[ sysGroup ] = {}
		end
		return GetGroupTexture( group, _textureStateCache[ sysGroup ], sysName, optional )
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Sound caches
--------------------------------------------------------------------------------
if common.IsSoundEnabled() then
	--------------------------------------------------------------------------------
	local _soundDefaultGroupId = "Common"
	local _dummyGroup = { HasSound = function() return false end }
	local _soundAddonGroups = {}
	local _soundAddonCache = {}
	local _soundStateGroups = {}
	local _soundStateCache = {}
	--------------------------------------------------------------------------------
	local function GetGroupSound( group, groupCache, sysName, optional )
		local result = groupCache[ sysName ]
		if result == nil then
			local hasSound = group:HasSound( sysName )
			if hasSound then
				local soundId = group:GetSound( sysName )
				local sound = common.CreateSound( soundId )
				if sound then
					result = sound
				else
					result = false
					---BEGIN_DEBUG---
					LogError( string.format( "Failed to create sound with id [%s], if sound muted this isn't an error", sysName ) )
					---END_DEBUG---
				end
			elseif optional then
				result = false
			---BEGIN_DEBUG---
			else
				local _, sysGroup = table.search( _soundAddonGroups, group )
				if not sysGroup then
					_, sysGroup = table.search( _soundStateGroups, group )
				end
				if group == _dummyGroup then
					LogError( string.format( "Requested sound [%s] from non-existent group [%s]", tostring( sysName ), tostring( sysGroup ) ) )
				else
					LogError( string.format( "Requested non-existent sound [%s] from group [%s]", tostring( sysName ), tostring( sysGroup ) ) )
				end
			---END_DEBUG---
			end
			groupCache[ sysName ] = result
		end
		return result
	end
	--------------------------------------------------------------------------------
	-- Получить звук sysName из группы аддона sysGroup (или Common если nil)
	-- Если задано optional то отсутствие звука не считается ошибкой
	function GetAddonSound( sysGroup, sysName, optional )
		sysGroup = sysGroup or _soundDefaultGroupId
		local group = _soundAddonGroups[ sysGroup ]
		if not group then
			group = common.GetAddonRelatedSoundGroup( sysGroup, true ) or _dummyGroup
			_soundAddonGroups[ sysGroup ] = group
			_soundAddonCache[ sysGroup ] = {}
		end
		return GetGroupSound( group, _soundAddonCache[ sysGroup ], sysName, optional )
	end
	--------------------------------------------------------------------------------
	-- Получить звук sysName из группы стейта sysGroup (или Common если nil)
	-- Если задано optional то отсутствие звука не считается ошибкой
	function GetStateSound( sysGroup, sysName, optional )
		sysGroup = sysGroup or _soundDefaultGroupId
		local group = _soundStateGroups[ sysGroup ]
		if not group then
			group = common.GetStateRelatedSoundGroup( sysGroup, true ) or _dummyGroup
			_soundStateGroups[ sysGroup ] = group
			_soundStateCache[ sysGroup ] = {}
		end
		return GetGroupSound( group, _soundStateCache[ sysGroup ], sysName, optional )
	end
	--------------------------------------------------------------------------------
else
	function GetAddonSound() return nil end
	function GetStateSound() return nil end
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Custom pairs()
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	-- Компаратор по умолчанию для sortpairs
	-- Cначала сортирует по типам значений (по алфавиту имени типа)
	-- Потом по типам ключей (по алфавиту имени типа)
	-- Потом по ключам приведенным к строке (по алфавиту)
	local function def_comp( tab )
		return function( k1, k2 )
			local v1, v2 = tab[ k1 ], tab[ k2 ]
			
			local tv1, tv2 = apitype( v1 ), apitype( v2 )
			if tv1 ~= tv2 then
				return tv1 < tv2
			end
			
			local tk1, tk2 = apitype( k1 ), apitype( k2 )
			if tk1 ~= tk2 then
				return tk1 < tk2
			end
			
			if tk1 == "number" or tk1 == "string" then
				return k1 < k2
			else
				return tostring( k1 ) < tostring( k2 )
			end
		end
	end
	--------------------------------------------------------------------------------
	-- pairs c сортировкай по ключам, можно задать свой компаратор специального вида
	-- Основное предназначение - стабильная итерация произвольных таблиц при отладочном выводе
	-- Для использования в логике компаратор по умолчанию скорее всего не подойдет
	function sortpairs( tab, comp )
		comp = comp or def_comp
	
		local list = {}
		for k in pairs( tab ) do
			table.insert( list, k )
		end
		
		table.sort( list, comp( tab ) )
		
		local first = list[ 1 ]
		local keys = {}
		
		for i, k in pairs( list ) do
			keys[ k ] = list[ i + 1 ]
		end
		
		return function( tab, key )
			if key == nil then
				key = first
			else
				key = keys[ key ]
			end
			return key, key ~= nil and tab[ key ]
		end, tab, nil
	end
	--------------------------------------------------------------------------------
	-- ipairs с 0 вместо 1
	function zpairs( tab )
		return function( tab, key )
			key = key + 1
			local val = tab[ key ]
			if val ~= nil then
				return key, val
			end
		end, tab, -1
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------


if rawget( _G, "FromWs" ) then
--------------------------------------------------------------------------------
-- Advanced tostring
--------------------------------------------------------------------------------
do
	local tostrlib = {}
	local done = {}
	local stack = {}
	local depth = 0
	local apitype = apitype
	local s_format = string.format
	------------------------------------------------------------------------------
	-- Превратить что угодно в строку, можно задать
	-- flat (default false) - собирать таблицы в 1 строку (не использовать красивое форматирование)
	-- brief (default INF) - максимальнаЯ глубина спуска во вложенные таблицы
	function advtostring( val, flat, brief )
		local method = tostrlib[ apitype( val ) ] or tostrlib[ type( val ) ]
		return method( val, flat, brief )
	end
	------------------------------------------------------------------------------
	tostrlib[ "table" ] = function( val, flat, brief )
		if brief and brief <= depth then return tostring( val ) end
		
		local out = {}
		local nosub, count = true, 0
		
		for k, v in pairs( val ) do
			count = count + 1
			
			if ( type( v ) == "table"
			and next( v ) ~= nil
			and ( not brief or brief > ( depth + 1 ) )
			and stack[ v ] == nil )
			or count > 8 then
				nosub = false
				break
			end
		end
		
		if not done[ val ] then done[ val ] = "self" end
		if not stack[ val ] then stack[ val ] = done[ val ] end
		
		depth = depth + 1
		local prefix = ( flat or nosub ) and " " or ( "\n" .. string.rep( "\t", depth ) )
		local key, t
		
		for k, v in sortpairs( val ) do
			t = type( k )
			key = s_format( t == "string" and "%s = " or "[ %s ] = ", t == "string" and k or advtostring( k, true, 0 ) )
			
			if done[ v ] == nil then
				if type( v ) == "table" then
					done[ v ] = s_format( t == "string" and "%s.%s" or "%s[ %s ]", done[ val ], tostring( k ) )
				end
			end
			
			if stack[ v ] == nil then
				table.insert( out, s_format( "%s%s%s", prefix, key, advtostring( v, flat, brief ) ) )
			else
				table.insert( out, s_format( "%s%s%s", prefix, key, stack[ v ] ) )
			end
		end
	
		depth = depth - 1
		prefix = ( flat or nosub ) and " " or ( "\n" .. string.rep( "\t", depth ) )
	
		stack[ val ] = nil
		if depth == 0 then done = {} end
		
		if #out == 0 then
			return "{}"
		else
			return "{" .. table.concat( out, ", " ) .. prefix .. "}"
		end
	end
	--------------------------------------------------------------------------------
	tostrlib[ "nil" ] = function()
		return "Nil"
	end
	------------------------------------------------------------------------------
	tostrlib[ "number" ] = function( val )
		return tostring( math.round( val, 3 ) )
	end
	------------------------------------------------------------------------------
	tostrlib[ "string" ] = function( val )
		return s_format( "\"%s\"", val )
	end
	------------------------------------------------------------------------------
	tostrlib[ "WString" ] = function( val )
		return s_format( "WString: [[%s]]", FromWs( val ) )
	end
	------------------------------------------------------------------------------
	tostrlib[ "ValuedText" ] = function( val, flat )
		return s_format( "ValuedText: [[%s]]", FromVt( val, true ) )
	end
	------------------------------------------------------------------------------
	local function widgettostring( widget )
		return widget:GetDebugInfo()
	end
	------------------------------------------------------------------------------
	tostrlib[ "ValuedObjectLua" ] = function( val )
		return s_format( "ValuedObjectLua: [[%s]]", FromWs( val:GetText() ) )
	end
	------------------------------------------------------------------------------
	tostrlib[ "function" ] = tostring
	tostrlib[ "boolean" ] = tostring
	------------------------------------------------------------------------------
	tostrlib[ "TextureId" ] = function( val )
		local info = common.GetTextureInfo( val )
		if info.xdbFile == "(serialized)" then
			return s_format( "TextureId: (serialized) [%dx%d] %s", info.realWidth, info.realHeight, info.binaryFile )
		else
			return s_format( "TextureId: %s", info.xdbFile )
		end
	end
	------------------------------------------------------------------------------
	tostrlib[ "userdata" ] = function( val )
		if common.IsWidget( val ) then
			return widgettostring( val )
		end
		local at = apitype( val )
		local resourcePath = at ~= "userdata" and at ~= "" and common.GetUserdataPath( val )
		
		if resourcePath then
			return s_format( "%s: \"%s\"", at, resourcePath )
		else
			return s_format( "%s: %s", at, string.sub( tostring( val ), -8 ) )
		end
	end
	------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Logging helpers
--------------------------------------------------------------------------------
do
	--------------------------------------------------------------------------------
	local function argtostring( ... )	
		local maxIndex = select( "#", ... )
		if maxIndex == 0 then
			return advtostring( nil )
		end
		
		local arg = { ... }
		local out, flat = {}
		
		for id = 1, maxIndex do
			flat = id < maxIndex
			
			local val = arg[ id ]
			if type( val ) ~= "string" then
				val = advtostring( val, flat )
			end
			
			table.insert( out, val )
		end
		
		return table.concat( out, " " )
	end
	--------------------------------------------------------------------------------
	local ms, ms2 = 0, 0
	local dt, dt2 = 0, 0
	--------------------------------------------------------------------------------
	local function gettimestring()
		local t = common.GetLocalDateTime()
		return string.format( "(%02d:%02d.%02d.%03d) ", t.h, t.min, t.s, t.ms )
	end
	--------------------------------------------------------------------------------
	local function getdeltatimestring( rs )
		local tms = common.GetLocalDateTimeMs()
		if ms == 0 or rs then
			ms = tms
			ms2 = ms
			dt, dt2 = 0, 0
			return "(0) "
		else
			dt = tms - ms
			dt2 = tms - ms2
			ms = tms
			return string.format( "(%d, +%d) ", dt2, dt )
		end
	end
	--------------------------------------------------------------------------------
	Global( "LOG_MULTILINE_FORMAT", true ) -- Заменить вывод одной строки с "\n" выводом нескольких строк
	--------------------------------------------------------------------------------
	local function IsMultilineOutput( data )
		if LOG_MULTILINE_FORMAT then
			return string.find( data, "\n" )
		end
		return false
	end
	--------------------------------------------------------------------------------
	local function Log( logger, timestamp, data )
		if IsMultilineOutput( data ) then
			data = string.gsub( data, "\t", "  " )
			local sLogData = string.split( data, "\n" )
			logger( ADDON_NAME, timestamp, "Multiline info:" )
			for _, logDataPart in ipairs( sLogData ) do
				logger( ADDON_NAME, logDataPart )
			end
		else
			logger( ADDON_NAME, timestamp, data )
		end
	end
	--------------------------------------------------------------------------------
	function LogInfo( ... )
		return Log( common.LogInfo, gettimestring(), argtostring( ... ) )
	end
	--------------------------------------------------------------------------------
	-- Вывести сообщение в лог и запустить (сбросить) таймер
	function LogInfoTS( ... )
		return Log( common.LogInfo, getdeltatimestring( true ), argtostring( ... ) )
	end
	--------------------------------------------------------------------------------
	-- Вывести сообщение + таймер в лог (см LogInfoTS)
	function LogInfoTN( ... )
		return Log( common.LogInfo, getdeltatimestring(), argtostring( ... ) )
	end
	--------------------------------------------------------------------------------
	function LogWarning( ... )
		return Log( common.LogWarning, gettimestring(), argtostring( ... ) )
	end
	--------------------------------------------------------------------------------
	function LogError( ... )
		return Log( common.LogError, gettimestring(), argtostring( ... ) )
	end
	--------------------------------------------------------------------------------
	function LogMemoryUsage()
		return LogInfo( collectgarbage( "count" ), "Kb of memory used" )
	end
	--------------------------------------------------------------------------------
	function LogTrace()
		local trace = common.GetCallStack()
		table.remove( trace, 1 )
		for index, line in ipairs( trace ) do
			trace[ index ] = string.format( "%s%s", string.rep( "\t", index ), line )
		end
		return LogInfo( "Lua stack trace:\n" .. table.concat( trace, "\n" ) )
	end
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------