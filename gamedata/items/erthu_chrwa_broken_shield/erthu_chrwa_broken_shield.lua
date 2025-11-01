function ADVR.onLoad()
	pickup.name = "Broken Shield"
	pickup.desc = "Massively increases critical chance, but incoming damage is sometimes increased"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS}
	HitCounter = 0
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
	player.PrimaryCritChance.ClearAddend(pickup.id)
	player.SecondaryCritChance.ClearAddend(pickup.id)
end

function ADVR.onPickup()
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.45)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.30)

	pickup.RegisterItem()
	ColorWeapons(player.LocalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.000, 0.000, 0.102))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(1.000, 0.000, 0.000, 1.000), 1.174)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ADVR.onPlayerHit(damage)
	HitCounter = HitCounter + 1
	if HitCounter % 2 == 0 then
		return damage + 1
	else
		return damage
	end
end