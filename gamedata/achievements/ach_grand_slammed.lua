function ADVR.onLoad()
    achievement.name = "Grand Slammed"
    achievement.desc = "Defeat 1000 enemies."
    achievement.unlocksItem = relics.SEBWR_TICKING_TREAT
    achievement.insightReward = 5
end

function ADVR.onRunComplete()
    if game.playerStatistics.GetStatistic(statistic.TOTAL_ENEMIES_KILLED) >= 1000 then
        achievement.Unlock()
    end
end

function ADVR.onPlayerDeath()
    if game.playerStatistics.GetStatistic(statistic.TOTAL_ENEMIES_KILLED) >= 1000 then
        achievement.Unlock()
    end
end
