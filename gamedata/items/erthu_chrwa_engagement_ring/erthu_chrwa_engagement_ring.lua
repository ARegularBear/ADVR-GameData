function ADVR.onLoad()
	pickup.name = "Engagement Ring"
	pickup.desc = "Sacrifice all hearts to gain twice that amount of protection"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	-- only if glass cannon has not been found yet --
	if game.itemInterpreter.AmountPickupFoundByLocalPlayer(relics.ERTHU_CHRWA_VIAL_OF_BLUE_BLOOD) > 0 then
		return
	end
	if game.itemInterpreter.AmountPickupFoundByLocalPlayer(relics.ERTHU_CHRWA_GLASS_CANNON) >  0 then
		return
	end

	player.Heal(player.MaxHealth * 2, player.GetBaseEtherealHeartType())
	player.MaxHealth = 0
	player.Health = 0
end