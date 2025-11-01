function ADVR.onLoad()
    achievement.name = "Try Harder"
	achievement.desc = "Escape The Ancient Dungeon after re-entering twice."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_TWICE_BAKED_BEANS
	achievement.insightReward = 11
end

function ADVR.onRunComplete()
	if player.newGamePlusLevel == 2 then
		achievement.Unlock()
	end
end