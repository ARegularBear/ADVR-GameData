function ADVR.onLoad()
	pickup.name = "Abacus Bead"
	pickup.desc = "Ranged strikes have a chance to hit twice"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsEnemy() and helperMethods.IsValidWithLuck(0.0, 0.66, 0.33) then
			pickup.CallFunctionIn("LateHit", 0.8, infos.entity, infos.usedWeapon, infos.hitPosition)
		end
	end

	return infos.damage
end

function LateHit(entity, weapon, hitPosition)
	if entity ~= nil and weapon ~= nil and entity.Health > 0 then
		entity.DoHit(weapon.networkObject, weapon.damageStat.GetValueFloat() * pickup.AmountActiveLocal(), damageType.PLAYER_SECONDARY_NO_KNOCKBACK, hitPosition)
	end
end