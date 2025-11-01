function ADVR.onLoad()
	pickup.name = "Bee Stinger"
	pickup.desc = "Slightly increases melee damage, but decreases the size of your melee weapon"
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

	helperMethods.RegisterMeleeDamageAddMult(pickup.id, 3, 1.1)
	helperMethods.RegisterMeleeCritAddend(pickup.id, 0.05)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.GenerateShape(originalPlayerRef)
end

function ADVR.RelicEvents.onShapeLoaded(shape, playerInv)
	playerInv.currentPrimaryWeapon.UpdateWeaponMesh(shape)
end