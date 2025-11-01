function ADVR.onLoad()
    achievement.name = "Mock the Cradle"
	achievement.desc = "Survive the Arena until the Beast's Cradle with any weapon"
	achievement.insightReward = 5
end

function ADVR.onPlayerDeath()
    arena = game.GetArenaManager() ---@type ArenaManager
    if arena ~= nil then
        if arena.networkedCurrentWave >= 53 then
            achievement.Unlock()
        end
    end
end