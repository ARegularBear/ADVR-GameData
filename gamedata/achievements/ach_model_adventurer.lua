function ADVR.onLoad()
    achievement.name = "Model Adventurer"
	achievement.desc = "Escape The Ancient Dungeon with a difficulty modifier of 3.00"
	achievement.insightReward = 10
end

function ADVR.onRunComplete()
	if player.inHardMode == true and player.GetDifficultyMultiplier() >= 3.0 then
		achievement.Unlock()
	end
end