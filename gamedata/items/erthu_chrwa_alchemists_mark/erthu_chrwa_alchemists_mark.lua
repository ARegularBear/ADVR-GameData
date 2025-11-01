function ADVR.onLoad()
	pickup.name = "Alchemist's Mark"
	pickup.desc = "Once charged, use to produce a random orb"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 1
	pickup.amountUses = 14
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local orb = game.SpawnObjectNetwork(objects.ITEM_ORB, game.playerController.rightHand.transform.position)
	orb.GetComponent_StartHoverWhenLowVelocity_().SetDistanceOverGround(1.1, 0)
end