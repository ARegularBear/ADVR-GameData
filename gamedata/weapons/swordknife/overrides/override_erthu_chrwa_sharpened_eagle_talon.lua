function ADVR.onLoad()
	pickup.name = "Sharpened Eagle Talon"
	pickup.desc = "Projectiles seek their target"

	pickup.globalTickDelay = 0.08
    FoundEnemy = nil
    Homing = false
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onKnifeThrow()
	FoundEnemy = nil
	Homing = true
end

function ADVR.onGlobalTick()
	if Homing == false then
		return
	end

	local projectile = game.inventory.currentSecondaryWeapon


	if FoundEnemy ~= nil then
		projectile.rigidb.velocity = vector3.Lerp(projectile.rigidb.velocity, ((FoundEnemy.transform.position + FoundEnemy.objectCenter) - projectile.transform.position).normalized * 12, 0.3)
	else
		local enemies = game.GetEnemiesInRadius(5, projectile.transform.position, true, true)
		for v in enemies do
			if v.networkedInvincible == base.ToNetworkBool(false) then
				FoundEnemy = v
				break
			end
		end
	end
end

function ADVR.onRangedWeaponCollide(knife, collision)
	Homing = false
end
