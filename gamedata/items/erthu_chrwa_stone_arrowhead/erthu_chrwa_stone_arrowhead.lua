function ADVR.onLoad()
	pickup.name = "Stone Arrowhead"
	pickup.desc = "Drastically increases weapon damage against flying enemies"
	pickup.weight = 25
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SPECIAL }
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsGrounded(true) == false then
			return infos.damage * 1.75
		end
	end

	return infos.damage
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsGrounded(true) == false then
			return infos.damage * 1.4
		end
	end

	return infos.damage
end