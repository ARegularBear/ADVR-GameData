function ADVR.onLoad()
	potion.name = "Magma Orb"
	potion.desc = "Throw to fill the ground with magma that sets enemies on fire."
	potion.weight = 100
	potion.effectTime = 0
	potion.price = 25
	potion.spawnsIn = {relicPool.CHEST, relicPool.SHOP,relicPool.SACRIFICE}
	potion.color = colors.Create(0.949, 0.35, 0.01, 1.0)
	potion.contactDamage = false
	potion.createEffectInstance = false
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance, stateAuthority)
	if stateAuthority then
	    game.SpawnObjectNetwork("effect_magma_orb_explosion", potionObject.transform.position)
	end
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
end
