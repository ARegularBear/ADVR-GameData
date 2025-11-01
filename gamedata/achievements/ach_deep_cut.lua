function ADVR.onLoad()
    achievement.name = "Deep Cut"
	achievement.desc = "Deal at least twenty-five damage with a single strike."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_WARTHOG_UNDERBELLY
	achievement.priority = -1000 -- make this so it runs last in the execution of onSwordHit events so we have the final damage we can check for
	achievement.insightReward = 2
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.damage >= 25 then
		achievement.Unlock()
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.damage >= 25 then
		achievement.Unlock()
	end
	return infos.damage
end