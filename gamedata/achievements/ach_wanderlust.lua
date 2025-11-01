function ADVR.onLoad()
    achievement.name = "Wanderlust"
	achievement.desc = "Explore two hundred fifty rooms within The Ancient Dungeon."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_DOOR_CHIME
	achievement.insightReward = 5
end

function ADVR.onRoomEntered(room)
	local roomsEntered = game.LoadInt("ach_wanderer_rooms_explored", 0)
	game.SaveInt("ach_wanderer_rooms_explored", roomsEntered + 1)
	
	if roomsEntered > 249 then
		achievement.Unlock()
	end	
end