function ADVR.onLoad()
	pickup.name = "Myopic Lens"
	pickup.desc = "Spell and Incantation damage alternates between high and low values, but averages higher overall."
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.BOSS }
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
	local randomValue = 0.3 + (2.0 - 0.15) * math.random()
	return infos.damage * randomValue
end

function ADVR.onSecondaryHitEntity(infos)
	local randomValue = 0.3 + (2.0 - 0.15) * math.random()
	return infos.damage * randomValue
end