function ADVR.onLoad()
    achievement.name = "Deep Pockets"
    achievement.desc = "Carry more than two hundred fifty coins during a single delve."
    achievement.unlocksItem = relics.ERTHU_CHRWA_VELVET_PURSE
    achievement.insightReward = 3
end

function ADVR.onPlayerValueChanged(val)
    if val == playerValues.CURRENT_CASH then
        if player.networkObject.IsValid and player.SharedCashPool >= 250 then
            achievement.Unlock()
        end
    end
end