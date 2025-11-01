function ADVR.onLoad()
	pickup.name = "Vicious Barb"
	pickup.desc = "Projectiles deal continuous damage while embedded in an enemy"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.price = 50
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true

	-- Variables
	HitSpeed = 1.5
	RangedDamageMultipler = 0.5

	-- Internal variables
	StuckToEnemy = nil
	EnemyCounterId = 0
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRangedWeaponCollide(ranged, collision)
	if collision.rigidbody == nil then	
		StuckToEnemy = nil	
		return
	end

	StuckToEnemy = collision.rigidbody.gameObject.GetComponent_EnemyBase_()
	if StuckToEnemy == nil then
		StuckToEnemy = collision.rigidbody.gameObject.GetComponent_EnemyBaseReference_()
		if StuckToEnemy == nil then
			return
		else
			StuckToEnemy = StuckToEnemy.enemy
		end
	end

	EnemyCounterId = EnemyCounterId + 1
	base.CallFunctionIn("DamageEnemyRoutine", HitSpeed, ranged, EnemyCounterId)
end

function DamageEnemyRoutine(sourceObject, id)
	if EnemyCounterId ~= id or StuckToEnemy == nil then
		return
	end

	local isStillStuck = false
	isStillStuck = sourceObject.IsKnifeStuck()

	if isStillStuck == false then
		StuckToEnemy = nil
		return
	end

	StuckToEnemy.DoHit(nil, mathf.RoundToInt(player.SecondaryDamage.GetValueFloat() * RangedDamageMultipler), damageType.PLAYER_SECONDARY_NO_KNOCKBACK, vector3.zero)
	base.CallFunctionIn("DamageEnemyRoutine", HitSpeed, sourceObject, id)
end
