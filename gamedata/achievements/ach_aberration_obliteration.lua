function ADVR.onLoad()
    achievement.name = "Aberration Obliteration"
	achievement.desc = "Defeat one hundred aberrant enemies."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_HOLY_UNDERWEAR
	achievement.insightReward = 3
end

function ADVR.onEntityDeath(living, source)
	if source == player.LocalPlayerRef and living.IsAbberrant() then

		-- Fallback to convert old statistic to new system
		local killed = game.LoadInt("ach_champions_killed", 0)
		game.playerStatistics.SetHighLowScore(statistic.TOTAL_AMOUNT_OF_ABERRANT_ENEMIES_KILLED, killed)
		if game.playerStatistics.GetStatistic(statistic.TOTAL_AMOUNT_OF_ABERRANT_ENEMIES_KILLED) >= 100 then
			achievement.Unlock()
		end
	end
end

