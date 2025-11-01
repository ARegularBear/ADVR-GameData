function ADVR.onLoad()
	pickup.name = "Heavy Yoke"
	pickup.desc = "Doubles your number of hearts, but sets current health to half a heart"
	pickup.weight = 33
	pickup.maxAmount = 2
	pickup.amountUses = -1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if player.Health <= 0 then
		return
	end
	player.RemoveEtherealHealth(99)
	player.Health = 1
	player.MaxHealth = player.MaxHealth * 2
end