function ADVR.onLoad()
	pickup.name = "Lost Lodestone"
	pickup.desc = "Either melee or ranged damage slightly increases after completing an area"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.PODEST, relicPool.SHOP}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if math.random(0, 1) == 0 then
		player.PrimaryDamage.RegisterAddend(pickup.id, 1)
	else
		player.SecondaryDamage.RegisterAddend(pickup.id, 1)
	end
end