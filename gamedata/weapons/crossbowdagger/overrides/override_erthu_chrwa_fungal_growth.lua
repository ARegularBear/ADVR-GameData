function ADVR.onLoad()
	pickup.name = "Fungal Growth"
	pickup.desc = "Projectiles emit damaging particles during flight"
	pickup.globalTickDelay = 0.1
	game.RegisterForRPCEvents(pickup)
	LastPosition = vector3.zero
end

function ADVR.onPickup()
	pickup.RegisterItem()
	SourcePlayerWeapon = game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt
	SourcePlayerParticles = game.SpawnObjectNetwork(objects.EFFECT_DAMAGING_PROJECTILE_PARTICLES, SourcePlayerWeapon.transform.position).GetComponent_ParticleSystem_()
	LastPosition = SourcePlayerWeapon.transform.position
	ColorWeapons(player.LocalPlayerRef)
	pickup.SendRPCEvent(0, vector3.zero, SourcePlayerParticles.gameObject.GetComponent_NetworkObject_(), rpcType.TO_ALL)
end

function ADVR.onGameReloadMP()
	game.Delete(SourcePlayerParticles.gameObject)
	FunctionOnRepeat.shouldCancel = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
	FunctionOnRepeat = pickup.CallFunctionOnRepeat("ProxyGlobalTick", 99999, pickup.globalTickDelay)
end

function ProxyGlobalTick() 
	ADVR.onGlobalTick()
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsRanged(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.451, 0.000, 0.000, 1.000), colors.Create(0.580, 0.157, 0.157, 1.000))
	helperMethods.SetTrailColorRanged(playerRef, colors.Create(1.000, 0.190, 0.190, 0.477))
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position, networkObject)
	SourcePlayerWeapon = sourcePlayer.playerController.networkedPlayerInventory.currentPrimaryWeapon.AsCrossbowBase().bolt
	SourcePlayerParticles = networkObject.transform.gameObject.GetComponent_ParticleSystem_()

	LastPosition = SourcePlayerWeapon.transform.position
end

function ADVR.onGlobalTick()
	if SourcePlayerWeapon == nil or SourcePlayerParticles == nil then
		return
	end

	LastPosition = SourcePlayerWeapon.transform.position

	if SourcePlayerWeapon.transform.position.y > 999 then
		SourcePlayerParticles.Stop()
		return
	elseif SourcePlayerParticles.isStopped then
		SourcePlayerParticles.Play()
	end

	if SourcePlayerWeapon.networkObject.HasStateAuthority then
		SourcePlayerParticles.transform.position = SourcePlayerWeapon.transform.position
	end
end