function ADVR.onLoad()
    achievement.name = "Hammer Time"
	achievement.desc = "Use The Blacksmith's Anvil to augment a weapon."
	achievement.hideDescription = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_THRESHING_BLADE
    achievement.insightReward = 3
end

function ADVR.onProgressBought(npcId)
    if npcId ~= "blacksmith_crossbowdagger" and npcId ~= "blacksmith_swordknife" and npcId ~= "blacksmith_magicwand" then
        return
    end

    UnlockAchievement()
end

function UnlockAchievement()
    achievement.Unlock()

    -- Refresh the achievement UI.
    game.RefreshHomeBaseUIs()
end

-- Failsafe as there are bug reports... 
function ADVR.onSpawnInHomeBase()
    if HasBoughtOneUpgrades("blacksmith_crossbowdagger") == true or HasBoughtOneUpgrades("blacksmith_swordknife") == true or HasBoughtOneUpgrades("blacksmith_magicwand") == true then
        achievement.Unlock()

        -- Refresh the achievement UI.
        game.RefreshHomeBaseUIs()
    end
end

function HasBoughtOneUpgrades(npcIdKey)
    for progressRepresentation in game.progressHandler.GetProgressesByNpc(npcIdKey) do
        if progressRepresentation.IsBought() == true then
            return true
        end
    end
    return false
end