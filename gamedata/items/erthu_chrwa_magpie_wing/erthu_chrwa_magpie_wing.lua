function ADVR.onLoad()
    pickup.name ="Magpie Wing"
    pickup.desc ="Increases your luck and discount significantly but breakable objects no longer drop items"
    pickup.weight = 60
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 10
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.PODEST}
    pickup.isActivateItem = false
    pickup.isSharedItem = true
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

    -- improve stats
	player.ShopDiscount.RegisterAddend(pickup.id, 0.50)
	player.Luck.RegisterAddend(pickup.id, 0.50)

    DisableProps()
end

function DisableProps()
    -- disable drops
    local breakables = {objects.PROP_POT, objects.PROP_POT_GOLDEN, objects.PROP_CRATE, objects.PROP_CRATE_SMALL}

    for key, value in pairs(breakables) do
        game.dropTableHandler.ClearDropTable(value)
    end
end

function ADVR.onPickupProxies(originalPlayerRef)
    pickup.RegisterItemNoSync()
    DisableProps()
end