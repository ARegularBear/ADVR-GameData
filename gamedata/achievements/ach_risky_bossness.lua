function ADVR.onLoad()
    achievement.name = "Risky Boss-ness"
	achievement.desc = "Challenge and destroy a boss with only a half-heart of health"
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_WINGED_SHOE
	achievement.priority = 0
	achievement.insightReward = 5

    That_was_close_start = false
end

function ADVR.onRoomEntered(room)
    if room.type == roomTypes.BOSS then
        if player.RealHealth == 1 then
            That_was_close_start = true
        end
    end
end

function ADVR.onEntityDeath(living, source)
    if living.IsBoss() then
        if player.RealHealth > 1 then
            That_was_close_start = false
        end

        if That_was_close_start then
            achievement.Unlock()
        end
    end
end