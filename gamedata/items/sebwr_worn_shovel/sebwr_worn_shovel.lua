function ADVR.onLoad()
	pickup.name = "Worn Shovel"
	pickup.desc = "Powerful relics will appear more commonly throughout the dungeon"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 45
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
	game.RegisterForRPCEvents(pickup)
end


function ADVR.onPickup()
	pickup.RegisterItem()
	RemoveLevelOnePickups()
end


function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	RemoveLevelOnePickups()
end


function RemoveLevelOnePickups()
	for pick in game.itemInterpreter.pickupsOnDisk do
		if pick.tier == 1 then
			pick.probability = 0.20
		end
	end
end