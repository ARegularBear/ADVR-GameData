function ADVR.onLoad()
	pickup.name = "Gold Tooth"
	pickup.desc = "Slightly increases melee damage"
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
	
	helperMethods.RegisterMeleeDamageAddend(pickup.id, 1)
end