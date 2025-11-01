-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "A Point of Interest"
	progress.desc = "<i>Areas featuring unique elements may be found</i>"
	progress.price = 30
	progress.predecessor = "progress_the_boss_stash"
end

function ADVR.ProgressEvents.onBuy()
end