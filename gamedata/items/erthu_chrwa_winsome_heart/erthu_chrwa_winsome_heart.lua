function ADVR.onLoad()
	pickup.name = "Winsome Heart"
	pickup.desc = "Gain one protection and charm shopkeepers for lesser prices"
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

	player.ShopDiscount.ChangeAddend(pickup.id, player.GetEtherealHealthByType(pickup) * 0.15)
end

function ADVR.onEtherealHeartHit(hp, difference)
	player.ShopDiscount.ChangeAddend(pickup.id, player.GetEtherealHealthByType(pickup) * 0.15)
end