-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Magnettic Aesthetic"
	progress.desc = "<i>Coins and keys are collected from a greater distance</i>"
	progress.price = 50
	progress.predecessor = "progress_marvellous_marks"
end

function ADVR.ProgressEvents.onBuy()
end