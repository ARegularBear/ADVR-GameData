function ADVR.onLoad()
	pickup.name = "Befouling Sludge"
	pickup.desc = "Your book sweep attack causes additional damage after a short delay"
	pickup.weight = 55
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 40
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.BOSS }
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
      	colors.CLEAR,
        colors.CLEAR,
		colors.CLEAR,
		colors.CLEAR,
		colors.CreateByte(50, 120, 110),
        colors.CreateByte(70, 200, 100),
		colors.CLEAR
	)
	helperMethods.SetTrailColorMelee(playerRef, colors.Create(0.353, 0.702, 0.171, 0.102))
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity ~= nil and infos.customData == "sweep_attack" then
		if infos.entity.IsEnemy() then
			pickup.CallFunctionIn("LateHit", 2.5, infos.entity, infos.usedWeapon, infos.hitPosition)
		end
	end

	return infos.damage
end

function LateHit(entity, weapon, hitPosition)
	if entity ~= nil and weapon ~= nil and entity.Health > 0 then
		entity.DoHit(weapon.networkObject, weapon.damageStat.GetValueFloat() * 0.5 * pickup.AmountActiveLocal(), damageType.PLAYER_PRIMARY_NO_KNOCKBACK, hitPosition)
	end
end