function ADVR.onLoad()
	pickup.name = "Hummingbird Feather"
	pickup.desc = "Projectiles are not affected by gravity"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	game.inventory.currentSecondaryWeapon.hasGravity = false
end