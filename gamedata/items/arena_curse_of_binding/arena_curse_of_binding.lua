function ADVR.onLoad()
	pickup.name = "Curse of Binding"
	pickup.desc = "Your maximum heart containers are locked and protection hearts are capped at one"
	pickup.weight = 0
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.isCurse = true
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	CurrentMaxHealth = player.MaxHealth
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	CurrentMaxHealth = player.MaxHealth
end

function ADVR.onPlayerValueChanged(statID)
	if statID == playerValues.MAX_HEALTH then
		if player.MaxHealth > CurrentMaxHealth then
			player.MaxHealth = CurrentMaxHealth
			if player.Health > player.MaxHealth then
				player.Health = player.MaxHealth
			end
		end
	end

	if statID == playerValues.ETHEREAL_HEALTH then
		if player.EtherealHealth > 2 then
			player.RemoveEtherealHealth(player.EtherealHealth - 2, false)
		end
	end
end

function IsAllowedToSpawn()
	return true
end