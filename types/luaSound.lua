---@meta

--- CategoryLuaSound
--- Функции и события Lua API, относящиеся к работе со звуком.

---@class luaSoundLib
luaSound = {}

--- Создает и возвращает объект, работающий с двухмерным звуком. Звук создается для определенного слота. Новый звук для уже имеющегося слота заменяет предыдущий. Звуки для разных слотов взаимодействуют по общим правилам. Звук продолжается некоторое время после завершения текущего состояния. Доступны слоты 0 - 20.
---@param soundId Sound2DId Id требуемого звука
---@param slot integer индекс слота под звук [0, 20]
---@return Sound2DLua|nil
function luaSound.CreateProlongedStateSound(soundId, slot) end

--- Создает и возвращает объект, работающий с двухмерным звуком.
---@param soundId Sound2DId Id требуемого звука
---@return Sound2DLua|nil
function luaSound.CreateSound(soundId) end

--- Возвращает группу связанных с аддоном звуковых ресурсов. Группа представляет собой userdata (RelatedSoundsLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedSoundsLua|nil
function luaSound.GetAddonRelatedSoundGroup(sysGroup, optional) end

--- Возвращает группу связанных с состоянием звуковых ресурсов. Группа представляет собой userdata (RelatedSoundsLua).
---@param sysGroup string идентификатор группы
---@param optional boolean|nil если true, то отсутствие искомой группы не считается ошибкой (по умолчанию false)
---@return RelatedSoundsLua|nil
function luaSound.GetStateRelatedSoundGroup(sysGroup, optional) end

--- Позволяет узнать, включен или выключен звук.
---@return boolean
function luaSound.IsSoundEnabled() end

--- Запускает музыку по алиасу, указанному в поле musicParameters в "\Interface\System\UIGameRoot.(UIGameRoot).xdb".
---@param musicAlias string алиас музыки
function luaSound.PlayMusic(musicAlias) end
