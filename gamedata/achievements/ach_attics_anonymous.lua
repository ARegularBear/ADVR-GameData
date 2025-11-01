function ADVR.onLoad()
    achievement.name = "Attics Anonymous"
	achievement.desc = "Discover a secret room in the ceiling."
	achievement.hideDescription = false
	achievement.entityDeathListeners = {"secret_entrance_ceiling"}
	achievement.unlocksItem = relics.ERTHU_CHRWA_ASCETICS_MARK
	achievement.insightReward = 2
end


function ADVR.onEntityDeath(living, source)
	achievement.Unlock()
end