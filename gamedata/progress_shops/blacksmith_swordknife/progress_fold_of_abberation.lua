-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Fold of Abberration"
	progress.desc = "Your weapon damage is increased when striking aberant enemies."
	progress.price = 1
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsAbberrant() then
		return infos.damage + 1
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsAbberrant() then
		return infos.damage + 1
	end
	return infos.damage
end