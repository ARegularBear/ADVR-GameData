-- EMPTY BECAUSE ITS AN OVERRIDE ITEM
function ADVR.onLoad()
	pickup.name = "Possessed Hammer"
	pickup.desc = "Increases the size of your melee weapon"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.CHEST, relicPool.PODEST}
end

function ADVR.onPickup()
	pickup.RegisterItem()
	-- HAS OVERRIDE
end