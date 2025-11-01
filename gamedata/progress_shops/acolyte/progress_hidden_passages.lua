-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Hidden Passages"
	progress.desc = "<i>Secret areas may be found in walls, ceilings, or floors.</i>"
	progress.price = 5
	progress.predecessor = nil
	progress.globalTickDelay = 2
end

function ADVR.ProgressEvents.onBuy()
end