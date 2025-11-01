function ADVR.onLoad()
	pickup.name = "Broken Shackle"
	pickup.desc = "Pots have a small chance of containing keys"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	game.dropTableHandler.AddToDropTable(dropTables.PROP_POT, objects.ITEM_KEY, 0.01, 0.01, 0.01, 1, 2)
end

function ADVR.onPickup()
	pickup.RegisterItem()
	game.dropTableHandler.AddToDropTable(dropTables.PROP_POT, objects.ITEM_KEY, 0.01, 0.01, 0.01, 1, 2)
end