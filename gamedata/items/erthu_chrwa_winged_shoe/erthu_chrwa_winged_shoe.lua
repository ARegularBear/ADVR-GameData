function ADVR.onLoad()
    pickup.name ="Winged Shoe"
    pickup.desc ="You float for four seconds when stepping over a pit"
    pickup.weight = 80
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 60
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
    pickup.isActivateItem = false
    pickup.globalTickDelay = 0.2
    pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true

    StartedFloatRoutine = false
end

--- This is called when the player picks up an item.
function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

--- This event gets called every now and then (by default every 0.5 seconds) which allows you to execute time based functions.
function ADVR.onGlobalTick()
    if game.IsInMenu() then
        return
    end

    local currentTile = game.currentWorldGenerator.GetTileAtRealPos(player.transform.position)

    if currentTile == nil then
        return
    end

    local overPit = string.find(currentTile.ground, "pit")
    if overPit and StartedFloatRoutine == false then
        StartedFloatRoutine = true
        game.playerController.useGravity = false
        game.playerController.ResetCurrentGravity()
        MoveRoutine = pickup.CallFunctionOnRepeat("MovePlayerUpTo", 4, 0.025, currentTile.GetGroundOffset() + 0.25)
        EndFlightRoutine = pickup.CallFunctionIn("EndFlight", 4)
    elseif not overPit then
        if MoveRoutine ~= nil then
            MoveRoutine.Cancel()
        end
        if EndFlightRoutine ~= nil then
            EndFlightRoutine.Cancel()
        end
        if StartedFloatRoutine then
            game.playerController.ResetCurrentGravity()
            game.playerController.useGravity = true
        end
        StartedFloatRoutine = false
    end
end

--- This event gets called whenever the player died.
--- @param player PlayerLiving desc
function ADVR.onPlayerDeath(player)
    if MoveRoutine ~= nil then
        MoveRoutine.Cancel()
    end
    if EndFlightRoutine ~= nil then
        EndFlightRoutine.Cancel()
    end
end

function EndFlight()
    game.playerController.useGravity = true
end

function MovePlayerUpTo(yPos)
    if StartedFloatRoutine == false then
        return
    end

    local pos = game.playerController.transform.position
    if pos.y <= yPos then
        pos.y = pos.y + 0.01
    end

    game.playerController.transform.position = pos
end