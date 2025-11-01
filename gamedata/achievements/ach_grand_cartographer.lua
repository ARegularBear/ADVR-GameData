function ADVR.onLoad()
    achievement.name = "Grand Cartographer"
	achievement.desc = "Discover a point of interest on every floor."
	achievement.insightReward = 10
end


function SetFloorStatus(floor, status)
    if FloorsToCheck[floor] ~= nil then
        FloorsToCheck[floor] = status
    end
end

function AllFloorsChecked()
    for _, status in pairs(FloorsToCheck) do
        if not status then
            return false
        end
    end
    return true
end

function CheckForUnlock()
    
    FloorsToCheck = {
        OVERGROWN_GATEHOUSE = false,
        INFESTED_DUNGEON = false,
        NOXIOUS_SEWERS = false,
        FORGOTTEN_LIBRARY = false,
        GLOAMING_MINES = false,
        LUMINOUS_DEPTHS = false,
    }
    
    for poi in game.poiInterpreter.poisOnDisk do
        if poi.HasFound then
            SetFloorStatus(tostring(poi.correspondingFloor), true)
        end
    end
    
    if AllFloorsChecked() then
        --debugLog("For each floors a POI was found.")
        achievement.Unlock()
    else
        --debugLog("At least one floor was missing...")
    end

end

function ADVR.onRunComplete()
	CheckForUnlock()
end

function ADVR.onPlayerDeath()
	CheckForUnlock()
end