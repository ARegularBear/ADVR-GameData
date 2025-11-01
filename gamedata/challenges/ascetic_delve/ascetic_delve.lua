function ADVR.onLoad()
    challenge.name = "The Ascetic's Delve"
    challenge.desc = "The Ascetic believed in strength through deprivation. The dungeon will leave you with empty hands."
    challenge.allowedWeaponTypes = {0, 1, 3}
    challenge.specialEventRequirement = 1031
    challenge.preObjectSpawnListeners = {
        game.stringToObjectMapper.GetObject("item_food_potato"),
        game.stringToObjectMapper.GetObject("item_podest_choose_one"),
        game.stringToObjectMapper.GetObject("item_podest"),
        game.stringToObjectMapper.GetObject("prop_chest_challenge"),
        game.stringToObjectMapper.GetObject("prop_chest_default"),
        game.stringToObjectMapper.GetObject("prop_chest_golden")
    }
end

function ADVR.onPreDungeonGenerated(worldGenerator)
    -- Remove all rooms that we don't want
    local deepnessArray = worldGenerator.generationDetails.specialRoomsForDeepnesses
    for i = 0, #deepnessArray - 1 do
        local room = deepnessArray[i]
        local deadendsArray = room.deadends
        for j = 0, #deadendsArray - 1 do
            local deadend = deadendsArray[j]
            if deadend.name == roomTypes.SHOP or deadend.name == roomTypes.SACRIFICE or deadend.name == roomTypes.LOCKED_LOOT then
                deadend.probability = 0.0
            end
        end
    end
    worldGenerator.generationDetails.probabilityForShop = 0.0
end

function ADVR.onDungeonGenerated(worldGenerator)
    -- story ghost placement
    if worldGenerator.worldGeneratorFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator)
    end
    
    -- Remove regular drops such as items, keys and coins.
    for dropTable in game.dropTableHandler.GetDropTablesByName("all") do
        if dropTable.dropTableNames[0] ~= "enemy_og_slime_big" and dropTable.dropTableNames[0] ~= "champion_bg_slime_big" and dropTable.dropTableNames[0] ~= "enemy_ns_slime" then
            dropTable.dropEntries = {}
        end
    end

    -- Remove chests.
    for entry in worldGenerator.wallPlacer.placeEntries do
        if entry.entryType == "chest" then
            entry.probabilityToPlaceWhenPossible = 0.0
        end
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

-- Makes sure certain objects don't get spawned.
function ADVR.onPreObjectSpawn()
	return nil
end
