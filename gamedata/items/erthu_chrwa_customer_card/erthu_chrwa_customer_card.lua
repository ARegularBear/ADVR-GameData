function ADVR.onLoad()
	pickup.name = "Customer Card"
	pickup.desc = "Moderately increases merchant discount"
	pickup.weight = 60
	pickup.maxAmount = 7
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.ShopDiscount.RegisterAddend(pickup.id, 0.1)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end