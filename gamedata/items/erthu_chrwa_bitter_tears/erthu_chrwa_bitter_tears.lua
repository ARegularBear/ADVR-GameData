function ADVR.onLoad()
	pickup.name = "Bitter Tears"
	pickup.desc = "When health is low, weapon damage is significantly increased"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 2
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onSecondaryHitEntity(infos)
	if player.Health <= 2 then
		return infos.damage * 1.35 + 2
	end
	return infos.damage
end

function ADVR.onPrimaryHitEntity(infos)
	if player.Health <= 2 then
		return infos.damage * 1.35 + 2
	end
	return infos.damage
end