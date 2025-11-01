function ADVR.onLoad()
	pickup.name = "Hat Buckle"
	pickup.desc = "Pots are more likely to contain coins"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	game.dropTableHandler.AddToDropTable(objects.PROP_POT, objects.ITEM_COIN, 0.25, 0.125, 0.125, 1, 2)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	game.dropTableHandler.AddToDropTable(objects.PROP_POT, objects.ITEM_COIN, 0.25, 0.125, 0.125, 1, 2)
end