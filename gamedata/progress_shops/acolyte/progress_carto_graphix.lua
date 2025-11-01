-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Carto GraphiX"
	progress.desc = "<i>Chests, Relics and doors you encounter are indicated on the map</i>"
	progress.price = 30
	progress.predecessor = "progress_marvellous_marks"
end

function ADVR.ProgressEvents.onBuy()
end