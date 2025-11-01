-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "I have a system"
	progress.desc = "<i>Your chance of winning at The Merchant's Slot Machine is increased."
	progress.price = 25
	progress.predecessor = "progress_hidden_passages"
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end