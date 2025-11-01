function ADVR.onLoad()
	pickup.name = "Silk Chain"
	pickup.desc = "Ranged strikes teleport enemies to you"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 100
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SPECIAL }
	pickup.supportedInMultiplayer = true
	game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsRanged(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.940, 0.940, 0.940, 1.000), colors.Create(0.730, 0.730, 0.730, 1.000))
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsEnemy() == true and infos.entity.IsBoss() == false  then
		local goalPos = player.transform.position + player.transform.forward * 1.7
		infos.entity.transform.position = goalPos

		-- send rpc to apply position on all other players as well so syncing works correctly 
		pickup.SendRPCEvent(0, goalPos, infos.entity.networkObject, rpcType.TO_PROXIES)

		-- stun ai and loose target info
		if infos.entity.HasStateAuthority then
			local ai = infos.entity.gameObject.GetComponent_AI_()
			if ai ~= nil then
				ai.networkedHasSeenTarget = base.ToNetworkBool(false)
				ai.Stun(0.75)
			end
		end

		-- other update stuff for more consistency 
		TryStopSyncing(infos.entity)
	end

	return infos.damage
end

-- try to stop syncing the transforms for a short time to stop accidentally snapping back the enemy 
function TryStopSyncing(entity)
	local transformSimpleHumanoid = entity.gameObject.GetComponent_ADVRNetworkTransformSimpleHumanoid_()
	if transformSimpleHumanoid ~= nil then
		transformSimpleHumanoid.SetDontUpdateTimer(0.5)
		return
	end

	local transformSpecial = entity.gameObject.GetComponent_ADVRNetworkTransformSpecial_()
	if transformSpecial ~= nil then
		transformSpecial.SetInterruptAdjustmentTimer(0.5)
		return
	end

	local networkRigidbody = entity.gameObject.GetComponent_ADVRNetworkRigidbody_()
	if networkRigidbody ~= nil then
		networkRigidbody.StopSyncingFor(0.5)
		return
	end
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position, networkObject)
	networkObject.transform.position = position

	local ai = networkObject.GetComponent_AI_()
	if ai ~= nil and ai.HasStateAuthority then
		ai.networkedHasSeenTarget = base.ToNetworkBool(false)
		ai.Stun(0.75)
	end

	TryStopSyncing(networkObject)
end