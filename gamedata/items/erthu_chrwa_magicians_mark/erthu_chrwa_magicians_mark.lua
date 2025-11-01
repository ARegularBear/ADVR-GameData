function ADVR.onLoad()
	pickup.name = "Magician's Mark"
	pickup.desc = "Once charged, use to transform nearby relics"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = 16
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SHOP, relicPool.SPECIAL }
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true

	game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	pickup.SendRPCEvent(0, player.transform.position, rpcType.TO_ALL)
end

function ADVR.onRPCReceived(eventID, sourcePlayer, sourcePlayerPosition, networkObject)
	local items = game.FindObjectsByTypeUnsorted(game.GetType("ItemUpgrade"))
	for i in items do
		if i.networkObject.HasStateAuthority and vector3.Distance(i.transform.position, sourcePlayerPosition) < 9 then
			i.forceSpawn = ""
			i.OverrideHash(math.random(1, 999999))
			i.RollItem()
		end
	end
end