function ADVR.onLoad()
	pickup.name = "Bee Stinger"
	pickup.desc = "Slightly increases melee damage, but decreases the size of your melee weapon"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	-- HAS OVERRIDE
end
