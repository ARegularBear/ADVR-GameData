function ADVR.onLoad()
    challenge.name = "The Berserker's Delve"
    challenge.desc = "The Berserker exulted in death and danger. The dungeon will have an increased enemy count."
    challenge.specialEventRequirement = 1020
    challenge.allowedWeaponTypes = {0}

    -- Variables
    PlayerDamageSword = 14
    PlayerDamageKnife = 6
end

function ADVR.onPreDungeonGenerated(worldGenerator)
    player.duplicateEnemyMultiplier = 2.5
end

function ADVR.onDungeonGenerated(worldGenerator)
    -- story ghost placement
    if worldGenerator.worldGeneratorFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator)
    end
    
    if helperMethods.IsInFirstDungeon(worldGenerator) then
        player.PrimaryDamage.ChangeAddend("defaultValue", PlayerDamageSword)
        player.SecondaryDamage.ChangeAddend("defaultValue", PlayerDamageKnife)
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