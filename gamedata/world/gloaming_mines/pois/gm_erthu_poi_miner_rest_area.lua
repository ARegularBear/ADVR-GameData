function ADVR.onLoad()
    poi.name = "Rest Area"
    poi.correspondingFloor = dungeonFloor.GLOAMING_MINES
    poi.probability = 1.0
    poi.replaceType = "secret"
    poi.spawnAtDeepness = -1
end

function ADVR.POIEvents.onFound(firstVisit)
end