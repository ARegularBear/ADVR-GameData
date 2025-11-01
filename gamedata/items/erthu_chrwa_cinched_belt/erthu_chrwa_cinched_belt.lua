function ADVR.onLoad()
	pickup.name = "Cinched Belt"
	pickup.desc = "When health is low, eating food provides more health than usual"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = { relicPool.GOLDEN_CHEST, relicPool.SHOP }
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onFoodEaten(food)
	if player.Health == 1 then
		player.Heal(1)
	end
end