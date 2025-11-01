function ADVR.onLoad()
    achievement.name = "Apprentice Cartographer"
	achievement.desc = "Discover your first point of interest."
	achievement.unlocksItem = relics.SEBWR_WORN_SHOVEL
	achievement.insightReward = 5
end

function ADVR.onRoomEntered(room)
	if (room.type == roomTypes.POI) then
		achievement.Unlock()
	end
end