function ADVR.onLoad()
	pickup.name = "Jade Turtleshell"
	pickup.desc = "When hit, gain a brief period of invulnerbility"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 2
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	player.hitCooldown = player.hitCooldown + 1
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.hitCooldown = player.hitCooldown + 1
end