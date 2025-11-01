function ADVR.onLoad()
	pickup.name = "Dowry Chest"
	pickup.desc = "Gain two hearts but you fail to collect coins half of the time."
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.priority = -500
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.MaxHealth = player.MaxHealth + 4
	player.Health = player.Health + 4
end

function ADVR.onPreObjectCollect(type, amount)
	if type ~= "coin" then
		return amount
	end

	-- Check if we are lucky, if so then just return the regular amount!
	if helperMethods.IsValidWithLuck(0.4, 1.0, 0.5) == true then
		return amount
	end

	-- Return -1 to indicate the coin will not be picked up
	return -1
end
