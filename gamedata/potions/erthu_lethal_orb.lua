function ADVR.onLoad()
	potion.name = "Lethal Orb"
	potion.desc = "Throw at your feet to increase damage and crit chance, but your movement speed is lowered."
	potion.weight = 60
	potion.effectTime = 15
	potion.price = 10
	potion.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
	potion.color = colors.Create(0.0, 94.0/255.0, 255.0/255.0, 1.0)

    -- Variable values, this stacks!
    MovementSpeed = 0.8
    CritIncrease = 1.45
    DamageIncrease = 2
    
	potion.affectsPlayer = true
	potion.affectsEnemies = false
	potion.affectsLiving = false
	potion.breakEffectDistance = 2
	potion.showActiveVignette = true
	potion.createEffectInstance = true
    potion.supportedInMultiplayer = true
end


function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance)
    if effectInstance.affectedPlayer ~= nil then
        player.MoveSpeed.RegisterMultiplier(potion.id, MovementSpeed)
        player.PrimaryCritChance.RegisterMultiplier(potion.id, CritIncrease)
        player.SecondaryCritChance.RegisterMultiplier(potion.id, CritIncrease)
    end
end

function ADVR.onPrimaryHitEntity(infos)
    return infos.damage + DamageIncrease * potion.GetTimesPlayerAffected()
end

function ADVR.onSecondaryHitEntity(infos)
    return infos.damage + DamageIncrease * potion.GetTimesPlayerAffected()
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
    if effectInstance.affectedPlayer ~= nil then
        player.MoveSpeed.RemoveMultiplierAt(potion.id, 0)
        player.PrimaryCritChance.RemoveMultiplierAt(potion.id, 0)
        player.SecondaryCritChance.RemoveMultiplierAt(potion.id, 0)
    end
end