function ADVR.onLoad()
    achievement.name = "Show Off"
	achievement.desc = "Escape the dungeon without obtaining any upgrade items."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_POTLUCK_LADLE
	achievement.insightReward = 10
end

function ADVR.onRunComplete()
	if game.itemInterpreter.TotalPickupsFoundInRunByAllPlayers() == 0 then
		achievement.Unlock()
	end
end