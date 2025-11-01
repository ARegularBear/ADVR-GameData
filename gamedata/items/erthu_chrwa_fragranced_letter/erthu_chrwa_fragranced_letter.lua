function ADVR.onLoad()
	pickup.name = "Fragranced Letter"
	pickup.desc = "Gain protection after completing an area"
	pickup.weight = 25
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SHOP, relicPool.SPECIAL }
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
	pickup.globalTickDelay = 1.0
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if #game.GetAllAlivePlayers() > 2 then
		player.Heal(1 * pickup.AmountActiveLocal(), player.GetBaseEtherealHeartType())
	else
		player.Heal(2 * pickup.AmountActiveLocal(), player.GetBaseEtherealHeartType())
	end
end