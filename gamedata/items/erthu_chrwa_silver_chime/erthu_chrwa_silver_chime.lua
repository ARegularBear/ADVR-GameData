function ADVR.onLoad()
	pickup.name = "Silver Chime"
	pickup.desc = "Weapon strikes have a chance to summon wisps"
	pickup.weight = 100
	pickup.tier = 3
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorTrail(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorTrail(originalPlayerRef)
end

function ColorTrail(playerRef)
	helperMethods.SetTrailColorAll(playerRef, colors.Create(0.000, 0.690, 0.000, 0.407))
	helperMethods.SetTrailEmissionAll(playerRef, colors.Create(0.000, 0.762, 0.000, 0.327), 0.489)
end


function ADVR.onSecondaryHitEntity(infos)
	return HandleDamage(infos)
end

function ADVR.onPrimaryHitEntity(infos)
	return HandleDamage(infos)
end

function HandleDamage(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		if helperMethods.IsValidWithLuck(0, 0.15, 0.08) then
			game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
			audio.PlaySoundNetwork(sounds.SFX_DOOR_CHIME, player.transform.position)
		end
	end
	return infos.damage
end
