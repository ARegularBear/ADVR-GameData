-- OVERRIDE ITEM
function ADVR.onLoad()
	pickup.name = "Fungal Growth"
	pickup.desc = "Projectiles emit damaging particles during flight."
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
end