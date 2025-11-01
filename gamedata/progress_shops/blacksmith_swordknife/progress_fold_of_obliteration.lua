-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Fold of Obliteration"
	progress.desc = "Your weapon damage is increased when striking boss enemies."
	progress.price = 1
	progress.predecessor = progresses.PROGRESS_FOLD_OF_ABBERATION
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsBoss() then
		return infos.damage + 1
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsBoss() then
		return infos.damage + 1
	end
	return infos.damage
end