function ADVR.onLoad()
	pickup.name = "Estate Keys"
	pickup.desc = "Gain ten keys"
	pickup.weight = 44
	pickup.tier = 2
	pickup.maxAmount = 99
	pickup.amountUses = -1
	pickup.price = 40
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	player.currentKeys = player.currentKeys + 10
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end