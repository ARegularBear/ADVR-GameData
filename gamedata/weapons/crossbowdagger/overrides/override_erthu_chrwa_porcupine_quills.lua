function ADVR.onLoad()
	pickup.name = "Porcupine Quills"
	pickup.desc = "Ranged attacks produce a burst of quills in addition to your projectile"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onKnifeThrow()
	local bones = game.SpawnObjectNetwork(objects.EFFECT_KNIFE_SCATTERSHOT, game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.transform.position)
	bones.transform.forward = game.playerHeadset.transform.forward

	local particleDamage = bones.GetComponent_ParticleDamage_()
	particleDamage.damage = player.PrimaryDamage.GetValueFloat() * 0.5 + 1
end