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
		colors.Create(0.240, 0.000, 0.000, 1.000),
		colors.Create(0.290, 0.000, 0.000, 1.000),
		colors.Create(0.130, 0.000, 0.000, 1.000),
		colors.Create(0.340, 0.000, 0.000, 1.000),
		colors.Create(0.500, 0.145, 0.145, 1.000),
		colors.CLEAR,
		colors.CLEAR
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.170, 0.170, 0.347))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(0.000, 0.000, 0.000, 0.904), 0.000)
end

function ADVR.onPrimaryHitEntity(infos)
	if time.time - LastKillTime < 5 then
		return infos.damage * 1.1 * pickup.AmountActiveLocal() + 2 
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if time.time - LastKillTime < 5 then
		return infos.damage * 1.1 * pickup.AmountActiveLocal() + 2
	end
	return infos.damage
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() and source == player.LocalPlayerRef then
		LastKillTime = time.time
	end
end