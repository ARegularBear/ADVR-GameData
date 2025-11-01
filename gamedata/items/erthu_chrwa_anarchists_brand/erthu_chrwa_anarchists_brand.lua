function ADVR.onLoad()
	pickup.name = "Anarchist's Brand"
	pickup.desc = "For a cost, use to cause an explosion"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = 9999
	pickup.tier = 2
	pickup.price = 20
	pickup.spawnsIn = {relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
	if player.SharedCashPool < 4 then
		pickup.currentCharge = 0
		game.activePickupSlot.UpdateChargeDisplay()
	end

	local livings = game.GetLivingInRadius(100, player.transform.position, false)
end

function ADVR.onPickupActivate()
	if player.SharedCashPool > 4 then
		player.currentCash = player.currentCash - 4
		if player.SharedCashPool > 4 then
			pickup.CallFunctionIn("Recharge", 1)
		end

		local explosion = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, game.playerController.rightHand.transform.position).GetComponent_Explosion_()
		explosion.damage = player.PrimaryDamage.GetValueFloat() * player.SecondaryDamage.GetValueFloat()
	end
end

function Recharge()
	pickup.currentCharge = 9999
	game.activePickupSlot.UpdateChargeDisplay()
end

function ADVR.onPlayerValueChanged(statID)
    if statID == playerValues.CURRENT_CASH then
		if player.SharedCashPool >= 4 then
			pickup.currentCharge = 9999
			game.activePickupSlot.UpdateChargeDisplay()
		end
    end
end

function ADVR.onObjectCollect(obj)
	if obj == "coin" then
		if player.SharedCashPool >= 4 then
			pickup.currentCharge = 9999
			game.activePickupSlot.UpdateChargeDisplay()
		end
	end
end