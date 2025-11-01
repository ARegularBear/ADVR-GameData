function ADVR.onLoad()
	progress.name = "Words of Vengeance"
	progress.desc = "Your spells damage is increased when striking aberrant or boss enemies"
	progress.price = 2
	progress.predecessor = progresses.PROGRESS_MANA_MASTERY
end

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

function ADVR.onRangedHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsAbberrant() or infos.entity.IsBoss() then
		return infos.damage + 1
	end
	return infos.damage
end