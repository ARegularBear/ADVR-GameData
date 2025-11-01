function ADVR.onLoad()
	pickup.name = "Withered Sapling"
	pickup.desc = "Pots may contain apples"
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
	game.dropTableHandler.AddToDropTable(dropTables.PROP_POT, objects.ITEM_FOOD_APPLE, 0.02, 0.01, 0.02, 1, 2)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	game.dropTableHandler.AddToDropTable(dropTables.PROP_POT, objects.ITEM_FOOD_APPLE, 0.02, 0.01, 0.02, 1, 2)
end