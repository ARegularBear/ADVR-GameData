function ADVR.onLoad()
	pickup.name = "Warthog Underbelly"
	pickup.desc = "Significantly increases weapon damage, but incoming damage is also increased"
	pickup.weight = 50
	pickup.tier = 2
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	helperMethods.RegisterMeleeDamageMultiplier(pickup.id, 1.7)
	helperMethods.RegisterRangedDamageMultiplier(pickup.id, 1.5)
	pickup.RegisterItem()
	ColorTrail(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorTrail(originalPlayerRef)
end

function ColorTrail(playerRef)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.000, 0.000, 0.102))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(1.000, 0.000, 0.000, 1.000), 1.174)
end

function ADVR.onPlayerHit(damage)
	return damage + 1
end
