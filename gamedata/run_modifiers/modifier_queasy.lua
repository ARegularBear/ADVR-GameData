function ADVR.onLoad()
	modifier.name = "Queasy"
	modifier.desc = "You only encounter simple food items"
    modifier.modifierHint = "#"
    modifier.maxLevel = 2
    modifier.difficultyPerLevel = 0.15
end

function ADVR.ModifierEvents.getFinalValue()
	if modifier.CurrentLevel == 0 then
        return "None"
    elseif modifier.CurrentLevel == 1 then
        return "Apples"
    elseif modifier.CurrentLevel == 2 then
        return "Potatoes"
    end
    return "None"
end

function ADVR.onDungeonGenerated(worldGenerator)
    if helperMethods.IsInFirstDungeon(worldGenerator) or game.runSaveManager.isInLoadRoutine then
        if modifier.CurrentLevel == 1 then
            base.AddPreObjectSpawnListenersRuntimeByStrings({objects.ITEM_FOOD_DRAGONFRUIT, objects.ITEM_FOOD_STEAK, objects.ITEM_FOOD_CHICKEN, objects.ITEM_FOOD_CHEESE})
        elseif modifier.CurrentLevel == 2 then
            base.AddPreObjectSpawnListenersRuntimeByStrings({objects.ITEM_FOOD_DRAGONFRUIT, objects.ITEM_FOOD_STEAK, objects.ITEM_FOOD_APPLE, objects.ITEM_FOOD_PEAR, objects.ITEM_FOOD_CHEESE, objects.ITEM_FOOD_CHICKEN, objects.ITEM_FOOD_ORANGE, objects.ITEM_FOOD_PLUM})
        end
    end
end

function ADVR.onPreObjectSpawn(prefab, override, position, rotation)
    if modifier.CurrentLevel == 1 then
        return game.stringToObjectMapper.GetObject(objects.ITEM_FOOD_APPLE)
    elseif modifier.CurrentLevel == 2 then
        return game.stringToObjectMapper.GetObject(objects.ITEM_FOOD_POTATO)
    end
    return nil
end