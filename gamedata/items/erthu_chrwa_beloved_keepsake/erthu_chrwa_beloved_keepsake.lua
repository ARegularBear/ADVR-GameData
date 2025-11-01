function ADVR.onLoad()
	pickup.name = "Beloved Keepsake"
	pickup.desc = "Gain one protection"
	pickup.weight = 100
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP}
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
end