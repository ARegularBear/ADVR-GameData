function ADVR.onLoad()
	pickup.name = "Bamboo Firecracker"
	pickup.desc = "Your projectile strikes cause an explosion"
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	CrossbowBoltRef = game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt
	CrossbowBoltRef.explodeDistance = 18
	CrossbowBoltRef.spawnExplosion = false
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsRanged(playerRef, colors.Create(0.550, 0.118, 0.060, 1.000), colors.Create(0.550, 0.118, 0.060, 1.000), colors.Create(0.550, 0.118, 0.060, 1.000), colors.Create(0.550, 0.118, 0.060, 1.000), colors.Create(0.732, 0.392, 0.109, 1.000), colors.Create(0.790, 0.582, 0.122, 1.000), colors.Create(0.950, 0.923, 0.070, 1.000))
	helperMethods.SetTrailColorRanged(playerRef, colors.Create(1.000, 0.642, 0.024, 0.317))
	helperMethods.SetTrailEmissionRanged(playerRef, colors.Create(1.000, 1.000, 0.059, 1.000), 1.381)
end

function ADVR.onRangedWeaponCollide(knife, collision)
	-- special case for chests, which should just open naturally 
	local living = collision.gameObject.GetComponent_LivingBase_()
	if living ~= nil and string.find(living.livingId, "prop_chest_") then
		living.DoHit(player.networkObject, 1, damageType.PLAYER_SECONDARY_NO_KNOCKBACK, vector3.__new(0,0,0), false)
		return
	end

	local expl = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, CrossbowBoltRef.transform.position).GetComponent_Explosion_()
	expl.damage = player.GetPrimaryDamageWithPickupModifiers() * 1.2
	expl.damagePlayer = false
	expl.damagesEnemies = true
	expl.enableCritChance = true
end