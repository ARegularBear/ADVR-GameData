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

	NewScale = vector3.__new(1.8, 1.8, 1.8)
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.SecondaryDamage.RegisterAddend(pickup.id, 4)
    player.SecondaryDamage.RegisterMultiplier(pickup.id, 1.2)

	KnifeRef = game.inventory.currentSecondaryWeapon.AsThrowingKnifeBase()
    KnifeRef.transform.localScale = NewScale
    KnifeRef.throwStrength = KnifeRef.throwStrength * 0.5
    KnifeRef.pullbackSpeed = 9

	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	local knife = game.GetPlayerById(originalPlayerRef).playerController.networkedPlayerInventory.currentSecondaryWeapon
	knife.transform.localScale = NewScale
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsRanged(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.260, 0.260, 0.260, 1.000), colors.Create(0.210, 0.210, 0.210, 1.000), colors.Create(0.330, 0.330, 0.330, 1.000))
	helperMethods.SetTrailColorRanged(playerRef, colors.Create(0.360, 0.360, 0.360, 0.567))
end

function ADVR.onRangedWeaponCollide(knife, collision)
	if collision.gameObject.layer == 9 then -- collides with ground
		local spikeCircular = game.SpawnObjectNetwork("effect_spike_attack_circular", collision.GetContact(0).point)
		local spikeAttacks = spikeCircular.GetComponentsInChildren(game.GetType("SpikeAttack")) ---@type SpikeAttack[]
	
		for i = 0, #spikeAttacks - 1 do 
			spikeAttacks[i].networkedPlayerImmune = base.ToNetworkBool(true)
		end
	end
end