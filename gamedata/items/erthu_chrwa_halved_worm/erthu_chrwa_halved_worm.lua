function ADVR.onLoad()
    pickup.name ="Halved Worm"
    pickup.desc ="The next relic that can be picked up multiple times is applied twice"
    pickup.weight = 40
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 25
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
    pickup.isActivateItem = false
    pickup.supportedInMultiplayer = true
    IsApplied = false
end

function ADVR.onPickup()
    pickup.RegisterItem()

    if game.runSaveManager.isInLoadRoutine then
        IsApplied = game.LoadBool("halved_worm_applied_in_saved_run", false)
    end
end

function ADVR.onPickupTaken(itemUpgrade)
    -- activatable items can't be duplicated because you can only equip one
    if itemUpgrade.rolledItem.isActivateItem then
        return
    end

    -- if pickup only works once, it might break to crazily so we should not duplicate
    if itemUpgrade.rolledItem.maxAmount <= 1 then
        return
    end

    -- if halved worm already dulpicated something, we should stop 
    if IsApplied then
        return
    end

    IsApplied = true

    local dupeUpgrade = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. itemUpgrade.rolledItem.id, vector3.zero)
    pickup.CallFunctionIn("UseIt", 0.8, dupeUpgrade.GetComponent_ItemUpgrade_())
end

function UseIt(upgrade)
	upgrade.OnUseStart()
end
