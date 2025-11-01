function ADVR.onLoad()
	pickup.name = "Sharpened Eagle Talon"
	pickup.desc = "Projectiles seek their target"

	pickup.globalTickDelay = 0.08
    -- Table to track multiple bullets and their homing states
    HomingBullets = {}
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onWandCast(spawnedBullet)
	-- Get the current bullet and add it to our tracking table
	bulletRb = spawnedBullet.GetComponent_Rigidbody_()
	HomingBullets[bulletRb] = {
		foundEnemy = nil,
		isHoming = true
	}
end

function ADVR.onGlobalTick()
	-- Iterate through all tracked bullets
	local bulletsToRemove = {}
	
	for bullet, bulletData in pairs(HomingBullets) do
		-- Check if bullet still exists and is homing
		if bullet ~= nil and bulletData.isHoming then
			-- Verify bullet is still valid (not destroyed)
			if bullet.transform == nil then
				-- Mark for removal if bullet is destroyed
				table.insert(bulletsToRemove, bullet)
			else
				if bulletData.foundEnemy ~= nil then
					-- Apply homing to this specific bullet
					local lerpFactor = 0.15
					bullet.velocity = vector3.Lerp(bullet.velocity, ((bulletData.foundEnemy.transform.position + bulletData.foundEnemy.objectCenter) - bullet.transform.position).normalized * 12, lerpFactor)
				else
					-- Search for enemies around this bullet
					local enemies = game.GetEnemiesInRadius(5, bullet.transform.position, true, true)
					for v in enemies do
						if v.networkedInvincible == base.ToNetworkBool(false) then
							bulletData.foundEnemy = v
							break
						end
					end
				end
			end
		else
			-- Mark for removal if bullet is null or not homing
			table.insert(bulletsToRemove, bullet)
		end
	end
	
	-- Clean up destroyed or invalid bullets
	for _, bullet in ipairs(bulletsToRemove) do
		HomingBullets[bullet] = nil
	end
end

function ADVR.onRangedWeaponCollide(knife, collision)
	-- Remove the bullet from tracking when it collides
	if HomingBullets[knife] then
		HomingBullets[knife] = nil
	end
end
