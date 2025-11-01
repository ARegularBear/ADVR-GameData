function ADVR.onLoad()
	pickup.name = "Bamboo Firecracker"
	pickup.desc = "Your orbs explode on impact"
	pickup.supportedInMultiplayer = true
	game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorWeapons(player.LocalPlayerRef)
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().dealsHitDamage = false
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().explosionRadius = 0.0
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(
		playerRef, 
		colors.CLEAR,
		colors.Create(0.403, 0.064, 0.110, 1.000),
		colors.CLEAR,
		colors.Create(0.835, 0.476, 0.042, 1.000),
		colors.CLEAR,
		colors.Create(0.729, 0.107, 0.107, 1.000),
		colors.Create(0.984, 0.309, 0.100, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.599, 0.114, 0.102))
end

---@param magicProjectile PlayerMagicOrbProjectile
function ADVR.onRangedWeaponCollide(magicProjectile, collision)
	-- special case for chests, which should just open naturally 
	local living = collision.gameObject.GetComponent_LivingBase_()
	if living ~= nil and string.find(living.livingId, "prop_chest_") then
		living.DoHit(player.networkObject, 1, damageType.PLAYER_SECONDARY_NO_KNOCKBACK, vector3.__new(0,0,0), false)
		return
	end

	
	local expl = game.SpawnObjectLocal(objects.EFFECT_EXPLOSION_SMALL, collision.GetContact(0).point).GetComponent_Explosion_()
	expl.damage = player.GetPrimaryDamageWithPickupModifiers()
	if magicProjectile.isSpecialOrbFire then
		expl.damage = player.GetSecondaryDamageWithPickupModifiers() * 3.3
	end
	expl.damagePlayer = false
	expl.damagesEnemies = true
	expl.enableCritChance = true
	pickup.SendRPCEvent(1, magicProjectile.transform.position, rpcType.TO_PROXIES)
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position)
	if eventID == 1 then
		local expl = game.SpawnObjectLocal(objects.EFFECT_EXPLOSION_SMALL, position).GetComponent_Explosion_()
		expl.damage = 0
	end
end