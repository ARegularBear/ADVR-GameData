function ADVR.onLoad()
    pickup.name ="Jousting Lance"
    pickup.desc ="Critical melee strikes knock enemies back a great distance"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 50
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.BOSS}
    pickup.isActivateItem = false
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(infos)
    if infos.entity == nil then
        return infos.damage
    end
    if infos.isCritical and infos.entity.IsEnemy() then
        infos.entity.AsEnemy().RpcKnockback(7, game.playerHeadset.transform.position, 17, knockbackType.FORCE_PUSH)
    end
    return infos.damage
end