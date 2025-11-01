function ADVR.onLoad()
	potion.name = "Orb of Protection"
	potion.desc = "Throw at your feet to temporarily become invincible."
	potion.weight = 30
	potion.effectTime = 10
	potion.price = 30
	potion.spawnsIn = {relicPool.SECRET,relicPool.SACRIFICE}
	potion.color = colors.Create(0.888,0.888,0.999,1)

	potion.affectsPlayer = true
	potion.affectsEnemies = false
	potion.affectsLiving = true
	potion.breakEffectDistance = 2
	potion.showActiveVignette = true
	potion.createEffectInstance = true
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance)
	if effectInstance.affectedPlayer ~= nil then
		player.networkedInvincible = base.ToNetworkBool(true)
	end

	if effectInstance.affectedLivings ~= nil then
		for v in effectInstance.affectedLivings do
			v.networkedInvincible = base.ToNetworkBool(true)
		end
	end
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
	if potion.GetTimesPlayerAffected() == 0 then
		player.networkedInvincible = base.ToNetworkBool(false)
	end

	if effectInstance.affectedLivings ~= nil then
		for v in effectInstance.affectedLivings do
			if v ~= nil then
				v.networkedInvincible = base.ToNetworkBool(false)
			end
		end
	end
end