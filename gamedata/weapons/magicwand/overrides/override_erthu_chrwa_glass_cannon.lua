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

	player.PrimaryDamage.RegisterMultiplier(pickup.id, 2.25)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 2.25)

	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(
		playerRef, 
		colors.CLEAR,
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.835, 0.835, 0.835, 1.000),
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.984, 0.984, 0.984, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.833, 0.833, 0.833, 0.102))
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