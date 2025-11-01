function ADVR.onLoad()
	pickup.name = "Penny Whistle"
	pickup.desc = "Gain twenty coins after completing an area"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if game.IsHost() then
		player.currentCash = player.currentCash + 20
	end
end
