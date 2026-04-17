---@meta

--- CategoryPayToPlay
--- Функции и события Lua API, связанные с подписочными серверами.

---@class payToPlayLib
payToPlay = {}

--- Возвращает true, если сейчас игрок находится на подписочном сервере. В остальных случаях (не на подписочном сервере, вообще не на сервере, не залогинился и т.п.) возвращает false.
---@return boolean
function payToPlay.IsOnPayToPlayShard() end
