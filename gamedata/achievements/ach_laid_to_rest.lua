function ADVR.onLoad()
    achievement.name = "Laid to Rest"
    achievement.desc = "Complete 3 unique sealed soul delves."
    achievement.unlocksItem = relics.ERTHU_CHRWA_LOBSTER_BIB
    achievement.insightReward = 5
end

function ADVR.onSpawnInHomeBase()
    local completedChallenges = 0
    for challenge in game.challengeInterpreter.challengesOnDisk do
        if challenge.Completed == true then
            completedChallenges = completedChallenges + 1

            if completedChallenges == 3 then
                achievement.Unlock()
    
                -- Refresh the achievement UI.
                game.RefreshHomeBaseUIs()
                return
            end
        end
    end
end