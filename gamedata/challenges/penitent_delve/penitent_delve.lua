function ADVR.onLoad()
    challenge.name = "The Penitent's Delve"
    challenge.desc = "The Penitent humbled himself through constant flagellation. You will be hardy, but take constant damage every few seconds."
    challenge.specialEventRequirement = 1030
    challenge.allowedWeaponTypes = {0, 1, 3}

    -- Variables
    DamageAfterSeconds = 40.0

    -- Internal
    ShouldDamagePlayer = true
end

function ADVR.onDungeonGenerated(worldGenerator)
    -- story ghost placement
    if worldGenerator.worldGeneratorFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator)
    end

    if helperMethods.IsInFirstDungeon() then
        player.MaxHealth = 20
        player.Health = 20

        -- Start the damage timer
        challenge.CallFunctionOnRepeat("DealDamageToPlayerTimer", 99999.0, DamageAfterSeconds)
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

    ShouldDamagePlayer = false
end

function DealDamageToPlayerTimer()
    if ShouldDamagePlayer == true then
        player.DamagePlayer(1, false)
    end
end

function ADVR.onPreBossFoodSpawn()
    return game.stringToObjectMapper.GetObject("item_food_dragonfruit")
end
