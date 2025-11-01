function ADVR.onLoad()
    combo.comboName = "Tome & Wand"
    combo.primaryWeaponName = "Spell"
    combo.secondaryWeaponName = "Incantation"
    combo.primaryWeapon = game.stringToObjectMapper.GetObject("weapon_player_magic_orb")
    combo.secondaryWeapon = game.stringToObjectMapper.GetObject("weapon_player_magic_book")
    combo.orderInUI = 3
end

-- PRIMARY DAMAGE (base) --
-- book arc attack --
-- base orb --

-- SECONDARY DAMAGE (special) --
-- poison circle -- 
-- lightning --
-- fire orb --

-- NO SCALE --
-- wand melee attack --

function ADVR.WeaponComboEvents.onWeaponComboSelected()
    -- set the default values of this weapon combo --
    player.PrimaryDamage.ChangeAddend("defaultValue", 5)
    player.SecondaryDamage.ChangeAddend("defaultValue", 4)
end

function ADVR.WeaponComboEvents.onTriggerPressed(weaponBase, hand, isEmpty)
    if weaponBase == game.inventory.currentPrimaryWeapon and game.inventory.currentPrimaryWeapon.EquippedHand == hand then
        weaponBase.TryChargingWand()
    end
    
    if weaponBase == game.inventory.currentSecondaryWeapon and game.inventory.currentSecondaryWeapon.EquippedHand == hand then
        weaponBase.TryChargingBook()
    end
end

function ADVR.WeaponComboEvents.onTriggerReleased(weaponBase, hand)
    if weaponBase == game.inventory.currentPrimaryWeapon and game.inventory.currentPrimaryWeapon.EquippedHand == hand then
        weaponBase.UnchargeWand()
    end
    
    if weaponBase == game.inventory.currentSecondaryWeapon and game.inventory.currentSecondaryWeapon.EquippedHand == hand then
        weaponBase.UnchargeBook()
    end

    weaponBase.OnTriggerInputReleased(hand.handType)
end

function ADVR.WeaponComboEvents.onSecondaryButtonPressed(weaponBase, hand)
    local secondaryWep = game.inventory.currentSecondaryWeapon
    if secondaryWep.IsEquipped then
        secondaryWep.UnequipWeapon()
    else
        secondaryWep.EquipWeapon(game.inventory.secondaryWeaponHand)
    end
end

function ADVR.WeaponComboEvents.onRunStart()
    game.inventory.currentSecondaryWeapon.EquipWeapon(game.inventory.secondaryWeaponHand)
end

function ADVR.WeaponComboEvents.isUnlocked()
    return game.LoadBool("story_tome", false)
end