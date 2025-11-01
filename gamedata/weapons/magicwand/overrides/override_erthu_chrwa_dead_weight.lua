function ADVR.onLoad()
	pickup.name = "Dead Weight"
	pickup.desc = "Your orbs do significantly more damage, but are larger and travel slower"
	pickup.weight = 100
	pickup.tier = 3
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	
	player.PrimaryDamage.RegisterAddend(pickup.id, 3)
    player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.2)

	local SlowdownFactor = 0.33
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed * SlowdownFactor
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(
		playerRef,
		colors.Create(0.174, 0.174, 0.174, 1.000),
		colors.Create(0.045, 0.045, 0.049, 1.000),
		colors.CLEAR,
		colors.Create(0.835, 0.835, 0.626, 1.000),
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.984, 0.984, 0.656, 1.000)
	)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.278, 0.278, 0.278, 0.102))
end

function ADVR.onRangedWeaponCollide(knife, collision)
	if collision.gameObject.layer == 9 then -- collides with ground
		local spikeAttacks = game.SpawnObjectNetwork(objects.EFFECT_SPIKE_ATTACK_CIRCULAR, collision.GetContact(0).point).GetComponentsInChildren(game.GetType("SpikeAttack"))
		for attack in spikeAttacks do
			attack.damage = player.GetPrimaryDamageWithPickupModifiers() * 0.5
			attack.networkedPlayerImmune = base.ToNetworkBool(true)
		end
	end
end