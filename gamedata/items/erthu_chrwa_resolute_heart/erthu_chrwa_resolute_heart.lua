function ADVR.onLoad()
	pickup.name = "Resolute Heart"
	pickup.desc = "On hit, gain invincibility for a few seconds"
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
	player.networkedInvincible = base.ToNetworkBool(true)
	pickup.CallFunctionIn("RemoveInvincibility", 6)
	player.playerHitEffect.EnableActiveEffect(colors.Create(0.888,0.888,0.999,1))
end

function RemoveInvincibility()
	player.networkedInvincible = base.ToNetworkBool(false)
	player.playerHitEffect.DisableActiveEffect()
end