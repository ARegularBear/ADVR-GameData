function ADVR.onLoad()
	potion.name = "Orb of Fury"
	potion.desc = "Throw at your feet to temporarily deal increased damage."
	potion.weight = 80
	potion.effectTime = 20
	potion.price = 30
	potion.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP}
	potion.color = colors.Create(0.5,0.137,0.45,1)

	potion.affectsPlayer = true
	potion.affectsEnemies = true
	potion.affectsLiving = false
	potion.breakEffectDistance = 2
	potion.showActiveVignette = true
	potion.createEffectInstance = true
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance)
	for v in effectInstance.affectedEnemies do
		if v ~= nil then
			v.touchDamage = v.touchDamage * 2
		end
	end
end

function ADVR.onPrimaryHitEntity(infos)
	return infos.damage + infos.damage * 0.6 * potion.GetTimesPlayerAffected()
end

function ADVR.onSecondaryHitEntity(infos)
	return infos.damage + infos.damage * 0.6 * potion.GetTimesPlayerAffected()
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
	for v in effectInstance.affectedEnemies do
		if v ~= nil then
			v.touchDamage = v.touchDamage / 2
		end
	end
end