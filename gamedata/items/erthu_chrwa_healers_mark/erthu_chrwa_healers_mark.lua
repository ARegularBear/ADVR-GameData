function ADVR.onLoad()
	pickup.name = "Healer's Mark"
	pickup.desc = "Once charged, use to gain a half-heart of health"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.amountUses = 20
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	player.Heal(1)
end