function ADVR.onLoad()
	pickup.name = "Curse of Leaden Feet"
	pickup.desc = "When hit, your movement speed is reduced by 50% for 3 seconds"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.isCurse = true
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPlayerHit(damage, damageSource, attackType, hitPosition)
	player.MoveSpeed.RegisterMultiplier(pickup.id, 0.5 / pickup.AmountActiveLocal())
	pickup.CallFunctionIn("RemoveMultiplier", 3)
	return damage
end

function RemoveMultiplier()
	player.MoveSpeed.ClearMultiplier(pickup.id)
end

function IsAllowedToSpawn()
	return true
end