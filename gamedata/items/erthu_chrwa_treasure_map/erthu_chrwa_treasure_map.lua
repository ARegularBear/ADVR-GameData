function ADVR.onLoad()
	pickup.name = "Treasure Map"
	pickup.desc = "Subsequent areas will contain more chests"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end
	
function ADVR.onPickup()
	pickup.RegisterItem()
	IncreaseChests()
end

function IncreaseChests()
	for g in game.worldGeneratorList do 
		local placeEntry = g.wallPlacer.GetPlaceEntry(relicPool.CHEST)
		if placeEntry ~= nil then
			placeEntry.minDistBetweenSpawns = placeEntry.minDistBetweenSpawns - 3
		end
	end
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	IncreaseChests()
end