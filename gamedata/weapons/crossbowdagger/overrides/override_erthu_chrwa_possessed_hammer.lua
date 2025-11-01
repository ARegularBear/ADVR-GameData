function ADVR.onLoad()
	pickup.name = "Possessed Hammer"
	pickup.desc = "Increases the size of your melee weapon"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.CHEST, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.GenerateShape(originalPlayerRef)
end

function ADVR.RelicEvents.onShapeLoaded(shape, playerInv)
	playerInv.currentSecondaryWeapon.UpdateWeaponMesh(shape)
end
