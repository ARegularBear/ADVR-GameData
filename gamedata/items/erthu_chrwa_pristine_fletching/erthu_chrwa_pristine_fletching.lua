
function ADVR.onLoad()
	pickup.name = "Pristine Fletching"
	pickup.desc = "Your projectile speed is massively increased and critical chance is slightly increased."
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end