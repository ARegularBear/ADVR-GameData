function ADVR.onLoad()
    achievement.name = "Jackpot!"
	achievement.desc = "Win big on The Merchant's slot machine."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_LUCKY_HORSESHOE
	achievement.insightReward = 5
end

function ADVR.onPlayerDeath(playerLiving)
	if game.LoadBool("ach_hit_jackpot", false) == true then
		achievement.Unlock()
	end
end

function ADVR.onRunComplete()
	if game.LoadBool("ach_hit_jackpot", false) == true then
		achievement.Unlock()
	end
end