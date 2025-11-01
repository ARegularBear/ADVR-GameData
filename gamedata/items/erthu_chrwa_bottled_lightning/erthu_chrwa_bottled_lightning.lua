
function ADVR.onLoad()
	pickup.name = "Bottled Lightning"
	pickup.desc = "Projectiles slowly increase in size and damage, but reset after each strike"
	pickup.weight = 44
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.globalTickDelay = 0.05
	pickup.supportedInMultiplayer = true
end
