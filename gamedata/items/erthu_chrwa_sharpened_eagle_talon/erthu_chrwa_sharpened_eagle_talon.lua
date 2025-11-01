
function ADVR.onLoad()
	pickup.name = "Sharpened Eagle Talon"
	pickup.desc = "Projectiles seek their target"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 3
	pickup.price = 60
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end