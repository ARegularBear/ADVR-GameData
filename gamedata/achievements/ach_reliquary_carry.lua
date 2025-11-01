function ADVR.onLoad()
    achievement.name = "Reliquary Carry"
    achievement.desc = "Collect more than 30 relics in a single run."
	achievement.unlocksItem = relics.SEBWR_CURSED_KNIFE
	achievement.insightReward = 5
end

function ADVR.onRunComplete()
    CheckUnlock()
end

function ADVR.onPlayerDeath()
    CheckUnlock()
end


function CheckUnlock()
	local amountPickups = game.itemInterpreter.TotalPickupsFoundInRunByASpecificPlayer(player.LocalPlayerRef)
	if amountPickups >= 30 then
		achievement.Unlock()
	end
end