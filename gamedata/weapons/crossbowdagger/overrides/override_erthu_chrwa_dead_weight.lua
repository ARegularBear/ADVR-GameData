function ADVR.onLoad()
	pickup.name = "Dead Weight"
	pickup.desc = "Ranged strikes do significantly more damage, but projectiles are larger and slower"
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

	game.inventory.currentPrimaryWeapon.AsCrossbowBase().shootSpeed = game.inventory.currentPrimaryWeapon.AsCrossbowBase().shootSpeed * 0.3
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsRanged(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.260, 0.260, 0.260, 1.000), colors.Create(0.210, 0.210, 0.210, 1.000), colors.Create(0.330, 0.330, 0.330, 1.000))
	helperMethods.SetTrailColorRanged(playerRef, colors.Create(0.360, 0.360, 0.360, 0.567))
end

function ADVR.onRangedWeaponCollide(knife, collision)
	if collision.gameObject.layer == 9 then -- collides with ground
		local spikeAttacks = game.SpawnObjectNetwork(objects.EFFECT_SPIKE_ATTACK_CIRCULAR, game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.transform.position).GetComponentsInChildren(game.GetType("SpikeAttack"))
		for attack in spikeAttacks do
			attack.networkedPlayerImmune = base.ToNetworkBool(true)
		end
	end
end