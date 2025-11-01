function ADVR.onLoad()
	pickup.name = "Heartstring Harp"
	pickup.desc = "Gain a heart of health after completing an area"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 20
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
	player.Heal(2)
end