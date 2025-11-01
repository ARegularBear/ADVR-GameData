function ADVR.onLoad()
    pickup.name = "Sprout of Ivy"
    pickup.desc = "Your melee weapon slowly increases in size and damage, but resets after each strike"
    pickup.globalTickDelay = 0.065
    game.RegisterForRPCEvents(pickup)

    BaseScale = vector3.__new(0.1, 0.1, 0.1)
    GrowthSpeed = 0.0265
    GoalScale = 1.6
end

function ADVR.onPickup()
    pickup.RegisterItem()
    SwordBase = game.inventory.currentPrimaryWeapon.AsSwordBase()
    ColorWeapons(player.LocalPlayerRef)
end

function ADVR.onPickupProxies(originalPlayerRef)
    ColorWeapons(originalPlayerRef)
    TimeToGrow = (GoalScale - BaseScale.x) / (GrowthSpeed / pickup.globalTickDelay * 2)
    pickup.CallFunctionOnRepeat("GrowWeaponProxy", TimeToGrow, pickup.globalTickDelay)
    SourcePlayerWeapon = game.GetPlayerById(originalPlayerRef).playerController.networkedPlayerInventory.currentPrimaryWeapon
end

function ColorWeapons(playerRef)
    helperMethods.UpdateWeaponColorsMelee(playerRef, colors.Create(0.017, 0.129, 0.000, 1.000), colors.Create(0.017, 0.129, 0.000, 1.000), colors.Create(0.017, 0.129, 0.000, 1.000), colors.Create(0.017, 0.129, 0.000, 1.000), colors.Create(0.163, 0.330, 0.163, 1.000), colors.Create(0.263, 0.520, 0.263, 1.000), colors.Create(0.455, 0.741, 0.455, 1.000))
    helperMethods.SetTrailColorMelee(playerRef, colors.Create(0.000, 0.690, 0.000, 0.407))
    helperMethods.SetTrailEmissionMelee(playerRef, colors.Create(0.000, 0.000, 0.000, 0.904), 0.000)
end

function ADVR.onGlobalTick()
    if SwordBase ~= nil and SwordBase.transform.localScale.x < GoalScale then
        SwordBase.transform.localScale = vector3.__new(1,1,1) * (SwordBase.transform.localScale.x + GrowthSpeed)
    end
end

function ADVR.onMeleeHitEntity(infos)
    local extraDmg = SwordBase.transform.localScale.x * 1.2

    if infos.entity ~= nil and infos.entity.IsEnemy() then
        -- try to send fewer rpcs (for example when hitting multiple enemies in a short amount of time)
        if SwordBase.transform.localScale.x > BaseScale.x + GrowthSpeed * 4 then
            pickup.SendRPCEvent(0, rpcType.TO_PROXIES)
        end
        SwordBase.transform.localScale = BaseScale
    end

    return infos.damage * extraDmg
end

function ADVR.onRPCReceived(eventID, sourcePlayer)
    SourcePlayerWeapon.transform.localScale = BaseScale
    pickup.CallFunctionOnRepeat("GrowWeaponProxy", TimeToGrow, pickup.globalTickDelay)
end

function GrowWeaponProxy()
    if SourcePlayerWeapon == nil then
        return
    end

    if SourcePlayerWeapon.transform.localScale.x < GoalScale then
        SourcePlayerWeapon.transform.localScale = vector3.__new(1,1,1) * (SourcePlayerWeapon.transform.localScale.x + GrowthSpeed)
    end
end