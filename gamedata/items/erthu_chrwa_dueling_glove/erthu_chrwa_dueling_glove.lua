
function ADVR.onLoad()
	pickup.name = "Dueling Gloves"
	pickup.desc = "Significantly increases weapon damage against undamaged enemies"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 40
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.MaxHealth == infos.entity.Health then
		return infos.damage * 1.15 * pickup.AmountActiveLocal() + 2
	end

	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.MaxHealth == infos.entity.Health then
		return infos.damage * 1.15 * pickup.AmountActiveLocal() + 2
	end

	return infos.damage
end