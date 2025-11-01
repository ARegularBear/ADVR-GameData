function ADVR.onLoad()
    achievement.name = "Overstuffed"
	achievement.desc = "Eat every tier of food during a single delve."
	achievement.hideDescription = false
	achievement.unlocksItem = "erthu_chrwa_cinched_belt"
	
	SaveKeyEatPotato = "overstuffed_eat_potato"
	SaveKeyEatApple = "overstuffed_eat_apple"
	SaveKeyEatSteak = "overstuffed_eat_steak"
	SaveKeyEatDragonfruit = "overstuffed_eat_dragonfruit"
	
	achievement.insightReward = 7
end

function ADVR.onDungeonGenerated(worldGenerator)
	if helperMethods.IsInFirstDungeon(worldGenerator) then
		game.SaveBool(SaveKeyEatPotato, false)
		game.SaveBool(SaveKeyEatApple, false)
		game.SaveBool(SaveKeyEatSteak, false)
		game.SaveBool(SaveKeyEatDragonfruit, false)
	end
end

function ADVR.onFoodEaten(food)
	local id = food.livingBase.livingId
	if id == objects.ITEM_FOOD_POTATO or id == objects.ITEM_FOOD_YAM or id == objects.ITEM_FOOD_BEET then
		game.SaveBool(SaveKeyEatPotato, true)
	elseif id == objects.ITEM_FOOD_APPLE or id == objects.ITEM_FOOD_PLUM or id == objects.ITEM_FOOD_PEAR or id == objects.ITEM_FOOD_ORANGE then
		game.SaveBool(SaveKeyEatApple, true)
	elseif id == objects.ITEM_FOOD_STEAK or id == objects.ITEM_FOOD_CHICKEN then
		game.SaveBool(SaveKeyEatSteak, true)
	elseif id == objects.ITEM_FOOD_DRAGONFRUIT then
        game.SaveBool(SaveKeyEatDragonfruit, true)
	end

	if game.LoadBool(SaveKeyEatPotato, false) == true and game.LoadBool(SaveKeyEatApple, false) == true and game.LoadBool(SaveKeyEatSteak, false) == true and game.LoadBool(SaveKeyEatDragonfruit, false) == true then
		achievement.Unlock()
	end
end