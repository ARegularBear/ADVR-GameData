function ADVR.onLoad()
	pickup.name = "Rodent Cache"
	pickup.desc = "Gain an assortment of simple items"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	
	if game.runSaveManager.isInLoadRoutine == false then
		local amountCoins = math.random(1, 15)
		local amountKeys = math.random(1, 3)
		local randomFood = math.random(0, 2)
	
		for i=0,amountCoins do
			game.SpawnObjectNetwork(objects.ITEM_COIN, game.playerController.rightHand.transform.position)
		end
		for i=0,amountKeys do
			game.SpawnObjectNetwork(objects.ITEM_KEY, game.playerController.rightHand.transform.position)
		end
	
		if randomFood == 0 then
			game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
		elseif randomFood == 1 then
			game.SpawnObjectNetwork(objects.ITEM_FOOD_STEAK, game.playerController.rightHand.transform.position)
		elseif randomFood == 2 then
			game.SpawnObjectNetwork(objects.ITEM_ORB, game.playerController.rightHand.transform.position)
		end
	end
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end
