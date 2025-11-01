function ADVR.onLoad()
    achievement.name = "Un-parry-leled"
	achievement.desc = "Defeat a Possessed Armor."
	achievement.hideDescription = false
	achievement.entityDeathListeners = {"enemy_fg_possessed_armor"}
	achievement.unlocksItem = relics.ERTHU_CHRWA_BARGAIN_SIGNED_IN_BLOOD
	achievement.insightReward = 3
end

function ADVR.onEntityDeath(living, source)
	achievement.Unlock()
end