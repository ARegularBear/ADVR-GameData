-- OVERRIDE ITEM
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
