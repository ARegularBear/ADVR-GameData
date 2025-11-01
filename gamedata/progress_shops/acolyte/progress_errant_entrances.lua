-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Errant Entrances"
	progress.desc = "<i>Alternate Floors are unlocked</i>"
	progress.price = 50
	progress.predecessor = "progress_the_boss_stash"
end

function ADVR.ProgressEvents.onBuy()
end