--Alchemists Mark     - ?
--Anarchists Mark     - Chance to set enemies on fire when hitting
--Ascetics Mark       - Being low on health increases damage
--Assassins Mark	  - +1 ranged damage
--Berserkers Mark     - Higher critical chance
--Gamblers Mark       - More luck
--Gluttons Mark       - 10% evasion
--Healers Mark        - Food has a chance to heal 1 more
--Innocents Mark      - +1 heart container
--Knights Mark        - +1 melee damage
--Magicians Mark      - Dilemmatic pedestals always spawns double items
--Merchants Mark      - 15% discount
--Messengers Mark     - Higher Movespeed
--Miners Mark         - Glittering orbs have a higher chance of spawning
--Penitants Mark      - 10% evasion
--Thiefs Mark         - Picking up item gives 3 coins
--Hagglers Marks      - 10% discount in shops 

function ADVR.onLoad()
	progress.name = "Marvellous Marks"
	progress.desc = "<i>Having a mark equipped grants an additional effect unique to the mark"
	progress.price = 50
    progress.predecessor = "progress_hidden_passages"

    Healers_mark_active = false
    Anarchists_mark_active = false
    Ascetics_mark_active  = false
    Thiefs_mark_active = false
    Innocents_mark_active = false

    if progress.IsBought() then
        ChangeDescriptionOfPickups()
    end
end

function ADVR.ProgressEvents.onBuy()
    ChangeDescriptionOfPickups()
end

function ADVR.onGameReloadMP()
    ResetAll()
end

function ResetAll()
    Healers_mark_active = false
    Ascetics_mark_active = false
    Anarchists_mark_active = false
    Thiefs_mark_active = false

    if Innocents_mark_active then
        if player.MaxHealth > 2 then
            player.MaxHealth = player.MaxHealth - 2
        end
        if player.Health > player.MaxHealth then
            player.Health = player.MaxHealth
        end
        Innocents_mark_active = false
    end

    player.PrimaryDamage.ClearAddend(progress.id)
    player.SecondaryDamage.ClearAddend(progress.id)
    player.PrimaryCritChance.ClearAddend(progress.id)
    player.SecondaryCritChance.ClearAddend(progress.id)
    player.EvasionChance.ClearAddend(progress.id)
    player.MoveSpeed.ClearAddend(progress.id)
    player.Luck.ClearAddend(progress.id)
    player.ShopDiscount.ClearAddend(progress.id)
    game.potionInterpreter.GetPotionByName("erthu_glittering_orb").weight = 15
    game.progressHandler.GetProgressById("progress_dilemmatic_pedestals").script.Globals["ChanceToDouble"] = 0.4

    SetOrbEffectTimeToDefault()
end

function ADVR.onPickupTaken(pickup)
    if Thiefs_mark_active == true and pickup.rolledItem.isActivateItem == false then
        player.currentCash = player.currentCash + 3
    end

    if pickup.rolledItem.isActivateItem == false then
        return
    end

    ResetAll()
    if pickup.rolledItem.id == relics.ERTHU_CHRWA_ALCHEMISTS_MARK then
        IncreaseOrbEffectTime()
    elseif pickup.rolledItem.id == "erthu_chrwa_anarchists_mark" then
        Anarchists_mark_active = true
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_ASCETICS_MARK then
        Ascetics_mark_active = true
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_ASSASSINS_MARK then
        helperMethods.GetRangedDamageStat().RegisterAddend(progress.id, 1)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_BERSERKERS_MARK then
        player.PrimaryCritChance.RegisterAddend(progress.id, 0.05)
        player.SecondaryCritChance.RegisterAddend(progress.id, 0.05)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_GAMBLERS_MARK then
        player.Luck.RegisterAddend(progress.id, 0.35)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_GLUTTONS_MARK then
        player.EvasionChance.RegisterAddend(progress.id, 0.1)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_HEALERS_MARK then
        Healers_mark_active = true
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_INNOCENTS_MARK then
        Innocents_mark_active = true
        player.MaxHealth = player.MaxHealth + 2
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_KNIGHTS_MARK then
        helperMethods.GetMeleeDamageStat().RegisterAddend(progress.id, 1)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_MAGICIANS_MARK then
        game.progressHandler.GetProgressById("progress_dilemmatic_pedestals").script.Globals["ChanceToDouble"] = 1.0
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_MERCHANTS_MARK then
        player.ShopDiscount.RegisterAddend(progress.id, 0.1)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_MESSENGERS_MARK then
        player.MoveSpeed.RegisterAddend(progress.id, 0.3)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_MINERS_MARK then
        game.potionInterpreter.GetPotionByName("erthu_glittering_orb").weight = 30
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_PENITENTS_MARK then
        player.EvasionChance.RegisterAddend(progress.id, 0.1)
    elseif pickup.rolledItem.id == relics.ERTHU_CHRWA_THIEFS_MARK then
        Thiefs_mark_active = true
    elseif pickup.rolledItem.id == "sebwr_hagglers_mark" then
        player.ShopDiscount.RegisterAddend(progress.id, 0.1)
    end
end

function ADVR.onFoodEaten(name)
    if Healers_mark_active then
        if math.random(0, 10) > 7 then
            player.Heal(1)
        end 
    end
end

function ADVR.onMeleeHitEntity(infos)
    if infos.entity == nil then
		return infos.damage
	end

    if Anarchists_mark_active then
        if infos.entity.IsEnemy() then
            if helperMethods.IsValidWithLuck(0.05, 0.33, 0.22) then
                infos.entity.ApplyEffect(damageType.FIRE, infos.damage / 4 + 1, 5)
            end
        end
    end

    if Ascetics_mark_active then
        if player.RealHealth <= 2 then
            return infos.damage + 2
        end
    end

	return infos.damage
end


function ChangeDescriptionOfPickups()
    --Alchemists Mark     - ?
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_alchemists_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased effect time for various orbs</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_alchemists_mark_desc", Description)
    
    --Anarchists Mark     - Chance to set enemies on fire when hitting
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_anarchists_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Chance to set enemies on fire when hitting</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_anarchists_mark_desc", Description)

    --Ascetics Mark       - Being low on health increases damage
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_ascetics_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Being low on health increases damage</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_ascetics_mark_desc", Description)

    --Assassins Mark	  - +1 ranged damage
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_assassins_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased ranged damage</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_assassins_mark_desc", Description)

    --Berserkers Mark     - Higher critical chance
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_berserkers_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Higher critical chance</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_berserkers_mark_desc", Description)

    --Gamblers Mark       - More luck
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_gamblers_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased luck</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_gamblers_mark_desc", Description)

    --Gluttons Mark       - 10% evasion
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_gluttons_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased evasion</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_gluttons_mark_desc", Description)

    --Healers Mark        - Food has a chance to heal 1 more
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_healers_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Food has a chance to heal 1 more heart</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_healers_mark_desc", Description)

    --Innocents Mark      - +1 heart container
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_innocents_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Gain one more heart container</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_innocents_mark_desc", Description)

    --Knights Mark        - +1 melee damage
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_knights_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased melee damage</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_knights_mark_desc", Description)

    --Magicians Mark      - Dilemmatic pedestals always spawns double items
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_magicians_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Dilemmatic pedestals always spawns double items</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_magicians_mark_desc", Description)

    --Merchants Mark      - 15% discount
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_merchants_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased shop discount</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_merchants_mark_desc", Description)

    --Messengers Mark     - Higher Movespeed
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_messengers_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased movement speed</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_messengers_mark_desc", Description)

    --Miners Mark         - Glittering orbs have a higher chance of spawning
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_miners_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Glittering orbs have a higher chance of spawning</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_miners_mark_desc", Description)

    --Penitants Mark      - 10% evasion
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_penitents_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased evasion</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_penitents_mark_desc", Description)

    --Thiefs Mark         - Picking up item gives 3 coins
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("erthu_chrwa_thiefs_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>When picking up an item get 3 coins</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("erthu_chrwa_thiefs_mark_desc", Description)

    --Hagglers Marks      - 10% discount in shops
    Description = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("sebwr_hagglers_mark_desc")
    Description = Description .. "\n<color=#4EF3FF>Increased shop discount</color>"
    game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("sebwr_hagglers_mark_desc", Description)

end

function IncreaseOrbEffectTime()
    Erthu_contracting_orb = game.potionInterpreter.GetPotionByName("erthu_contracting_orb")
    Erthu_contracting_orb.effectTime = Erthu_contracting_orb.effectTime + 15

    Erthu_flickering_orb = game.potionInterpreter.GetPotionByName("erthu_flickering_orb")
    Erthu_flickering_orb.effectTime = Erthu_flickering_orb.effectTime + 10

    Erthu_lethal_orb = game.potionInterpreter.GetPotionByName("erthu_lethal_orb")
    Erthu_lethal_orb.effectTime = Erthu_lethal_orb.effectTime + 7

    Erthu_potion_of_focus = game.potionInterpreter.GetPotionByName("erthu_potion_of_focus")
    Erthu_potion_of_focus.effectTime = Erthu_potion_of_focus.effectTime + 5
    
    Erthu_potion_of_fury = game.potionInterpreter.GetPotionByName("erthu_potion_of_fury")
    Erthu_potion_of_fury.effectTime = Erthu_potion_of_fury.effectTime + 10
    
    Erthu_potion_of_protection = game.potionInterpreter.GetPotionByName("erthu_potion_of_protection")
    Erthu_potion_of_protection.effectTime = Erthu_potion_of_protection.effectTime + 5
end

function SetOrbEffectTimeToDefault()
    Erthu_contracting_orb = game.potionInterpreter.GetPotionByName("erthu_contracting_orb")
    Erthu_contracting_orb.effectTime = 30

    Erthu_flickering_orb = game.potionInterpreter.GetPotionByName("erthu_flickering_orb")
    Erthu_flickering_orb.effectTime = 20

    Erthu_lethal_orb = game.potionInterpreter.GetPotionByName("erthu_lethal_orb")
    Erthu_lethal_orb.effectTime = 15

    Erthu_potion_of_focus = game.potionInterpreter.GetPotionByName("erthu_potion_of_focus")
    Erthu_potion_of_focus.effectTime = 10
    
    Erthu_potion_of_fury = game.potionInterpreter.GetPotionByName("erthu_potion_of_fury")
    Erthu_potion_of_fury.effectTime = 20
    
    Erthu_potion_of_protection = game.potionInterpreter.GetPotionByName("erthu_potion_of_protection")
    Erthu_potion_of_protection.effectTime = 10
end