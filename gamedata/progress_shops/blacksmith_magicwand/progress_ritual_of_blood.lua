function ADVR.onLoad()
	progress.name = "Ritual of Blood"
	progress.desc = "The tomes sweep attack deals an additional bleeding effect"
	progress.price = 3
	progress.predecessor = progresses.PROGRESS_MANA_MASTERY
end

function ADVR.ProgressEvents.onBuy()
end