function ADVR.onLoad()
    achievement.name = "Try Hard with a Vengeance"
	achievement.desc = "Escape The Ancient Dungeon after re-entering three times."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_THRICE_BAKED_BEANS
	achievement.insightReward = 15
end

function ADVR.onRunComplete()
	if player.newGamePlusLevel == 3 then
		achievement.Unlock()
	end
end