-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Reactive Polarization"
	progress.desc = "When you defeat an enemy with the dagger, your crossbow bolt is retrieved immediately."
	progress.price = 5
	progress.priority = -7777 -- needs to run late so we can measure if we would kill the enemy with dagger
	progress.predecessor = progresses.PROGRESS_PRESSURIZED_CAPSULE
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() and infos.entity.Health <= infos.damage then
		game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.afterShootTimer = 1000
	end

	return infos.damage
end