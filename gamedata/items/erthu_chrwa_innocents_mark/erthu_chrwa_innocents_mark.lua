function ADVR.onLoad()
	pickup.name = "Innocent's Mark"
	pickup.desc = "Once charged, use to summon a wisp"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = 3
	pickup.price = 20
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
    game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
end