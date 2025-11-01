function ADVR.onLoad()
    achievement.name = "Ride the Waves"
	achievement.desc = "Reach an arena score of 750 or more"
	achievement.insightReward = 5
end

function ADVR.onPlayerDeath()
    arena = game.GetArenaManager() ---@type ArenaManager
    if arena ~= nil then
        if arena.networkedCurrentKills >= 750 then
            achievement.Unlock()
        end
    end
end