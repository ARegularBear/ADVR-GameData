function ADVR.onLoad()
    pickup.name ="Tincture of Beast Bile"
    pickup.desc ="You probably shouldn't drink this..."
    pickup.weight = 40
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 50
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
    pickup.isActivateItem = false
    pickup.supportedInMultiplayer = true
end

--- This is called when the player picks up an item.
function ADVR.onPickup()
    pickup.RegisterItem()
    if Companion ~= nil then
        game.Delete(Companion)
    end
    Companion = game.SpawnObjectNetwork(objects.COMPANION_BEAST_ARM, player.transform.position)
end

function ADVR.onGameReloadMP()
    if Companion ~= nil then
        game.Delete(Companion)
    end
end