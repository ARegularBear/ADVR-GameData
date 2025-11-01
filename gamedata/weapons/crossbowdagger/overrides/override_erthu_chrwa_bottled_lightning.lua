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
	GrowSpeed = 0.0115
	MaxSize = 0.8
end

function ADVR.onPickup()
	pickup.RegisterItem()
	KnifeThrown = false
	ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorWeapons(originalPlayerRef)
	FunctionOnRepeat = pickup.CallFunctionOnRepeat("ProxyGlobalTick", 99999, pickup.globalTickDelay)
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
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().arrowDecoy.transform.localScale = BaseScale
	pickup.SendRPCEvent(0, rpcType.TO_PROXIES)
end

function ADVR.onRangedHitEntity(infos)
	return infos.damage * (game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.transform.localScale.x * 1.4 + 0.35)
end

function ADVR.onGlobalTick()
	local objToScale = game.inventory.currentPrimaryWeapon.AsCrossbowBase().arrowDecoy.transform

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
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.transform.localScale = game.inventory.currentPrimaryWeapon.AsCrossbowBase().arrowDecoy.transform.localScale
	pickup.SendRPCEvent(1, rpcType.TO_PROXIES)
end

function ADVR.onRPCReceived(eventID, sourcePlayer)
	SourcePlayerWeaponDecoy = sourcePlayer.playerController.networkedPlayerInventory.currentPrimaryWeapon.AsCrossbowBase().arrowDecoy
	SourcePlayerWeaponBolt = sourcePlayer.playerController.networkedPlayerInventory.currentPrimaryWeapon.AsCrossbowBase().bolt

	if eventID == 0 then -- Bolt attached
		ProxyShouldGrow = true
		SourcePlayerWeaponDecoy.transform.localScale = BaseScale
		SourcePlayerWeaponBolt.transform.localScale = BaseScale
	else -- bolt shot
		ProxyShouldGrow = false
	end
end

function ProxyGlobalTick()
	if SourcePlayerWeaponDecoy == nil then
		return
	end

	local objToScale = SourcePlayerWeaponDecoy.transform

	if objToScale.gameObject.activeSelf then
		if objToScale.localScale.x < MaxSize and ProxyShouldGrow == true then
			objToScale.localScale = (objToScale.localScale.x + GrowSpeed) * vector3.__new(1,1,1)
		end
	else
		objToScale.localScale = BaseScale
	end
end