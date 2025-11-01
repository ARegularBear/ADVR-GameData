function ADVR.onLoad()
	pickup.name = "Thrice-Baked Beans"
	pickup.desc = "You leave a trail of burning magma behind when moving"
	pickup.weight = 30
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 40
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	Trail = game.SpawnObjectNetwork(objects.EFFECT_MAGMA_TRAIL, player.GetCenterInWorld())
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