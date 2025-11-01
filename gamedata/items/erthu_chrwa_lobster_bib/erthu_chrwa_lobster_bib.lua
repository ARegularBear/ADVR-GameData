function ADVR.onLoad()
	pickup.name = "Lobster Bib"
	pickup.desc = "Eating food will grant coins in addition to health"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 2
	pickup.price = 15
	pickup.spawnsIn = {relicPool.SHOP, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onFoodEaten(food)
	player.CurrentCash = player.CurrentCash + food.healAmount * 4 * pickup.AmountActiveLocal()
end
