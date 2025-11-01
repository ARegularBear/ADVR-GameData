function ADVR.onLoad()
	pickup.name = "Miner's Mark"
	pickup.desc = "Once charged, use to produce a line of damaging spikes"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = 6
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = false --spike attacks are not correctly networked at the moment
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local tileInRoom = game.currentWorldGenerator.GetTileAtRealPos(player.transform.position)
	local pos = vector3.__new(player.transform.position.x, tileInRoom.GetGroundOffset(), player.transform.position.z)
	local circular = game.SpawnObjectNetwork(objects.EFFECT_SPIKE_ATTACK_CIRCULAR, pos)
	circular.transform.forward = player.transform.forward

	local spikes = circular.GetComponentsInChildren(game.GetType("SpikeAttack"))
	for spikeAttack in spikes do
		spikeAttack.transform.position = spikeAttack.transform.position + spikeAttack.transform.forward * 0.65
		spikeAttack.damage = (player.PrimaryDamage.GetValueFloat() + player.SecondaryDamage.GetValueFloat()) * 2
		spikeAttack.attackLength = 6
		spikeAttack.spacing = 0.95
		spikeAttack.networkedPlayerImmune = base.ToNetworkBool(true)
	end
end