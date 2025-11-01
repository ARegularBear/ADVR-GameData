function ADVR.onLoad()
	progress.name = "Phantom Step"
	progress.desc = "Start with 20% evasion until you take damage. Resets on every new area entered."
	progress.price = 2
	progress.predecessor = progresses.PROGRESS_LETHAL_PRECISION

	Applied = false
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated()
	if Applied then
		return
	end
	
	Applied = true

	player.EvasionChance.RegisterAddend(progress.id, 0.2)
end

function ADVR.onPlayerHit(damage, damageSource, attackType, hitPosition)
	if damage > 0 then
		player.EvasionChance.ClearAddend(progress.id)
		Applied = false
	end
	return damage
end