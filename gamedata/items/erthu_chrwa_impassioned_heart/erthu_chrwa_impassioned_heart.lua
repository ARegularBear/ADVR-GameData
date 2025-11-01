function ADVR.onLoad()
	pickup.name = "Impassioned Heart"
	pickup.desc = "Gain one golden protection but fire"
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
	local enemies = game.GetEnemiesInRadius(8, player.transform.position)
	for v in enemies do
		v.applyEffect(damageType.FIRE, player.PrimaryDamage.GetValueFloat() * 2.5)
		audio.PlaySoundLocal(sounds.SFX_DRAGON_LUNG, player.transform.position)
	end
end