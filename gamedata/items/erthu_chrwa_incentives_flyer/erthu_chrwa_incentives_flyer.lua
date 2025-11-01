function ADVR.onLoad()
	pickup.name = "Incentives Flyer"
	pickup.desc = "Merchants provide health when you buy an item"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onItemBought()
	player.Heal(1)
end