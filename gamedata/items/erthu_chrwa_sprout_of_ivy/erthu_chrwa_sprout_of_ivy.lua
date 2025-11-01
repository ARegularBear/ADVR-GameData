-- OVERRIDE ITEM
function ADVR.onLoad()
	pickup.name = "Sprout of Ivy"
	pickup.desc = "Your melee weapon slowly increases in size and damage, but resets after each strike"
	pickup.weight = 35
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.globalTickDelay = 0.065
	pickup.supportedInMultiplayer = true
end

