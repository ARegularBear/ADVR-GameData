function ADVR.onLoad()
    achievement.name = "Spoilsport"
	achievement.desc = "Defeat a boss enemy with a single strike."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_FUNGAL_GROWTH
	achievement.priority = -1000
	achievement.insightReward = 5
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsBoss() then
		if infos.entity.MaxHealth <= infos.damage then
			achievement.Unlock()
		end
	end

	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsBoss() then
		if infos.entity.MaxHealth <= infos.damage then
			achievement.Unlock()
		end
	end

	return infos.damage
end