function ADVR.onLoad()
    challenge.name = "The Hunter's Delve"
    challenge.desc = "The Hunter demanded only the greatest of prey. The dungeon will accommodate."
    challenge.specialEventRequirement = 1011
    challenge.allowedWeaponTypes = {0, 1, 3}
end

function ADVR.onPreDungeonGenerated(worldGenerator)
    worldGenerator.generationDetails.deepnessForEndRoom = 0
    
    -- remove the shop
    local deepnessArray = worldGenerator.generationDetails.specialRoomsForDeepnesses
    for i = 0, #deepnessArray - 1 do
        local room = deepnessArray[i]
        local deadendsArray = room.deadends
        for j = 0, #deadendsArray - 1 do
            local deadend = deadendsArray[j]
            if deadend.name == "shop" then
                deadend.probability = 0.0
            end
        end
    end
end

function ADVR.onDungeonGenerated(worldGenerator)
    -- story ghost placement
    if worldGenerator.worldGeneratorFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator)
    end
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
    if worldGenerator.worldGeneratorFloor == dungeonFloor.NOXIOUS_SEWERS or worldGenerator.worldGeneratorFloor == dungeonFloor.INFESTED_DUNGEON then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator, "afterboss_start")
    end
end

function ADVR.onRunComplete()
    -- story ghost placement
    game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(false, game.currentWorldGenerator)
end