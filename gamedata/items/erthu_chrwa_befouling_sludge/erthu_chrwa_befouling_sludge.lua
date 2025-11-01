
function ADVR.onLoad()
	pickup.name = "Befouling Sludge"
	pickup.desc = "Melee strikes cause additional damage after a short delay"
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
	helperMethods.UpdateWeaponColorsMelee(
	playerRef,
	colors.CLEAR,
	colors.CLEAR,
	colors.CLEAR,
	colors.CLEAR,
	colors.Create(0.078, 0.200, 0.037),
	colors.Create(0.246, 0.340, 0.214),
	colors.CLEAR
	)

	helperMethods.SetTrailColorMelee(playerRef, colors.Create(0.353, 0.702, 0.171, 0.102))
end

function ADVR.onMeleeHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsEnemy() then
			pickup.CallFunctionIn("LateHit", 3, infos.entity, infos.usedWeapon, infos.hitPosition)
		end
	end

	return infos.damage
end

function LateHit(entity, weapon, hitPosition)
	if entity ~= nil and weapon ~= nil and entity.Health > 0 then
		entity.DoHit(weapon.networkObject, weapon.damageStat.GetValueFloat() * 0.5 * pickup.AmountActiveLocal(), damageType.PLAYER_PRIMARY_NO_KNOCKBACK, hitPosition)
	end
end