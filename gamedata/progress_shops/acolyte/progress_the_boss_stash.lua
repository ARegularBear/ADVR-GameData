-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "The Boss's Stash"
	progress.desc = "<i>You receive a potato after defeating boss enemies."
	progress.price = 25
	progress.predecessor = "progress_hidden_passages"
end

function ADVR.ProgressEvents.onBuy()
end