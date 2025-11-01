function ADVR.onLoad()
	pickup.name = "Curse of Frailty"
	pickup.desc = "You lose one heart container"
	pickup.weight = 0
	pickup.maxAmount = 100
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.isCurse = true
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.MaxHealth = player.MaxHealth - 2
	if player.Health > player.MaxHealth then
		player.Health = player.MaxHealth
	end
end

function IsAllowedToSpawn()
	return player.MaxHealth >= 4
end