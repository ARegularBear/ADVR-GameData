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
		colors.Create(0.392, 0.095, 0.047, 1.000),
		colors.Create(0.278, 0.000, 0.000, 1.000),
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.576, 0.475, 0.256, 1.000),
		colors.Create(0.729, 0.287, 0.116, 1.000),
		colors.CLEAR
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.659, 0.108, 0.102))
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
			infos.entity.applyEffect(damageType.FIRE, damage / 3 + 1, 5)
		end
	end
	return infos.damage
end
