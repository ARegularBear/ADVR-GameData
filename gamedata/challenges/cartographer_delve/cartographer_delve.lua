function ADVR.onLoad()
    challenge.name = "The Cartographer's Delve"
    challenge.desc = "The Cartographer thrilled in walking untrod paths. The dungeon will be a lot larger than usual."
    challenge.specialEventRequirement = 1001
    challenge.allowedWeaponTypes = {0, 1, 3}

    -- Variable
    RoomClusterSizeMultiplier = 2
end

function ADVR.onPreDungeonGenerated(worldGenerator)
    local generatorDetails = worldGenerator.generationDetails
    generatorDetails.roomClusterSize = generatorDetails.roomClusterSize * RoomClusterSizeMultiplier
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
