function ADVR.onLoad()
	pickup.name = "Grinning Totem"
	pickup.desc = "Consumes half of your keys and coins, but increases luck accordingly"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
	game.RegisterForRPCEvents(pickup)
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	local currentCash = player.SharedCashPool
	local currentKeys = player.SharedKeyPool

	pickup.SendRPCEvent(rpcType.TO_PROXIES)

	player.CurrentKeys = currentKeys / 2
	player.CurrentCash = currentCash / 2

	local increase = (currentCash + currentKeys * 5) / 80

	player.Luck.RegisterAddend(pickup.id, increase)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onRPCReceived()
	player.currentKeys = 0
	player.currentCash = 0
end