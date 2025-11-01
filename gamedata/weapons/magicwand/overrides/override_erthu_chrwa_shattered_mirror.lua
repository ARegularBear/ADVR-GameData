function ADVR.onLoad()
	pickup.name = "Shattered Mirror"
	pickup.desc = "Moderately increases all of characteristics, but significantly decreases luck"
	pickup.weight = 85
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.Luck.RegisterAddend(pickup.id, -1.0)
	player.PrimaryDamage.RegisterAddMult(pickup.id, 2, 1.1)
	player.SecondaryDamage.RegisterAddMult(pickup.id, 1, 1.1)
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()

	player.PrimaryDamage.RegisterAddMult(pickup.id, 2, 1.1)
	player.SecondaryDamage.RegisterAddMult(pickup.id, 1, 1.1)
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
end
