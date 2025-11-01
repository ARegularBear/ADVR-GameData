function ADVR.onLoad()
	pickup.name = "Overstock Flyer"
	pickup.desc = "Merchants offer another item for sale after one is purchased"
	pickup.weight = 100
	pickup.tier = 2
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.SPECIAL}
	TimesRespawned = 0
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onItemBought(item, pos)
	TimesRespawned = TimesRespawned + 1
	pickup.CallFunctionIn("Respawn", 1.5, pos)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function Respawn(position)
	game.SpawnObjectNetwork(objects.SHOP_BUY_AREA, position)
end