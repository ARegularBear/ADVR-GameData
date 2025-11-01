function ADVR.onLoad()
    pickup.name ="Sticky Finger"
    pickup.desc ="Shop items are free, but only one item can be obtained."
    pickup.weight = 40
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 60
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL}
    pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
    pickup.globalTickDelay = 3

    Item_already_kept = false
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.networkedFreeStoreItems = player.networkedFreeStoreItems + 999
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
end

function ADVR.onItemBought(item, pos)
   pickup.CallFunctionIn("RemoveBuyAreas", 0.25)
end

function RemoveBuyAreas()
    local buyAreas = game.FindObjectsByTypeUnsorted(game.GetType("BuyItem")) ---@type BuyItem[]
    for buyArea in buyAreas do
        if buyArea.IsValid() then
            game.Delete(buyArea.gameObject)
        end
    end
end