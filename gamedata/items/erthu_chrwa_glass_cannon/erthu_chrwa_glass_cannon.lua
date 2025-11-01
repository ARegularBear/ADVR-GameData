function ADVR.onLoad()
	pickup.name = "Glass Cannon"
	pickup.desc = "Massively increases weapon damage, but your maximum number of hearts cannot exceed one"
	pickup.weight = 33
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
	player.PrimaryDamage.ClearMultiplier(pickup.id)
	player.SecondaryDamage.ClearMultiplier(pickup.id)

	player.MaxHealth = OldMaxHealth
end

function ADVR.onPickup()
	pickup.RegisterItem()

	OldMaxHealth = player.MaxHealth

	player.MaxHealth = 2
	player.Health = 2
	player.RemoveEtherealHealth(99)

	player.PrimaryDamage.RegisterMultiplier(pickup.id, 2.5)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 2.5)

	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(playerRef, colors.Create(0.180, 0.180, 0.180, 1.000), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.500, 0.500, 0.500, 1.000), colors.Create(0.720, 0.720, 0.720, 1.000), colors.Create(0.880, 0.880, 0.880, 1.000))
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 1.000, 1.000, 0.527))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(1.000, 1.000, 1.000, 0.000), 0.715)
end

function ADVR.onPlayerValueChanged(val)
    if val == "etherealHealth" and player.EtherealHealth > 0 then
		player.RemoveEtherealHealth(player.EtherealHealth, false)
		player.MaxHealth = 2
	elseif val == "health" then
		if player.MaxHealth > 2 then
			player.MaxHealth = 2
		end
		if player.Health > 2 then
			player.Health = 2
		end
	end
end