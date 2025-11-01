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
	helperMethods.UpdateWeaponColorsAll(playerRef, colors.Create(0.347, 0.094, 0.094, 1.000), colors.Create(0.347, 0.094, 0.094, 1.000), colors.Create(0.347, 0.094, 0.094, 1.000), colors.Create(0.347, 0.094, 0.094, 1.000), colors.Create(0.707, 0.669, 0.088, 1.000), colors.Create(0,0,0,0), colors.Create(0,0,0,0))
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.000, 0.000, 0.102))
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsAbberrant() then
		return infos.damage * 1.75 * pickup.AmountActiveLocal()
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsAbberrant() then
		return infos.damage * 1.75 * pickup.AmountActiveLocal()
	end
	return infos.damage
end