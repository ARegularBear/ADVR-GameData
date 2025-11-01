function ADVR.onLoad()
	progress.name = "Double Edged"
	progress.desc = "Your knife deals its full damage when returning to your hand."
	progress.price = 2
	progress.predecessor = progresses.PROGRESS_FOLD_OF_ABBERATION
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onKnifeThrow()
	if player ~= nil and game.inventory.currentSecondaryWeapon ~= nil then
		game.inventory.currentSecondaryWeapon.AsThrowingKnifeBase().pullbackDamage = player.GetSecondaryDamageWithPickupModifiers()
	end
end