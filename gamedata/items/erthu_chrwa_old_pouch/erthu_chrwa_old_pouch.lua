function ADVR.onLoad()
	pickup.name = "Old Pouch"
	pickup.desc = "Gain twenty-five coins"
	pickup.weight = 33
	pickup.tier = 1
	pickup.maxAmount = 99
	pickup.amountUses = -1
	pickup.price = 100
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.currentCash = player.currentCash + 25
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end