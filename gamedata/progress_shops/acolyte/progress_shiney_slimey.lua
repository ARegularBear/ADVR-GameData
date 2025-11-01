-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Shiney Slimey"
	progress.desc = "<i>Golden Slimes may appear throughout all areas of The Ancient Dungeon.</i>"
	progress.price = 125
	progress.preObjectSpawnListeners = {
		game.GetObjectMapping("enemy_og_slime"),
		game.GetObjectMapping("enemy_id_slime"),
		game.GetObjectMapping("enemy_fg_slime_phase"),
		game.GetObjectMapping("enemy_gm_slime_bone"),
		game.GetObjectMapping("enemy_ns_slime"),
		game.GetObjectMapping("enemy_ns_slime_rotten"),
	}
	progress.predecessor = "progress_honeypot"
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPreObjectSpawn(prefab, obj, position)
	if game.IsPlayerWhoStartedRun() and game.currentFloor ~= dungeonFloor.ARENA then
		if helperMethods.RandomFromPosition(position) < 0.030 then
			return game.stringToObjectMapper.GetObject("enemy_golden_slime")
		end
	end
	return obj
end