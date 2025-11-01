function ADVR.onLoad()
	pickup.name = "Two-Headed Coin"
	pickup.desc = "Slightly increases all characteristics"
	pickup.weight = 30
	pickup.maxAmount = 20
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.PrimaryDamage.RegisterAddend(pickup.id, 1)
	player.SecondaryDamage.RegisterAddend(pickup.id, 1)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)

	player.ShopDiscount.RegisterAddend(pickup.id, 0.05)
	player.Luck.RegisterAddend(pickup.id, 0.05)
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()

	player.PrimaryDamage.RegisterAddend(pickup.id, 1)
	player.SecondaryDamage.RegisterAddend(pickup.id, 1)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)
end