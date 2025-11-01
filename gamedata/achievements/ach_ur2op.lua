function ADVR.onLoad()
    achievement.name = "UR2OP"
	achievement.desc = "Acquire three highly powerful items during a single delve."
	achievement.hideDescription = false
	achievement.worksOnLoadedRun = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_WHIPPING_TOY
	Tier3Found = 0
	achievement.insightReward = 5
end

function ADVR.onPickupTaken(pickup)
	if pickup.rolledItem.tier == 3 then
		Tier3Found = Tier3Found + 1
		if Tier3Found == 3 then
			achievement.Unlock()
		end
	end
end