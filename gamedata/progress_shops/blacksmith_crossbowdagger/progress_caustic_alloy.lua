-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Caustic Alloy"
	progress.desc = "Your dagger's damage is increased when striking aberant or boss enemies."
	progress.price = 3
	progress.predecessor = progresses.PROGRESS_TETHERED_BOLT
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onMeleeHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsAbberrant() or infos.entity.IsBoss() then
		return infos.damage + 1
	end
	return infos.damage
end