function ADVR.onLoad()
    achievement.name = "They Belong in a Museum!"
    achievement.desc = "Collect more than 500 relics in total."
    achievement.unlocksItem = relics.SEBWR_SHINING_CATALYST
    achievement.insightReward = 5
end

function ADVR.onRunComplete()
    if game.playerStatistics.GetStatistic(statistic.TOTAL_PICKUPS_COLLECTED) >= 500 then
        achievement.Unlock()
    end
end

function ADVR.onPlayerDeath()
    if game.playerStatistics.GetStatistic(statistic.TOTAL_PICKUPS_COLLECTED) >= 500 then
        achievement.Unlock()
    end
end
