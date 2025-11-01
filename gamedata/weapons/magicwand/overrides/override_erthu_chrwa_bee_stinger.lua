function ADVR.onLoad()
	pickup.name = "Bee Stinger"
	pickup.desc = "Increases orb damage, but decreases length your orbs travel"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	helperMethods.RegisterRangedDamageAddMult(pickup.id, 3, 1.1)
	helperMethods.RegisterRangedCritAddend(pickup.id, 0.05)

	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().orbTravelDistance = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().orbTravelDistance * 0.6
end