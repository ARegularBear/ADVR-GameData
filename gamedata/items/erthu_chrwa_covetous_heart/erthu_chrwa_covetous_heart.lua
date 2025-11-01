function ADVR.onLoad()
	pickup.name = "Covetous Heart"
	pickup.desc = "Gain one golden protection"
	pickup.weight = 0
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true
	game.RegisterEtherealHeart(pickup)
end

function ADVR.onPickup()
	pickup.RegisterItem()

	if game.runSaveManager.isInLoadRoutine then
		return
	end

	player.AddEtherealHealth(2, pickup)
end

function ADVR.onEtherealHeartHit()
	for i = 1, 7, 1 do
		game.SpawnObjectNetwork(objects.ITEM_COIN, player.transform.position + player.transform.forward)
	end
end