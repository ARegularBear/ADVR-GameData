function ADVR.onLoad()
	pickup.name = "Wool Slippers"
	pickup.desc = "Significantly increases evasion"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.EvasionChance.RegisterAddend(pickup.id, 0.2)
end