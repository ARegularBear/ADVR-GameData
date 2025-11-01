function ADVR.onLoad()
	potion.name = "Demanding Orb"
	potion.desc = "Throw at your feet to deal one additional damage until the next time you get hit."
	potion.weight = 100
	potion.effectTime = -1
	potion.price = 10
	potion.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
	potion.color = colors.Create(170.0/255.0, 255.0/255.0, 0.0/255.0, 1.0)

    -- Makes sure that we don't get weird damage outputs in 'onPlayerHit' after this potion
    -- it's event listener has been called!
    potion.priority = -50 

    potion.affectsPlayer = true
	potion.affectsEnemies = false
	potion.affectsLiving = false
	potion.breakEffectDistance = 2
	potion.showActiveVignette = false
	potion.createEffectInstance = true
    potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance)
    if effectInstance.affectedPlayer == nil then
        effectInstance.ForceStopEffect()
    end
end

function ADVR.PotionEvents.onPotionRunOut()
end

function ADVR.onPrimaryHitEntity(infos)
    return infos.damage + potion.GetTimesPlayerAffected()
end

function ADVR.onSecondaryHitEntity(infos)
    return infos.damage + potion.GetTimesPlayerAffected()
end

function ADVR.onPlayerHit(damage)
    if damage > 0 then
        base.CallFunctionIn("RemoveEffect", 0.1)
    end

    return damage
end

function RemoveEffect()
    potion.ClearEffects()
end
