function ADVR.onLoad()
	pickup.name = "Glutton's Mark"
	pickup.desc = "Once charged, use to deal a small amount of damage to nearby visible enemies"
	pickup.weight = 90
	pickup.maxAmount = 1
	pickup.amountUses = 16
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
	local enemies = game.GetEnemiesInRadius(13, game.playerHeadset.transform.position, true)
	for v in enemies do
		v.DoHit(player.networkObject, (player.SecondaryDamage.GetValueFloat() + player.PrimaryDamage.GetValueFloat()) * 1.5)
	end
end