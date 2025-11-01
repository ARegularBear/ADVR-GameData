function ADVR.onLoad()
	pickup.name = "Assassins Mark"
	pickup.desc = "Once charged, use to destroy a nearby non boss enemy"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = 7
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local enemies = game.GetEnemiesInRadius(8, game.playerHeadset.position, true, true)
	for v in enemies do
		if v.isBoss() == false then
			v.DoHit(player.networkObject, v.MaxHealth)
		else
			v.DoHit(player.networkObject, v.MaxHealth * 0.25)
		end
		break
	end
end