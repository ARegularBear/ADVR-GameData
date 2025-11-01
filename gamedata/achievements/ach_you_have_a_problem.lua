function ADVR.onLoad()
    achievement.name = "You Have A Problem"
    achievement.desc = "Use a Bandit Box at least twenty times during a single delve."
	achievement.hideDescription = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_CHICKEN_DINNER
    achievement.insightReward = 5

    TimesGambledKey = "ach_gamble_time_times_gambled"
end

function ADVR.onDungeonGenerated(worldGenerator)
    if game.helperMethods.IsInFirstDungeon(worldGenerator) then
        game.SaveInt(TimesGambledKey, 0)
    end
end

function ADVR.onSlotMachineGamble(machineType)
    if machineType ~= "random_reward" then
        return
    end

    local timesGambled = game.LoadInt(TimesGambledKey, 0) + 1
    if timesGambled == 20 then
        achievement.Unlock()
    end

    game.SaveInt(TimesGambledKey, timesGambled)
end
