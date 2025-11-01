function ADVR.onLoad()
	pickup.name = "Sprout of Ivy"
	pickup.desc = "Your orb attacks grow in size the further they travel"
	pickup.globalTickDelay = 0.065

	BaseScale = vector3.__new(0.3, 0.3, 0.3)
	MaxScale = 1.5
	MaxDistance = 10.0  -- Maximum distance for full scale
	BulletsSpawned = {}
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(
		playerRef,
		colors.CLEAR,
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.041, 0.535, 0.217, 1.000),
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.043, 0.984, 0.060, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.187, 0.482, 0.102, 0.102))
end

function ADVR.onWandCast(spawnedBullet)
	local bulletRb = spawnedBullet.GetComponent_Rigidbody_()
	bulletRb.transform.localScale = BaseScale
	bulletRb.velocity = bulletRb.velocity * 0.44
	BulletsSpawned[bulletRb] = {
		spawnedBullet = spawnedBullet,
		magicOrbProjectile = spawnedBullet.GetComponent_PlayerMagicOrbProjectile_(),
		startPosition = bulletRb.transform.position,
	}
end

function ADVR.onGlobalTick()
	for bulletRb, bulletData in pairs(BulletsSpawned) do
		if bulletRb ~= nil and bulletRb.transform ~= nil then
			-- Calculate distance from bullet's current position to player position
			local currentPosition = bulletRb.transform.position
			local playerPosition = player.transform.position
			local distance = vector3.Distance(currentPosition, playerPosition)
			
			-- Calculate scale based on distance (clamped between BaseScale and MaxScale)
			local scaleProgress = math.min(distance / MaxDistance, 1.0)
			local currentScale = BaseScale.x + (MaxScale - BaseScale.x) * scaleProgress
			
			-- Apply the calculated scale
			bulletRb.transform.localScale = vector3.__new(currentScale, currentScale, currentScale)
			
			-- Update damage multiplier based on scale
			bulletData.magicOrbProjectile.SetDamageMultiplierValue(currentScale)
		else
			-- Clean up destroyed bullets
			BulletsSpawned[bulletRb] = nil
		end
	end
end