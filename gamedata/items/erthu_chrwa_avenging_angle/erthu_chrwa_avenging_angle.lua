function ADVR.onLoad()
	pickup.name = "Avenging Angle"
	pickup.desc = "When hit by a regular enemy, the enemy will be destroyed"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, damageSource, attackType, hitPosition)
    if damageSource == nil then
        return damage
    end
    
    local enemyBase = damageSource.GetComponent_EnemyBase_()
    if enemyBase == nil then
        local enemyBaseRef = damageSource.GetComponent_EnemyBaseReference_()
        if enemyBaseRef ~= nil then
            enemyBase = enemyBaseRef.enemy
        end
    end
    
    if enemyBase ~= nil and enemyBase.IsBoss() == false and enemyBase.IsAbberrant() == false and damage > 0 then
        enemyBase.DoHit(player.networkObject, enemyBase.Health, damageType.PLAYER_TERTIARY_NO_KNOCKBACK, vector3.zero)
    end
    
    return damage
end