-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Another Interesting Point"
	progress.desc = "<i>Points of interest have a higher chance of appearing.</i>"
	progress.price = 75
	progress.predecessor = "progress_a_point_of_interest"
end

function ADVR.ProgressEvents.onBuy()
end