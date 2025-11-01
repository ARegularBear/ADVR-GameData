function ADVR.onLoad()
	pickup.name = "Calcified Pustule"
	pickup.desc = "Ranged strikes produce a poisonous cloud, but projectiles are slower"
	pickup.weight = 33
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 40
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end