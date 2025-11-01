-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Introspec'd"
	progress.desc = "<i>The stat screen will show you more detailed information on your stats</i>"
	progress.price = 20
	progress.predecessor = "progress_marvellous_marks"
end

function ADVR.ProgressEvents.onBuy()
end