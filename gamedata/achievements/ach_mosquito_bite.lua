function ADVR.onLoad()
    achievement.name = "Mosquito Bite"
	achievement.desc = "Damage The Beast for the first time"
	achievement.hideDescription = true
	achievement.unlocksItem = relics.ERTHU_CHRWA_SHARPENED_EAGLE_TALON
	achievement.insightReward = 5
end

function ADVR.onRunComplete()
	achievement.Unlock()
end