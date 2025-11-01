function ADVR.onLoad()
	pickup.name = "Bamboo Firecracker"
	pickup.desc = "Your projectile strikes cause an explosion"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 60
	pickup.tier = 3
	pickup.priority = -75
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
end
