function ADVR.onLoad()
    achievement.name = "Close The Book"
    achievement.desc = "Discover all items."
	achievement.insightReward = 10
end

function ADVR.onPlayerDeath()
	Unlock()
end

function ADVR.onRunComplete()
	Unlock()
end

function Unlock()
	local unlocked = true
	for pickupDiskRepresentation in game.itemInterpreter.pickupsOnDisk do
		if not pickupDiskRepresentation.HasFoundItem() then
			unlocked = false
			break
		end
	end

	if unlocked then
		achievement.Unlock()
	end
end
