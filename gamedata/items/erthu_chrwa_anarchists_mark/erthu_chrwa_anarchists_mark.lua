function ADVR.onLoad()
	pickup.name = "Anarchist's Mark"
	pickup.desc = "Once charged, use to cause an explosion"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 1
	pickup.amountUses = 8
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, game.playerController.rightHand.transform.position)
end