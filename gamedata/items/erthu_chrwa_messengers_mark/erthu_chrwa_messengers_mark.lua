function ADVR.onLoad()
	pickup.name = "Messenger's Mark"
	pickup.desc = "Once charged, use to dash"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SECRET, relicPool.SACRIFICE }
	pickup.isActivateItem = true
	pickup.priority = -99999 --low priority so if we get hit during dash, we can negate the damage
	InDash = false
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function OnDashStep()
	local direction = game.playerHeadset.transform.forward
	direction.y = 0
	direction = direction.normalized * time.deltaTime * 12

	if physics.Raycast(game.playerLiving.transform.position, direction, 0.75, layerMask.GetMask(layers.STATIC, layers.GROUND)) then
		direction = vector3.zero
	end

	player.characterController.Move(direction)
end

function ADVR.onPlayerHit(damage)
	if InDash then
		return 0
	end
	return damage
end

function ADVR.onPickupActivate()
	InDash = true
	audio.PlaySoundNetwork(sounds.WIGHT_DASH_MONO, player.transform.position)
	pickup.CallFunctionOnRepeat("OnDashStep", 0.4, 0.0)
	pickup.CallFunctionIn("RemoveInvincibility", 0.4)
end

function RemoveInvincibility()
	InDash = false
end