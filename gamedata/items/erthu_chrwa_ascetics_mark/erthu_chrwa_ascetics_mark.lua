function ADVR.onLoad()
	pickup.name = "Ascetic's Mark"
	pickup.desc = "Once charged, use to improve a random characteristic"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = 25
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
end