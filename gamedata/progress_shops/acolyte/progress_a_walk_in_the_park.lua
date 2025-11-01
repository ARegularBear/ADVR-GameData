-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "A Walk in the Park"
	progress.desc = "<i>Movement speed increases when no enemies are present</i>"
	progress.price = 35
	progress.predecessor = "progress_the_boss_stash"
	progress.globalTickDelay = 0.66

	CurrentMoveSpeedMultiplier = 1.0
	AdjustSpeed = 0.07
	MaxSpeed = 1.2
	MinSpeed = 1.0
	InRoutine = false
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onGlobalTick()
	if #game.GetEnemiesInRadius(13, player.transform.position, false) == 0 then
		if CurrentMoveSpeedMultiplier < MaxSpeed and not InRoutine then
			InRoutine = true
			progress.CallFunctionOnRepeat("AdjustSpeedUp", 2, 0.0)
		end
	else
		if CurrentMoveSpeedMultiplier > MinSpeed and not InRoutine then
			InRoutine = true
			progress.CallFunctionOnRepeat("AdjustSpeedDown", 2, 0.0)
		end
	end
end

function AdjustSpeedUp()
	CurrentMoveSpeedMultiplier = CurrentMoveSpeedMultiplier + game.DELTA_TIME * AdjustSpeed
	if CurrentMoveSpeedMultiplier > MaxSpeed then
		CurrentMoveSpeedMultiplier = MaxSpeed
	end
	if not game.IsInMenu() then
		player.MoveSpeed.ChangeMultiplier(progress.id, CurrentMoveSpeedMultiplier)
	end
	InRoutine = false
end

function AdjustSpeedDown()
	CurrentMoveSpeedMultiplier = CurrentMoveSpeedMultiplier - game.DELTA_TIME * AdjustSpeed
	if CurrentMoveSpeedMultiplier < MinSpeed then
		CurrentMoveSpeedMultiplier = MinSpeed
	end
	if not game.IsInMenu() then
		player.MoveSpeed.ChangeMultiplier(progress.id, CurrentMoveSpeedMultiplier)
	end
	InRoutine = false
end

