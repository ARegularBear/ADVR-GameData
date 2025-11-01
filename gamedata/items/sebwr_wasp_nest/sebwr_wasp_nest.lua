function ADVR.onLoad()
	pickup.name = "Wasp Nest"
	pickup.desc = "The next five times you are hit, critical chance increases"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.GOLDEN_CHEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true

	Amount_activated = 0
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage)
	local critIncrease = 0.03
	if Amount_activated < 5 then
		player.PrimaryCritChance.RegisterAddend(pickup.id, critIncrease)
        player.SecondaryCritChance.RegisterAddend(pickup.id, critIncrease)
		Amount_activated = Amount_activated + 1
	end

	return damage
end

