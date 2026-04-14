---@meta

---@class WidgetSafe
local WidgetSafe = {}

---Прерывает эффекты всех  типов Соответствует шаблону  FinishEffect( self, finalPosition, sendEvent )
function WidgetSafe:FinishAllEffects() end

---Прерывает эффект  типа ET_FADE Соответствует шаблону  FinishEffect( self, finalPosition, sendEvent )
function WidgetSafe:FinishFadeEffect() end

---Прерывает эффект  типа ET_MOVE Соответствует шаблону  FinishEffect( self, finalPosition, sendEvent )
function WidgetSafe:FinishMoveEffect() end

---Прерывает эффект  типа ET_RESIZE Соответствует шаблону  FinishEffect( self, finalPosition, sendEvent )
function WidgetSafe:FinishResizeEffect() end

---Прерывает эффект  типа ET_TEXTURE_ROTATION Соответствует шаблону  FinishEffect( self, finalPosition, sendEvent )
function WidgetSafe:FinishRotationEffect() end

---Получить оставшуюся длительность эффекта заданного типа у виджета. Если на виджете не проигрывается соответствующий эффект - вернет 0. Если функция вернула 0 это НЕ гарантирует что данного эффекта на виджете нет, возможно он есть, но его длительность истекла, при этом состояние события окончания эффекта не определено.
---@param effectType enum ET_* Тип эффекта
---@return number
function WidgetSafe:GetActiveEffectRemainingMs(effectType) end

---Получить имя аддона, к которому относится данный виджет.
---@return string -
function WidgetSafe:GetAddonName() end

---Возвращает полную таблицу WidgetPlacement. Неявные параметры могут иметь произвольное значение (поведение не определено)
---@return table
function WidgetSafe:GetPlacementPlain() end

---Возвращает полную таблицу WidgetPlacement с действительными значениями всех полей (неявные параметры будут вычислены).
---@return table
function WidgetSafe:GetSmartPlacementPlain() end

---Проверяет наличие активного  эффекта у виджета
---@param effectType number|nil тип эффекта, или nil если тип эффекта не имеет значения
function WidgetSafe:HasActiveEffects(effectType) end

---Запускает набор цепочек эффектов разных типов. В качестве аргумента принимает таблицу вида ET_* -> sequenceParams. Описание sequenceParams смотреть в  PlayEffectSequence( self, sequenceParams ) Примечание: для ET_TEXTURE_ROTAION используется PlayRotationEffectSequence
---@param effectPack table Таблица описывающая набор цепочек эффектов. Ключом является тип эффекта ET_*, значением sequenceParams для данного эффекта.
---@return Нет
function WidgetSafe:PlayEffectSequencePack(effectPack) end

---Запускает эффект изменения прозрачности виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers ) Типы start / finish: number  (float) в диапазоне [ 0, 1 ] - значение непрозрачности
function WidgetSafe:PlayFadeEffect() end

---Запускает цепочку эффектов изменения прозрачности виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffectSequence( self, sequenceParams ) Типы start / finish: number  (float) в диапазоне [ 0, 1 ] - значение непрозрачности
function WidgetSafe:PlayFadeEffectSequence() end

---Запускает эффект изменения положения виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers ) Типы start / finish: table (WidgetPlacement), значимые поля posX, posY, highPosX, highPosY Замечание: Если виджет выровнен по ширине (WIDGET_ALIGN_BOTH) или имеет неявное масштабирование (WIDGET_SIZING_CHILDREN / WIDGET_SIZING_INTERNAL), то данный эффект может приводить к изменению размера виджета.
function WidgetSafe:PlayMoveEffect() end

---Запускает цепочку эффектов изменения положения виджета. Имеет  тип ET_FADE, соответствует шаблону  PlayEffectSequence( self, sequenceParams ) Типы start / finish: table (WidgetPlacement), значимые поля posX, posY, highPosX, highPosY Замечание: Если виджет выровнен по ширине (WIDGET_ALIGN_BOTH) или имеет неявное масштабирование (WIDGET_SIZING_CHILDREN / WIDGET_SIZING_INTERNAL), то данный эффект может приводить к изменению размера виджета.
function WidgetSafe:PlayMoveEffectSequence() end

---Запускает эффект изменения размера виджета. Имеет  тип ET_RESIZE, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers ) Типы start / finish: table (WidgetPlacement), значимые поля sizeX, sizeY Замечание: Используются ресурсные поля размера, если виджет выровнен по ширине (WIDGET_ALIGN_BOTH) или имеет неявное масштабирование (WIDGET_SIZING_CHILDREN / WIDGET_SIZING_INTERNAL) то данный эффект работать не будет.
function WidgetSafe:PlayResizeEffect() end

---Запускает цепочку эффектов изменения размера виджета. Имеет  тип ET_RESIZE, соответствует шаблону  PlayEffectSequence( self, sequenceParams ) Типы start / finish: table (WidgetPlacement), значимые поля sizeX, sizeY Замечание: Используются ресурсные поля размера, если виджет выровнен по ширине (WIDGET_ALIGN_BOTH) или имеет неявное масштабирование (WIDGET_SIZING_CHILDREN / WIDGET_SIZING_INTERNAL) то данный эффект работать не будет.
function WidgetSafe:PlayResizeEffectSequence() end

---Запускает эффект поворота текстур виджета. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false. Имеет  тип ET_TEXTURE_ROTATION, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers ) Типы start / finish: number (float) - угол поворота в радианах
function WidgetSafe:PlayRotationEffect() end

---Запускает цепочку эффектов поворота текстур виджета. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false. Имеет  тип ET_TEXTURE_ROTATION, соответствует шаблону  PlayEffectSequence( self, sequenceParams ) Типы start / finish: number (float) - угол поворота в радианах
function WidgetSafe:PlayRotationEffectSequence() end

---Запускает эффект поворота текстур виджета. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false. Имеет  тип ET_TEXTURE_ROTATION, соответствует шаблону  PlayEffect( self, start, finish, timeMs, algoDesc, needEvent, eventReceivers ) Работает аналогично PlayRotationEffect, но применяется не только к целевому виджету, но и рекурсивно к его детям. Типы start / finish: number (float) - угол поворота в радианах
function WidgetSafe:PlayRotationWithChildrenEffect() end

---Запускает цепочку эффектов поворота текстур виджета и его детей. Вращаются текстуры BackLayer и FrontLayer относительно центра виджета против часовой стрелки. Если текстуры выходят за пределы вписанной в виджет окружности, то для предотвращения обрезания текстур виджет должен иметь флаг clipContent = false. Имеет  тип ET_TEXTURE_ROTATION, соответствует шаблону  PlayEffectSequence( self, sequenceParams ) Работает аналогично PlayRotationEffectSequence, но применяется не только к целевому виджету, но и рекурсивно к его детям. Типы start / finish: number (float) - угол поворота в радианах
function WidgetSafe:PlayRotationWithChildrenEffectSequence() end

---Задает специальный эффект для фонового слоя виджета. Сам фоновый слой должен быть в наличии. Передаются два цвета, основной и дополнительный. Описание цвета смотреть:  Color. Замечание. Специальный эффект используется для текстуры подложки гильдийский плащей.
---@param primaryColor Color основной цвет
---@param secondaryColor Color дополнительный цвет
---@return нет
function WidgetSafe:SetBackgroundClearMaskEffect(primaryColor, secondaryColor) end

---Задает специальный эффект для переднего слоя виджета. Сам передний слой должен быть в наличии. Передаются два цвета, основной и дополнительный. Описание цвета смотреть:  Color. Замечание. Специальный эффект используется для текстуры подложки гильдийский плащей.
---@param primaryColor Color основной цвет
---@param secondaryColor Color дополнительный цвет
---@return нет
function WidgetSafe:SetForegroundClearMaskEffect(primaryColor, secondaryColor) end

---Задает цвет для переднего слоя виджета. Сам передний слой должен быть в наличии. Описание цвета смотреть:  Color.
---@param color Color новый цвет для слоя
---@return нет
function WidgetSafe:SetForegroundColor(color) end

---Задает новое расположение виджета. В качестве аргумента принимает полную или неполную таблицу WidgetPlacement.
---@param placement table таблица описывающая новое положение виджета
---@return Нет
function WidgetSafe:SetPlacementPlain(placement) end

---Задает новое расположение виджета. В качестве аргумента принимает полную или неполную таблицу WidgetPlacement. Возвращает полную таблицу WidgetPlacement с действительными значениями всех полей (неявные параметры будут вычислены).
---@param placement table таблица описывающая новое положение виджета
---@return table
function WidgetSafe:SetSmartPlacementPlain(placement) end
