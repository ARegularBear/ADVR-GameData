function ADVR.onLoad()
    achievement.name = "Unsealed Souls"
    achievement.desc = "Complete the delve of every Sealed Soul."
    achievement.insightReward = 20
end

function ADVR.onSpawnInHomeBase()
    for challenge in game.challengeInterpreter.challengesOnDisk do
        if challenge.Completed == false then
            return
        end
    end

    achievement.Unlock()
    
    -- Refresh the achievement UI.
    game.RefreshHomeBaseUIs()
end
