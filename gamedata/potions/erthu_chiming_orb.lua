function ADVR.onLoad()
	potion.name = "Chiming Orb"
	potion.desc = "Throw to summon a few helpful wisps"
	potion.weight = 100
	potion.effectTime = 0
	potion.price = 15
	potion.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.SACRIFICE}
	potion.color = colors.Create(201.0/255.0,300.0/255.0,125.0/255.0,1)

	potion.createEffectInstance = false
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(tmpPotion, tmpEffectInstance, stateAuthority)
	if stateAuthority == true then
		game.SpawnCompanionWisp(tmpPotion.transform.position + vector3.__new(0.25, 0, 0))
		game.SpawnCompanionWisp(tmpPotion.transform.position - vector3.__new(0.25, 0, 0))
		game.SpawnCompanionWisp(tmpPotion.transform.position + vector3.__new(0, 0, 0.25))
		game.SpawnCompanionWisp(tmpPotion.transform.position - vector3.__new(0, 0, 0.25))
	end
end

function ADVR.PotionEvents.onPotionRunOut()
end