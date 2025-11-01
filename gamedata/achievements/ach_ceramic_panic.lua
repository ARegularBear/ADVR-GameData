function ADVR.onLoad()
    achievement.name = "Ceramic Panic"
    achievement.desc = "Destroy one thousand pots."
    achievement.unlocksItem = relics.ERTHU_CHRWA_WITHERED_SAPLING
    achievement.insightReward = 5
end

function ADVR.onRunComplete()
    if game.playerStatistics.GetStatistic(statistic.POTS_DESTROYED) >= 1000 then
        achievement.Unlock()
    end
end

function ADVR.onPlayerDeath()
    if game.playerStatistics.GetStatistic(statistic.POTS_DESTROYED) >= 1000 then
        achievement.Unlock()
    end
end
