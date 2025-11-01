function ADVR.onLoad()
	pickup.name = "Relentless Orchestrina"
	pickup.desc = "Summon an eternal wisp companion"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if Wisp ~= nil then
		game.Delete(Wisp)
	end
	Wisp = game.SpawnObjectNetwork(objects.COMPANION_WISP_INVINCIBLE, player.transform.position)
end

function ADVR.onGameReloadMP()
	if Wisp ~= nil then
		game.Delete(Wisp)
	end
end