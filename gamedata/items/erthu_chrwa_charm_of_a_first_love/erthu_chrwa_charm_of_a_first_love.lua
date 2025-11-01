function ADVR.onLoad()
	pickup.name = "Charm of a First Love"
	pickup.desc = "Gain one heart"
	pickup.weight = 100
	pickup.tier = 2
	pickup.maxAmount = 5
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	player.MaxHealth = player.MaxHealth + 2
	player.Health = player.Health + 2
	pickup.RegisterItem()
end