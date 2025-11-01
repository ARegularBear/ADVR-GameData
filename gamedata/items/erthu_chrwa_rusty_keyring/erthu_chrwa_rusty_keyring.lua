function ADVR.onLoad()
	pickup.name = "Rusty Keyring"
	pickup.desc = "Enemies may drop keys when destroyed"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	game.dropTableHandler.AddToDropTable(dropTables.BASE_ENEMY, objects.ITEM_KEY, 0.03, 0.025, 0.025, 1, 1)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	game.dropTableHandler.AddToDropTable(dropTables.BASE_ENEMY, objects.ITEM_KEY, 0.03, 0.025, 0.025, 1, 1)
end