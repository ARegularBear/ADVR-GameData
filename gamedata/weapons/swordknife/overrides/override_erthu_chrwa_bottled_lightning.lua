function ADVR.onLoad()
	pickup.name = "Bottled Lightning"
	pickup.desc = "Projectiles slowly increase in size and damage, but reset after each strike"
	pickup.weight = 44
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.globalTickDelay = 0.05
	pickup.supportedInMultiplayer = true
	game.RegisterForRPCEvents(pickup)

	BaseScale = vector3.__new(0.33, 0.33, 0.33)
	GrowSpeed = 0.07
	MaxSize = 2.0
end

function ADVR.onPickup()
	pickup.RegisterItem()
	KnifeThrown = false
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
	FunctionOnRepeat = pickup.CallFunctionOnRepeat("ProxyGlobalTick", 9999, pickup.globalTickDelay)
	ProxyShouldGrow = false
end

function ADVR.onGameReloadMP()
	if FunctionOnRepeat ~= nil then
		FunctionOnRepeat.shouldCancel = true
	end
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsRanged(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.284, 0.907, 1.000, 1.000), colors.Create(0,0,0,0))
	helperMethods.SetTrailColorRanged(playerRef, colors.Create(0.165, 1.000, 0.957, 0.197))
	helperMethods.SetTrailEmissionRanged(playerRef, colors.Create(0.169, 1.000, 0.958, 0.000), 0.845)
end

function ADVR.onKnifeInHand()
	KnifeThrown = false
	game.inventory.currentSecondaryWeapon.transform.localScale = BaseScale
	pickup.SendRPCEvent(0, rpcType.TO_PROXIES)
end

function ADVR.onRangedHitEntity(infos)
	return infos.damage * (game.inventory.currentSecondaryWeapon.transform.localScale.x + 0.33)
end

function ADVR.onGlobalTick()
	local objToScale = game.inventory.currentSecondaryWeapon.transform

	if objToScale.gameObject.activeSelf then
		if objToScale.localScale.x < MaxSize and KnifeThrown == false then
			objToScale.localScale = (objToScale.localScale.x + GrowSpeed) * vector3.__new(1,1,1)
		end
	else
		objToScale.localScale = BaseScale
		KnifeThrown = false
	end
end

function ADVR.onKnifeThrow()
	KnifeThrown = true
	pickup.SendRPCEvent(1, rpcType.TO_PROXIES)
end

function ADVR.onRPCReceived(eventID, sourcePlayer)
	SourcePlayerWeapon = sourcePlayer.playerController.networkedPlayerInventory.currentSecondaryWeapon

	if eventID == 0 then -- Knife In Hand Scale
		SourcePlayerWeapon.transform.localScale = BaseScale
		ProxyShouldGrow = true
	else -- Knife throw
		ProxyShouldGrow = false
	end
end

function ProxyGlobalTick()
	if SourcePlayerWeapon == nil then
		return
	end

	local objToScale = SourcePlayerWeapon.transform

	if objToScale.gameObject.activeSelf then
		if objToScale.localScale.x < MaxSize and ProxyShouldGrow == true then
			objToScale.localScale = (objToScale.localScale.x + GrowSpeed) * vector3.__new(1,1,1)
		end
	else
		objToScale.localScale = BaseScale
	end
end