function ADVR.onLoad()
	pickup.name = "Bloody Fingerprint"
	pickup.desc = "Slightly increases ranged critical chance"
	pickup.weight = 50
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	helperMethods.RegisterRangedCritAddend(pickup.id, 0.05)
end