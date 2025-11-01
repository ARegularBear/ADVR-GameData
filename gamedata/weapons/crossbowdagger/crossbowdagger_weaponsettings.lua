function ADVR.onLoad()
    combo.comboName = "Crossbow & Dagger"
    combo.primaryWeaponName = "Cbow"
    combo.secondaryWeaponName = "Dagger"
    combo.primaryWeapon = game.stringToObjectMapper.GetObject("weapon_player_crossbow")
    combo.secondaryWeapon = game.stringToObjectMapper.GetObject("weapon_player_dagger")
    combo.orderInUI = 1
    combo.colorRegionsOverrideSecondary = {
        colors.Create(0.251, 0, 0, 1), 
        colors.Create(0.361, 0.086, 0.086, 1),
        colors.Create(0.451, 0.451, 0.451, 1),
        colors.Create(0.651, 0.651, 0.651, 1),
        colors.Create(0.337, 0.337, 0.337, 1),
        colors.Create(0.267, 0.267, 0.267, 1),
        colors.Create(0.353, 0.341, 0.298, 1),
    }
end

function ADVR.WeaponComboEvents.onWeaponComboSelected()
    -- set the default values of this weapon combo --
    player.PrimaryDamage.ChangeAddend("defaultValue", 7)
    player.SecondaryDamage.ChangeAddend("defaultValue", 4)
end

function ADVR.WeaponComboEvents.onTriggerPressed(weaponBase, hand, isEmpty)
    if not isEmpty or weaponBase == game.inventory.currentPrimaryWeapon then
        return
    end

    if weaponBase.IsEquipped then
        weaponBase.UnequipWeapon()
    end
    weaponBase.EquipWeapon(hand)
end

function ADVR.WeaponComboEvents.onTriggerReleased(weaponBase, hand)
    if weaponBase == game.inventory.currentPrimaryWeapon then
        return
    end

    if weaponBase.IsEquipped and weaponBase.EquippedHand == hand then
        weaponBase.UnequipWeapon()
    end

    weaponBase.OnTriggerInputReleased(hand.handType)
end

function ADVR.WeaponComboEvents.onRunStart()
    game.inventory.currentPrimaryWeapon.EquipWeapon(game.inventory.primaryWeaponHand)
end

function ADVR.WeaponComboEvents.onSecondaryButtonPressed(weaponBase, hand)
    if weaponBase.IsEquipped then
        weaponBase.UnequipWeapon()
    elseif not weaponBase.IsEquipped then
        local secondaryWep = game.inventory.currentSecondaryWeapon
        if secondaryWep ~= nil and secondaryWep.IsEquipped and secondaryWep.EquippedHand == hand then
            secondaryWep.UnequipWeapon()
        end
        weaponBase.EquipWeapon(hand)
    end
end

function ADVR.WeaponComboEvents.isUnlocked()
    return game.LoadBool("story_crossbow", false)
end