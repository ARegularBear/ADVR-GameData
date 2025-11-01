function ADVR.onLoad()
    achievement.name = "Jingleheimer Schmidt"
	achievement.desc = "Carry more than twenty keys during a single delve."
	achievement.hideDescription = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_ESTATE_KEYS
    achievement.insightReward = 3
end

function ADVR.onPlayerValueChanged(val)
    if val == "currentKeys" then
        if player.networkObject.IsValid and player.SharedKeyPool >= 20 then
            achievement.Unlock()
        end
    end
end