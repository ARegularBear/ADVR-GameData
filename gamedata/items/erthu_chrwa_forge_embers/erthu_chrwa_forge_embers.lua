function ADVR.onLoad()
	pickup.name = "Forge Embers"
	pickup.desc = "Weapon strikes have a chance to set enemies on fire"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
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
		colors.Create(0.550, 0.118, 0.060, 1.000), 
		colors.Create(0.550, 0.118, 0.060, 1.000), 
		colors.Create(0.550, 0.118, 0.060, 1.000), 
		colors.Create(0.550, 0.118, 0.060, 1.000), 
		colors.Create(0.732, 0.392, 0.109, 1.000), 
		colors.Create(0.790, 0.582, 0.122, 1.000), 
		colors.Create(0.950, 0.923, 0.070, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.642, 0.024, 0.317))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(1.000, 1.000, 0.059, 1.000), 1.381)
end

function ADVR.onPrimaryHitEntity(infos)
	return HandleDamage(infos, player.PrimaryDamage.GetValueFloat())
end

function ADVR.onSecondaryHitEntity(infos)
	return HandleDamage(infos, player.SecondaryDamage.GetValueFloat())
end

function HandleDamage(infos, damage)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		local amount =  pickup.AmountActiveLocal()
		if helperMethods.IsValidWithLuck(0.0, amount * 0.66, amount * 0.33) then
			infos.entity.applyEffect(damageType.FIRE, damage * 2 + 6)
		end
	end
	return infos.damage
end
