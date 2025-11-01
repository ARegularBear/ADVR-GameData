function ADVR.onLoad()
	progress.name = "Forceful Flourish"
	progress.desc = "Striking enemies with your charged wand will knock them back a great distance"
	progress.price = 1
	progress.predecessor = progresses.PROGRESS_MANA_MASTERY
end

function ADVR.ProgressEvents.onBuy()
end