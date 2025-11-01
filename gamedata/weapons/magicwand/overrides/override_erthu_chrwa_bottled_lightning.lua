function ADVR.onLoad()
	pickup.name = "Bottled Lightning"
	pickup.desc = "Orbs start smaller and grow larger the longer you hold them charged with the wand, resetting in size when cast."
	pickup.weight = 44
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.globalTickDelay = 0.05
	pickup.supportedInMultiplayer = true
	game.RegisterForRPCEvents(pickup)
	
	BaseScale = vector3.__new(0.5, 0.5, 0.5)
	GrowSpeed = 0.020
	MaxSize = 1.66
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	ProxyShouldGrow = false
end

function ADVR.onGameReloadMP()
	if FunctionOnRepeat ~= nil then
		FunctionOnRepeat.shouldCancel = true
	end
end

function ADVR.onRangedHitEntity(infos)
	return (infos.damage * game.inventory.currentPrimaryWeapon.AsMagicOrbBase().orbLoadedParticles.transform.localScale.x) * 0.8
end

function ADVR.onGlobalTick()
	local objToScale = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().orbLoadedParticles.transform

	if objToScale.gameObject.activeSelf then
		if objToScale.localScale.x < MaxSize then
			objToScale.localScale = (objToScale.localScale.x + GrowSpeed) * vector3.__new(1,1,1)
		end
	else
		objToScale.localScale = BaseScale
	end
end

function ADVR.onWandCharged()
	local objToScale = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().orbLoadedParticles.transform
	objToScale.localScale = BaseScale
end

function ADVR.onWandCast(spawnedBullet)
	spawnedBullet.transform.localScale = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().orbLoadedParticles.transform.localScale
	pickup.SendRPCEvent(0, spawnedBullet.transform.localScale, spawnedBullet.GetComponent_NetworkObject_(), rpcType.TO_PROXIES)
end

function ADVR.onRPCReceived(eventID, sourcePlayer, vector, networkObject)
	if eventID == 0 then -- orb shot
		networkObject.transform.localScale = vector
	end
end