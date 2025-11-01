function ADVR.onLoad()
    challenge.name = "The Alchemist's Delve"
    challenge.desc = "The Alchemist concocted elixers of terrible power. They will be your only defense within the dungeon."
    challenge.specialEventRequirement = 1021
    challenge.allowedWeaponTypes = {2}
    challenge.preObjectSpawnListeners = {game.GetObjectMapping("enemy_fg_possessed_armor")}

    -- The interval at which items get replenished.
    challenge.globalTickDelay = 5.0

    -- Variables
    Exclusions = {
        "erthu_contracting_orb",
        "erthu_fluctuating_orb",
        "erthu_demanding_orb",
        "erthu_potion_of_fury",
        "erthu_glittering_orb",
        "erthu_lethal_orb"
    }
    Chances = {
        ["erthu_potion_of_protection"] = 0.4,
        ["erthu_potion_of_focus"] = 0.3,
        ["erthu_flickering_orb"] = 0.3,
        ["erthu_orb_of_obliteration"] = 0.2
    }

    -- Internal
    OrbPossibilities = {}

    local orbs = game.potionInterpreter.potionsOnDisk
    for i = 0, #orbs - 1 do
        local orb = orbs[i]
        local shouldBeAdded = true

        for _, value in pairs(Exclusions) do
            if orb.id == value then
                shouldBeAdded = false
                break
            end
        end

        if shouldBeAdded == true then
            table.insert(OrbPossibilities, orb)
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

-- Override possessed armors with different enemies so people don't get soft locked in challenge rooms.
function ADVR.onPreObjectSpawn()
    return game.GetObjectMapping("enemy_fg_book")
end

function ADVR.onRunComplete()
    -- story ghost placement
    game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(false, game.currentWorldGenerator)
end

function ADVR.onGlobalTick()
    for i = 0, #game.inventory.slots - 1 do
        local slot = game.inventory.slots[i]
        if slot.objectInSlot == nil then
            local orbName = nil
            local attempts = 0

            while true do 
                orbName = OrbPossibilities[math.random(1, #OrbPossibilities)].id
                
                local shouldSpawn = true
                for orb, chance in pairs(Chances) do 
                    if orbName == orb and math.random() > chance and attempts < 10 then
                        shouldSpawn = false
                    end
                end
                
                if shouldSpawn == true then
                    break
                end

                attempts = attempts + 1
            end
            
            local orbObject = game.DropItem("item_orb:" .. orbName, vector3.zero)
            if orbObject ~= nil then
                local interactable = orbObject.GetComponent_BaseInteract_()

                -- Certain components depend on Start to be ran first...
                base.CallFunctionIn("PutOrbInSlot", 1.0, interactable, orbObject, slot)
            end
        end
    end
end

function PutOrbInSlot(interactable, orbObject, slot)
    if slot.objectInSlot == nil then
        if slot.PlaceObjectInSlot(interactable) == false then
            game.Delete(orbObject)
        end
    end
end
