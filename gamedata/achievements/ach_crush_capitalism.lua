function ADVR.onLoad()
    achievement.name = "Crush Capitalism"
    achievement.desc = "Deafeat a Mad Merchant"
    achievement.hideDescription = true
    achievement.entityDeathListeners = {"enemy_corrupted_shopkeeper"}
    achievement.unlocksItem = "cosmetic:27" -- Merchant Mask
    achievement.insightReward = 5
end

function ADVR.onEntityDeath(living, source)
    if source == player.LocalPlayerRef then
        achievement.Unlock()
    end
end