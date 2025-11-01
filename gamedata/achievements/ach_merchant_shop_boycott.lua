function ADVR.onLoad()
    achievement.name = "Merchant Shop Boycott"
	achievement.desc = "Escape the Ancient Dungeon without entering a shop."
	achievement.hideDescription = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_GRINNING_TOTEM
    achievement.insightReward = 5

    HasEnteredShop = false
    HasEnteredShopKey = "ach_shop_escape_entered"
end

function ADVR.onDungeonGenerated(worldGenerator)
    -- This is a solution to the following problem: if a player saves their run and has entered a shop
    -- and then starts a new run then their saved progress of entering a shop still exists. Meaning that
    -- if they now in this run do it properly they wont get the achievement because the saved value still exists!
    -- OR if the game simply crashes / exits after having entered a shop.
    -- Checking for a new run and then setting it to false will make sure this doesn't happen.
    if game.helperMethods.IsInFirstDungeon(worldGenerator) then
        game.SaveBool(HasEnteredShopKey, false)
    end
end

function ADVR.onRoomEntered(currentPlayerRoom)
    -- There's no need to call anything in here if we already entered a shop, this run is invalid no matter what.
    if HasEnteredShop then
        return
    end

    if currentPlayerRoom.type ~= roomTypes.SHOP then
        return
    end

    game.SaveBool(HasEnteredShopKey, true)
    HasEnteredShop = true 
end

function ADVR.onRunComplete()
    if HasEnteredShop == false and game.LoadBool(HasEnteredShopKey, false) == false then
        achievement.Unlock()
    end
end
