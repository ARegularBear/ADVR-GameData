function ADVR.onLoad()
	pickup.name = "Four Leaf Clover"
	pickup.desc = "Increases all attributes and maximizes luck."
	pickup.weight = 50
	pickup.maxAmount = 20
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	player.PrimaryDamage.RegisterAddend(pickup.id, 1)
	player.SecondaryDamage.RegisterAddend(pickup.id, 1)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.05)
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.PrimaryDamage.RegisterAddend(pickup.id, 1)
	player.SecondaryDamage.RegisterAddend(pickup.id, 1)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
	player.EvasionChance.RegisterAddend(pickup.id, 0.05)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.05)

	-- First we clear all custom addends and multipliers from the luck stat and then we apply full luck!
	player.Luck.ClearAllCustomAddendsAndMultipliers()
	player.Luck.RegisterAddend(pickup.id, 1)
end
