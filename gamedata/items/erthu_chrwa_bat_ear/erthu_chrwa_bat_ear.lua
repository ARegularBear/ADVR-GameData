function ADVR.onLoad()
	pickup.name = "Bat Ear"
	pickup.desc = "Area maps are fully revealed."
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.amountUses = -1
	pickup.price = 60
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	if game.runSaveManager.isInLoadRoutine then
		pickup.CallFunctionIn("RevealCurrentMap", 5.0)
		return
	end

	RevealCurrentMap()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	RevealCurrentMap()
end

function ADVR.onRoomEntered(room)
	if room.type == roomTypes.START then
		pickup.CallFunctionIn("RevealCurrentMap", 5.0)
	end
end

function RevealCurrentMap()
	game.playerController.minimap.RevealCurrentFloorMap()
	game.playerController.minimap.shouldUpdateMap = false
end