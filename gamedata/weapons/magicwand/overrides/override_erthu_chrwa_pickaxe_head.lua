function ADVR.onLoad()
	pickup.name = "Pickaxe Head"
	pickup.desc = "Your book sweep attack produces a line of damaging spikes"
end

function ADVR.onPickup()
	pickup.RegisterItem()
	LastAttackTime = time.time
end

function ADVR.onTomeSweep(sweepPosition, forwardVector)
	--check time between attacks on ground so we can't spam the attack
	if time.time - LastAttackTime < 2.5 then
		return
	end

	-- raycast to ground to spawn the spike attack
	local isHit, raycastHit = physics.Raycast(sweepPosition, vector3.down, nil, 4, layerMask.GetMask(layers.GROUND))
	if isHit then	
		local spawnPos = raycastHit.point
		local spikeAttack = game.SpawnObjectNetwork(objects.EFFECT_SPIKE_ATTACK, spawnPos).GetComponent_SpikeAttack_()
		
		forwardVector.y = 0
		spikeAttack.transform.forward = forwardVector.normalized
		spikeAttack.networkedPlayerImmune = base.ToNetworkBool(true)

		-- adjust spike attack values
		spikeAttack.attackLength = 7
		spikeAttack.spacing = 1.33
		spikeAttack.damage = player.GetPrimaryDamageWithPickupModifiers()
		spikeAttack.timeBetweenSpikes = 0.11

		LastAttackTime = time.time
	end
end