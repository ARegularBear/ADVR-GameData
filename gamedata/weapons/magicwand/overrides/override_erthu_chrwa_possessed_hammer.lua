function ADVR.onLoad()
	pickup.name = "Possessed Hammer"
	pickup.desc = "Increases the size and damage of your basic orbs"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.CHEST, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.PrimaryDamage.RegisterAddend(pickup.id, 1)
end

function ADVR.onWandCast(spawnedBullet)
	spawnedBullet.transform.localScale = spawnedBullet.transform.localScale * 1.5
end