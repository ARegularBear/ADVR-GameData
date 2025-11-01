function ADVR.onLoad()
	pickup.name = "Caged Match"
	pickup.desc = "Weapon damage is increased while in a sealed room"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.globalTickDelay = 1.0
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true

	-- Variables
	DamageIncrease = 3

	-- Internal variables
	IsActive = false
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onGlobalTick()
	local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position)
	if room == nil then
		IsActive = false
		return
	end

	IsActive = room.type == roomTypes.CHALLENGE
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPrimaryHitEntity(infos)
	return HandleHit(infos)
end

function ADVR.onSecondaryHitEntity(infos)
	return HandleHit(infos)
end

function HandleHit(infos)
	if IsActive == false then	
		return infos.damage
	end
	
	return infos.damage + DamageIncrease
end
