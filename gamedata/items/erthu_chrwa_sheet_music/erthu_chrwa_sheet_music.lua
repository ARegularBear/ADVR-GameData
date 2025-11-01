function ADVR.onLoad()
    pickup.name ="Sheet Music"
    pickup.desc ="Enemies have a chance to spawn a wisp when destroyed"
    pickup.weight = 70
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SHOP,relicPool.SPECIAL}
    pickup.isActivateItem = false
    pickup.isSharedItem = true
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onEntityDeath(living, source)
    if living.IsEnemy() and living.networkObject.HasStateAuthority then
        local randomNumber = math.random(0, 2)
    
        if randomNumber == 1 then
            game.SpawnCompanionWisp(living.GetCenterInWorld())
        end
    end
end
