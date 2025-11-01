function ADVR.onLoad()
    achievement.name = "Antique Antik"
	achievement.desc = "Destroy a Sacrifice Statue."
	achievement.hideDescription = false
	achievement.entityDeathListeners = {"prop_sacrifice_statue"}
	achievement.unlocksItem = relics.ERTHU_CHRWA_PENITENTS_MARK
	achievement.insightReward = 2
end

function ADVR.onEntityDeath(living, source)
	achievement.Unlock()
end