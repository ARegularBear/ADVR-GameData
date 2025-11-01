function ADVR.onLoad()
	pickup.name = "Clock Key"
	pickup.desc = "When hit, time is temporarily slowed"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.PODEST, relicPool.SHOP}
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage)
	player.ActivateBulletTime(3)
	return damage
end