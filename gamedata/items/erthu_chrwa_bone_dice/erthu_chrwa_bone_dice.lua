function ADVR.onLoad()
	pickup.name = "Bone Dice"
	pickup.desc = "Improves a random characteristic"
	pickup.weight = 100
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	if game.runSaveManager.isInLoadRoutine then
		return
	end

	local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
end