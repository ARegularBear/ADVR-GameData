function ADVR.onLoad()
	pickup.name = "Berserker's Mark"
	pickup.desc = "Once charged, use to temporarily increase critical chance"
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.amountUses = 25
	pickup.isActivateItem = true
	pickup.tier = 2
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	player.PrimaryCritChance.RegisterAddend(pickup.id, 1.0)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 1.0)
	pickup.CallFunctionIn("ActiveTearOff", 10.0)
end

function ActiveTearOff()
	player.PrimaryCritChance.ClearAddend(pickup.id)
	player.SecondaryCritChance.ClearAddend(pickup.id)
end
