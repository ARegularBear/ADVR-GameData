function ADVR.onLoad()
	pickup.name = "Fossilized Leech"
	pickup.desc = "Marks charge more quickly"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP}
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
	if living.IsEnemy() and source == player.LocalPlayerRef then
		if game.itemInterpreter.currentUsable ~= nil then
			game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.currentCharge + 1
			game.activePickupSlot.UpdateChargeDisplay()
		end
	end
end