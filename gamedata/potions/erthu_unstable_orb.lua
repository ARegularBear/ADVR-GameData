function ADVR.onLoad()
	potion.name = "Unstable Orb"
	potion.desc = "Throw to cause an explosion that deals huge amounts of damage."
	potion.weight = 50
	potion.effectTime = 0
	potion.price = 25
	potion.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.SACRIFICE}
	potion.color = colors.Create(0.317,0.266,0.184,1)
	potion.contactDamage = false

	potion.createEffectInstance = false
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance, stateAuthority)
	if stateAuthority then
		local explosion = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, potionObject.transform.position).GetComponent_Explosion_()
		explosion.damage = (player.PrimaryDamage.GetValueFloat() + player.SecondaryDamage.GetValueFloat()) * 3
	end
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
end