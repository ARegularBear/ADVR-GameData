function ADVR.onLoad()
    poi.name = "Arcane Rift"
    poi.correspondingFloor = dungeonFloor.FORGOTTEN_LIBRARY
    poi.probability = 0.7
    poi.replaceType = "enemy"
    poi.spawnAtDeepness = -1
end

function ADVR.POIEvents.onFound(firstVisit)
end