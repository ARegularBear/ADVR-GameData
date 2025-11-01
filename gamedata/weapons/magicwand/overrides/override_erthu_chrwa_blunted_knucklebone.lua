function ADVR.onLoad()
	pickup.name = "Blunted Knucklebone"
	pickup.desc = "Hitting enemies with your orb has a chance to increase your number of coins"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ColorMeleeWeapon(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
	ColorMeleeWeapon(originalPlayerRef)
end

function ColorMeleeWeapon(playerRef)
	helperMethods.UpdateWeaponColorsAll(
		playerRef,
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.581, 0.671, 1.000, 1.000), 
		colors.CLEAR,
		colors.CLEAR,
		colors.Create(0.753, 0.729, 0.248, 1.000), 
		colors.CLEAR
	)
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		if helperMethods.IsValidWithLuck(0, pickup.AmountActiveLocal() * 0.075, pickup.AmountActiveLocal() * 0.045) then
			player.currentCash = player.currentCash + 1
		end
	end
	return infos.damage
end