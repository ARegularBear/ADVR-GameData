function ADVR.onLoad()
	pickup.name = "Holy Underwear"
	pickup.desc = "Drastically increases weapon damage against aberant enemies"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 40
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SPECIAL }
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.715, 0.114, 0.289, 0.102))
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsAbberrant() then
		return infos.damage * 1.55 * pickup.AmountActiveLocal()
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsAbberrant() then
		return infos.damage * 1.55 * pickup.AmountActiveLocal()
	end
	return infos.damage
end