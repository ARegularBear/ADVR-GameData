function ADVR.onLoad()
    poi.name = "Hot Springs"
    poi.correspondingFloor = dungeonFloor.LUMINOUS_DEPTHS
    poi.probability = 1.0
    poi.replaceType = "secret"
    poi.spawnAtDeepness = -1
end

function ADVR.POIEvents.onFound(firstVisit)
    poi.CallFunctionIn("HealPlayer", 10.0)
end

function HealPlayer()
    if game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position).type == "poi" then 
        player.Heal(2)
        game.ShowMessageInWorld("You feel refreshed by the hot springs.", 4)
    end
end