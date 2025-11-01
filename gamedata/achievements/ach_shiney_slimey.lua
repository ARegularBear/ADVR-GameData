function ADVR.onLoad()
    achievement.name = "Shiney Slimey"
	achievement.desc = "Defeat a Golden Slime."
	achievement.hideDescription = false
	achievement.entityDeathListeners = {"enemy_slime_golden"}
	achievement.unlocksItem = "cosmetic:17" -- Crown
	achievement.insightReward = 5
end

function ADVR.onEntityDeath(living, source)
	if source == player.LocalPlayerRef then
		achievement.Unlock()
	end
end