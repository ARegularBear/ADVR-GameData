-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Gourmet Selections"
	progress.desc = "<i>More varieties of food can be found in the dungeon</i>"
	progress.price = 40
	progress.predecessor = "progress_marvellous_marks"

	base.preObjectSpawnListeners = {
		game.GetObjectMapping(objects.ITEM_FOOD_APPLE),
		game.GetObjectMapping(objects.ITEM_FOOD_POTATO),
		game.GetObjectMapping(objects.ITEM_FOOD_STEAK),
		game.GetObjectMapping(objects.ITEM_FOOD_DRAGONFRUIT)
	}

	ProbabilityPotatoReplace = 0.60
	ProbabilityAppleReplace = 0.70
	ProbabilitySteakReplace = 0.25
	ProbabilityDragonfruitReplace = 0.0
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPreObjectSpawn(prefab, override)
    -- Apple
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_APPLE) then
        if math.random() < ProbabilityAppleReplace then
            local replacements = {
                game.GetObjectMapping(objects.ITEM_FOOD_PLUM),
                game.GetObjectMapping(objects.ITEM_FOOD_CHEESE),
                game.GetObjectMapping(objects.ITEM_FOOD_PEAR),
                game.GetObjectMapping(objects.ITEM_FOOD_ORANGE)
            }
            -- Randomly pick one replacement
            return replacements[math.random(#replacements)]
        end
    end

    -- Potato
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_POTATO) then
        if math.random() < ProbabilityPotatoReplace then
            local replacements = {
                game.GetObjectMapping(objects.ITEM_FOOD_YAM),
                game.GetObjectMapping(objects.ITEM_FOOD_BEET)
            }
            return replacements[math.random(#replacements)]
        end
    end

    -- Steak
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_STEAK) then
        if math.random() < ProbabilitySteakReplace then
            local replacements = {
                game.GetObjectMapping(objects.ITEM_FOOD_CHICKEN)
            }
            return replacements[math.random(#replacements)]
        end
    end

    -- Dragonfruit
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_DRAGONFRUIT) then
        if math.random() < ProbabilityDragonfruitReplace then
            local replacements = {
            }
            if #replacements > 0 then
                return replacements[math.random(#replacements)]
            end
        end
    end

    return override
end