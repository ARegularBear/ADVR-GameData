function ADVR.onLoad()
	pickup.name = "Valued Customer Card"
	pickup.desc = "Drastically increases merchant discount"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.ShopDiscount.RegisterAddend(pickup.id, 0.2)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end