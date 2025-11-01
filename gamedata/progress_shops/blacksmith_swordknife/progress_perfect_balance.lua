-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Perfect Balance"
	progress.desc = "When you defeat an enemy, you gain a short period of increased weapon damage."
	progress.price = 5
	LastKillTime = 0
	progress.predecessor = progresses.PROGRESS_FOLD_OF_OBLITERATION
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPrimaryHitEntity(infos)
	if time.time - LastKillTime < 5 then
		return infos.damage * 1.1 + 1
	end
	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if time.time - LastKillTime < 5 then
		return infos.damage * 1.1 + 1
	end
	return infos.damage
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() and source == player.LocalPlayerRef then
		LastKillTime = time.time
	end
end