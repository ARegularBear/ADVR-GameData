function ADVR.onLoad()
    achievement.name = "Merciless Killer"
	achievement.desc = "Fully augment the Assassin's Armament."
	achievement.hideDescription = false
    achievement.insightReward = 7

    NpcIdKey = "blacksmith_crossbowdagger"
end

function ADVR.onVersionUpgrade(previous, current)
    -- ea0.1.1.0
    if previous < 2 and current >= 2 and HasBoughtAllUpgrades() == true then
        achievement.Unlock()
    end
end

function ADVR.onProgressBought(npcId)
    if npcId ~= NpcIdKey or HasBoughtAllUpgrades() == false then
        return
    end

    achievement.Unlock()

    -- Refresh the achievement UI.
    game.RefreshHomeBaseUIs()
end

-- Failsafe
function ADVR.onSpawnInHomeBase()
    if HasBoughtAllUpgrades() == true then
        achievement.Unlock()

        -- Refresh the achievement UI.
        game.RefreshHomeBaseUIs()
    end
end

function HasBoughtAllUpgrades()
    for progressRepresentation in game.progressHandler.GetProgressesByNpc(NpcIdKey) do
        if progressRepresentation.IsBought() == false then
            return false
        end
    end

    return true
end
