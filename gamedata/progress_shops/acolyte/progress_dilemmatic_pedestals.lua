-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Dilemmatic Pedestals"
	progress.desc = "<i>Pedestals may offer two upgrade items to choose from.</i>"
	progress.price = 60
	progress.preObjectSpawnListeners = {game.stringToObjectMapper.GetObject("item_podest")}
	progress.predecessor = "progress_devilish_deals"
	ChanceToDouble = 0.4
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPreObjectSpawn(prefab, obj, position)
	if game.IsPlayerWhoStartedRun() then
		if helperMethods.RandomFromPosition(position) < ChanceToDouble then
			return game.stringToObjectMapper.GetObject("item_podest_choose_one")
		end
	end
	return obj
end