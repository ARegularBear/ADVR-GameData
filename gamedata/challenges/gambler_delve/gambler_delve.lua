function ADVR.onLoad()
    challenge.name = "The Gambler's Delve"
    challenge.desc = "The Gambler reveled in risk. The dungeon will gift its boons at random, for weal or woe."
    challenge.specialEventRequirement = 1000
    challenge.allowedWeaponTypes = {0, 1, 3}
    challenge.preObjectSpawnListeners = {
        game.stringToObjectMapper.GetObject("item_podest_choose_one"),
        game.stringToObjectMapper.GetObject("item_podest")
    }

    AmountItemsToApply = 3

    DropsToRemove = {
        "item_upgrade_all",
        "item_upgrade_all:erthu_chrwa_tattered_coin_pouch",
        "item_upgrade_podest",
        "item_upgrade_special",
        "item_upgrade_boss",
        "item_upgrade_goldenChest",
        "item_upgrade_chest",
        "item_ethereal_heart",
        "item_upgrade_shop",
        "item_upgrade_sacrifice"
    }
end

function ADVR.onPreDungeonGenerated(worldGenerator)
    -- Remove the shop and sacrifice statues.
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

    -- Remove all item drops.
    for _, itemToRemove in pairs(DropsToRemove) do
        game.dropTableHandler.RemoveObjectFromAllDropTables(itemToRemove)
    end
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
    if worldGenerator.worldGeneratorFloor == dungeonFloor.NOXIOUS_SEWERS or worldGenerator.worldGeneratorFloor == dungeonFloor.INFESTED_DUNGEON then
        game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(true, worldGenerator, "afterboss_start")
    end
    base.CallFunctionIn("PickRandomItems", 0.1)
end

function ADVR.onRunComplete()
    -- story ghost placement
    game.challengeInterpreter.PlaceStoryGhostAroundPlayerInDungeon(false, game.currentWorldGenerator)
end

-- Makes sure certain objects don't get spawned.
function ADVR.onPreObjectSpawn()
	return nil
end

function PickRandomItems()
    -- Apply the random items.
    local seed = game.currentWorldGenerator.seed
    local playerPositionHash = player.transform.position.x + player.transform.position.y + player.transform.position.z
    local message = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("gambler_delve_random_items_applied") .. "\n"

    for i = 1, AmountItemsToApply do 
        local item = game.itemInterpreter.GetRandomPickup(math.abs(playerPositionHash + seed + i) % 2147483647, "")
        if item == nil then
            game.ShowMessageInWorld("Unable to pick random items!", 4)
            return
        end

        RegisterRandomItem(item)
        message = message .. item.GetLocalizedName() .. "\n"
    end

    game.ShowMessageInWorld(message, 6)
end

function RegisterRandomItem(item)
    item.Execute("onPickup")
end
