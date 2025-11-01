function ADVR.onLoad()
	pickup.name = "Promotional Flyer"
	pickup.desc = "The next merchant visited will offer a free item"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 99
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	player.networkedFreeStoreItems = player.networkedFreeStoreItems + 1
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end