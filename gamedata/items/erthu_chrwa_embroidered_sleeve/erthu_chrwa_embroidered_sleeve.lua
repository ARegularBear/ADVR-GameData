function ADVR.onLoad()
	pickup.name = "Embroidered Sleeve"
	pickup.desc = "Gain a large amount of protection after destroying the next boss, but that boss's damage is doubled"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	KilledBoss = false
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	KilledBoss = false
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if KilledBoss == false and not player.isDead then
		player.Heal(3, player.GetBaseEtherealHeartType())
		KilledBoss = true
	end
end

function ADVR.onPlayerHit(damage)
	local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position, true)
	if KilledBoss == false and room ~= nil then
		if room.type == roomTypes.BOSS then
			return damage + 1
		end
	end

	return damage
end