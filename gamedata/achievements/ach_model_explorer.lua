function ADVR.onLoad()
    achievement.name = "Model Explorer"
	achievement.desc = "Escape The Ancient Dungeon with a difficulty modifier of 2.25"
	achievement.insightReward = 10
    achievement.unlocksItem = relics.ERTHU_CHRWA_SHEET_MUSIC
end

function ADVR.onRunComplete()
	if player.inHardMode == true and player.GetDifficultyMultiplier() >= 2.25 then
		achievement.Unlock()
	end
end