function ADVR.onLoad()
    pickup.name ="Tight Breeches"
    pickup.desc ="Significantly increases all characteristics, but you can no longer store items"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 60
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SPECIAL}
    pickup.isActivateItem = false
    pickup.supportedInMultiplayer = true
end

--- This is called when the player picks up an item.
function ADVR.onPickup()
    pickup.RegisterItem()

    player.PrimaryDamage.RegisterAddend(pickup.id, 3)
	player.SecondaryDamage.RegisterAddend(pickup.id, 2)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.10)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.10)
	player.EvasionChance.RegisterAddend(pickup.id, 0.10)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.15)
	player.Luck.RegisterAddend(pickup.id, 0.15)

    for i = 0, 1 do
        if game.inventory.slots[i].objectInSlot ~= nil then
            local baseInteract = game.inventory.slots[i].objectInSlot.gameObject.GetComponent_BaseInteract_()
            baseInteract.OnTakeFromSlot()
            baseInteract.transform.parent = nil
            local rotateIdle = baseInteract.gameObject.GetComponent_RotateWhenIdle_()
            if rotateIdle ~= nil then
                rotateIdle.shouldRotate = true
                rotateIdle.shouldMoveUpDownLocal = true
            end
        end
        game.inventory.slots[i].gameObject.SetActive(false)
    end
end

function ADVR.onGameReloadMP()
    for i = 0, 1 do
        game.inventory.slots[i].gameObject.SetActive(true)
    end
end