function ADVR.onLoad()
    pickup.name ="Granite Pestle"
    pickup.desc ="While under an orb's effects, weapon strikes cause an explosion"
    pickup.weight = 75
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
    pickup.isActivateItem = false
    pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true

    TimeOfLastHit = 0
end

--- This is called when the player picks up an item.
function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
    pickup.RegisterItemNoSync()
end

function ADVR.onPrimaryHitEntity(hitInfo)
    if hitInfo.entity == nil then
        return hitInfo.damage
    end

    -- special case for chests, which should just open naturally 
    local living = hitInfo.entity
	if living ~= nil and string.find(living.livingId, "prop_chest_") == nil then
        SpawnExplosion(hitInfo)  
    end

    return hitInfo.damage
end

function ADVR.onSecondaryHitEntity(hitInfo)
    if hitInfo.entity == nil then
        return hitInfo.damage
    end

    -- special case for chests, which should just open naturally 
    local living = hitInfo.entity
	if living ~= nil and string.find(living.livingId, "prop_chest_") == nil then
        SpawnExplosion(hitInfo)  
    end
 
    return hitInfo.damage
end

function SpawnExplosion(hitInfo)
    local isActive = false
    for key, value in pairs(game.potionInterpreter.activePotions) do
        if value.id ~= "erthu_demanding_orb" then
            isActive = true
        end
    end

    if isActive then
        local expl = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, hitInfo.hitPosition).GetComponent_Explosion_()
        expl.damage = (player.GetPrimaryDamageWithPickupModifiers() + player.GetSecondaryDamageWithPickupModifiers()) * 0.5
        expl.damagePlayer = false
        expl.damagesEnemies = true
        expl.enableCritChance = true
    end
end