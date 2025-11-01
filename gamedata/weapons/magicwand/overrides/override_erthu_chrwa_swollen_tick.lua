function ADVR.onLoad()
	pickup.name = "Swollen Tick"
	pickup.desc = "Enemies explode when destroyed"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL}
	game.RegisterForRPCEvents(pickup)
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() and source == player.LocalPlayerRef then
		local damageArea = game.SpawnObjectLocal(objects.EFFECT_SWOLLEN_TICK, living.transform.position).GetComponent_DamageArea_()
		damageArea.enemiesImmune = false
		damageArea.playerImmune = true
		damageArea.damageMode = damageMode.ALL_OBJECTS
		damageArea.damage = player.SecondaryDamage.GetValueFloat() / 2
		pickup.SendRPCEvent(0, living.transform.position, rpcType.TO_PROXIES)
	end
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position)
	local damageArea = game.SpawnObjectLocal(objects.EFFECT_SWOLLEN_TICK, position).GetComponent_DamageArea_()
	damageArea.damageMode = damageMode.NO_OBJECTS
end