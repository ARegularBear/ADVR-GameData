function ADVR.onLoad()
    achievement.name = "Empty Belly"
	achievement.desc = "Escape The Ancient Dungeon without consuming any food items."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_FRAGRANCED_LETTER

	CanUnlock = true
	HasEatenFoodKey = "ach_empty_belly_eaten_food"
	achievement.insightReward = 10
end

function ADVR.onDungeonGenerated(worldGenerator)
	if helperMethods.IsInFirstDungeon(worldGenerator) then
		game.SaveBool(HasEatenFoodKey, false)
	end
end

function ADVR.onPlayerDeath() 
	CanUnlock = false
	game.SaveBool(HasEatenFoodKey, true)
end

function ADVR.onFoodEaten()
	CanUnlock = false
	game.SaveBool(HasEatenFoodKey, true)
end

function ADVR.onRunComplete()
	if CanUnlock == true and game.LoadBool(HasEatenFoodKey, false) == false then
		achievement.Unlock()
	end
end
