---@meta

---@class DiscreteSliderSafe
local DiscreteSliderSafe = {}

---Возвращает текущую позицию дискретного слайдера.
---@return integer
function DiscreteSliderSafe:GetPos() end

---Возвращает диапазон значений дискретного слайдера (количество разбиений). (Значения слайдера - [0..GetStepsCount], т.е. число позиций на 1 больше количества разбиений).
---@return integer
function DiscreteSliderSafe:GetStepsCount() end

---Задает текущую позицию для дискретного слайдера.
---@param pos integer новая позиция, [0..GetStepsCount()]
---@return нет
function DiscreteSliderSafe:SetPos(pos) end

---Задает диапазон (количество разбиений) дискретного слайдера. (Значения слайдера - [0..GetStepsCount], т.е. число позиций на 1 больше количества разбиений).
---@param count integer диапазон слайдера
---@return нет
function DiscreteSliderSafe:SetStepsCount(count) end
