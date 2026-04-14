---@meta

---@class avatarLib
avatar = {}

---@class AvatarGetTargetSalesResult
---@field id ObjectId -- идентификатор
---@field item ItemId|nil предлагаемый предмет
---@field alternativeItem ItemId|nil идентичный предмет из лавки редкостей
---@field text string текстовое сообщение
---@field tag String тип предложения
---@field endTime LuaFullDateTime дата окончания предложения
---@field amount table|nil предлагаемое количество предметов, диапазон, при значениях менее 1 пользователь сам выбирает необходимое количество
---@field min integer минимальное количество
---@field max integer максимальное количество

---@class AvatarGetAbilityInfoResult
---@field id AbilityId Id умения
---@field name WString
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field level integer уровень, начиная с которого можно изучить это умение
---@field rank integer ранг умения (начиная с 1)
---@field sysInfo string системная информация для дебага (путь к файлу)
---@field hasReplacementSpell boolean true если есть подменяющее заклинание
---@field texture TextureId идентификатор текстуры для иконки абилки

---@class AvatarGetActionInfoResult
---@field type number тип объекта в слоте
---@field id ObjectId Id объекта в слоте (например Id умения)

---@class AvatarGetActiveUsableDeviceActionInfoResult
---@field name string название действия
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field image TextureId пиктограмма действия
---@field enabled boolean доступность. Можно ли в принципе использовать это действие сейчас. false - если нельзя (например, включить скорость, находясь в ангаре, или поменять устройство, находясь не в ангаре)
---@field active boolean true, если это действие активно (это activeAction)
---@field cost integer|nil цена действия в эманациях, если они требуются
---@field isPointed boolean требует ли действие указания точки на местности, если требует, то заданы следующие параметры:
---@field radius number радиус воздействия (только для действий, требующих указания точки на местности)
---@field range number максимальная дальность применения (только для действий, требующих указания точки на местности)
---@field minRange number минимальная дальность применения (только для действий, требующих указания точки на местности)
---@field cooldown table|nil если действие может иметь кулдаун, то таблица с полями:
---@field predictedCooldown number прогнозируемое время отката если выполнить действие в данный момент. Прогноз может быть неточным из-за упрощений в механике на клиенте по сравнению с сервером.
---@field durationMs number полное время текущего кд, 0 если в данный момент действие не в кд
---@field remainingMs number оставшееся время текущего кд, 0 если в данный момент действие не в кд

---@class AvatarGetAlchemyDrumInfoResult
---@field itemId ObjectId идентификатор предмета положенного в слот из инвентаря (nil, если пока не положен)
---@field maxCorrectionsPerColumn integer максимально возможное количество доворотов барабана (см. correction); -1 - не определено
---@field position integer смещение позиции барабана после avatar.DoReaction()
---@field correction integer величина коррекции барабана относительно первичной реакции. 0 - не скорректирован.
---@field components ComponentId[] массив идентификаторов алхимических компонент (см. avatar.GetComponentInfo(id)). Пустой, пока предмет не положен в слот.

---@class AvatarGetAlchemyInfoResult
---@field id SkillId идентификатор ресурса скила
---@field recipes RecipeId[] список идентификаторов ресурсов доступных рецептов (см. avatar.GetRecipeInfo(id))
---@field correctionCount integer доступное количество коррекций для игрока на текущем score
---@field drumsCount integer доступное количество слотов для размещения ингридиентов (0, если active == false)
---@field drumSize integer количество компонент в барабане
---@field perfectBonus integer дополнительное количество результата в случае полного совпадения расположения компонент в рецепте и инструменте
---@field perComponentBonus integer количество предметов добавляемых за каждый компонент
---@field unusedRollsBonus number бонус за неиспользованные довороты при идеальном совпадении
---@field defaultResultCount integer базовое количество результирующих предметов
---@field active boolean true, если действие алхимии начато (был использован алхимический инструмент)
---@field reactionInited boolean true, если была произведена первичная алхимическая реакция (avatar.DoAlchemyReaction())
---@field finished boolean true, если коррекция и выбор строки был произведён (avatar.FinishAlchemyReaction( line )). Осталось забрать результат.

---@class AvatarGetAlchemyMatchedRecipeResult
---@field recipeId RecipeId идентификатор ресурса рецепта по которому произведется результат
---@field perfectRecipe boolean расположение компонентов такое же как в рецепте. Результат увеличен.

---@class AvatarGetBarriersInfoResult
---@field damage integer величина текущего урона в барьере
---@field remainingTimeMs integer оставшееся время до разрешения барьера

---@class AvatarGetBaseTalentInfoResult
---@field canUpdate boolean возможно ли изучить/проапдейтить данный талант
---@field isEmpty boolean является ли клетка пустой
---@field isLearned boolean выучена ли клетка таланта
---@field priorityType ENUM_PriorityType_* приоритет таланта
---@field requiredSpentTP integer необходиимое количество вложенных очков талантов для изучения данного таланта
---@field currentRank integer|nil текущий, выученный ранг таланта (индекс в списке ranks, начиная от 0), если ранг изучен
---@field nextRank integer|nil следующий для изучения ранг таланта (индекс в списке ranks, начиная от 0), если следующий ранг можно изучить
---@field replacement table|nil подменяющие талант данные
---@field text string подменяющие описание
---@field image TextureId идентификатор текстуры для иконки (это поле доступно только для UI)
---@field ranks table индексированная с 1 таблица с информацией о рангах таланта. Каждый ранг описывается таблицей:
---@field rank integer ранг (начиная с 1)
---@field name string имя
---@field desc string описание
---@field spellId SpellId / nil Id ресурса спелла (если есть, иначе nil)
---@field abilityId AbilityId / nil Id ресурса абилки (если есть, иначе nil)
---@field image TextureId идентификатор текстуры для иконки (это поле доступно только для UI)
---@field unlockInfo table информация о закрытости таланта для изучения игроком
---@field isLocked boolean true, если данный талант пока что закрыт для изучения
---@field isLockable boolean true, если данный талант может быть закрыт для изучения
---@field unlockName string|nil название возможности, необходимой для открытия таланта
---@field unlockDescription string|nil описание действия, необходимого для открытия таланта
---@field parentTalentInfo table|nil если у таланта есть родительский талант, то информация о нём в виде таблицы с полями:
---@field spellId SpellId|nil идентификатор ресурса заклинания, требуемого для изучения этого таланта
---@field abilityId AbilityId|nil идентификатор ресурса умения, требуемого для изучения этого таланта
---@field layer integer номер строки
---@field line integer номер столбца
---@field relatedSpells SpellId|nil[] список активных способностей на которые влияет данный талант, индексация с 1

---@class AvatarGetBaseTalentTableSizeResult
---@field linesCount integer количество столбцов

---@class AvatarGetBonusPoolsResult
---@field type number тип бонуса
---@field sysType string строковое представление типа бонуса
---@field total integer сколько всего бонусов имелось
---@field left integer сколько бонусов осталось

---@class AvatarGetChannelsInfoResult
---@field key number индекс канала
---@field value table таблица с информацией о канале:
---@field busyness number загруженность канала. Если больше 1 значит канал перегружен.
---@field raidMembers UniqueId|nil[] список членов отряда игрока.
---@field groupMembers UniqueId|nil[] список членов группы игрока (отсутствует если группа входит в отряд)

---@class AvatarGetClassChangerInfoResult
---@field charClassId ResourceId идентификатор ресурса CharacterClass: на какой класс меняем класс
---@field substs tables или nil[] список возможных замен для имеющихся у аватара вещей: nil если таких вещей нет, иначе список таблиц с полями:
---@field itemId ObjectId идентификатор имеющейся у аватара вещи, которая будет заменена
---@field itemSubstitutions tables[] список описаний возможных замен этой вещи (нужно будет выбрать одну из них, см. avatar.SetClassChangerInfo( changeList )): список таблиц с полями:
---@field itemSubstituteParts tables of tables[] список замен, которые могут быть выданы (все вместе) взамен имеющейся у аватара вещи (как правило одна вещь, но возможна замена двуручной вещи на пару право/леворучных) или отобраны вместе с ней (например в случае замены пары право/леворучных вещей на двуручную); каждый элемент списка является таблицей-списком, из которого нужно выбрать одну замену; каждый элемент такой вложенной таблицы-списка является таблицей с полями:
---@field substItemId ObjectId идентификатор вещи, которая будет выдана; если выбирается именно эта замена, то этот идентификатор впоследствии должен быть передан в avatar.SetClassChangerInfo( changeList ) как один из элементов списка changeList
---@field isRemoved boolean если false, то такая вещь будет выдана аватару при замене; если true, то эта вещь будет отобрана у аватара
---@field enchantsSubstitutions tables[] список замен самоцветов (для всех самоцветов, вставленных в заменяемую вещь и подлежащих замене): список таблиц с полями:
---@field sourceEnchantItemId ObjectId идентификатор самоцвета, который будет заменён
---@field oneOfEnchantSubstitution ObjectId[] список id самоцветов, один из которых надо выбрать на замену (см. avatar.SetClassChangerInfo( changeList ))

---@class AvatarGetCommonFieldTalentInfoResult
---@field name string локализованное название поля
---@field image UISingleTexture иконка

---@class AvatarGetComponentInfoResult
---@field id ComponentPropertyId Id ресурса компонента
---@field name string название
---@field description string описание
---@field image TextureId идентификатор текстуры для иконки компонента

---@class AvatarGetContextActionCooldownResult
---@field durationMs integer длительность кулдауна в миллисекундах
---@field remainingMs integer сколько осталось кулдауна в миллисекундах

---@class AvatarGetContextActionInfoResult
---@field id ObjectId идентификатор контекстного действия
---@field priority integer приоритет действия
---@field name string название
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field image TextureId идентификатор текстуры для иконки
---@field enabled boolean true, если действие доступно
---@field sysType string название типа контекстного действия
---@field objectId ObjectId|nil идентификатор объекта, если он есть, к которому применяется контекстное действие
---@field spellId SpellId|nil идентификатор ресурса заклинания, которое запустится при использовании этого действия
---@field itemId ObjectId|nil идентификатор предмета, который будет использован
---@field cooldown table|nil информация о кулдауне, если доступна. Таблица с полями:
---@field durationMs integer длительность кулдауна в миллисекундах
---@field remainingMs integer сколько осталось кулдауна в миллисекундах
---@field pointInfo table|nil если это контекстное действие требует точку установки, то таблица с полями:
---@field range number максимальное растояние до цели, на котором действует (0, если не указано)
---@field minRange number минимальное растояние до цели, на котором действует (0, если не указано)
---@field radius number радиус действия AOE от точки применения (0, если не указано)
---@field sysNameAEMark string|nil для АЕ спеллов имя текстуры AEMark, которую нужно визуализировать (nil, если не указана)

---@class AvatarGetContextActionShortInfoResult
---@field image TextureId идентификатор текстуры для иконки
---@field enabled boolean true, если действие доступно
---@field sysType string название типа контекстного действия
---@field objectId ObjectId|nil идентификатор объекта, если он есть, к которому применяется контекстное действие
---@field cooldown table|nil информация о кулдауне, если доступна. Таблица с полями:
---@field durationMs integer длительность кулдауна в миллисекундах
---@field remainingMs integer сколько осталось кулдауна в миллисекундах

---@class AvatarGetCurrencyValueResult
---@field value integer количество такой валюты у игрока
---@field maxValue integer|nil максимально возможное количество такой валюты у игрока, если такая величина задана

---@class AvatarGetDestinyPointsResult
---@field total integer накопленные Очки Судьбы персонажа
---@field bonus integer бонусный пул Очков Судьбы

---@class AvatarGetEmoteInfoResult
---@field id ObjectId идентификатор объекта эмоции
---@field canRun boolean можно ли проиграть эмоцию сейчас
---@field hasMood boolean true, если эмоция меняет настроение игрока
---@field name string название эмоции
---@field description string описание эмоции
---@field aliases string[] слэш-команды для активации эмоции через чат (индексация с 1)
---@field sysName string системное название эмоции, совпадающее с идентификатором эмоции при запуске через чат
---@field textTarget string локализованный текст для случая, когда эмоция на кого-то направлена
---@field textNoTarget string локализованный текст для случая, когда эмоция ни на кого не направлена
---@field image TextureId|nil идентификатор текстуры для иконки эмоции
---@field image2 TextureId|nil идентификатор текстуры для второй иконки эмоции

---@class AvatarGetExperienceResult
---@field currentExp integer текущий опыт персонажа
---@field currentLevelExp integer опыт для получения текущего уровня персонажа
---@field nextLevelExp integer опыт для получения следующего уровня персонажа
---@field extraExp integer накопленный бонусный опыт, который может быть переведен в текущий(currentExp) при помощи "Фолианта знаний"
---@field extraExpCap integer максимально возможное значение накопленного бонусного опыта(extraExp)
---@field bonus number множитель получаемого опыта (1.0 - опыт по умолчанию)
---@field pvpExp integer опыт полученный за убийства других игроков

---@class AvatarGetFairyMechanicsInfoResult
---@field description string кастомное описание механики покровителей. Может быть пустым
---@field groups table[] индексированный с 0 список описаний групп заклинаний, на которые влияет покровитель. Каждая группа представлена таблицей с полями:
---@field spells SpellId[] индексированный с 0 список идентификаторов ресурсов заклинаний группы
---@field entries table[] индексированный с 0 список описаний влияния покровителя на заклинания этой группы. Каждое описание представлено таблицей с полями:
---@field fairyRank integer уровень покровительства
---@field immunityTimeMs integer время, на которое игрок имунен
---@field durationMod number модификатор длительности

---@class AvatarGetFieldTalentTableSizeResult
---@field rowsCount integer количество строк
---@field columnsCount integer количество столбцов

---@class AvatarGetGearScoreInfoResult
---@field currentValue number текущее значение рейтинга
---@field levelsPass number[] уровни рейтинга, таблица индексируемая с 1; пороговое значение рейтинга при достижении которого аватар получит пропуск в следующий сектор
---@field levelsRecipe number[] уровни рейтинга, таблица индексируемая с 1; пороговое значение рейтинга при достижении которого аватару откроются новые рецепты

---@class AvatarGetGlobalCooldownResult
---@field duration int64 полная длительность текущего ГКД в миллисекундах, если нет текущего - прогнозируемая следующего
---@field remaining int64 оставшееся время текущего ГКД в миллисекундах, если нет текущего - 0

---@class AvatarGetGlobalRatesResult
---@field isCustom boolean определяет имеется ли у рейта кастомное описание
---@field type number|nil тип рейта; nil если isCustom == true
---@field sysType string|nil строковое представление типа рейта; nil если isCustom == true
---@field title string|nil заголовок рейта; nil если isCustom == false
---@field description string|nil описание рейта; nil если isCustom == false
---@field value number значение рейта
---@field remainingMs number количество времени (в миллисекундах), оставшееся до окончания действия рейта; nil если время окончания неизвестно

---@class AvatarGetHealthRegenResult
---@field base integer базовое значение регена за тик
---@field talents integer величина регена за тик от талантов
---@field equipment integer величина регена за тик от надетых на игрока предметов
---@field buffs integer величина регена за тик от активных буфов
---@field effective integer эффективное (текущее) значение регена за тик
---@field tickMs integer длительность тка в миллисекундах

---@class AvatarGetHearthStoneLocatorResult
---@field zone string имя зоны
---@field locator string имя локатора
---@field locationId ObjectId идентификатор точки телепортации (для использования при вызове avatar.UseHearthStoneToLocation( locationId ))

---@class AvatarGetInnateStatsResult
---@field sysName string текстовый вариант перечисления
---@field base number базовое значение характеристики
---@field effective number эффективное (текущее) значение
---@field talents number величина изменения от талантов
---@field equipment number величина изменения от надетых на игрока предметов
---@field enchants number величина изменения от энчантов, вставленных в надетые на игрока предметы
---@field isCursed boolean на характеристику влияет проклятый предмет
---@field buffs number величина изменения от активных буфов
---@field fairyBonus number бонус от покровителя
---@field secondary table таблица с описанием вторичных характеристик, рассчитаных на основе текущей. Поля:
---@field current table на основе текущего значения
---@field next table на основе следующего, увеличенного на 1 от текущего эффективного значения.

---@class AvatarGetInspectInfoResult
---@field rank integer|nil ранг умения игрока подсматривать чужие вещи, если оно у него есть
---@field playerId ObjectId|nil идентификатор инспектируемого игрока
---@field mountId ObjectId|nil идентификатор маунта инспектируемого игрока

---@class AvatarGetInteractorCueResult
---@field name string имя реплики (или ответ на неё)
---@field text string текст реплики
---@field data CueData- индексированный с 0 список дополнительных даных[]
---@field isSpecial boolean является ли эта реплика не просто репликой в разговоре, но и началом какого-то действия (показать ремортов, войти в парикмахерскую и т.п.)
---@field alias string|nil псевдоним этого элемента данных. Может использоваться, например, для подстановки этого элемента данных в форматную строку, заданную в поле name этой реплики
---@field image TextureId|nil идентификатор текстуры для иконки реплики, если есть
---@field titlePicture TextureId|nil идентификатор текстуры для титульной картинки в тексте реплики, если есть
---@field money number|nil количество денег, требуемых для ответа
---@field number number|nil какое-то число, требуемое для ответа
---@field itemId ObjectId|nil идентификатор предмета, требуемого для ответа
---@field string string|nil какой-то текст, требуемое для ответа

---@class AvatarGetLootBagSlotsResult
---@field items ObjectIds[] список идентификаторов вещей в сумке, индексируется [0..avatar.GetLootBagSlotCount() - 1], элементы типа ObjectId, могут быть nil

---@class AvatarGetManaRegenResult
---@field base integer базовое значение регена за тик
---@field talents integer величина регена за тик от талантов
---@field equipment integer величина регена за тик от надетых на игрока предметов
---@field buffs integer величина регена за тик от активных буфов
---@field effective integer эффективное (текущее) значение регена за тик
---@field tickMs integer длительность тка в миллисекундах

---@class AvatarGetMapInstanceKickResult
---@field durationMs integer общее время на выброс из инстанса в миллисекундах
---@field remainingMs integer сколько времени осталось до выброса в миллисекундах
---@field sysCause string причина выброса

---@class AvatarGetMetaUpgradeResultsResult
---@field canUpgrade boolean true, если есть возможность улучшить при таком сочетании параметров; false если возможности улучшить предмет нет
---@field upgradeChance nil|number шанс моментального/двойного улучшения в промежутке [0, 1]; если возможности улучшить нет, то nil
---@field upgradeChanceBehavior nil|number поведение при срабатывании шанса моментального/двойного улучшения
---@field sysUpgradeChanceBehavior nil|string поведение при срабатывании шанса моментального/двойного улучшения
---@field sysUpgradeVector int что улучшается при срабатывании шанса моментального/двойного улучшения: качество или уровень
---@field improvement nil|number какая степень улучшения будет у результата после операции в промежутке [0, 99]; если возможности улучшить нет, то nil
---@field maxImprovement nil|number наибольшая возможная степень улучшения (при бесконечном значении agentCount) в промежутке [0, 100], предполагается что если improvement равен maxImprovement, то увеличивать agentCount бессмысленно (см. также поле isSingleUpgradeAgent у avatar.GetItemMetaInfo( itemId )); если возможности улучшить нет, то nil
---@field resultId ObjectId Id предмета, который получится, если мета-апгрейд предполагает замену предмета при склейке (sysUpgradeVector == "META_UPGRADE_ITEM")

---@class AvatarGetMoveToPointStateResult
---@field isMoving boolean находится ли персонаж в режиме движения в точку, для режима движения в точку доступны дополнительные поля:
---@field position таблица с координатами целевой точки, поля:
---@field posX number
---@field posY number
---@field posZ number

---@class AvatarGetNecromancerBloodPoolResult
---@field minValue number
---@field maxValue number

---@class AvatarGetNextLevelUnlockInfoResult
---@field unlockName string название возможности
---@field unlockDescription string описание, что делать для получения возможности

---@class AvatarGetProficiencyInfoResult
---@field id ObjectId Id профессии
---@field name WString
---@field description WString
---@field sysInfo string системная информация для дебага (путь к файлу)
---@field image TextureId идентификатор текстуры для иконки

---@class AvatarGetQuestInfoResult
---@field id QuestId идентификатор ресурса задания.
---@field name ValuedText|nil название задания
---@field sysName string внутреннее уникальное имя квеста
---@field debugName string|nil отладочное имя квеста (имя файла) или nil. Для отладочной версии
---@field level integer уровень квеста
---@field isHideLevel boolean если true, то не нужно показывать уровень квеста в интерфейсе
---@field requiredLevel integer необходимый уровень главного игрока для взятия квеста
---@field goal ValuedText|nil цель задания
---@field startText ValuedText|nil текст при выдаче задания
---@field checkText ValuedText|nil текст при проверке готово ли к сдаче задание
---@field finishText ValuedText|nil текст при завершение задания
---@field kickText ValuedText|nil текст при провале задания
---@field plotLine string имя квестовой цепочки (нелокализованная строка для внутреннего употребления)
---@field shared boolean можно ли поделиться данным заданием с другими игроками (не автоматически, а именно самому)
---@field canCancel boolean true, если задание можно отменить
---@field canBeSkipped boolean true, если задание можно пропустить(мгновенно закомплитить за Очки Судьбы)
---@field type number тип квеста
---@field isAutomatic boolean true, если задание берется и сдаётся автоматически(без разговора с неписем, дейлик)
---@field isForInstance boolean true, если для инстанса
---@field isPvP boolean true, если задание даётся для PvP
---@field isInSecretSequence boolean true, если задание входит в какую-либо линейку заданий, открывающих тайны мира
---@field isTutorial boolean true, если задание предназначено для обучения
---@field isItemMall boolean true, если задание предназначено для обучения каким-либо особенностям Лавки Редкостей
---@field isLowPriority boolean true, если задание является второстепенным
---@field isNextQuestFinder boolean true, если задание автоматически сгенерировано для помощи в поиске следующего задания
---@field uiPriority integer приоритет для сортировки квестов в аддоне NPCTalk (соответствующее поле в базе - "uiPriority")
---@field isRepeatable boolean true, если задание можно выполнить повторно через некоторое время
---@field canRepeat boolean true, если повторно выполняемое задание можно выполнить ещё раз сейчас
---@field repeatPeriod integer период в днях, через который можно выполнять повторно выполняемые задания. 0, если можно повторно выполнять сразу или вообще нельзя повторно выполнять (см. isRepeatable)
---@field isSecret boolean true, если это главное задание тайны мира
---@field zoneName string имя зоны, которой принадлежит квест
---@field zonesMapId ObjectId|nil идентификатор интерфейсной карты задания (если не произошло ошибки)
---@field returnLocation QuestLocation|nil если задана, то точка сдачи квеста. Описанние см. ниже.

---@class AvatarGetQuestRewardResult
---@field money integer сумма в награду
---@field experience integer опыт в награду
---@field loyalty integer получаемая верность гильдии
---@field authority integer получаемое влияние в гильдии
---@field mandatoryItems ObjectId[] список идентификаторов наградных предметов. которые известны
---@field mandatoryItemsCount integer количество наградных предметов (может быть больше, чем mandatoryItems, если некоторые награды не известны)
---@field alternativeItems ObjectId[] список идентификаторов альтернативных наградных предметов
---@field reputations table[] индексированный с 0 список значений репутационных наград для разных фракций. Поля каждого пункта:
---@field faction string имя фракции
---@field value integer на сколько повысится репутация
---@field currencies table[] индексированный с 0 список наград альтернативной валютой. Поля каждого пункта:
---@field currencyId СurrencyId имя альтернативной валюты
---@field value integer величина награды
---@field unlocks UnlockId[] индексированный с 1 список идентификаторов возможностей (анлоков), даваемых в награду

---@class AvatarGetQuestShareInvitationsResult
---@field shareId ObjectId уникальный идентификатор приглашения
---@field questId QuestId идентификатор задания
---@field sharerName string имя игрока, который делится заданием

---@class AvatarGetRecipeInfoResult
---@field id RecipeId Id ресурса рецепта
---@field name string название
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field skillId SkillId|nil идентификатор ресурса скила, которому принадлежит рецепт (если скилл выучен игроком)
---@field score integer необходимый уровень (score) умения для изучения
---@field image TextureId идентификатор текстуры для иконки рецепта
---@field components ObjectId|ResourceId[] массив компонент рецепта (см. ниже)
---@field resultQuantity integer количество предметов, получаемых из рецепта по умолчанию
---@field defaultItem ObjectId|nil идентификатор предмета, получаемый из рецепта по умолчанию
---@field nextRecipe UnlockId|nil идентификатор анлока следующего ресурса (если ещё не выполнен)
---@field nextRecipeId RecipeId|nil следующий рецепт
---@field nextRecipePoints integer Сколько надо просветления для анлока следующего рецепта
---@field qualificationPoints CurrencyId Id альтернативной ценности
---@field resultItems ObjectId[] индексированный с 0 массив идентификаторов предметов, создаваемых по рецепту (отсортированы по качеству от менее качественного (0) до более качественного)
---@field bindResult boolean будет ли результат привязан к аватару

---@class AvatarGetRecommendedStatsResult
---@field commonGoldStats table|nil список обще рекомендованных хар-к золотого тира
---@field resourceId SpecialStatId ресурс характеристики
---@field innateType ENUM_InnateStats_...|nil тип характеристики (только для InnateStats)
---@field commonSilverStats table|nil список обще рекомендованных хар-к серебряного тира
---@field slots table|nil таблица рекомендованных хар-к для конкретных слотов экипировки, ключом является enum DRESS_SLOT, каждая ячейка содержит поля
---@field goldStats table|nil список хар-к золотого тира
---@field silverStats table|nil список хар-к серебряного тира

---@class AvatarGetReputationInfoResult
---@field factionId FactionId фракция
---@field rep integer текущее значение репутации
---@field level number текущий уровень репутации
---@field nextLevel number следующий либо максимальный уровень репутации
---@field repCurrLevel number значение репутации для получения текущего уровня репутации (если есть, иначе nil)
---@field repNextLevel number значение репутации для получения следующего уровня репутации (если есть, иначе nil)

---@class AvatarGetReputationsListResult
---@field key number индекс репутации в списке
---@field value table таблица с информацией о репутации:
---@field factionId FactionId фракция
---@field rep integer текущее значение репутации
---@field level number текущий уровень репутации
---@field nextLevel number следующий либо максимальный уровень репутации
---@field repCurrLevel number значение репутации для получения текущего уровня репутации (если есть, иначе nil)
---@field repNextLevel number значение репутации для получения следующего уровня репутации (если есть, иначе nil)

---@class AvatarGetSecondhandListResult
---@field id ObjectId Id объекта
---@field quantity integer количество предметов, имеющихся у торговца. Если -1, то количество не ограничено.
---@field counter number
---@field isBound boolean прибинтенность итема
---@field isSecondhand boolean товар с вторичного рынка
---@field price number
---@field requiredUnlocks UnlockId|nil[] требуемые анлоки для покупки, индексация с 1
---@field requiredAchievements table|nil требуемые очки событий для покупки, индексация с 1, каждый элемент таблица с полями
---@field ruleId RuleId идентификатор события
---@field achievement integer требуемое количество очков события
---@field alternativePrices table или nil nil если нет информации; иначе список (индексируется от 0) цен в альтернативных валютах, элемент списка - таблица с полями:
---@field currencyId CurrencyId идентификатор альтернативной валюты (получение информации об альтернативной валюте по CurrencyId - см. avatar.GetCurrencyInfo(currencyId))
---@field value integer цена в этой альтернативной валюте

---@class AvatarGetSecretComponentsResult
---@field opened boolean компонент открыт (взят начальный квест)
---@field closed boolean компонент закрыт (сдан завершающий квест)
---@field text string|nil текст компоненты, если она раскрыта
---@field level num уровень персонажа, с которого компонент будет доступен для выполенния
---@field index num порядковый номер компоненты (начиная с нуля)

---@class AvatarGetSecretInfoResult
---@field id ObjectId идентификатор тайны мира
---@field questId QuestId идентификатор ресурса главного задания тайны мира
---@field closed boolean true, если все компоненты завершены
---@field finished boolean true, если тайна мира была завершена и получена главная награда
---@field level num уровень персонажа с которого доступна тайна мира
---@field image TextureId идентификатор изображения книги тайны мира

---@class AvatarGetSkillInfoResult
---@field id SkillId Id ресурса умения
---@field score integer|nil уровень скилла. nil, если скилл не изучен игроком
---@field exp integer|nil накопленный опыт текущего уровня скилла в процентах. nil, если скилл не изучен игроком или скилл прокачивается плавно

---@class AvatarGetSpecialStatsResult
---@field id SpecialStatId идентификатор стата
---@field name string название характеристики
---@field tooltipName string тултипное название характеристики
---@field sysName string служебное название характеристики
---@field base number базовое значение характеристики
---@field effective number эффективное (текущее) значение
---@field talents number величина изменения от талантов
---@field equipment number величина изменения от надетых на игрока предметов
---@field enchants number величина изменения от энчантов, вставленных в надетые на игрока предметы
---@field isCursed boolean на характеристику влияет проклятый предмет
---@field buffs number величина изменения от активных буфов
---@field fairyBonus number бонус от покровителя type: Number( ENUM_SpecialStatType ) - класс характеристики
---@field description ValuedText|nil описание с подставленными текущими значениями параметров

---@class AvatarGetStalkerDamagePoolInfoResult
---@field damage number текущее значение дамага в i-том барьере
---@field resolveTime number время в миллисекундах, оставшееся до исчезновения этого i-го барьера
---@field internalId integer внутренний уникальный идентификатор этого i-го барьера

---@class AvatarGetStatsBonusesPartResult
---@field isBonusesEmpty boolean не используется
---@field fairyBonus table|nil информация о бонусе от покровителя; таблица с полями:
---@field statPointsCount integer величина бонуса
---@field currentStat integer индекс характеристики из таблицы allowedStats, к которой даётся бонус
---@field stats - список характеристик, индексированный [1..], каждый элемент таблица с полями:
---@field id SpecialStatId идентификатор стата
---@field isAllowed boolean true, если стат доступен для выбора
---@field name string название характеристики
---@field tooltipName string тултипное название характеристики
---@field sysName string служебное название характеристики
---@field base number базовое значение характеристики
---@field effective number эффективное (текущее) значение
---@field talents number величина изменения от талантов
---@field equipment number величина изменения от надетых на игрока предметов
---@field enchants number величина изменения от энчантов, вставленных в надетые на игрока предметы
---@field isCursed boolean на характеристику влияет проклятый предмет
---@field buffs number величина изменения от активных буфов
---@field fairyBonus number бонус от покровителя
---@field description ValuedText|nil описание с подставленными текущими значениями параметров

---@class AvatarGetTeleportLocationInfoResult
---@field id ObjectId идентификатор точки
---@field name string название точки
---@field isHighPriority boolean эта точка должна показываться перед остальными точками телепортации
---@field minLevel integer минимальный комфортный уровень игры (0, если карта не прописана)
---@field maxLevel integer максимальный комфортный уровень игры (0, если карта не прописана)

---@class AvatarGetUnlockInfoResult
---@field id ObjectId|nil идентификатор возможности
---@field unlockId UnlockId|nil идентификатор ресурса возможности
---@field name string название возможности
---@field description string описание, что делать для получения возможности
---@field sourceDescription GlossaryId|nil идентификатор ресурса универсального описателя для источника анлока (при наличии)
---@field sysName string внутреннее имя анлока (может быть использовано для специальной обработки), соответствующее поле в базе для анлока - "sysUIScriptName"
---@field sysDebugName string или nil внутреннее дебажное имя ресурса анлока
---@field image TextureId идентификатор текстуры для иконки возможности
---@field isBoundToRemort boolean true, если эта взможность будет доступна и у Перерождения (реморта)
---@field endTime LuaFullDateTime|nil дата окончания действия анлока, если анлок временный, иначе nil
---@field category table|nil если возможность принадлежит какой-либо категории, то таблица с полями
---@field name string название категории
---@field sysName string системное название категории, предназначенное для реализации каких-либо уникальных свойств категории
---@field categoryId UnlockCategoryId идентификатор категории анлока

---@class AvatarGetUsableDeviceInfoResult
---@field id ObjectId Id объекта устройства
---@field name string название устройства
---@field hasCrosshair boolean true, если надо показывать прицел при использовании этого устройства
---@field activeAction integer|nil индекс активного действия из actions, если есть
---@field actions таблица с действиями, которые может исполнять устройство, индексация [0..], значения таблица с полями:
---@field name string название действия
---@field description ValuedText|nil описание с подставленными текущими значениями параметров
---@field image TextureId пиктограмма действия
---@field enabled boolean доступность. Можно ли в принципе использовать это действие сейчас. false - если нельзя (например, включить скорость, находясь в ангаре, или поменять устройство, находясь не в ангаре)
---@field active boolean true, если это действие активно (это activeAction)
---@field cost integer|nil цена действия в эманациях, если они требуются
---@field isPointed boolean требует ли действие указания точки на местности, если требует, то заданы следующие параметры:
---@field radius number радиус воздействия (только для действий, требующих указания точки на местности)
---@field range number максимальная дальность применения (только для действий, требующих указания точки на местности)
---@field minRange number минимальная дальность применения (только для действий, требующих указания точки на местности)
---@field cooldown table|nil если действие может иметь кулдаун, то таблица с полями:
---@field predictedCooldown number прогнозируемое время отката если выполнить действие в данный момент. Прогноз может быть неточным из-за упрощений в механике на клиенте по сравнению с сервером.
---@field durationMs number полное время текущего кд, 0 если в данный момент действие не в кд
---@field remainingMs number оставшееся время текущего кд, 0 если в данный момент действие не в кд

---@class AvatarGetVariableInfoResult
---@field id VariableId Id валюты
---@field sysName string внутриигровой псевдоним переменной
---@field name string название переменной
---@field sysDebugName string дебажный путь к ресурсу переменной
---@field value number значение переменной
---@field minValue number минимальное значение переменной
---@field maxValue number максимальное значение переменной
---@field hasRelatedSpell boolean переменная влияет на какие-то заклинания игрока (требуется для них)

---@class AvatarGetVendorBuybackResult
---@field id ObjectId Id объекта
---@field quantity integer количество предметов, имеющихся у торговца. Если -1, то количество не ограничено.
---@field price number
---@field counter number
---@field isBound boolean прибинтенность итема

---@class AvatarGetVendorListResult
---@field id ObjectId Id объекта
---@field quantity integer количество предметов, имеющихся у торговца. Если -1, то количество не ограничено.
---@field counter number
---@field isBound boolean прибинтенность итема
---@field isSecondhand boolean товар с вторичного рынка
---@field price number
---@field requiredUnlocks UnlockId|nil[] требуемые анлоки для покупки, индексация с 1
---@field requiredAchievements table|nil требуемые очки событий для покупки, индексация с 1, каждый элемент таблица с полями
---@field ruleId RuleId идентификатор события
---@field achievement integer требуемое количество очков события
---@field alternativePrices table или nil nil если нет информации; иначе список (индексируется от 0) цен в альтернативных валютах, элемент списка - таблица с полями:
---@field currencyId CurrencyId идентификатор альтернативной валюты (получение информации об альтернативной валюте по CurrencyId - см. avatar.GetCurrencyInfo(currencyId))
---@field value integer цена в этой альтернативной валюте

---@class AvatarGetWarriorDamagePoolInfoResult
---@field value number текущее значение дамага в барьере
---@field limit number лимит дамага в барьере

---@class AvatarInventoryGetPocketInfoResult
---@field firstIndex integer первый индекс слота кармана в общем массиве слотов инвентаря
---@field size integer размер кармана
---@field name string название категории
---@field description string описание категории
---@field image string текстура иконки кармана

---@class AvatarGetCraftInfoResult
---@field craftingSkillIds SkillId[] УСТАРЕЛО! индексированный с 0 список идентификаторов ресурсов скиллов крафтинга, для которых используется предмет (или nil, если в крафтинге не участвует). Получить описание - craftingSkillId:GetInfo()
---@field craftingSkillsInfo table of[]
---@field skillId SkillId идентификатор ресурса скилла крафтинга, для которого используется предмет
---@field isLearned boolean выучен ли скилл
---@field minLevel integer|nil минимальный уровень рецепта, для которого нужен этот компонент
---@field maxLevel integer|nil максимальный уровень рецепта, для которого нужен этот компонент
---@field craftingComponents ComponentPropertyId[] таблица (начиная с 0) Id ресурсов компонент крафтинга, если предмет участвует в крафтинге (в данный момент только для алхимии). Может не иметь компонент, если крафтинг их не использует (например armorCraft). Описание - avatar.GetComponentInfo( componentId )
---@field foragingInfo table|nil информация об инструменте или предмете фуражирования
---@field isInstrument boolean это инструмент фуражирования
---@field skills SkillId[] индексированный с 0 список идентификаторов ресурса скила, который использует этот инструмент
---@field disassemblerInfo table / nil информация об инструменте для дизассемблинга, если предмет таковым является (иначе nil)
---@field slots table список слотов одежды, которые можно разломать данным предметом
---@field classes table список названий классов предметов, которые можно разломать данным предметом
---@field isAlchemyJoker boolean|nil true, если является джокером для алхимии

---Возвращает информацию о доступных в данный момент таргетных продажах.
---@return AvatarGetTargetSalesResult
function avatar.GetTargetSales() end

---Отклоняет предложение таргетной продажи.
---@param saleId ObjectId -- идентификатор
---@return нет
function avatar.RejectTargetSale(saleId) end

---Попытка получить задание у NPC, который является текущей целью аватара. *Нельзя получить задание у NPC, не являющегося текущей целью. Вызывать можно только после  FunctionAvatarRequestInteractions*
---@param questId QuestId -- идентификатор задания
---@return нет
function avatar.AcceptQuest(questId) end

---Согласие принять разделяемое задание от другого игрока.
---@param shareId ObjectId уникальный идентификатор предложения
---@return нет
function avatar.AcceptShareQuest(shareId) end

---Активировать предмет. Неактивированные предметы могут появляться в результате крафта, и их надо активирвать специальными активаторами. См.  itemLib.GetActivationInfo( itemId ).
---@param itemId ObjectId идентификатор предмета
---@param instrumentId Object идентификатор инструмента-активатора
---@return нет
function avatar.ActivateItem(itemId, instrumentId) end

---Активировать предмет. Неактивированые предметы могут появляться в результате крафта и их надо активировать, что требует наличия определённых альтернативных валют.
---@param itemId ObjectId идентификатор предмета
---@return нет
function avatar.ActivateItemAlternative(itemId) end

---Выучить помеченные таланты и вехи.
---@return нет
function avatar.ApplyStoredTalents() end

---Попытка переместить несколько предметов, лежащих в контейнере, в начало контейнера в заданном порядке.
---@param moves массив number (int, индексируется от 0) индексом является номер слота В который надо поместить итем, а значением - номер слота (считая с начала кармана) ИЗ которого надо переместить итем.
---@param compact boolean производить ли компактинг стекающихся итемов и пустых слотов
---@param container number в каком контейнере переставляем предметы. Допустимые контейнеры: сумка, банковская ячейка. В банковской ячейке нельзя переставлять предметы, если она не открыта.
---@param pocket integer|nil карман. Базовый карман имеет индекс -1, остальные считаются с нуля. Значение по умолчанию -1.
---@return нет
function avatar.ArrangeContainerItems(moves, compact, container, pocket) end

---Привязывает запуск эмоции главного игрока к слоту экшен панели.
---@param emoteId ObjectId Id эмоции, привязываемой к слоту
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.BindEmoteToActionPanel(emoteId, index) end

---Привязывает предмет к слоту экшен панели. Предмет может быть:
---@param itemId ObjectId Id предмета, привязываемого к слоту
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.BindItemToActionPanel(itemId, index) end

---Привязывает вызов маунта-метаморфа из конюшни главного игрока к слоту экшен панели.
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.BindMountMetamorphToActionPanel(index) end

---Привязывает вызов маунта с определенным скином из конюшни главного игрока к слоту экшен панели.
---@param skinId ObjectId Id скина маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.BindMountSkinToActionPanel(skinId, index) end

---Привязывает вызов маунта из конюшни главного игрока к слоту экшен панели.
---@param mountId ObjectId Id маунта из конюшни, привязываемого к слоту
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.BindMountToActionPanel(mountId, index) end

---Привязывает умение из книги умений к слоту экшен панели. При получении новых умений той же цепочки, но больших уровней, если новый уровень вытесняет старый уровень умения, все привязки старых умений в панели заменяются на новые. Если умение нового уровня добавляется к старым умениям без вытеснения, то заменяется привязка к первому слоту умения наибольшего имеющегося в панели уровня. Кроме того, имеется механизм автоматической привязки умений. Если у ресурса умения прописано поле DefaultAction, то, при получении этого умения '''первого''' уровня, оно автоматически привяжется к заданному слоту, если он пуст. Состояние панели сразу сохраняется в Personal/user.cfg. При входе в игру состояние панели восстанавливается. Восстановление можно отключить используя глобальную переменную [:DebugGame#head-0b2a7b310dbb423db644652c70a9638e03d13671:load_action_panel]. В этом случае умения привяжутся на панели автоматически (будут привязаны все умения, а не только первых уровней). Ограничения. Сторонним аддонам запрещено использовать данную функцию пока персонаж игрока находится в бою.
---@param spellId SpellId Id умения, привязываемого к слоту
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.BindSpellToActionPanel(spellId, index) end

---Попытаться купить вещь у NPC-торговца.
---@param objectId ObjectId Id предмета для покупки
---@param quantity integer количество предметов для покупки
---@return нет
function avatar.Buy(objectId, quantity) end

---Попытаться купить вещь у NPC-торговца и поместить в определённый слот инвентаря.
---@param objectId ObjectId Id предмета для покупки
---@param quantity integer количество предметов для покупки
---@param slot integer номер слота инвентаря
---@return нет
function avatar.BuyToSlot(objectId, quantity, slot) end

---Высчитывает и возвращает текущий рейтинг экипировки аватара
---@return currentValue: number
function avatar.CalcCurrentGearScore() end

---Попытаться преждевременно вызвать искру главного игрока, находящегося на кладбище. Вызов искры оплачивается мирро. Если требуемого количества не обнаружится, то прийдёт EVENT_CALL_SPARK_FAILED.
---@return нет
function avatar.CallSpark() end

---Показывает, можно ли активировать данный предмет данным активатором. Неактивированные предметы могут появляться в результате крафта, и их надо активирвать специальными активаторами. См.  itemLib.GetActivationInfo( itemId ).
---@param itemId ObjectId идентификатор предмета
---@param instrumentId Object идентификатор инструмента-активатора
---@return нет
function avatar.CanActivateItem(itemId, instrumentId) end

---Показывает, можно ли активировать данный предмет, потратив данную альтернативную валюту. Не проверяет нехватку валюты - это бессмысленно, поскольку при нехватке для активации может быть одновременно использовано несколько альтернативных валют из списка  itemLib.GetActivatorsAlternative( itemId ). Неактивированные предметы могут появляться в результате крафта, и их надо активировать, затрачивая соответствующую альтернативную валюту в соответствующем количестве. См.  itemLib.GetActivationInfo( itemId ).
---@param itemId ObjectId идентификатор предмета
---@param currrencyId CurrencyId идентификатор альтернативной валюты
---@return нет
function avatar.CanActivateItemAlternative(itemId, currrencyId) end

---Отменить текущее алхимическое действо. После этого прийдёт EVENT_ALCHEMY_CANCELED.
---@return нет
function avatar.CancelAlchemy() end

---Отсылает на сервер отказ от продолжения процесса смены класса (работает на стадии выбора замен для предметов, см.  avatar.GetClassChangerInfo()).
---@return нет
function avatar.CancelClassChanger() end

---Есть ли возможность разломать указанный предмет указанным инструментом. См.  ITEM_CONT_....
---@param instrumentId ObjectId идентификатор инструмента для дизассемблинга в контейнере
---@param itemId integer идентификатор разламываемого предмета в контейнере
---@return boolean
function avatar.CanDisassembleItem(instrumentId, itemId) end

---Показывает, можно ли распределять свободные пункты характеристик. При изменении этого состояния приходит событие EVENT_AVATAR_STATS_CAN_IMPROVE_CHANGED.
---@return boolean
function avatar.CanImproveInnateStats() end

---Можно ли проапдейтить (или выучить) талант из базовой таблицы талантов.
---@param layer integer номер строки
---@param line integer номер столбца
---@return boolean
function avatar.CanUpdateBaseTalent(layer, line) end

---Можно ли проапдейтить (или выучить) талант из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return boolean
function avatar.CanUpdateFieldTalent(field, row, column) end

---Привязывает бонус от покровителя к заданной характеристике (должна присутствовать в списке характеристик, к которым в данный момент можно привязать бонус, см  avatar.GetStatsBonusesPart(), поле fairyBonus.allowedStats).
---@param stat integer индекс характеристики из таблицы fairyBonus.allowedStats
---@return нет
function avatar.ChangeFairyBonus(stat) end

---Проверка, можно ли использовать предмет в контейнере игрока.
---@param itemId ObjectId идентификатор предмета
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function avatar.CheckCanUseItem(itemId, isSendEvent) end

---Проверка, можно ли использовать предмет в контейнере игрока на точку на ландшафте. См. также  GamePosition.
---@param itemId ObjectId идентификатор предмета
---@param position таблица GamePosition, точка на ландшафте
---@param isSendEvent boolean если true, то выводит сообщение о провале
---@return boolean
function avatar.CheckCanUseItemOnPoint(itemId, position, isSendEvent) end

---Сбрасывает эмоцию у главного игрока.
---@return нет
function avatar.ClearMood() end

---Сбросить помеченные таланты и вехи.
---@return нет
function avatar.ClearStoredTalents() end

---Закрывает сумку с лутом.
---@return нет
function avatar.CloseLootBag() end

---Конвертировать метаитем-улучшитель в обычный предмет применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-конвертором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
---@return нет
function avatar.ConvertMetaEnhancer(itemId, instrumentId) end

---Попытка завершить использование устройства.
---@return нет
function avatar.DeactivateUsableDevice() end

---Отказ принять разделяемое задание от другого игрока.
---@param shareId ObjectId уникальный идентификатор предложения
---@return нет
function avatar.DeclineShareQuest(shareId) end

---Попытка выкинуть задание из журнала заданий аватара.
---@param questId QuestId --идентификатор задания
---@return нет
function avatar.DiscardQuest(questId) end

---Окончательно распределяет пункты характеристик, предварительно запланированные к распределению функцией avatar.ImproveInnateStat( stat, amount ). Работает только если avatar.CanImproveInnateStats() даёт true, при этом переключает это состояние в false до ответа сервера. При любом ответе сервера переключает  avatar.CanImproveInnateStats() обратно в true (если нет дополнительных обстоятельств). При удачном завершении операции через некоторое время произойдёт изменение данных, выдаваемых  avatar.GetInnateStats(), с событием  EVENT_AVATAR_STATS_CHANGED).
---@return нет
function avatar.DistributeStatPoints() end

---Сбрасывает подготовленное заклинание. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях. 2. Этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши, т.е. на нажатие кнопки.
---@param spellId SpellId идентификатор заклинания
---@return нет
function avatar.DropSpell(spellId) end

---Копировать метаитем-улучшитель применением на нём предмета-инструмента.
---@param itemId ObjectId идентификатор конвертируемого метапредмета в контейнере; должен быть метапредметом-улучшителем (иное считается ошибкой и команда игнорируется),
---@param instrumentId ObjectId идентификатор инструмента в контейнере; должен быть специализированным преметом-дубликатором, иное считается ошибкой (иное считается ошибкой и команда игнорируется),
---@return нет
function avatar.DuplicateMetaEnhancerItem(itemId, instrumentId) end

---Включает или выключает детектор интерактивных объектов на клиенте. Это могут быть детекторы квестгиверов, торговцев и т.п. Типы детекторов:
function avatar.EnableClientDetector() end

---Включить/выключить бескорыстную помощь.
---@param enable boolean для включения: true, для выключения: false
---@return нет
function avatar.EnableFreeKeys(enable) end

---Закончить инспектирование цели главного игрока. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях, в которых есть возможность голосовать за изгнание игрока. Проверить доступность можно функцией  avatar.IsInspectAllowed()
---@return нет
function avatar.EndInspect() end

---Экипировать предмет с указанным идентификатором. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ). Особенно это '''важно''' помнить при работе с ITEM_CONT_CHECKROOM и ITEM_CONT_POWEREDLSWEAPON.
---@param itemId ObjectId идентификатор предмета
---@return нет
function avatar.EquipItemById(itemId) end

---Экипировать предмет с указанным идентификатором в указанный слот в экипировке. Предмет должен находится в одном из контейнеров:  ITEM_CONT_.... Получить предметы в контейнере можно функцией  containerLib.GetItems( slotType ). Особенно это '''важно''' помнить при работе с ITEM_CONT_CHECKROOM и ITEM_CONT_POWEREDLSWEAPON.
---@param itemId ObjectId идентификатор предмета
---@param equipSlot number индекс слота в экипировке.
---@return нет
function avatar.EquipItemByIdToSlot(itemId, equipSlot) end

---Команда на оживление аватара из чистилища в мир.
---@return нет
function avatar.FinallyRespawn() end

---Посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест из линейки квестов этапа тайны мира. Получить id текущего квеста для этапа тайны мира. Если задание не находится в квестбуке аватара, то венет nil. Если требуется найти и получить потерянное задание надлежит использовать avatar.FindNextSecretComponentQuest
---@param secretId QuestId id основного квеста тайны мира
---@param componentIndex num порядковый номер интересующей компоненты (берется из avatar.GetSecretComponents( secretId ))
---@return QuestId|nil
function avatar.FindCurrentSecretComponentQuest(secretId, componentIndex) end

---Если список текущих заданий пуст, посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест.
---@param mode number где искать следующий квест (зона, в которой находится аватар или весь игровой мир)
function avatar.FindNextQuest(mode) end

---Посылает запрос на выдачу задания, отправляющее на встречу с NPC, выдающим следующий доступный квест из линейки квестов этапа тайны мира.
---@param secretId QuestId id основного квеста тайны мира
---@param componentIndex num порядковый номер интересующей компоненты (берется из avatar.GetSecretComponents( secretId ))
---@return нет
function avatar.FindNextSecretComponentQuest(secretId, componentIndex) end

---Возвращает список Id пассивных умений. Список активных умений и заклинаний можно получить, используя avatar.GetSpellBook().
---@return AbilityId[]
function avatar.GetAbilities() end

---Возвращает информацию об абилке по идентификатору её ресурса.
---@param id AbilityId Id ресурса умения
---@return AvatarGetAbilityInfoResult
function avatar.GetAbilityInfo(id) end

---Возвращает подменяющее заклинание абилке по идентификатору её ресурса.
---@param id AbilityId идентификатор ресурса умения
---@return SpellId|nil
function avatar.GetAbilityReplacementSpell(id) end

---Возвращает подменяющее заклинание абилке по идентификатору её ресурса.
---@param id AbilityId идентификатор ресурса умения
---@return SpellId|nil[]
function avatar.GetAbilityReplacementSpells(id) end

---Возвращает новый экземпляр ValuedObject для пассивного умения.
function avatar.GetAbilityValuedObject() end

---Возвращает количество очков заработанных в событии.
---@param ruleId RuleId идентификатор события
---@return integer
function avatar.GetAchievementValue(ruleId) end

---Возвращает заклинания из указанной группы, принадлежащие указанному классу. См. также ActionGroupId, CharacterClassId.
---@param actionGroupId ActionGroupId идентификатор ресурса группы заклинаний
---@param characterClassId CharacterClassId идентификатор ресурса класса игрока
---@return SpellId[]
function avatar.GetActionGroupSpells(actionGroupId, characterClassId) end

---Выдаёт информацию о бонусе к статам аватара при использовании заклинаний из группы actionGroupId.
---@param actionGroupId ActionGroupId Id группы заклинаний
---@return table|nil
function avatar.GetActionGroupStatBonus(actionGroupId) end

---Вернуть информацию о наличии действия в слоте экшен-панели и его параметры.
---@param index number
---@return AvatarGetActionInfoResult
function avatar.GetActionInfo(index) end

---Получить номер активной специализации.
---@return number
function avatar.GetActiveBuild() end

---Возвращает идентификатор крафтового скила, которые сейчас активен, то есть сейчас совершается крафт. если никакого крафта сейчас не присходит, то возвращается nil.
---@return SkillId|nil
function avatar.GetActiveCraftingSkill() end

---Возвращает id используемого устройства. Например, корабельные устройства (управление, пушки и т.д.). Если состояние доступности какого либо действия меняется, приходит  EVENT_DEVICE_COOLDOWNS_ENABLE_CHANGED.
---@return ObjectId (or nil) -
function avatar.GetActiveUsableDevice() end

---Возвращает информацию о действии используемого устройства. Например корабельного (управление, пушки и т.д.).
---@param index number индекс действия [0..(pDevice->GetActionCount() - 1)]
---@return AvatarGetActiveUsableDeviceActionInfoResult
function avatar.GetActiveUsableDeviceActionInfo(index) end

---Возвращает базовую информацию о барабане умения алхимии. Если барабан не используется (алхимия не начата, или слот не доступен в имеющемся алхимическом инструменте), то вернёт nil.
---@param drum integer номер барабана (слота) текущего алхимического действа
---@return AvatarGetAlchemyDrumInfoResult
function avatar.GetAlchemyDrumInfo(drum) end

---Возвращает базовую информацию об умении алхимии главного игрока.
---@return AvatarGetAlchemyInfoResult
function avatar.GetAlchemyInfo() end

---Возвращает информацию о рецепте, по которому создастся предмет в выбранной строке после проведения алхимической реакции (учитываются текущие корректировки). Если рецепт не найден, то возвращается nil, иначе возвращается идентификатор ресурса рецепта и флаг, бонусное ли расположение компонент для этого рецепта. Это расположение компонент в инструменте такое же как в рецепте. В таком случае количество произведенного продукта увеличивается на некую величину (см. avatar.GetAlchemyInfo()).
---@param line integer строка в которой необходимо узнать результат
---@return AvatarGetAlchemyMatchedRecipeResult
function avatar.GetAlchemyMatchedRecipe(line) end

---Попытка получить у предмета в инвентаре список заданий, которые он может выдать персонажу. Вызывать только после avatar.RequestQuestsForItem( itemId ).
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
---@return QuestId -[]
function avatar.GetAvailableItemQuests(itemId) end

---Попытка получить у собеседника список заданий, которые он может выдать персонажу. Вызывать только после avatar.RequestInteractions().
---@return QuestId -[]
function avatar.GetAvailableQuests() end

---Возвращает начальную длительность барьеров (паладина) в миллисекундах.
---@return integer
function avatar.GetBarriersDelay() end

---Возвращает информацию о барьерах (паладина).
---@return AvatarGetBarriersInfoResult
function avatar.GetBarriersInfo() end

---Получить информацию о таланте из базовой таблицы талантов.
---@param layer integer номер строки
---@param line integer номер столбца
---@return AvatarGetBaseTalentInfoResult
function avatar.GetBaseTalentInfo(layer, line) end

---Получить размер базовой таблицы талантов.
---@return AvatarGetBaseTalentTableSizeResult
function avatar.GetBaseTalentTableSize() end

---Возвращает Id транспортного средства, которое привязано к главному игроку (игрок вызвал его в ангаре).
---@param id ObjectId (or nil) -- идентификатор транспортного средства, если есть
function avatar.GetBindedTransport(id) end

---Возвращает список бонусов развития главного игрока. В результирующей таблице может быть только один элемент, описывающий бонус какого-то кокретного типа. См. enum ENUM_DevelopmentTrack_....
---@return AvatarGetBonusPoolsResult
function avatar.GetBonusPools() end

---Возвращает новый экземпляр ValuedObject для бафа.
function avatar.GetBuffValuedObject() end

---Получить количество специализаций аватара. Может быть больше числа доступных специализаций в случае если их число когда-либо было временно увеличено а затем вновь уменьшилось. Сохраненные данные специализации будут доступны, но активировать ее будет нельзя.
---@return integer
function avatar.GetBuildsCount() end

---Получить количество доступных специализаций аватара.
---@return integer
function avatar.GetBuildsUnlockedCount() end

---Получить id спелла, переключающего специализацию (билд) аватара. Используется для получения информации об условиях переключения.
---@return QuestId
function avatar.GetBuildSwitchSpell() end

---Возвращает информацию о валютах главного игрока, содержащихся в одной категории валют. Список отсортирован по названию валюты.
---@param categoryId CurrencyCategoryId категория валюты
---@return CurrencyId[]
function avatar.GetCategoryCurrencies(categoryId) end

---Возвращает информацию о каналах в текущей зоне.
---@return AvatarGetChannelsInfoResult
function avatar.GetChannelsInfo() end

---Возвращает класс аватара
---@return string -
function avatar.GetClass() end

---Возвращает информациюю связанную со сменой класса
---@return table
function avatar.GetClassChangeData() end

---Рассчитывает сумму бонусов, даваемых предметами, выбранными для замены экипировки на соответствующей стадии процесса смены класса (набор замен для предметов). Входные данные аналогичны  avatar.SetClassChangerInfo( changeList ) (однако набор замен не обязательно должен быть полным), выходные данные аналогичны itemLib.GetBonus( itemId ) (с той только разницей, что тут бонусы не от одного предмета, а от всех, указанных во входных параметрах). Состояние процесса смены класса при этом остаётся неизменным.
---@param changeList table аналогично avatar.SetClassChangerInfo( changeList ), список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен
---@return см. описание avatar.GetItemBonus( itemId )
function avatar.GetClassChangerBonusStats(changeList) end

---Возвращает информацию, необходимую для смены класса аватара, например варианты для замены вещей на подходящие новому классу. Имеет смысл, только если аватар находится в соответствующем состоянии (см.  EVENT_CHARACTER_CLASS_CHANGER_CHANGED), когда класс для замены уже выбран (для выбора используется  ClassSelectQuestion) и требуется уточнить детали замены.
---@return AvatarGetClassChangerInfoResult
function avatar.GetClassChangerInfo() end

---Рассчитывает сумму бонусов, даваемых дистанционным оружием, выбранным для замены экипировки на соответствующей стадии процесса смены класса (набор замен для предметов). Входные данные аналогичны  avatar.SetClassChangerInfo( changeList ) (однако набор замен не обязательно должен быть полным), выходные данные аналогичны itemLib.GetBonus( itemId ) (с той только разницей, что тут бонусы только для предмета из слота DRESS_SLOT_RANGED). Состояние процесса смены класса при этом остаётся неизменным.
---@param changeList table аналогично avatar.SetClassChangerInfo( changeList ), список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен
---@return см. описание avatar.GetItemBonus( itemId )
function avatar.GetClassChangerRangeBonusStats(changeList) end

---Возвращает  идентификатор класса главного игрока.
---@return CharacterClassId
function avatar.GetClassId() end

---Получить информацию о поле талантов.
---@param field integer номер поля (от 1)
---@return AvatarGetCommonFieldTalentInfoResult
function avatar.GetCommonFieldTalentInfo(field) end

---Возвращает описание крафтового компонента по идентификатору ресурса.
---@param id ComponentPropertyId Id ресурса компонента
---@return AvatarGetComponentInfoResult
function avatar.GetComponentInfo(id) end

---Вернуть информацию о кулдауне контекстного действия. Более полный вариант:  avatar.GetContextActionInfo( id ).
---@param id ObjectId идентификатор контекстного действия
---@return AvatarGetContextActionCooldownResult
function avatar.GetContextActionCooldown(id) end

---Вернуть информацию о контекстном действии. Контекстное действие может находится в списке контекстных действий аватара, но в то же время быть недоступным (например цель не в зоне действия или не в той полусфере игрока). Поле enabled принимает значение true, если действие доступно и false, если не доступно. В случае изменения поля, на клиент приходит  EVENT_CONTEXT_ACTIONS_CHANGED. Внимание! Есть более оптимииованный вариант:  avatar.GetContextActionShortInfo( id ) и  avatar.GetContextActionCooldown( id ).
---@param id ObjectId идентификатор контекстного действия
---@return AvatarGetContextActionInfoResult
function avatar.GetContextActionInfo(id) end

---Вернуть список идентификаторов контекстных действий. В списке перечислены идентификаторы созданных экземпляров контекстных действий. Если список меняется, то приходит  EVENT_CONTEXT_ACTIONS_CHANGED.
---@param withMount boolean|nil true добавлять контекстные действия маунта; по-умолчанию true
---@return ObjectId:[]
function avatar.GetContextActions(withMount) end

---Вернуть информацию о контекстном действии. Контекстное действие может находится в списке контекстных действий аватара, но в то же время быть недоступным (например цель не в зоне действия или не в той полусфере игрока). Поле enabled принимает значение true, если действие доступно и false, если не доступно. В случае изменения поля, на клиент приходит  EVENT_CONTEXT_ACTIONS_CHANGED. Более полный вариант:  avatar.GetContextActionInfo( id ).
---@param id ObjectId идентификатор контекстного действия
---@return AvatarGetContextActionShortInfoResult
function avatar.GetContextActionShortInfo(id) end

---В игре встречаются альтернативные валюты. Этот метод возвращает информацию об этой валюте и её количество у игрока.
---@return CurrencyId[]
function avatar.GetCurrencies() end

---Возвращает информацию о категориях валют, имеющихся у главного игрока. Список отсортирован по системному названию категории валюты. См. CurrencyCategoryId.
---@return CurrencyCategoryId[]
function avatar.GetCurrencyCategories() end

---Возвращает описание альтернативной валюты.
---@return ValuedText|nil
function avatar.GetCurrencyDescription() end

---Возвращает информацию об альтернативной валюте по её внутриигровому имени. В случае ошибки возвращается nil. Если валюта в данный момент не найдена у игрока, но в принципе существует в системе, всё равно возвращается nil.
---@param sysName string|nil внутриигровое имя альтернативной валюты.
---@return CurrencyId|nil
function avatar.GetCurrencyId(sysName) end

---В игре встречаются альтернативные валюты. Этот метод возвращает её количество у игрока.
---@param currencyId CurrencyId|nil идентификатор ресурса альтернативной валюты.
---@return AvatarGetCurrencyValueResult
function avatar.GetCurrencyValue(currencyId) end

---Возвращает максимально возможный уровень скилла для текущего уровня главного игрока.
---@param skillId ObjectId идентификатор скилла
---@return integer
function avatar.GetCurrentMaxSkillScore(skillId) end

---Возвращает id квеста, объявленного как текущий.
---@return QuestId или nil
function avatar.GetCurrentQuest() end

---Возвращает информацию об Очках Судьбы персонажа
---@return AvatarGetDestinyPointsResult
function avatar.GetDestinyPoints() end

---Возвращает список Id объектов (устройство или юнит), отслеживаемых главным игроком на карте.
---@return ObjectId – список (индексирован с 1) идентификаторов отслеживаемых объектов (устройств или кричей)[]
function avatar.GetDetectedObjects() end

---Получить список всех устройств в зоне действия аватара
---@return ObjectId[]
function avatar.GetDeviceList() end

---Возвращает информацию о направлении аватара.
---@return number
function avatar.GetDir() end

---Возвращает базовую информацию о слоте экипировки. Список доступных слотов:  DRESS_SLOT_...
---@param dressSlot integer номер слота ( enum DRESS_SLOT_... )
---@return table|nil
function avatar.GetDressSlotInfo(dressSlot) end

---Возвращает значение CommandPoints пета друида, если у друида есть пет, и nil в противном случае.
---@param value number
---@param minValue number
---@param maxValue number
function avatar.GetDruidPetCommandPoints(value, minValue, maxValue) end

---Вернуть информацию об эмоции.
---@param index number id эмоции
---@return AvatarGetEmoteInfoResult
function avatar.GetEmoteInfo(index) end

---Возвращает список Id эмоций.
---@return ObjectId[]
function avatar.GetEmotes() end

---Возвращает специальные заклинания для класса инженера
---@return SpellId[]
function avatar.GetEngineerPetCommands() end

---Возвращает информацию об опыте персонажа
---@return AvatarGetExperienceResult
function avatar.GetExperience() end

---Возвращает количество опыта персонажа, требуемое на указанный уровень
---@return integer
function avatar.GetExpToLevel() end

---Получить дополнительные данные о фракции
---@param factionId FactionId -- идентификатор фракции, например возвращаемый matchMaking.GetEventProgressInfo() в поле winnerFactionId или функцией unit.GetFactionId( unitId )
---@return table
function avatar.GetFactionInfo(factionId) end

---Возвращает информацию о механике покровителей. Дополнительные подробности:  LuaApiDetails (закрытая ссылка)
---@return AvatarGetFairyMechanicsInfoResult
function avatar.GetFairyMechanicsInfo() end

---Получить информацию о таланте из поля талантов. См.  avatar.GetBaseTalentInfo( layer, line ).
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return как в avatar.GetBaseTalentInfo( layer, line )
function avatar.GetFieldTalentInfo(field, row, column) end

---Получить размер поля талантов.
---@return AvatarGetFieldTalentTableSizeResult
function avatar.GetFieldTalentTableSize() end

---Даёт количество доступных для распределения пунктов характеристик (ещё не намеченных к распределению). Работает только если avatar.CanImproveInnateStats() даёт true.
---@return Number (integer) или nil
function avatar.GetFreeStatPointsToDistribute() end

---Возвращает текущий рейтинг экипировки аватара, а так же информацию об уровнях и наградах за достижение рейтинга.
---@return AvatarGetGearScoreInfoResult
function avatar.GetGearScoreInfo() end

---Возвращает информацию о глобальном времени восстановления умений у аватара.
---@return AvatarGetGlobalCooldownResult
function avatar.GetGlobalCooldown() end

---Возвращает список глобальных рейтов развития главного игрока. Значение рейта по умолчанию = 1. Это значит, что пользователь получает обычное количество единиц развития. Значение value больше единицы говорит о том, что игрок получает единиц развития в value раз больше. Метод всегда возвращает значения для всех типов единиц развития. То есть, в обычных условиях будет возвращен массив из всех типом со значением value=1. Типы единиц развития см в  enum ENUM_GlobalScalerType_....
---@return AvatarGetGlobalRatesResult
function avatar.GetGlobalRates() end

---Получить описание  GlossaryResource.
---@param glossaryId GlossaryId идентификатор ресурса глоссария
---@return ValuedText
function avatar.GetGlossaryDescription(glossaryId) end

---Возвращает значение регена здоровья главного игрока. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName.
---@return AvatarGetHealthRegenResult
function avatar.GetHealthRegen() end

---Возвращает информацию о кулдауне HearthStone.
---@param remainingMs integer сколько времени кулдауна осталось в миллисекундах
---@param durationMs integer сколько кулдаун длится в миллисекундах
function avatar.GetHearthStoneCooldown(remainingMs, durationMs) end

---Возвращает информацию о месте в которое ведет HearthStone (карта, зона, локатор).
---@return AvatarGetHearthStoneLocatorResult
function avatar.GetHearthStoneLocator() end

---Возвращает заклинание HearthStone.
---@return SpellId или nil
function avatar.GetHearthStoneSpell() end

---получить идентификатор аватара.
---@return в настоящее время при старте скриптов может быть nil)|false
function avatar.GetId() end

---Аналогично  avatar.GetInnateStats() дает основные характеристики аватара, но с учётом намеченных к распределению (ещё нераспределённых окончательно) пунктов характеристик. Работает только когда  avatar.CanImproveInnateStats() дает true.
---@return table или nil
function avatar.GetImprovedInnateStats() end

---Возвращает список категорий постоянных возможностей (анлоков), имеющихся у аватара.
---@return table
function avatar.GetInfiniteUnlockCategories() end

---Возвращает список имеющихся у главного игрока идентификаторов возможностей (анлоков) с неограниченным сроком жизни.
---@return ObjectId[]
function avatar.GetInfiniteUnlocks() end

---Возвращает список идентификаторов постоянных возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return ObjectId[]
function avatar.GetInfiniteUnlocksInCategory(unlockCategoryId) end

---Возвращает описание InnateStat характеристики аватара.
---@param sysName string служебное имя характеристики
---@return ValuedText|nil
function avatar.GetInnateStatDescription(sysName) end

---Возвращает основные характеристики аватара. Перечисления: ENUM_InnateStats. Дополнительные подробности:  LuaApiDetails (закрытая ссылка) Производные характеристики:  InnateStatSecondary Если для характеристики нет производной K, то secondaryK равна нулю.
---@return AvatarGetInnateStatsResult
function avatar.GetInnateStats() end

---Возвращает информацию об умении игрока просматривать вещи другого игрока и текущих просматриваемых объектах. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях, в которых есть возможность голосовать за изгнание игрока. Проверить доступность можно функцией  avatar.IsInspectAllowed()
---@return AvatarGetInspectInfoResult
function avatar.GetInspectInfo() end

---Возвращает реплику NPC-собеседника. Ответы можно получить в  avatar.GetInteractorNextCues(). Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель.
---@return AvatarGetInteractorCueResult
function avatar.GetInteractorCue() end

---Возвращает идентификатор точки телепортации, в которой находится мастер телепорта, с которым сейчас разговаривает главный игрок.
---@return ObjectId|nil
function avatar.GetInteractorCurrentLocation() end

---Возвращает информацию по собеседнику, если он есть. Возвращаемая информация такая же, как и в  object.GetInteractorInfo( id ). Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель. До разговора можно узнать информацию, используя object.GetInteractorInfo( id ). Но она может быть не точна.
---@return table|nil
function avatar.GetInteractorInfo() end

---Возвращает список возможных ответов на реплику NPC-собеседника  avatar.GetInteractorCue(). Ответ представлен полной информацией о следующей реплике, приходящей от NPC, в случае выбора этого ответа. Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель. Информация о реплике представлена таблицей, описанной в  avatar.GetInteractorCue().
---@return Cue: список реплик, приходящих после соответствующего ответа по индексу от 0. Каждая реплика Cue представлена таблицей, как в avatar.GetInteractorCue()[]
function avatar.GetInteractorNextCues() end

---Возвращает список точек телепортации мастера телепорта, с которым сейчас разговаривает главный игрок.
---@return ObjectId[]
function avatar.GetInteractorTeleportLocations() end

---Возвращает информацию о текущем собеседнике аватара. Собеседником может быть устройство или NPC, см.  CategoryObject.
---@return ObjectId – идентификатор собеседника или nil, если его нет
function avatar.GetInterlocutor() end

---Возвращает информацию о количестве убитых в PvP противников. При изменении приходит  EVENT_VICTIM_TRACKER_CHANGED.
---@return number
function avatar.GetKills() end

---Вернуть общее число слотов в открытой сумке с лутом, включая пустые. Деньги не считаются слотом - это отдельная сущность.
---@return integer
function avatar.GetLootBagSlotCount() end

---Возвращает количество денег и список вещей в сумке с лутом - содержимое всех слотов. Список индексируется от 0 до avatar.GetLootBagSlotCount() - 1. Для пустых слотов возвращается nil.
---@return AvatarGetLootBagSlotsResult
function avatar.GetLootBagSlots() end

---Возвращает значение скорости атаки основным оружием аватара.
---@param base number
---@param effective number
function avatar.GetMainhandSpeed(base, effective) end

---Возвращает значение регена маны главного игрока. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName.
---@return AvatarGetManaRegenResult
function avatar.GetManaRegen() end

---Возвращает информацию о причине и времени до выброса главного игрока из инстанса. Если счетчика нет, возвращает nil. См. также "ENUM_AvatarKickCause...".
---@return AvatarGetMapInstanceKickResult
function avatar.GetMapInstanceKick() end

---Вернуть общее (суммарное) количество слотов на всех ActionBar-ах (как пустых, так и непустых).
---@return count: number (int)
function avatar.GetMaxActionCount() end

---Возвращает максимально возможный уровень скилла в игре.
---@param skillId ObjectId идентификатор скилла
---@return integer
function avatar.GetMaxSkillScore(skillId) end

---Возвращает стоимость улучшения мета-предмета в меди.
---@param sourceId ObjectId идентификатор предмета который улучшаем
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор агента улучшения
---@return number
function avatar.GetMetaUpgradeCost(sourceId, enhancerId, agentId) end

---Возвращает предсказание по улучшению мета-предмета. См.  ENUM_UpgradeChanceBehavior_...
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор предмета-агента, требуемого для улучшения
---@param agentCount integer количество используемых агентов
---@return AvatarGetMetaUpgradeResultsResult
function avatar.GetMetaUpgradeResults(sourceId, enhancerId, agentId, agentCount) end

---Возвращает информацию о количестве денег у игрока. В текущий момент ограничение около 2 млрд (int32).
---@return number
function avatar.GetMoney() end

---Возвращает информацию о режиме движения в точку для аватара игрока.
---@return AvatarGetMoveToPointStateResult
function avatar.GetMoveToPointState() end

---Возвращает значение BloodPool некроманта.
---@return AvatarGetNecromancerBloodPoolResult
function avatar.GetNecromancerBloodPool() end

---Возвращает описание возможности (анлока), необходимой для получения следующего уровня главного игрока.
---@return AvatarGetNextLevelUnlockInfoResult
function avatar.GetNextLevelUnlockInfo() end

---Возвращает Id астрального моба, которое просматривается через навигационное устройство корабля, на котором находится главный игрок (навигатор корабля игрока назумился на другой корабль). Если навигатор не просматривает астрального моба, или он не найден, то возвращает nil. Навигатор может одновременно может просматривать либо транспорт, либо астрального моба. См.avatar.GetObservedTransport(). См. также:  EVENT_TRANSPORT_OBSERVING_STARTED,  EVENT_TRANSPORT_OBSERVING_FINISHED.
---@param id ObjectId (or nil) -- идентификатор просматриваемого астрального моба
function avatar.GetObservedAstralUnit(id) end

---Возвращает Id о транспортном средстве, которое просматривается через навигационное устройство корабля, на котором находится главный игрок (навигатор корабля игрока назумился на другой корабль). У просматриваемого транспорта доступна информация по устройствам Если навигатор не просматривает транспорт, или транспорт не найден, то возвращает nil. Навигатор может одновременно может просматривать либо транспорт, либо астрального моба. См. avatar.GetObservedAstralUnit(). См. также:  EVENT_TRANSPORT_OBSERVING_STARTED,  EVENT_TRANSPORT_OBSERVING_FINISHED
---@param id ObjectId (or nil) -- идентификатор просматриваемого транспортного средства
function avatar.GetObservedTransport(id) end

---Возвращает значение скорости атаки дополнительным оружием аватара.
---@param base number
---@param effective number
function avatar.GetOffhandSpeed(base, effective) end

---Возвращает индекс активного заклинания пета аватара.
---@return integer
function avatar.GetPetActiveSpell() end

---Возвращает текущий тип поведения пета аватара. Типы см. avatar.SetPetAggroMode( mode )
---@return number
function avatar.GetPetAggroMode() end

---Возвращает текущий тип движения пета аватара. Типы см. avatar.SetPetMoveMode( mode )
---@return number
function avatar.GetPetMoveMode() end

---Возвращает список идентификаторов ресурсов переключаемых заклинаний пета аватара.
---@return SpellId[]
function avatar.GetPetSpells() end

---Возвращает информацию о координатах аватара.
---@return GamePosition
function avatar.GetPos() end

---Возвращает количество Могущества аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatar.GetPower() end

---Возвращает список Id профессий главного игрока. Этот список зависит от класса персонажа и его уровня. В данный момент - это умения персонажа носить определенный класс предметов.
---@return ObjectId[]
function avatar.GetProficiencies() end

---Возвращает информацию о профессии главного игрока по идентификатору. В данный момент это умение носить вещи определенного класса. Зависит от уровня и класса персонажа.
---@param id ObjectId Id объекта профессии
---@return AvatarGetProficiencyInfoResult
function avatar.GetProficiencyInfo(id) end

---Главный герой псионик может установить псионический контакт с несколькими целями. Каждый псионический контакт определенного типа может быть установлен с одной целью. Метод возвращает индексированную по типу контакта таблицу контактов. В ней по индексу типа контакта лежит или информация о контакте или nil, если нет контакта такого типа. Если главный герой не псионик, то таблица будет всегда пустой. У контакта может быть определена длительность. Тогда в поле durationMs будет длительность этого контакта в миллисекундах. Если для такого типа контакта длительность не определена (длится сколь угодно долго), то durationMs = 0.
---@param unitId ObjectId идентификатор контактного юнита
---@param durationMs integer длительность контакта в миллисекундах
---@param remainingMs integer осталось миллисекунд до окончания контакта
function avatar.GetPsionicContacts(unitId, durationMs, remainingMs) end

---Возвращает специальные заклинания для класса мистика
---@return SpellId[]
function avatar.GetPsionicOrders() end

---Получить список заданий, находящихся в данный момент в журнале заданий аватара.
---@return QuestId[]
function avatar.GetQuestBook() end

---Получить список заданий, выполненных аватаром.
---@return QuestId -[]
function avatar.GetQuestHistory() end

---Возвращает идентификатор текстуры изображения, которое относится к тексту описания задания.
---@param questId QuestId идентификатор ресурса задания
---@return TextureId|nil
function avatar.GetQuestImage(questId) end

---Получить описание задания. Так же смотрите типы квестов в  QUEST_TYPE_.... Для получения информации о карте goalLocation и returnLocation, см.  сartographer.GetQuestGeodata( questId, zonesMapId ).
---@param questId QuestId идентификатор задания.
---@return AvatarGetQuestInfoResult
function avatar.GetQuestInfo(questId) end

---Получить информацию об одной цели какого-либо задания игрока. См. QuestLocation.
---@param objectiveId ObjectId идентификатор цели задания
---@param questId QuestId идентификатор ресурса квеста
---@param id ObjectId идентификатор цели квеста
---@param name string название цели квеста
---@param description string описание цели квеста
---@param sysDebugName string|nil дебажный строковый идентификатор (путь к файлу) или nil для финальной версии
---@param progress integer текущее значение счетчика (например, сколько уже собрано предметов на квест)
---@param required integer целевое значение счетчика (например, сколько надо собрать предметов на квест)
---@param isInternal boolean счётчик внутренний, поэтому, счётчик и маркер вообще не должны быть показаны пользователю
---@param type number тип цели квеста, см. ниже
---@param showCounterValue boolean нужно показывать пользователю прогресс (цифры progress и required)
---@param alwaysShowMarker boolean всегда показывать маркер квеста на карте, даже если isInternal=true
---@param items ObjectId[] если имеется список предметов, то таблица с идентификаторами этих предметов
---@param dressSlots number[] если имеется список слотов предметов, то таблица со значениями слотов
---@param locations QuestLocation[] таблица с описаниями точек цели задания
function avatar.GetQuestObjectiveInfo(objectiveId, questId, id, name, description, sysDebugName, progress, required, isInternal, type, showCounterValue, alwaysShowMarker, items, dressSlots, locations) end

---Получить информацию о состоянии конкретного задания, находящегося в журнале заданий аватара. См.  avatar.GetQuestObjectiveInfo( objectiveId ). См. QuestLocation.
---@param questId QuestId идентификатор квеста
---@param id QuestId идентификатор квеста
---@param state number состояние квеста
---@param returnLocation QuestLocation|nil если нет ошибки, то точка возвращения задания
---@param zonesMapId ObjectId|nil идентификатор интерфейсной карты задания (если не произошло ошибки)
---@param timerDurationMs number продолжительность таймера (nil если таймер отсуствует или неактивен)
---@param timerTimeLeftMs number оставшееся время таймера (nil если таймер отсуствует или неактивен)
---@param objectives ObjectId[] список (индекс с 0) ID целей квеста.
function avatar.GetQuestProgress(questId, id, state, returnLocation, zonesMapId, timerDurationMs, timerTimeLeftMs, objectives) end

---Получить описание награды за выполнение задания.
---@param questId QuestId -- идентификатор задания.
---@return AvatarGetQuestRewardResult
function avatar.GetQuestReward(questId) end

---Возвращает список приглашений от игроков, которые делятся своими заданиями.
---@return AvatarGetQuestShareInvitationsResult
function avatar.GetQuestShareInvitations() end

---Возвращает максимально допустимое количество заданий. Замечание. Максимально допустимое количество обычных и ежедневных заданий совпадают.
---@return integer
function avatar.GetQuestsLimit() end

---Возвращает значение скорости атаки дистанционныим оружием аватара.
---@param base number
---@param effective number
function avatar.GetRangedSpeed(base, effective) end

---Возвращает идентификатор предмета, выдающего озарение, для указанного рецепта по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return itemId : ItemId или nil (если рецепт не найден по идентификатору, или итем озарения не прописан в рецепте)
function avatar.GetRecipeAfflatusItem(id) end

---Возвращает информацию о рецепте по идентификатору ресурса.
---@param id RecipeId Id ресурса рецепта
---@return AvatarGetRecipeInfoResult
function avatar.GetRecipeInfo(id) end

---Возвращает текущие рекомендованные характеристики для аватара(зависит от класса и включенного аспекта).
---@return AvatarGetRecommendedStatsResult
function avatar.GetRecommendedStats() end

---Получить у аватара информацию о репутации с фракцией.
---@param factionId FactionId фракция
---@return AvatarGetReputationInfoResult
function avatar.GetReputationInfo(factionId) end

---Получить у аватара список открытых репутаций.
---@return AvatarGetReputationsListResult
function avatar.GetReputationsList() end

---Получить значение репутации соответствующее уровню репутации.
---@param reputationLevel number уровень репутации
---@return integer|nil
function avatar.GetReputationValue(reputationLevel) end

---Возвращает сопротивляемости аватара. Перечисления:  RESISTANCE_.../"ENUM_Element_...". Возвращаемые значения как в  avatar.GetInnateStats()
---@return таблица, индексированная [0..], индексы
function avatar.GetResistances() end

---Попытка получить у NPC-собеседника список заданий, которые NPC может принять.
---@return QuestId -[]
function avatar.GetReturnableQuests() end

---Позволяет узнать текущий активный набор ритуальных вещей.
---@return number
function avatar.GetRitualActivePreset() end

---Возвращает уровня игрока, с которого доступно распределение вех.
---@return integer
function avatar.GetRubyStartLevel() end

---Возвращает список Id вещей вторичного рынка на продажу у NPC-торговца. Должна быть вызвана после avatar.RequestVendor().
---@return AvatarGetSecondhandListResult
function avatar.GetSecondhandList() end

---Возвращает список описаний компонент тайны мира. Если компонента не раскрыта (не сдан завершающий квест), то текст компоненты не возвращается.
---@param objectId ObjectId идентификатор тайны мира
---@return AvatarGetSecretComponentsResult
function avatar.GetSecretComponents(objectId) end

---Возвращает описание тайны мира.
---@param objectId ObjectId идентификатор тайны мира
---@return AvatarGetSecretInfoResult
function avatar.GetSecretInfo(objectId) end

---Возвращает список идентификаторов всех тайн мира, которые уже доступны или будут доступны когда-то аватару.
---@return ObjectId[]
function avatar.GetSecrets() end

---получить постоянный идентификатор аватара.
---@return id: PersistentId (not nil) -
function avatar.GetServerId() end

---Возвращает левелкап текущего шарда.
---@return integer|1
function avatar.GetShardLevelCap() end

---Возвращает информацию о скилле по идентификатору ресурса. Дает информацию по любому скиллу, даже если он не изучен игроком. В этом случае score = nil. ВНИМАНИЕ! В данный момент существует две системы прокачки:
---@param id SkillId Id умения (скила)
---@return AvatarGetSkillInfoResult
function avatar.GetSkillInfo(id) end

---Возвращает список скилов главного героя.
---@return SkillId[]
function avatar.GetSkills() end

---Возвращает стоимость (в мирро) преждевременного вызова искры главного игрока, находящегося в данный момент на кладбище. Эта стоимость постоянно меняется из-за разных условий. При изменении стоимости в момент нахождения на кладбище приходит EVENT_CALL_SPARK_COST_CHANGED.
---@return integer|nil
function avatar.GetSparkCost() end

---Возвращает время (в миллисекундах), требуемое на возвращение искры к главному игроку (воскрещения) после появления главного игрока на кладбище с помощью avatar.Respawn().
---@return integer|nil
function avatar.GetSparkReturnDelay() end

---Возвращает специальные характеристики аватара.
---@return AvatarGetSpecialStatsResult
function avatar.GetSpecialStats() end

---Возвращает список Id умений и заклинаний аватара. пассивные умения можно получить, используя avatar.GetAbilities().
---@return SpellId[]
function avatar.GetSpellBook() end

---Получить информацию о количестве вложенных очков талантов.
---@return integer
function avatar.GetSpentTalentPoints() end

---Метод возвращает список стрел в колчане сталкера.
---@param enchantSpellId SpellId идентификатор ресурса спелла, заряжающего стрелу такого типа
---@param shotSpellId SpellId идентификатор ресурса спелла, выстреливающего стрелу такого типа
---@param arrowCount integer количество уже заряженных стрел такого типа
---@param maxArrowCount integer максимальное количество заряженных стрел такого типа
function avatar.GetStalkerCartridge(enchantSpellId, shotSpellId, arrowCount, maxArrowCount) end

---Возвращает значения барьеров лучника (если они есть и активны)
---@return AvatarGetStalkerDamagePoolInfoResult
function avatar.GetStalkerDamagePoolInfo() end

---Возвращает размер (максимальное время жизни) барьеров лучника.
---@return limit : number (int)
function avatar.GetStalkerDamagePoolSize() end

---Возвращает количество Выносливости у аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatar.GetStamina() end

---Даёт информацию о намеченных для распределения пунктах характеристик. Работает только если avatar.CanImproveInnateStats() даёт true.
---@return table или nil
function avatar.GetStatPointsToDistribute() end

---Возвращает информацию о бонусах к характеристикам аватара. При изменении информации о fairyBonus приходит событие  EVENT_FAIRY_BONUS_CHANGED.
---@return AvatarGetStatsBonusesPartResult
function avatar.GetStatsBonusesPart() end

---Возвращает минимальный уровень аватара, начиная с которого доступно распределение очков таланта
---@return minLevel: Number
function avatar.GetTalentSelectMinLevel() end

---Возвращает информацию о цели аватара. Для аватара возвращается дополнительная цель.
---@return ObjectId – идентификатор цели аватара или nil, если цели нет
function avatar.GetTarget() end

---Возвращает информацию о точке телепортации. Информацию можно получить для имеющихся точек телепортации главного игрока, а также точек телепортации мастера телепорта, с которым разговаривает главный игрок, включая точку, в которой стоит мастер.
---@param locationId ObjectId|TeleportMasterId|table идентификатор точки телепорта
---@return AvatarGetTeleportLocationInfoResult
function avatar.GetTeleportLocationInfo(locationId) end

---Возвращает список известных главному игроку точек телепортации от мастеров телепортов.
---@return ObjectId[]
function avatar.GetTeleportLocations() end

---Возвращает список категорий временных возможностей (анлоков), имеющихся у аватара.
---@return table
function avatar.GetTemporaryUnlockCategories() end

---Возвращает список имеющихся у главного игрока идентификаторов возможностей (анлоков) с ограниченным сроком жизни.
---@return ObjectId[]
function avatar.GetTemporaryUnlocks() end

---Возвращает список идентификаторов временных возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return ObjectId[]
function avatar.GetTemporaryUnlocksInCategory(unlockCategoryId) end

---Возвращает время (в миллисекундах), прошедшее после появления главного игрока на кладбище после вызова avatar.Respawn().
---@return integer|nil
function avatar.GetTimeAfterRespawn() end

---Получить список всех транспортов в зоне действия аватара
---@return TransportId: cписок идентификаторов (индексирован с 1) видимых транспортов[]
function avatar.GetTransportList() end

---Возвращает уникальный постоянный(кросс-серверный) идентификатор аватара.
---@return uniqueId: UniqueId (not nil) -
function avatar.GetUniqueId() end

---Получить список всех юнитов в зоне действия аватара ( сам аватар исключается )
---@return ObjectId[]
function avatar.GetUnitList() end

---Возвращает список категорий возможностей (анлоков), имеющихся у аватара.
---@return table
function avatar.GetUnlockCategories() end

---Возвращает описание возможности (анлока), имеющейся у аватара .
---@param unlockId ObjectId|UnlockId идентификатор возможности (анлока)
---@return AvatarGetUnlockInfoResult
function avatar.GetUnlockInfo(unlockId) end

---Возвращает список идентификаторов всех возможностей (анлоков), имеющихся у главного игрока.
---@return ObjectId[]
function avatar.GetUnlocks() end

---Возвращает список идентификаторов возможностей (анлоков), имеющихся у главного игрока, в указанной категории
---@param unlockCategoryId UnlockCategoryId идентификатор типа категории возможностей (анлоков)
---@return ObjectId[]
function avatar.GetUnlocksInCategory(unlockCategoryId) end

---Возвращает информацию об устройстве. Например, корабельные устройства (управление, пушки и т.д.).
---@return AvatarGetUsableDeviceInfoResult
function avatar.GetUsableDeviceInfo() end

---Метод возвращает информацию о геймдизайнерской переменной и её значение у главного игрока.
---@param variableId VariableId|string или идентификатор ресурса переменной или алиас
---@return AvatarGetVariableInfoResult
function avatar.GetVariableInfo(variableId) end

---У игрока могут быть некоторые гейммеханические переменные (например, количество Сил Льда у мага). Этот метод возвращает список идентификаторов этих переменных. Доступные для просмотра переменные указаны в "\Client\GMUIHelper\VariablesAliases.(VariablesAliases).xdb"
---@return VariableId[]
function avatar.GetVariables() end

---Возвращает список Id проданных вещей на выкуп у NPC-торговца. Должна быть вызвана после avatar.RequestVendor().
---@return AvatarGetVendorBuybackResult
function avatar.GetVendorBuyback() end

---Возвращает список Id вещей на продажу у NPC-торговца (исключая товары вторичного рынка). Должна быть вызвана после avatar.RequestVendor().
---@return AvatarGetVendorListResult
function avatar.GetVendorList() end

---Получить номер специализации, данные о которой доступны для просмотра.
---@return number
function avatar.GetViewedBuild() end

---Возвращает количество свободных вех развиия, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return integer
function avatar.GetViewedBuildFreeRubyPoints() end

---Возвращает количество пунктов характеристик, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return integer
function avatar.GetViewedBuildFreeStatPoints() end

---Возвращает количество свободных очков умений, доступных для распределения в просматриваемой специализации (задаваемой avatar.SetViewedBuild( index ))
---@return integer
function avatar.GetViewedBuildFreeTalentPoints() end

---Метод возвращает величину боевого духа война.
function avatar.GetWarriorCombatAdvantage() end

---Возвращает значения барьеров воина (если они есть и активны)
---@return AvatarGetWarriorDamagePoolInfoResult
function avatar.GetWarriorDamagePoolInfo() end

---Возвращает количество Мудрости у аватара. Возвращаемые значения как в  avatar.GetInnateStats(), кроме sysName. При изменении приходит  EVENT_AVATAR_STATS_CHANGED.
---@return table
function avatar.GetWisdom() end

---Возвращает информацию о наличии HearthStone у аватара.
---@return boolean
function avatar.HasHearthStone() end

---Возвращает true, если собеседник имеет реплику для разговора. Также можно получить информацию о реплике с помощью  avatar.GetInteractorCue(). Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель.
---@return boolean
function avatar.HasInteractorCue() end

---Возвращает true, если собеседник имеет квест на выдачу или может принять квест. Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель.
---@return boolean
function avatar.HasInteractorQuest() end

---Псионики могут писать и просматривать классовый канал чата. Этот метод возвращает true, если главный игрок имеет доступ к такому каналу.
function avatar.HasPsionicChannel() end

---Проверка наличия спелла у аватара. Смотрит в спеллбук, если спелл является специальным и не выдается в спеллбук, то вернет false. Примечание: основное использование - проверка наличия игрушек в гардеробе
---@return boolean
function avatar.HasSpell() end

---Возвращает true, если у аватара имеется соответствующий анлок. Иначе false.
---@param unlockId UnlockId идентификатор возможности (анлока)
---@return boolean
function avatar.HasUnlock(unlockId) end

---Отводит для будущего распределения пункты характеристик. Работает только если avatar.CanImproveInnateStats() даёт true.
---@param stat number значение множества InnateStats, соответствующее характеристике, которую планируется изменить
---@param amount integer количество пунктов характеристик, на которое планируется изменить; не может быть больше текущего количества свободных пунктов характеристик; может быть отрицательным, в этом случае уменьшит ранее заданное этой же функцией количество пунктов для этой характеристики, однако не может уменьшить общее запланированное количество для этой характеристики ниже 0
---@return нет
function avatar.ImproveInnateStat(stat, amount) end

---Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Слоты индексируются с 0 по всему объему инвентаря, включая карманы. Этот метод возвращает true, если в указанный слот можно положить предмет. Метод не проверяет свободен ли слот и подобные условия.
---@param itemId ObjectId идентификатор предмета
---@param slot integer индекс слота
---@return boolean
function avatar.InventoryCanPlaceItemToSlot(itemId, slot) end

---Возвращает базовое число слотов (без карманов, только сумка) в инвентаре главного персонажа.
---@return integer
function avatar.InventoryGetBaseBagSlotCount() end

---Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Этот метод возвращает индекс кармана, в который можно положить предмет. Если возвращается -1, то предмет можно положить в базовую сумку
---@param itemId ObjectId идентификатор предмета
---@return integer
function avatar.InventoryGetItemPocket(itemId) end

---Инвентарь состоит из базовой сумки и нескольких карманов. В определенный карман можно класть только определенные предметы. Эти предметы не кладуться в базовую сумку. Слоты индексируются с 0 по всему объему инвентаря, включая карманы. Этот метод возвращает индекс кармана, в котором находится указанный слот.
---@param slot integer индекс слота
---@return integer
function avatar.InventoryGetPocketIndexBySlot(slot) end

---Возвращает таблицу с информацией о кармане инвентаря главного игрока. Инвентарь состоит из базовой сумки и нескольких карманов. Слоты инвентаря индексируются с 0 по всему массиву и базовой сумки и карманов. То есть Размер инвентаря = Размер базовой сумки + Сумма размеров всех карманов.
---@param pocketIndex integer индекс кармана, начиная с 0
---@return AvatarInventoryGetPocketInfoResult
function avatar.InventoryGetPocketInfo(pocketIndex) end

---Возвращает число карманов в инвентаре главного персонажа.
---@return integer
function avatar.InventoryGetPocketsCount() end

---Сообщает, доступно ли клиентское управление перемещением аватара.
---@return boolean
function avatar.IsAbleToMove() end

---Возвращает true, если в алхимическом приборе достаточно реагентов для начала реакции.
---@return boolean
function avatar.IsAlchemyComponentsReady() end

---Возвращает базовую информацию об умении алхимии главного игрока.
---@param line integer строка результата (-1, 0, 1)
---@return boolean
function avatar.IsAlchemyLineAvailable(line) end

---получить идентификатор аватара.
---@return isAlive: boolean -
function avatar.IsAlive() end

---Возвращает состояние детектора интерактивных объектов на клиенте. Это могут быть детекторы квестгиверов, торговцев и т.п. См. avatar.EnableClientDetector( type, enable ).
---@param type number тип детектора
---@return boolean
function avatar.IsClientDetectorEnabled(type) end

---Возвращает информацию, выполняется ли некоторое условие, заданное дизайнером.
---@param alias string строковое название условия
---@return boolean
function avatar.IsConditionValid(alias) end

---true, если главный игрок уже существует. Иначе false.
---@return boolean
function avatar.IsExist() end

---Проверяем доступность быстрой прокачки.
---@return boolean
function avatar.IsFastLevelUpAvailable() end

---После смерти главный игрок переносится на кладбище с помощью avatar.Respawn(). После этого его искра возвращается к нему и игрок окончательно воскресает. Пока искра двигается к игроку, игрок находится в состоянии воскрешения и avatar.IsInRespawn() возвращает true. Во всех остальных случаях возвращается false.
---@return boolean
function avatar.IsInRespawn() end

---Проверка доступности функции инспектирования игрока.
---@return boolean
function avatar.IsInspectAllowed() end

---Возвращает true, если собеседник имеет в данный момент начальную реплику для разговора. Эта реплика повляется в самом начале разговора и, начиная от неё, игрок может продолжить разговор с собеседником (NPC).
---@return boolean
function avatar.IsInteractorRootCue() end

---Возвращает true, если собеседник является учителем. Иначе false. Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель.
---@return boolean
function avatar.IsInteractorTrainer() end

---Возвращает true, если собеседник является торговцем. Иначе false. Необходимо вызывать после EVENT_INTERACTION_STARTED. Во время разговора нельзя менять цель.
---@return boolean
function avatar.IsInteractorVendor() end

---Проверяет, будет ли предмет при перемещении из одного слота контейнера (инвентарь, переполненная сумка, банковская ячейка) в другой слот (возможно другого контейнера) объединён с предметом в целевом слоте. Предназначена для определения необходимости проверки на изменение связанности и времени существования предметов при перемещении.
---@param itemFromId ObjectId перемещаемый предмет (должен находиться в одном из контейнеров)
---@param itemToId ObjectId предмет, находящийся в слоте, куда предполагается переместить предмет itemFromId
---@return boolean
function avatar.IsItemsStackable(itemFromId, itemToId) end

---Возвращает состояние сумки с лутом на сервере - открыта она для лута или нет.
---@return boolean
function avatar.IsLootBagOpen() end

---Возвращает информацию о том, является ли инструментом для копирования метаитема-улучшителя.
---@param itemId ObjectId идентификатор предмета
---@return boolean
function avatar.IsMetaEnhancerDuplicator(itemId) end

---Возвращает true, если в данный момент бежим до точки на карте по найденному пути.
---@return boolean
function avatar.IsNavigateToPoint() end

---Возвращает true, если получение следующего уровня невозможно для главного игрока.
---@return boolean
function avatar.IsNextLevelLocked() end

---Является ли персонаж пассажиром, к примеру, на двухместном маунте.
---@return boolean
function avatar.IsPassangerState() end

---Возвращает true, если активный пет главного игрока находится в состоянии боя. Иначе возвращает false.
---@return boolean
function avatar.IsPetInCombat() end

---Доступна ли автонавигация для данного задания.
---@param questId QuestId -- идентификатор задания.
---@return boolean
function avatar.IsQuestAutoNavigationAllowed(questId) end

---Проверяет завершено ли задание.
---@param questId QuestId идентификатор ресурса задания
---@return boolean
function avatar.IsQuestFinished(questId) end

---Возвращает true, если игрок может воскреснуть в обычном мире, находясь в чистилище. После смерти главный игрок переносится на кладбище с помощью avatar.Respawn(). После этого его искра возвращается к нему и игрок окончательно воскресает. Если искра уже пришла, то игрок может окончательно воскреснуть в мире с помощью avatar.FinallyRespawn(). Если он может это сделать, то этот метод avatar.IsReadyForFinallyRespawn() возвращает true.
---@return boolean
function avatar.IsReadyForFinallyRespawn() end

---Проверка состояния разговора аватара с NPC
---@return boolean
function avatar.IsTalking() end

---Проверка, находиться ли выбранный юнит в радиусе "meleeRange"
---@return boolean
function avatar.IsTargetInMeleeRange() end

---Инспектируется ли цель главного игрока. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях, в которых есть возможность голосовать за изгнание игрока. Проверить доступность можно функцией  avatar.IsInspectAllowed()
---@return boolean
function avatar.IsTargetInspected() end

---Проверяем валидность locationId.
---@param locationId ObjectId|TeleportMasterId|table идентификатор точки телепорта
---@return boolean
function avatar.IsTeleportLocationValid(locationId) end

---Находится ли персонаж игрока в режиме ходьбы.
---@return boolean
function avatar.IsWalkMode() end

---Устанавливает состояние панели действий для заданного класса и билда. Номера билдов 0-2 соответствуют 1-3 грани талантов, номера билдов 3-9 ничему не соответствуют, но хранятся на сервере и могут быть загружены / выгружены. Примечание: Существует ограничение на частоту записи в серверное хранилище, не рекомендуется изменять более 3 разных раскладок в минуту (одну и ту же раскладку менять можно несколько раз). Для корректного сохранения данных на сервере может потребоваться до 1 минуты. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши. То есть на нажатие кнопки. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: запрещено использовать данную функцию пока персонаж игрока находится в бою.
---@param sysClass SpellId системное имя класса
---@param buildIndex integer индекс билда от 0 до 9
---@param data string|table данные о раскладке полученные из SaveActionPanel. Модификация не допускается, имеется контрольная сумма.
---@return нет
function avatar.LoadActionPanel(sysClass, buildIndex, data) end

---Попытка открыть сундуки. Результат операции приходит в виде события EVENT_BOX_OPERATION_RESULT.
---@param boxId ObjectId item id сундучка, сундучок должен находиться в одном из контейнеров (например в инвентаре или переполненной сумке)
---@param quantity integer|nil необязательный параметр, количество открываемых сундуков; по умолчанию 1.
---@return нет
function avatar.OpenBox(boxId, quantity) end

---Агрит пета аватара на цель.
---@return нет
function avatar.PetAttack() end

---Начинает подготавливать заклинание. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях. 2. Этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши, т.е. на нажатие кнопки.
---@param spellId SpellId идентификатор заклинания
---@return нет
function avatar.PrepareSpell(spellId) end

---Положить/вынуть ингредиент в алхимический слот. После этого прийдёт EVENT_ALCHEMY_ITEM_PLACED. Если передать nil, то слот будет очищен и прийдёт сообщение. Дополнительные подробности: LuaApiDetails (закрытая ссылка)
---@param itemId ObjectId|nil идентификатор ингридиента (предмета из инвентаря). nil - очистить слот.
---@param slot integer номер барабана (слота)
---@return нет
function avatar.PutAlchemyItemToSlot(itemId, slot) end

---Попытка начала разговора с собеседником (спросить список заданий, торговец ли он и т.п.). Если собеседник готов торговать или выдать какие-то задания игроку, то придет сообщение  EVENT_INTERACTION_STARTED Использовать этот метод можно, только если пользователь находится в состоянии разговора после вызова  avatar.StartInteract().
---@return нет
function avatar.RequestInteractions() end

---Запрос заданий у предмета в слоте контейнера (сумка, переполненная сумка, банковская ячейка). В ответ придет сообщение EVENT_ITEM_QUESTS_RECEIVED
---@param itemId ObjectId id предмета; предмет должен находиться в слоте какого-либо контейнера (сумка, переполненная сумка, банковская ячейка)
---@return нет
function avatar.RequestQuestsForItem(itemId) end

---Попытка запросить у торговца список имеющихся товаров. Если собеседник готов торговать, то придет сообщение EVENT_VENDOR_LIST_UPDATED
---@return нет
function avatar.RequestVendor() end

---Команда на оживление аватара на кладбище. После этого он не воскресает немедленно, а ожидает прибытия своей искры, находясь в чистилище.
---@return нет
function avatar.Respawn() end

---Согласиться или отказаться от оживления главного инрока в ответ на EVENT_RESSURECT_REQUESTED.
---@param accept boolean true, если главный игрок согласен на оживление. Иначе false.
---@return нет
function avatar.ResurrectReply(accept) end

---Попытка сдать задание юнита, который является текущей целью аватара. *Нельзя сдать задание юнита, не являющемуся текущей целью.
---@param questId QuestId -- идентификатор квеста
---@param rewardId ObjectId -- идентификатор награды
---@return нет
function avatar.ReturnQuest(questId, rewardId) end

---Запрашивает начальную реплику NPC-собеседника. В ответ прийдёт EVENT_INTERACTION_STARTED.
---@return нет
function avatar.ReturnToStartCue() end

---Начинает сотворение заклинания в указанную точку на карте. См. также  GamePosition. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях. 2. Этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши, т.е. на нажатие кнопки.
---@param spellId SpellId идентификатор заклинания
---@param position таблица GamePosition
---@return нет
function avatar.RunAESpell(spellId, position) end

---Начинает сотворение заклинания на цель по умолчанию.
---@param spellId SpellId идентификатор заклинания
---@return нет
function avatar.RunSpell(spellId) end

---Попытка выполнить одно из действий устройства. Список действий можно узнать через функцию  GetUsableDeviceInfo. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши. То есть на нажатие кнопки.
---@param index integer индекс действия
---@return нет
function avatar.RunUsableDeviceAction(index) end

---Попытка выполнить одно из действий устройства на точку местности. Список действий можно узнать через функцию  GetUsableDeviceInfo. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши. То есть на нажатие кнопки.
---@param index integer индекс действия
---@param pos GamePosition точка применения действия
---@return нет
function avatar.RunUsableDeviceActionPoint(index, pos) end

---Возвращает сериализованное состояние панели действий для заданного класса и билда. Номера билдов 0-2 соответствуют 1-3 грани талантов, номера билдов 3-9 ничему не соответствуют, но хранятся на сервере и могут быть загружены / выгружены.
---@param sysClass SpellId системное имя класса
---@param buildIndex integer индекс билда от 0 до 9
---@return table|string|nil
function avatar.SaveActionPanel(sysClass, buildIndex) end

---Отвечает на реплику NPC-собеседника  avatar.GetInteractorCue(). Ответ - индекс в списке ответов  avatar.GetInteractorNextCues().
---@param index integer индекс ответа
---@return нет
function avatar.SelectInteractorCue(index) end

---Попытка аватара сделать указанного юнита своей целью. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши. То есть на нажатие кнопки.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return нет
function avatar.SelectTarget(unitId) end

---Задать номер активной специализации.
---@param index integer номер специализации аватара; доступный диапазон - от 0 до величины, на 1 меньшей результата avatar.GetBuildsCount()
---@return нет
function avatar.SetActiveBuild(index) end

---Отсылает на сервер информацию, необходимую для продолжения процесса смены класса (набор замен для предметов). Должны быть указаны замены для всех предметов и самоцветов, информация о которых есть в  avatar.GetClassChangerInfo().
---@param changeList table список ObjectId предметов (вещей и самоцветов), выбранных на замену имеющимся у аватара и не совместимых с новым классом; должны быть выбраны из данных, полученных avatar.GetClassChangerInfo() (из каждого списка itemSubstitutions второго уровня вложенности можно указать только один substItemId, аналогично для oneOfEnchantSubstitution); порядок следования не важен; должны быть указаны замены для всех предметов и самоцветов, иначе замена произведена не будет
---@return нет
function avatar.SetClassChangerInfo(changeList) end

---Объявлет квест с заданным QuestId текущим выполняемым квестом.
---@param questId QuestId или nil id квеста, задаваемого как текущий; если nil, то никакой квест не будет текущим
---@return нет
function avatar.SetCurrentQuest(questId) end

---Попытка установить фразу для добивания. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия мыши. То есть на нажатие кнопки.
---@param message string фраза
---@return нет
function avatar.SetFatalityPhrase(message) end

---Включает/выключает автоматическое движение вслед за объектом, являющимся целью на момент вызова.
---@param isFollow boolean если true - включить режим следования, если false - выключить
---@return нет
function avatar.SetFollowTarget(isFollow) end

---Устанавливает активное заклинание для пета аватара.
---@param index integer индекс заклинания
---@return нет
function avatar.SetPetActiveSpell(index) end

---Установливает для пета аватара тип поведения:
function avatar.SetPetAggroMode() end

---Установливает для пета аватара тип движения:
function avatar.SetPetMoveMode() end

---Попытка изменить активный набор ритуальных вещей. Результатом успешной попытки будет событие  EVENT_EQUIPMENT_ACTIVE_PRESET_CHANGED. ВНИМАНИЕ! В пользовательских аддонах есть ограничение: этот метод будет работать только в обработчиках реакции на действия мыши. То есть на нажатие кнопки.
---@param preset number набор
---@return нет
function avatar.SetRitualActivePreset(preset) end

---Задать номер специализации, данные о которой доступны для просмотра.
---@param index integer номер специализации аватара; доступный диапазон - от 0 до величины, на 1 меньшей результата avatar.GetBuildsCount()
---@return нет
function avatar.SetViewedBuild(index) end

---Задает режим движения персонажа: шаг/бег.
---@param walk boolean задать режим ходьбы или бега
---@return нет
function avatar.SetWalkMode(walk) end

---Предлагает другим игрокам группы принять указанное задание. Задание должно быть разделяемым.
---@param questId QuestId идентификатор задания
---@return нет
function avatar.ShareQuest(questId) end

---Визуально показывает/убирает оружие. Циклически переключаются следующие состояния: показать ближнее оружие/показать дальнее оружие/убрать оружие.
---@return нет
function avatar.SheathNext() end

---Необходимо вызывать из скрипта при открытии/закрытии диалога улучшения мета-предметов. Это необходимо для корректого отслеживания закрытия диалога по внутренним причинам ( EVENT_META_UPGRADE_BREAK).
---@param show boolean true, если начали показывать диалог
---@return нет
function avatar.ShowMetaUpgradeDialog(show) end

---Попытка инспектировать игрока. Пользователь может получать экипировку инспектируемой цели. ВНИМАНИЕ! В некоторых MM активностях данная функция недоступна. Проверить доступность можно функцией  avatar.IsInspectAllowed()
---@param unitId ObjectId (not nil) -- идентификатор игрока
---@return нет
function avatar.StartInspect(unitId) end

---Попытка начать взаимодействовать с NPC. В случае успеха придёт EVENT_TALK_STARTED.
---@param unitId ObjectId (not nil) -- идентификатор юнита
---@return нет
function avatar.StartInteract(unitId) end

---Прекратить кастование текущего спелла (действия).
---@return нет
function avatar.StopCasting() end

---Окончание взаимодействия с NPC
---@return нет
function avatar.StopInteract() end

---Насильно останавливает движение аватара игрока в точку (если тот находится в соответствующем режиме).
---@return нет
function avatar.StopMoveToPoint() end

---Пометить талант из базовой таблицы талантов для изучения.
---@param layer integer номер строки
---@param line integer номер столбца
---@return нет
function avatar.StoreBaseTalent(layer, line) end

---Пометить для изучения веху из поля талантов.
---@param field integer номер поля
---@param row integer номер строки
---@param column integer номер столбца
---@return нет
function avatar.StoreFieldTalent(field, row, column) end

---Поменять умения экшен панели местами. Ограничения. Сторонним аддонам запрещено использовать данную функцию пока персонаж игрока находится в бою.
function avatar.SwapActionsInActionPanel() end

---Переключает пользовательский флаг PvP главного игрока.
---@param isOn boolean true, если надо включить PvP флаг
---@return нет
function avatar.SwitchPvPFlag(isOn) end

---Отправляет команду на смену игрового канала зоны. Успешный результат: перемещение аватара на выбранный канал.
---@param channelIndex integer индекс выбранного канала
---@return нет
function avatar.SwitchToChannel(channelIndex) end

---Попытка выбрать своего персонажа в качестве цели. Используется дополнительная цель.
---@return нет
function avatar.TargetSelf() end

---Этим методом даётся ответ на EVENT_TELEPORT_OFFER_REQUEST. Если accept == true, то главный игрок согласен на телепортацию, предложенну. одногруппником.
---@param accept boolean true, если игрок согласен на телепортацию
---@return нет
function avatar.TeleportOfferReply(accept) end

---В ответ на этот запрос, мастер телепорта, с которым разговаривает главный игрок, телепортирует игрока в заданную точку. Идентификатор Точки телепортации должен быть взят из списка точек телепортации, имеющихся у мастера телепорта.
---@param locationId ObjectId идентификатор точки телепортации
---@return нет
function avatar.TeleportToLocation(locationId) end

---Снимает привязку какого-либо действия к слоту экшен панели. Состояние панели сразу сохраняется в Personal/user.cfg. Ограничения. Сторонним аддонам запрещено использовать данную функцию пока персонаж игрока находится в бою.
---@param index integer индекс слота от 0 до max
---@return нет
function avatar.UnBindFromActionPanel(index) end

---Попытка снять указанный предмет.
---@param itemId ObjectId идентификатор предмета
---@return нет
function avatar.UnequipItem(itemId) end

---Попытка снять указанный предмет из в указанную ячейку инвентаря.
---@param itemId ObjectId идентификатор предмета
---@param inventorySlot integer индекс ячейки в инвентаре [0..GetInventorySize() - 1]
---@return нет
function avatar.UnequipItemToSlot(itemId, inventorySlot) end

---Сброс цели у аватара. Сбрасывается дополнительная цель.
---@return нет
function avatar.UnselectTarget() end

---Делает попытку улучшения мета-предмета в ответ на  EVENT_META_DIALOG.
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@param agentId ObjectId идентификатор предмета-агента, требуемого для улучшения
---@param agentCount integer количество используемых агентов
---@return нет
function avatar.UpgradeMetaItem(sourceId, enhancerId, agentId, agentCount) end

---Использовать HearthStone.
---@return нет
function avatar.UseHearthStone() end

---Телепортирует игрока в заданную точку. Идентификатор точки телепортации должен быть взят из списка точек телепортации, имеющихся у аватара (см avatar.GetTeleportLocations()) или из привязки HearthStone (см avatar.GetHearthStoneLocator(), поле locationId).
---@param locationId ObjectId идентификатор точки телепортации
---@return нет
function avatar.UseHearthStoneToLocation(locationId) end

---Попытка использовать предмет в контейнере игрока. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях. 2. Этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши, т.е. на нажатие кнопки.
---@param itemId ObjectId идентификатор предмета
---@return нет
function avatar.UseItem(itemId) end

---Использовать выбранную вещь и выполнить какие-то воздействия сообразно предмету, который применяется.
---@param itemId ObjectId идентификатор предмета (должен иметь парт UseItemAndTakeActions - проверяется itemLib.IsUseItemAndTakeActions( itemId ))
---@param count number количество используемых предметов из стека (по умолчанию - 1)
---@param useAction number индекс (sysIndex) выбранного Usage (по умолчанию - -1)
---@return нет
function avatar.UseItemAndTakeActions(itemId, count, useAction) end

---Использовать выбранную вещь на другой предмет и выполнить какие-то воздействия сообразно предмету, на который вещь применяется.
---@param sourceItemId ObjectId идентификатор предмета, который применяется на другой итем (должен иметь парт UseOnItemAndTakeActions - проверяется itemLib.IsUseOnItemAndTakeActions( itemId ))
---@param targetItemId ObjectId идентификатор предмета, на который отправляется запрос на действие и на котором будут проверяться предикаты
---@param count number количество используемых предметов из стека waitingItemId (по умолчанию - 1)
---@param useAction number индекс (sysIndex) выбранного Usage (по умолчанию - -1)
---@return нет
function avatar.UseItemOnItemAndTakeActions(sourceItemId, targetItemId, count, useAction) end

---Использовать выбранную вещь на маунта и выполнить какие-то воздействия.
---@param itemId ObjectId идентификатор предмета, который применяется на маунта
---@param mountId ObjectId идентификатор маунта, на который будет применятся предмет
---@param useAction number индекс (sysIndex) выбранного Usage (по умолчанию - -1)
---@return нет
function avatar.UseItemOnMountAndTakeActions(itemId, mountId, useAction) end

---Попытка использовать предмет в контейнере игрока на точку на ландшафте. См. также  GamePosition. ВНИМАНИЕ! Для сторонних аддонов есть ограничения: 1. Этот метод недоступен на PvP активностях. 2. Этот метод будет работать только в обработчиках реакции на действия (не перемещение) мыши, т.е. на нажатие кнопки.
---@param itemId ObjectId идентификатор предмета
---@param position таблица GamePosition, точка на ландшафте
---@return нет
function avatar.UseItemOnPoint(itemId, position) end

---Возвращает true, если можно положить предмет в основы агента мета-предметов.
---@param agentId ObjectId идентификатор улучшаемого предмета
---@return нет
function avatar.CanPlaceMetaUpgradeAgent(agentId) end

---Возвращает true, если можно положить предмет в слот улучшителя мета-предметов.
---@param sourceId ObjectId|nil идентификатор улучшаемого предмета, если требуется
---@param enhancerId ObjectId идентификатор предмета-улучшителя
---@return нет
function avatar.CanPlaceMetaUpgradeEnhancer(sourceId, enhancerId) end

---Возвращает true, если можно положить предмет в основы улучшителя мета-предметов.
---@param sourceId ObjectId идентификатор улучшаемого предмета
---@return нет
function avatar.CanPlaceMetaUpgradeSource(sourceId) end

---Возвращает таблицу с информацией о предмете, связанную с крафтами.
---@param itemId ObjectId идентификатор предмета
---@return AvatarGetCraftInfoResult
function avatar.GetCraftInfo(itemId) end

---Задает аргумент слеш-команды для строки ввода.
---@param arg string аргумент команды
function avatar.SetChatInputArg(arg) end

---Назначить цель слеш-команды для строки ввода(для межсервера).
---@param uniqueId UniqueId уникальный идентификатор персонажа
function avatar.SetChatInputTarget(uniqueId) end

---Задает тип слеш-команды (префикс) для строки ввода. Работает только для команд с префиксами. Текст слеш-команды при этом очищается.
---@param sysCmdType string тип команды (ее идентификатор)
function avatar.SetChatInputType(sysCmdType) end
