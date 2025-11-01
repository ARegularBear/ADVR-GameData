function ADVR.onLoad()
    challenge.name = "The Biologist's Delve"
    challenge.desc = "The Biologist delighted in observing all creatures. The dungeon will contain a menagerie."
    challenge.specialEventRequirement = 1010
    challenge.allowedWeaponTypes = {0, 1, 3}

    -- Variables (whitelist)
    IncludedEnemies = {
        "enemy_og_bat",
        "enemy_og_plant_4x",
        "enemy_og_plant_homing",
        "enemy_og_slime",
        "enemy_og_slime_armored",
        "enemy_og_slime_big",
        "enemy_og_wight",
        "enemy_og_wight_advanced",
        "enemy_og_wight_crawling",
        "enemy_fg_book",
        "enemy_fg_book_exploding",
        "enemy_fg_elemental_magic",
        "enemy_fg_slime_phase",
        "enemy_fg_targeting_beam",
        "enemy_fg_wisp",
        "enemy_fg_wisp_group",
        "enemy_id_maggot_infested",
        "enemy_id_mushroom_rotten",
        "enemy_id_possessed_axe",
        "enemy_id_slime_bullet_infested",
        "enemy_id_slime_infested",
        "enemy_id_wight_infested",
        "enemy_gm_slime_bone",
        "enemy_gm_slime_stone",
        "enemy_gm_possessed_skull",
        "enemy_gm_skeleton",
        "enemy_gm_skeleton_miner",
        "enemy_gm_rock_elemental",
        "enemy_ld_targeting_beam",
        "enemy_ld_crystal_elemental",
        "enemy_ld_slime_crystal",
        "enemy_ld_fat_slime_crystal",
        "enemy_ld_plant_crystal",
        "enemy_ld_skeleton_crystal",
        "enemy_ld_possessed_skull",
        "special_slime_golden",
        "enemy_bc_skull_darkness",
        "enemy_ns_fly",
        "enemy_ns_maggot",
        "enemy_ns_poison_spitter",
        "enemy_ns_slime",
        "enemy_ns_slime_rotten",
        "enemy_ns_slime_tiny"
    }

    -- Internal
    NextSpawnOffset = vector3.zero
end

function ADVR.onPreDungeonGenerated(worldGenerator)
    -- Remove challenge rooms
    local deepnessArray = worldGenerator.generationDetails.specialRoomsForDeepnesses
    for i = 0, #deepnessArray - 1 do
        local room = deepnessArray[i]
        local deadendsArray = room.deadends
        local roomsArray = room.rooms
        for j = 0, #deadendsArray - 1 do
            local deadend = deadendsArray[j]
            if deadend.name == "challenge" then
                deadend.probability = 0.0
            end
        end
        for k = 0, #roomsArray - 1 do
            local room = roomsArray[k]
            if room.name == "challenge" then
                room.probability = 0.0
            end
        end
    end
end

function ADVR.onDungeonGenerated(worldGenerator)
    -- story ghost placement
    if worldGenerator.worldGeneratorFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator)
    end
    
    if helperMethods.IsInFirstDungeon() then
        local enemies = {}

        for i = 0, #game.enemyRegistry.enemyRegistryEntries - 1 do
            local registry = game.enemyRegistry.enemyRegistryEntries[i]

            -- Instead of defaulting to true, we only allow enemies present in the whitelist.
            local shouldRegister = false
            for _, value in pairs(IncludedEnemies) do
                if registry.registryId == value then
                    shouldRegister = true
                    break
                end
            end

            if shouldRegister then
                for j = 0, #registry.possibilities - 1 do
                    table.insert(enemies, registry.possibilities[j].objToSpawn)
                end

                for j = 0, #registry.champions - 1 do
                    table.insert(enemies, registry.champions[j].objToSpawn)
                end
            end
        end

        base.AddPostObjectSpawnListenersRuntimeByObjects(enemies)
        base.AddPreObjectSpawnListenersRuntimeByObjects(enemies)
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

function ADVR.onPreObjectSpawn(prefab, override)
    NextSpawnOffset = override.GetComponent_EnemyBase_().spawnOffset

    -- Filter enemy registry entries to include only those in the whitelist
    local filteredEntries = {}
    for i = 0, #game.enemyRegistry.enemyRegistryEntries - 1 do
        local registry = game.enemyRegistry.enemyRegistryEntries[i]
        for _, value in pairs(IncludedEnemies) do
            if registry.registryId == value then
                table.insert(filteredEntries, registry.registryId)
                break
            end
        end
    end

    -- Now choose a random enemy from the filtered entries.
    -- (Assuming a function exists to select randomly from an array without an exclusion list.)
    local randomEntry = game.enemyRegistry.GetRandomEnemyFromArray(filteredEntries, game.enemyRegistry.GetCurrentChampionProbability())
    return randomEntry.objToSpawn
end

function ADVR.onPostObjectSpawn(prefab, gameObject)
    gameObject.transform.position = gameObject.transform.position - NextSpawnOffset
    gameObject.transform.position = gameObject.transform.position + gameObject.GetComponentInChildren(game.GetType("EnemyBase")).spawnOffset
end
