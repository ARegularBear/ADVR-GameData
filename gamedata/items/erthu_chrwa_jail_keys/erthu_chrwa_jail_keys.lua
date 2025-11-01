function ADVR.onLoad()
	pickup.name = "Jail Key"
	pickup.desc = "Gain three keys"
	pickup.weight = 100
	pickup.maxAmount = 99
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	player.currentKeys = player.currentKeys + 3
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end