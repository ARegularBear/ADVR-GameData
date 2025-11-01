function ADVR.onLoad()
	pickup.name = "Pickaxe Head"
	pickup.desc = "Striking the ground with your melee weapon produces a line of damaging spikes"
end

function ADVR.onPickup()
	pickup.RegisterItem()
	LastAttackTime = time.time
end

function ADVR.onMeleeWeaponCollide(sword,collision)
	-- check time between attacks on ground so we can't spam the attack
	if time.time - LastAttackTime < 2.5 then
		return
	end

	-- check if attack is fast enough --
	if game.inventory.currentSecondaryWeapon.AsSwordBase().tipVelocity.GetVelocityEstimate().magnitude < 4 then
		return
	end
	if game.inventory.currentSecondaryWeapon.handleVelocity.GetVelocityEstimate().magnitude < 1 then
		return
	end

	-- spawn the spike attack when player hits ground 
	local ground = collision.GetContact(0).otherCollider.gameObject
	if ground.layer == 9 then
		local spawnPos = game.inventory.currentSecondaryWeapon.tipVelocity.transform.position
		spawnPos.y = ground.transform.position.y
		spawnPos = spawnPos + game.playerHeadset.transform.forward * 0.25
		local spikeAttack = game.SpawnObjectNetwork(objects.EFFECT_SPIKE_ATTACK, spawnPos).GetComponent_SpikeAttack_()
		
		local frwrd = game.playerHeadset.transform.forward
		frwrd.y = 0

		spikeAttack.transform.forward = frwrd.normalized
		spikeAttack.networkedPlayerImmune = base.ToNetworkBool(true)

		-- adjust spike attack values
		spikeAttack.attackLength = 7
		spikeAttack.spacing = 1.33
		spikeAttack.damage = player.GetPrimaryDamageWithPickupModifiers()
		spikeAttack.timeBetweenSpikes = 0.11

		LastAttackTime = time.time
	end
end