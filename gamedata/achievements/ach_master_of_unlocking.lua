function ADVR.onLoad()
    achievement.name = "Master of Unlocking"
    achievement.desc = "Open 250 chests"
    achievement.unlocksItem = relics.ERTHU_CHRWA_OVERSTOCK_FLYER
    achievement.insightReward = 5
end

function ADVR.onRunComplete()
    if game.playerStatistics.GetStatistic(statistic.CHESTS_OPENED) >= 250 then
        achievement.Unlock()
    end
end

function ADVR.onPlayerDeath()
    if game.playerStatistics.GetStatistic(statistic.CHESTS_OPENED) >= 250 then
        achievement.Unlock()
    end
end
