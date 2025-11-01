function ADVR.onLoad()
	pickup.name = "Gnawed-Off Paw"
	pickup.desc = "When health is low, evasion is massively increased"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 2
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage)
	if player.RealHealth <= 2 then
		if helperMethods.IsValidWithLuck(0, 0.5, 0.4) then
			damage = 0
		end
	end
	return damage
end