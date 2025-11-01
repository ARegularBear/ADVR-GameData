function ADVR.onLoad()
	pickup.name = "Bloodshot Eye"
	pickup.desc = "Moderately increases weapon damage, but decreases your number of hearts"
	pickup.weight = 100
	pickup.maxAmount = 10
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	-- do nothing when using blue blood
	if game.itemInterpreter.AmountPickupFoundByLocalPlayer(relics.ERTHU_CHRWA_VIAL_OF_BLUE_BLOOD) > 0 then
		return
	end

	if player.newGamePlusLevel < 3 then
		if player.MaxHealth >= 2 then
			player.MaxHealth = player.MaxHealth - 2
		else
			player.RemoveEtherealHealth(2)
		end
		player.Health = math.max(0, math.min(player.MaxHealth, player.Health))
		
		if player.RealHealth <= 0 then
			player.OnDeath()
		end
	end

	player.PrimaryDamage.RegisterAddMult(pickup.id, 3, 1.1)
	player.SecondaryDamage.RegisterAddMult(pickup.id, 2, 1.1)

	ColorTrail(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorTrail(originalPlayerRef)
end

function ColorTrail(playerRef)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.000, 0.000, 0.102))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(1.000, 0.000, 0.000, 1.000), 1.174)
end
