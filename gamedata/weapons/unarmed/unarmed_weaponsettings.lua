function ADVR.onLoad()
    combo.comboName = "Unarmed"
    combo.primaryWeaponName = "Left"
    combo.secondaryWeaponName = "Right"
    combo.primaryWeapon = nil
    combo.secondaryWeapon = nil
    combo.orderInUI = -1
    combo.showInPreparationScreen = false
end

function ADVR.WeaponComboEvents.onWeaponComboSelected()
    -- set the default values of this weapon combo --
    player.PrimaryDamage.ChangeAddend("defaultValue", 4)
    player.SecondaryDamage.ChangeAddend("defaultValue", 4)
end

function ADVR.WeaponComboEvents.isUnlocked()
    return true
end

function ADVR.WeaponComboEvents.onRunStart()
end

function ADVR.WeaponComboEvents.onSecondaryButtonPressed()
end

function ADVR.WeaponComboEvents.onTriggerPressed()
end

function ADVR.WeaponComboEvents.onTriggerReleased()
end
