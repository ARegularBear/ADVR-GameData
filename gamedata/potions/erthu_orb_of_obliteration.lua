function ADVR.onLoad()
	potion.name = "Orb of Obliteration"
	potion.desc = "Throw to cause an explosion that deals massive damage"
	potion.weight = 10
	potion.effectTime = 0
	potion.price = 60
	potion.spawnsIn = { relicPool.GOLDEN_CHEST, relicPool.SECRET, relicPool.SACRIFICE }
	potion.color = colors.Create(0, 0, 0, 1)
	potion.supportedInMultiplayer = true

	potion.createEffectInstance = false
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance, stateAuthority)
	if stateAuthority then
		local explosion = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, potionObject.transform.position).GetComponent_Explosion_()
		explosion.damage = 100 + (player.PrimaryDamage.GetValueFloat() + player.SecondaryDamage.GetValueFloat()) * 4
	end
end

function ADVR.PotionEvents.onPotionRunOut()
end