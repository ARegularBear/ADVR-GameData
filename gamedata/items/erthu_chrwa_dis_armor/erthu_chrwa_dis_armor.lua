function ADVR.onLoad()
	pickup.name = "Dis Armor"
	pickup.desc = "You are immune to damage from traps and spikes."
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST}
	pickup.priority = -500
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, source, dmgType)
	if dmgType == damageType.TRAP then
		return 0
	end

	return damage
end