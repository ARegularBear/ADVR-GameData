function ADVR.onLoad()
	pickup.name = "Weak Link"
	pickup.desc = "Slightly increases evasion"
	pickup.weight = 70
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)
end