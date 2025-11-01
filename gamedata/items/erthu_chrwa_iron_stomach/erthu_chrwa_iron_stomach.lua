function ADVR.onLoad()
	pickup.name = "Iron Stomach"
	pickup.desc = "Gain some protection after eating food that restores more health than needed"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.price = 60
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.priority = -100 -- Makes sure that other healing items are called first, this then won't mess with this item that depends on proper healing values.
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
	local healthUsed = player.MaxHealth - player.Health
	if food.healAmount > healthUsed then
		player.Heal(food.healAmount - healthUsed, player.GetBaseEtherealHeartType())
	end
end
