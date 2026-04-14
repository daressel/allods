---@meta

---@class transportLib
transport = {}

---@class TransportGetShipInfoResult
---@field name string имя корабля
---@field ownerName string имя владельца корабля
---@field ownerGuildName string|nil имя гильдии владельца корабля, если он в гильдии
---@field gearScore number рейтинг корабля
---@field techLevel number поколение корпуса корабля
---@field quality number улучшения корпуса корабля за аномалии
---@field isEnhanced boolean есть ли 15% улучшение стойкости корпуса?

---Возвращает true, если требуется отрисовывать интерфейс выбранного корабля. То есть это боевой корабль, на котором могут летать игроки и они могут им управлять. Если это просто транспортное средство без управления (плот, лодка или скриптовый корабль), двигающиеся по заданному маршруту, то вернется false. Этот флаг выставляется в ресурсе корабля.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
function transport.CanDrawInterface(transportId) end

---Возвращает возвращает массу корабля, номинальную для двигателя транспортного средства. Если масса корабля больше, то движок будет перегружен. Если транспорт  или движок не найден, то возвращает nil.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
---@return number|nil
function transport.GetAcceleratorNominalMass(transportId) end

---Возвращает список идентификаторов используемых устройств транспортного средства. Если транспорт не найден, то возвращает пустую таблицу.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
function transport.GetDevices(transportId) end

---Возвращает величину поворота (yaw) транспортного средства в радианах. Если транспорт не найден, то возвращает 0.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
function transport.GetDirection(transportId) end

---Возвращает информацию об энергии транспортного средства. Если транспорт не найден, то возвращает nil.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
---@param value integer текущее значение энергии
---@param limit integer значение предела энергии
---@param changeRate number скорость изменения нагрева. Если больше 0 - нагреваемся, иначе остываем.
function transport.GetEnergy(transportId, value, limit, changeRate) end

---Возвращает значение здоровья максимально возможного для имеющегося корпуса. Если транспорт не найден, то возвращает ноль.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
function transport.GetHealthMaximum(transportId) end

---Возвращает информацию о количестве эманации транспортного средства, которое привязано к главному игроку. Если транспорт не найден, то возвращает nil. Эманация - ресурс, который тратится на астральную навигацию.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
---@param limit integer значение инсайта
function transport.GetInsight(transportId, limit) end

---Возвращает массу транспортного средства без устройств. Если транспорт не найден, то возвращает nil.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
function transport.GetMass(transportId) end

---Возвращает информацию о координатах транспортного средства (корабля)) по его Id.
---@return table
function transport.GetPosition() end

---Возвращает информацию о силе щита транспортного средства по какой-либо стороне (SHIP_SIDE_...). Сила представлена парой - значение/максимальное значение. Если транспорт не найден, то возвращает 0/0.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
---@param side number сторона
---@param value integer сила щита
---@param maxValue integer максимальная сила щита
function transport.GetShieldStrength(transportId, side, value, maxValue) end

---Возвращает общую информацию о постороннем корабле по его Id. При изменении приходит  EVENT_TRANSPORT_SHIP_INFO_CHANGED.
---@return TransportGetShipInfoResult
function transport.GetShipInfo() end

---Возвращает информацию о скоростях перемещения транспортного средства в пространстве. Если транспорт не найден, то возвращает nil. Проверка на изменение происходит не на каждом тике, а один раз в секунду.
---@param transportId ObjectId (not nil) -- идентификатор транспортного средства
---@param horizontal number скорость перемещения по горизонтали (всегда >0 - вперед)
---@param vertical number скорость перемещения по вертикали (>0 - вверх)
---@param angular number скорость поворота (>0 - против часовой стрелки)
function transport.GetVelocities(transportId, horizontal, vertical, angular) end
