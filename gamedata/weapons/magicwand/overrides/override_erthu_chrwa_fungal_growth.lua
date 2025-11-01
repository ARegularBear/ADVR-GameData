function ADVR.onLoad()
	pickup.name = "Fungal Growth"
	pickup.desc = "Projectiles emit damaging particles during flight"
	pickup.globalTickDelay = 0.1
	game.RegisterForRPCEvents(pickup)
	BulletToFollow = nil
end

function ADVR.onPickup()
	pickup.RegisterItem()
	SourcePlayerParticles = game.SpawnObjectNetwork(objects.EFFECT_DAMAGING_PROJECTILE_PARTICLES, vector3.zero).GetComponent_ParticleSystem_()
	ColorWeapons(player.LocalPlayerRef)
	pickup.SendRPCEvent(0, vector3.zero, SourcePlayerParticles.gameObject.GetComponent_NetworkObject_(), rpcType.TO_ALL)
end

function ADVR.onWandCast(spawnedBullet)
	BulletToFollow = spawnedBullet.GetComponent_NetworkObject_()
	pickup.SendRPCEvent(1, spawnedBullet.GetComponent_NetworkObject_(), rpcType.TO_ALL)
end

function ADVR.onGameReloadMP()
	if SourcePlayerParticles ~= nil then
		game.Delete(SourcePlayerParticles.gameObject)
	end

	if FunctionOnRepeat ~= nil then
		FunctionOnRepeat.shouldCancel = true
	end
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
	FunctionOnRepeat = pickup.CallFunctionOnRepeat("ProxyGlobalTick", 99999, pickup.globalTickDelay)
end

function ProxyGlobalTick() 
	ADVR.onGlobalTick()
end

function ColorWeapons(playerRef)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.659, 0.113, 0.172, 0.102))
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position, networkObject)
	if eventID == 0 then -- particles spawned
		SourcePlayerParticles = networkObject.transform.gameObject.GetComponent_ParticleSystem_()
		SourcePlayerParticles.transform.position = position
	elseif eventID == 1 then -- new orb spawned that we follow with the particles 
		BulletToFollow = networkObject
	end
end

function ADVR.onGlobalTick()
	if SourcePlayerParticles == nil then
		return
	end

	if BulletToFollow == nil then
		if SourcePlayerParticles.isPlaying then
			SourcePlayerParticles.Stop()
		end
		return
	end

	if SourcePlayerParticles.isStopped then
		SourcePlayerParticles.Play()
	end

	if BulletToFollow.HasStateAuthority then
		SourcePlayerParticles.transform.position = BulletToFollow.transform.position
	end
end