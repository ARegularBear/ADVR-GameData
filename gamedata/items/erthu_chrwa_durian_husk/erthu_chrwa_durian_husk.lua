function ADVR.onLoad()
	pickup.name = "Durian Husk"
	pickup.desc = "Eating food will damage nearby enemies."
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onFoodEaten(food)
	local damageMultiplier = 12
	local enemySearchDistance = 15
	
	local foundEnemies = game.GetEnemiesInRadius(enemySearchDistance, player.transform.position)
	for i = 0, #foundEnemies - 1 do
		local enemy = foundEnemies[i]
		enemy.DoHit(food.networkObject, damageMultiplier * pickup.AmountActiveLocal() * food.healAmount, damageType.PLAYER_TERTIARY_NO_KNOCKBACK, food.transform.position)
	end
end
