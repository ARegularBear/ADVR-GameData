function ADVR.onLoad()
    achievement.name = "Unerring Daring"
	achievement.desc = "Strike enemies with a ranged weapon twenty-five times in a row without missing."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_NEEDLE_OF_OROBOROUS
	TimesHit = 0
	achievement.insightReward = 5
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	TimesHit = TimesHit + 1

	if TimesHit >= 25 then
		achievement.Unlock()
	end
	return infos.damage
end

function ADVR.onRangedWeaponCollide(knife,collision)
	local enemy = collision.transform.gameObject.GetComponent_EnemyBase_()
	if enemy == nil then
		TimesHit = 0
	end
end