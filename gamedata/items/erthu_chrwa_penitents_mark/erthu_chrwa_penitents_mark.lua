function ADVR.onLoad()
	pickup.name = "Penitent's Mark"
	pickup.desc = "Once charged, use to gain a random relic, but lose a small amount of health"
	pickup.weight = 33
	pickup.maxAmount = 1
	pickup.amountUses = 6
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SHOP, relicPool.SPECIAL }
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	if helperMethods.IsValidWithLuck(0.1, 0.7, 0.4) then
		game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, game.playerController.rightHand.transform.position)
	end
	player.DamagePlayer(1, false)
end
