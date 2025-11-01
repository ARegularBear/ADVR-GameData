-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Devilish Deals"
	progress.desc = "<i>Some rooms contain mysterious statues with which a bargain can be made."
	progress.price = 25
	progress.predecessor = "progress_hidden_passages"
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end