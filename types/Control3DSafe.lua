---@meta

---@class Control3DSafe
local Control3DSafe = {}

---Добавляет указанный 2D-контрол как Widget3D в контрол типа Control3DSafe. Добавляемый 2D-контрол или его дочерние контролы не могут сами быть Control3DSafe. Можно задавать оба 3D-размера вручную, либо один из них может рассчитываться автоматически, исходя из размера исходного 2D-контрола. Основной 3D контрол находится в аддоне Main и имеет имя MainScreenControl3D Функция вернет ошибку если выполняется любое из нижележащих условий
---@param widget WidgetSafe 2D-контрол, который добавляется как Widget3D
---@param size table с полями:
---@param sizeX number размер контрола-3D по X в метрах
---@param sizeY number размер контрола-3D по Y в метрах
---@param pos GamePosition позиция контрола-3D на карте
---@param autoResizeX boolean использовать ли автоматический расчет ширины объекта (нельзя включать одновременно с autoResizeY)
---@param autoResizeY boolean использовать ли автоматический расчет высоты объекта (нельзя включать одновременно с autoResizeX)
---@param cutDistance number расстояние (в метрах), на котором перестает показывать контрол
---@param bindPointY number точка привязки контрола-3D по y
---@param minSizeLimit number коэффициент, задающий минимальный абсолютный размер контрола (его реальный размер в пикселах на экране), при достижении этого размера контрол перестает уменьшаться (при отдалении объекта), абсолютный минимальный размер контрола - его виртуальный размер, умноженный на данный коэффициент с учетом отношения реального и виртуального размеров экранов
---@param maxSizeLimit number коэффициент максимального размера контрола, аналогичен минимальному
---@return нет
function Control3DSafe:AddWidget3D(widget, size, sizeX, sizeY, pos, autoResizeX, autoResizeY, cutDistance, bindPointY, minSizeLimit, maxSizeLimit) end

---Проверяет добавлен ли виджет как Widget3D в данный Control3DSafe.
---@param widget WidgetSafe проверяемый виджет
---@return boolean
function Control3DSafe:IsAddedAsWidget3D(widget) end

---Удаляет все Widget3D из контрола типа Control3DSafe. ВАЖНО: Удаляются именно Widget3D, но не содержащиеся в них WidgetSafe. Они будут возвращены владельцам (будет неявно вызван Owner:AddChild( widget ) )
---@return нет
function Control3DSafe:RemoveAllWidget3D() end

---Удаляет указанный 2D-контрол как Widget3D из контрола типа Control3DSafe. ВАЖНО: Удаляется именно Widget3D, но не содержащийся в нем WidgetSafe. Он будет возвращен владельцу (будет неявно вызван Owner:AddChild( widget ) )
---@param widget WidgetSafe 2D-контрол, который удаляется как Widget3D
---@return нет
function Control3DSafe:RemoveWidget3D(widget) end

---Меняет позицию на карте для Widget3D для указанного контрола, находящегося в объекте типа Control3DSafe.
---@param widget WidgetSafe 2D-контрол, для которого меняется позиция Widget3D
---@param pos GamePosition новая позиция контрола-3D на карте (новая версия GamePosition)
---@return нет
function Control3DSafe:SetWidget3DPos(widget, pos) end

---Меняет размер Widget3D для указанного контрола, находящегося в объекте типа Control3DSafe.
---@param widget WidgetSafe 2D-контрол, для которого меняется размер Widget3D
---@param size table с полями:
---@param sizeX number новый размер контрола-3D по X в метрах
---@param sizeY number новый размер контрола-3D по Y в метрах
---@return нет
function Control3DSafe:SetWidget3DSize(widget, size, sizeX, sizeY) end
