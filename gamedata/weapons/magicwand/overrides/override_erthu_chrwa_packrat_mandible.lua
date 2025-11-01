function ADVR.onLoad()
	pickup.name = "Packrat Mandible"
	pickup.desc = "Significantly increases all characteristics, but acquiring other relics will damage you"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.PrimaryDamage.RegisterAddend(pickup.id, 2)
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.1)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryDamage.RegisterAddend(pickup.id, 1)
	player.EvasionChance.RegisterAddend(pickup.id, 0.15)
end


function ADVR.onPickupTaken(takenPickup)
	player.DamagePlayer(1, false)
	audio.PlaySoundLocal(sounds.SFX_PACKRAT_MANDIBLE, player.transform.position)
end