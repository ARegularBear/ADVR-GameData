function ADVR.onLoad()
	progress.name = "Arcane Momentum"
	progress.desc = "Special attacks need less hits to charge up"
	progress.price = 5
	progress.predecessor = progresses.PROGRESS_RITUAL_OF_BLOOD
end

function ADVR.ProgressEvents.onBuy()
end