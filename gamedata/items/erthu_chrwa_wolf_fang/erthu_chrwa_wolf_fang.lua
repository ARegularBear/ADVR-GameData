function ADVR.onLoad()
	pickup.name = "Wolf Fang"
	pickup.desc = "When hit, your next few weapon strikes do massively more damage"
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	CriticalHits = 0
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	CriticalHits = 0
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage)
	CriticalHits = 3
	return damage
end

function ADVR.onSecondaryHitEntity(infos)
	local damage = infos.damage
	if CriticalHits > 0 then
		damage = infos.damage * 2
	end
	
	-- for testing in stats screen --
	if infos.entity == nil then
		return damage
	end

	CriticalHits = CriticalHits - 1
	return damage
end

function ADVR.onPrimaryHitEntity(infos)
	local damage = infos.damage
	if CriticalHits > 0 then
		damage = infos.damage * 2
	end

	-- for testing in stats screen --
	if infos.entity == nil then
		return damage
	end

	CriticalHits = CriticalHits - 1
	return damage
end