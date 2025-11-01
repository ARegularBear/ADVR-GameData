function ADVR.onLoad()
	pickup.name = "Lucky Horseshoe"
	pickup.desc = "Subsequent areas will contain more golden chests"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	AddEntries()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	AddEntries()
end

function AddEntries()
	for g in game.worldGeneratorList do 
		local placeEntry = g.wallPlacer.GetPlaceEntry("chest")
		if placeEntry ~= nil then
			placeEntry.possibleObjects = { game.stringToObjectMapper.GetObject(objects.PROP_CHEST_GOLDEN) }
		end
	end
end