function ADVR.onLoad()
	pickup.name = "Spoiled Brat"
	pickup.desc = "Merchant items are free, but each item taken slightly decreases a random characteristic"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	player.networkedFreeStoreItems = 9999
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onItemBought(item, pos)
	local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, -1.0)
	game.ShowMessageInWorld("<color=#e82e20>" .. result .. "</color>", 4)
end

