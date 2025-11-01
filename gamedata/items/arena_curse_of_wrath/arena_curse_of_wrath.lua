function ADVR.onLoad()
	pickup.name = "Curse of Wrath"
	pickup.desc = "Enemies have a 33% chance to deal double damage"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.isCurse = true
	pickup.tier = 1
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
	local chance = 0.3333 * pickup.AmountActiveLocal()
	if math.random() < chance then
		return damage * 2
	end
	return damage
end

function IsAllowedToSpawn()
	return true
end