function ADVR.onLoad()
	pickup.name = "Slimy I.O.U."
	pickup.desc = "Food in rest areas are replaced with relics"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.preObjectSpawnListeners = {game.stringToObjectMapper.GetObject(objects.ITEM_PODEST_FOOD_AFTER_BOSS)}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPreObjectSpawn(prefab, obj, position)
	if game.IsPlayerWhoStartedRun() then
		return game.stringToObjectMapper.GetObject(objects.ITEM_PODEST_CHOOSE_ONE)
	end
	return obj
end