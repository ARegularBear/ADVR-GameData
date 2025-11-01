function ADVR.onLoad()
	pickup.name = "Shining Catalyst"
	pickup.desc = "Orbs are converted to coins on pickup"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 25
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
	game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onObjectGrab(object, hand)
	if object.gameObject.GetComponent_ItemPotion_() == nil then
		return
	end

	game.Delete(object.gameObject)
	game.SpawnObjectNetwork(objects.ITEM_COIN, hand.transform.position)

	for i = 0, 4 do
		if helperMethods.IsValidWithLuck(0.0, 1.0, 0.75) then
			game.SpawnObjectNetwork(objects.ITEM_COIN, hand.transform.position)
		end
	end
end