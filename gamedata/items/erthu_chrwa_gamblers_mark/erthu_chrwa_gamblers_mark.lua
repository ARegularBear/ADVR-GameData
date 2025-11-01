function ADVR.onLoad()
	pickup.name = "Gambler's Mark"
	pickup.desc = "Once charged, use to either gain one heart of health or lose a half-heart"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 1
	pickup.amountUses = 20
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	if helperMethods.IsValidWithLuck(0.0, 0.7, 0.5) then
		player.Heal(2)
	else
		player.DamagePlayer(1, false)
	end
end