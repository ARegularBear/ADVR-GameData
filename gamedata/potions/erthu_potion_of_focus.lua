function ADVR.onLoad()
	potion.name = "Orb of Focus"
	potion.desc = "Throw at your feet to temporarily slow the world around you."
	potion.weight = 70
	potion.effectTime = 10
	potion.price = 30
	potion.spawnsIn = {relicPool.CHEST, relicPool.SHOP}
	potion.color = colors.Create(0.6,0.2,0.00,1)

	potion.affectsPlayer = true
	potion.affectsEnemies = true
	potion.affectsLiving = false
	potion.breakEffectDistance = 2
	potion.showActiveVignette = true
	potion.createEffectInstance = true
	potion.supportedInMultiplayer = false
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance)
	if effectInstance.affectedPlayer ~= nil then
		player.PlayBulletTimeSoundEffect()
		time.timeScale = 0.5
	end
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
	if potion.GetTimesPlayerAffected() == 0 then
		time.timeScale = 1.0
	end
end