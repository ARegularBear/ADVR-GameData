function ADVR.onLoad()
	pickup.name = "Velvet Purse"
	pickup.desc = "Gain one hundred coins"
	pickup.weight = 30
	pickup.maxAmount = 99
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 100
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.currentCash = player.currentCash + 100
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end