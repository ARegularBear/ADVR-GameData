function ADVR.onLoad()
	pickup.name = "Bargain Signed in Blood"
	pickup.desc = "When hit, gain five coins"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, source, dmgType)
	-- fix for the dis armor exploit --
	if dmgType == damageType.TRAP then
		if game.itemInterpreter.AmountPickupFoundByLocalPlayer(Relics.ERTHU_CHRWA_DIS_ARMOR) > 0 then
			return damage
		end
	end

	-- if player hasn't received any damage, don't grant any money --
	if damage == 0 then
		return damage
	end

	-- only grant money if nothing else returned --
	player.currentCash = player.currentCash + pickup.AmountActiveLocal() * 5
	return damage
end