-- EMPTY BECAUSE ITS AN OVERRIDE ITEM
function ADVR.onLoad()
	pickup.name = "Dead Weight"
	pickup.desc = "Your projectile does significantly more damage, but is larger and slower"
	pickup.weight = 100
	pickup.tier = 3
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end