function ADVR.onLoad()
	pickup.name = "Tortured Heart"
	pickup.desc = "Gain one protection but your stats are lowered as long as its active"
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
	ChangeValues()
end

function ADVR.onEtherealHeartHit(hp, difference)
	ChangeValues()
end

function ChangeValues()
	player.PrimaryDamage.ChangeMultiplier(pickup.id, math.max((1 - player.GetEtherealHealthByType(pickup) * 0.1), 0.2))
	player.SecondaryDamage.ChangeMultiplier(pickup.id, math.max((1 - player.GetEtherealHealthByType(pickup) * 0.1), 0.2))
	player.EvasionChance.ChangeMultiplier(pickup.id, math.max((1 - player.GetEtherealHealthByType(pickup) * 0.1), 0.2))
	player.ShopDiscount.ChangeMultiplier(pickup.id, math.max((1 - player.GetEtherealHealthByType(pickup) * 0.1), 0.2))
	player.PrimaryCritChance.ChangeMultiplier(pickup.id, math.max((1 - player.GetEtherealHealthByType(pickup) * 0.1), 0.2))
	player.SecondaryCritChance.ChangeMultiplier(pickup.id, math.max((1 - player.GetEtherealHealthByType(pickup) * 0.1), 0.2))
end