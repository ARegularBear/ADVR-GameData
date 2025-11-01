function ADVR.onLoad()
	pickup.name = "Ginseng Root"
	pickup.desc = "Gain 5 Insight"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
    player.Insight = player.Insight + 5
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
    player.Insight = player.Insight + 5
end