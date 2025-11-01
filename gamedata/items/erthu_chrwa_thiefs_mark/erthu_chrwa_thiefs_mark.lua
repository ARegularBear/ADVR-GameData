function ADVR.onLoad()
	pickup.name = "Thief's Mark"
	pickup.desc = "Once charged, use to gain a random relic"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.amountUses = 35
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, game.playerController.rightHand.transform.position)
end