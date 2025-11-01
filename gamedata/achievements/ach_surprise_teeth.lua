function ADVR.onLoad()
    achievement.name = "Surprise! Teeth!"
    achievement.desc = "Defeat a Chest Mimic."
    achievement.entityDeathListeners = {"enemy_chest_mimic"}
    achievement.unlocksItem = relics.ERTHU_CHRWA_TWO_HEADED_COIN
    achievement.insightReward = 3
end

function ADVR.onEntityDeath(living, source)
    if source == player.LocalPlayerRef then
        achievement.Unlock()
    end
end