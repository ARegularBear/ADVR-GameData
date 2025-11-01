function ADVR.onLoad()
	pickup.name = "Ominous Fingerprint"
	pickup.desc = "Slightly increases ranged damage"
	pickup.weight = 100
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	helperMethods.RegisterRangedDamageAddend(pickup.id, 1)
end