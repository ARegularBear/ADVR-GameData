function ADVR.onLoad()
	pickup.name = "Exotic Spice"
	pickup.desc = "Eating food has a chance to restore more health than usual"
	pickup.weight = 35
	pickup.maxAmount = 1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onFoodEaten()
	if helperMethods.IsValidWithLuck(0.0, 0.8, 0.5) then
		player.Heal(1)
	end
end
