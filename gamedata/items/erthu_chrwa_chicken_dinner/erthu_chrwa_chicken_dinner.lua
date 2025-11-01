function ADVR.onLoad()
	pickup.name = "Chicken Dinner"
	pickup.desc = "Bandit Boxes are guaranteed to provide a good reward after several attempts"
	pickup.weight = 95
	pickup.maxAmount = 1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
    pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true

    -- Variables
    TimesNeededToReceivePrice = 6

    -- Internal variables
    TimesGambled = 0
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onSlotMachineGamble(type)
    if type ~= "random_reward" then
        return
    end

    TimesGambled = TimesGambled + 1

    if TimesGambled >= TimesNeededToReceivePrice then
        local randomNumber = math.random(0, 3)
        TimesGambled = 0
        TimesNeededToReceivePrice = TimesNeededToReceivePrice + 2
        if randomNumber == 0 then
            local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	        game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
        elseif randomNumber == 1 then
            player.Heal(2, player.GetBaseEtherealHeartType())
            game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("stat_screen_protection_heart"), 4)
        elseif randomNumber == 2 then
            local keysRandom = math.random(1, 3)
            player.CurrentKeys = player.CurrentKeys + keysRandom
            game.ShowMessageInWorld(tostring(keysRandom) .. " " .. game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("keys"), 4)
        elseif randomNumber == 3 then
            local moneyRandom = math.random(3, 6)
            player.CurrentCash = player.CurrentCash + moneyRandom
            game.ShowMessageInWorld(tostring(moneyRandom) .. " " .. game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("coins"), 4)
        end
    end
end
