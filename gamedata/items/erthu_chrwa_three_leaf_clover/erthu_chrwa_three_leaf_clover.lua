function ADVR.onLoad()
	pickup.name = "Three Leaf Clover"
	pickup.desc = "Slightly increases your luck."
	pickup.weight = 100
	pickup.maxAmount = 10
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.CHEST}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.Luck.RegisterAddend(pickup.id, 0.1)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end
