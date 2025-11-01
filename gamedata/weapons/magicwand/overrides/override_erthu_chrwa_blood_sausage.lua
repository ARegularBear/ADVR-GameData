function ADVR.onLoad()
	pickup.name = "Blood Sausage"
	pickup.desc = "Weapon damage is temporarily increased after destroying an enemy"
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP }
	LastKillTime = 0
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
	helperMethods.UpdateWeaponColorsAll(
		playerRef,
		colors.Create(0.392, 0.035, 0.250, 1.000),
		colors.Create(0.286, 0.024, 0.227, 1.000),
		colors.CLEAR,
		colors.Create(0.576, 0.161, 0.195, 1.000),
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.562, 0.056, 0.148, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.632, 0.066, 0.130, 0.102))
end

function ADVR.onPrimaryHitEntity(infos)
	if time.time - LastKillTime < 5 then
		return infos.damage * 1.1 * pickup.AmountActiveLocal() + 1
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if time.time - LastKillTime < 5 then
		return infos.damage * 1.1 * pickup.AmountActiveLocal() + 1
	end
	return infos.damage
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() and source == player.LocalPlayerRef then
		LastKillTime = time.time
	end
end