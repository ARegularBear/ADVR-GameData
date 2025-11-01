function ADVR.onLoad()
    pickup.name ="Jousting Lance"
    pickup.desc ="Incantation attacks knock enemies back a great distance"
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

function ADVR.onRangedHitEntity(infos)
    if infos.customData == "magic_orb_attack_special" or infos.customData == "lightning_attack" then
        if infos.entity == nil then
            return infos.damage
        end
        if infos.isCritical and infos.entity.IsEnemy() and not infos.entity.IsBoss() then
            infos.entity.AsEnemy().RpcKnockback(7, game.playerHeadset.transform.position, 17, knockbackType.FORCE_PUSH)
        end
    end
    return infos.damage
end