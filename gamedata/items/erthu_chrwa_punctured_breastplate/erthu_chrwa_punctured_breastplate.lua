
function ADVR.onLoad()
	pickup.name = "Punctured Breastplate"
	pickup.desc = "Ranged strikes have a chance to do massively more damage"
	pickup.weight = 70
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.tier = 2
	pickup.price = 30
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorTrail(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorTrail(originalPlayerRef)
end

function ColorTrail(playerRef)
	helperMethods.SetTrailColorRanged(playerRef, colors.Create(1.000, 0.000, 0.000, 0.102))
	helperMethods.SetTrailEmissionRanged(playerRef, colors.Create(1.000, 0.000, 0.000, 1.000), 1.174)
end

function ADVR.onRangedHitEntity(hitInfo)
	if hitInfo.entity == nil then
		return hitInfo.damage
	end

	local newDamage = hitInfo.damage
	if helperMethods.IsValidWithLuck(0, 0.20 * pickup.AmountActiveLocal(), 0.1 * pickup.AmountActiveLocal()) then
		newDamage = newDamage * 3
	end
	return newDamage
end
