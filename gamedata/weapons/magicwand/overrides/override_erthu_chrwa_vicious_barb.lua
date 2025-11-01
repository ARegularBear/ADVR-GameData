function ADVR.onLoad()
	pickup.name = "Vicious Barb"
	pickup.desc = "Your attacks have a chance to cause a bleeding effect on enemies"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.price = 50
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true

	-- Variables
	HitSpeed = 1.5
	RangedDamageMultipler = 0.4

	-- Internal variables
	StuckToEnemy = nil
	EnemyCounterId = 0
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		if helperMethods.IsValidWithLuck(0, pickup.AmountActiveLocal() * 0.075, pickup.AmountActiveLocal() * 0.045) then
			-- Apply bleeding effect
			local bleedDamage = mathf.RoundToInt(player.PrimaryDamage.GetValueFloat() * RangedDamageMultipler)
			local bleedDuration = 5 -- Duration of the bleed effect in seconds
			local bleedInterval = 1 -- How often the bleed damage is applied in seconds
			base.CallFunctionOnRepeat("DamageEnemyRoutine", bleedDuration, bleedInterval, infos.entity, bleedDamage)
		end
	end

	return infos.damage
end

function DamageEnemyRoutine(sourceObject, entity, damage)
	if entity == nil or not entity.IsEnemy() then
		return
	end

	entity.DoHit(nil, mathf.RoundToInt(player.PrimaryDamage.GetValueFloat() * RangedDamageMultipler), damageType.PLAYER_TERTIARY_NO_KNOCKBACK, vector3.zero)
end
