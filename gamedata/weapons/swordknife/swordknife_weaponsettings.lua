function ADVR.onLoad()
    combo.comboName = "Sword & Knife"
    combo.primaryWeaponName = "Sword"
    combo.secondaryWeaponName = "Knife"
    combo.primaryWeapon = game.stringToObjectMapper.GetObject("weapon_player_sword")
    combo.secondaryWeapon = game.stringToObjectMapper.GetObject("weapon_player_throwing_knife")
    combo.orderInUI = 0
end

function ADVR.WeaponComboEvents.onWeaponComboSelected()
    -- set the default values of this weapon combo --
    player.PrimaryDamage.ChangeAddend("defaultValue", 6)
    player.SecondaryDamage.ChangeAddend("defaultValue", 3)
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

function ADVR.WeaponComboEvents.onRunStart()
    game.inventory.currentPrimaryWeapon.EquipWeapon(game.inventory.primaryWeaponHand)
end

function ADVR.WeaponComboEvents.isUnlocked()
    return true
end