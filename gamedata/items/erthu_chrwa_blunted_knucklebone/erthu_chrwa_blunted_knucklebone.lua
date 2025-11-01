
function ADVR.onLoad()
	pickup.name = "Blunted Knucklebone"
	pickup.desc = "Melee strikes have a chance to increase your number of coins"
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
	helperMethods.UpdateWeaponColorsMelee(playerRef, colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0,0,0,0), colors.Create(0.992, 0.762, 0.011, 1.000), colors.Create(0,0,0,0), colors.Create(0,0,0,0))
end


function ADVR.onMeleeHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		if helperMethods.IsValidWithLuck(0, pickup.AmountActiveLocal() * 0.07, pickup.AmountActiveLocal() * 0.05) then
			player.currentCash = player.currentCash + 1
		end
	end
	return infos.damage
end