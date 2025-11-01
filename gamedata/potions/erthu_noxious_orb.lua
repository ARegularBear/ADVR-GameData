function ADVR.onLoad()
	potion.name = "Noxious Orb"
	potion.desc = "Throw to release a cloud of poisonous gas."
	potion.weight = 100
	potion.effectTime = 0
	potion.price = 15
	potion.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.SACRIFICE}
	potion.color = colors.Create(53.0/255.0, 112.0/255.0, 26.0/255.0,1)
	potion.contactDamage = false
	potion.supportedInMultiplayer = true
	potion.createEffectInstance = false
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance, stateAuthority)
    local cloud = game.SpawnObjectLocal(objects.EFFECT_POISONOUS_GAS, potionObject.transform.position)
    cloud.transform.localScale = vector3.__new(6, 6, 6)
	local dmgArea = cloud.GetComponent_DamageArea_()

	dmgArea.playerImmune = true

	if stateAuthority then
		dmgArea.enemiesImmune = false
		dmgArea.damage = (player.PrimaryDamage.GetValueFloat() + player.SecondaryDamage.GetValueFloat()) * 0.4
	else
		dmgArea.enabled = false
	end
end

function ADVR.PotionEvents.onPotionRunOut()

end