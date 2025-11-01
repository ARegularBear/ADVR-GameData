function ADVR.onLoad()
	pickup.name = "Third Card Monte"
	pickup.desc = "Moderately increases two characteristics, but significantly decreases another"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.SHOP, relicPool.GOLDEN_CHEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

    if game.runSaveManager.isInLoadRoutine == true then
        return
    end

    local results = helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, -2, 1, 1)
    local textResult = ""
    for i = 0, #results - 1 do
        local color = ""
        if i ~= 0 then
            color = "<color=#289407>"
        else
            color = "<color=#e82e20>"
        end
        textResult = textResult .. color .. results[i] .. "</color>"
        if i == 0 then
            textResult = textResult .. "\n\n"
        elseif i < #results - 1 then
            textResult = textResult .. "\n"
        end
    end
    game.ShowMessageInWorld(textResult, 4)
end