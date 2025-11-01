function ADVR.onLoad()
    achievement.name = "Try Hard"
	achievement.desc = "Escape The Ancient Dungeon after re-entering once."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_VIAL_OF_BLUE_BLOOD
	achievement.insightReward = 7
end

function ADVR.onRunComplete()
	if player.newGamePlusLevel == 1 then
		achievement.Unlock()
	end
end