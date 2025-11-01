function ADVR.onLoad()
    achievement.name = "Errant Entrance"
    achievement.desc = "Discover a secret room in the wall."
	achievement.unlocksItem = relics.ERTHU_CHRWA_THIEFS_MARK
	achievement.hideDescription = false
	achievement.insightReward = 2
end

function ADVR.onRoomEntered(room)
	if room.type == roomTypes.SECRET then
		achievement.Unlock()
	end
end