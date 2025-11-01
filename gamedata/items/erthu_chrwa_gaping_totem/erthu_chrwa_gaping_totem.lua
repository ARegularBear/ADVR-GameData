function ADVR.onLoad()
	pickup.name = "Gaping Totem"
	pickup.desc = "Significantly increases weapon damage, but each strike costs a coin"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 3
	pickup.globalTickDelay = 0.8
	pickup.price = 40
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.SecondaryDamage.RegisterAddend(pickup.id, 1.2)
	ColorWeapons(player.LocalPlayerRef)

end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	player.SecondaryDamage.RegisterAddend(pickup.id, 1.2)
	ColorWeapons(originalPlayerRef)
end

function ColorWeapons(playerRef)
	helperMethods.UpdateWeaponColorsAll(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(1.000, 0.963, 0.370, 1.000), colors.Create(0,0,0,0))
	helperMethods.SetTrailColorAll(playerRef, colors.Create(1.000, 0.941, 0.000, 0.102))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(1.000, 0.941, 0.000, 1.000), 1.174)
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		if player.SharedCashPool > 0 then
			return infos.damage * 1.35 + 2
		end
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		if player.SharedCashPool > 0 then
			player.currentCash = player.currentCash - 1
			audio.PlaySoundNetwork(sounds.SFX_GAPING_TOTEM, infos.hitPosition)
			return infos.damage * 1.35 + 2
		end
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		if player.SharedCashPool > 0 then
			return infos.damage * 1.35 + 2
		end
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		if player.SharedCashPool > 0 then
			player.currentCash = player.currentCash - 1
			audio.PlaySoundNetwork(sounds.SFX_GAPING_TOTEM, infos.hitPosition)
			return infos.damage * 1.35 + 2
		end
	end
	return infos.damage
end
