function ADVR.onLoad()
	pickup.name = "Lockpick Set"
	pickup.desc = "Locks have a chance to open without consuming a key"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.entityDeathListeners = {"prop_lock"}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onEntityDeath(living, source)
	if living.networkObject.HasStateAuthority and helperMethods.IsValidWithLuck(0.05, 0.5, 0.25) then
		player.currentKeys = player.currentKeys + 1
	end
end