function ADVR.onLoad()
    achievement.name = "Grand Spammed"
    achievement.desc = "Spend 1000 coins at shops."
    achievement.unlocksItem = relics.SEBWR_SPOILED_BRAT
    achievement.insightReward = 5
end

function ADVR.onRunComplete()
    if game.playerStatistics.GetStatistic(statistic.CASH_SPEND_IN_SHOP) >= 1000 then
        achievement.Unlock()
    end
end

function ADVR.onPlayerDeath()
    if game.playerStatistics.GetStatistic(statistic.CASH_SPEND_IN_SHOP) >= 1000 then
        achievement.Unlock()
    end
end
