function ADVR.onLoad()
	pickup.name = "Calcified Pustule"
	pickup.desc = "Ranged strikes produce a poisonous cloud, but projectiles are slower"
	pickup.globalTickDelay = 0.1
	pickup.supportedInMultiplayer = true
	SlowdownFactor = 0.35
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorWeapons(player.LocalPlayerRef)
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().dealsHitDamage = false
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().explosionRadius = 0.0
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed * SlowdownFactor
    game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed * SlowdownFactor
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(
		playerRef,
		colors.Create(0.392, 0.090, 0.157, 1.000),
		colors.Create(0.286, 0.029, 0.029, 1.000),
		colors.CLEAR,
		colors.Create(0.835, 0.000, 0.000, 1.000),
		colors.Create(0.490, 0.213, 0.305, 1.000),
		colors.Create(0.729, 0.116, 0.338, 1.000),
		colors.Create(0.984, 0.295, 0.295, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.777, 0.163, 0.212, 0.102))
end

function ADVR.onRangedWeaponCollide(knife, collision)
	local explosion = game.SpawnObjectNetwork(objects.EFFECT_CALCIFIED_PUSTULE, knife.transform.position).GetComponent_Explosion_()
	explosion.damage = player.GetPrimaryDamageWithPickupModifiers() * 0.7
	explosion.damagePlayer = false
	explosion.enableCritChance = true
	explosion.damagesEnemies = true
end