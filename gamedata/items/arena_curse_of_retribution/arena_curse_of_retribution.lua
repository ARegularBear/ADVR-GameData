function ADVR.onLoad()
	pickup.name = "Curse of Retribution"
	pickup.desc = "Your next hit will deal double damage to you"
	pickup.weight = 0
	pickup.maxAmount = 10
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
	HasRun = false
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	HasRun = false
end

function ADVR.onPlayerHit(damage, damageSource, attackType, hitPosition)
	if HasRun then
		return damage
	end
	HasRun = true
	return damage * 2
end

function IsAllowedToSpawn()
	return true
end