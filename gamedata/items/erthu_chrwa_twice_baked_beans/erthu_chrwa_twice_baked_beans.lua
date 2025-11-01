function ADVR.onLoad()
	pickup.name = "Twice-Baked Beans"
	pickup.desc = "You leave a trail of poisonous gas behind when moving"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	Trail = game.SpawnObjectNetwork(objects.EFFECT_POISON_TRAIL, player.GetCenterInWorld())
end

function ADVR.onPlayerDeath(playerLiving)
	Trail.GetComponent_ParticleDamage_().particlesEnabled = false
end

function ADVR.onPlayerRevive()
	Trail.GetComponent_ParticleDamage_().particlesEnabled = true
end

function ADVR.onGameReloadMP()
	game.Delete(Trail)
end