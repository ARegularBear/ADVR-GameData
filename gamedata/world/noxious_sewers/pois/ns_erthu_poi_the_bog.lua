function ADVR.onLoad()
    poi.name = "The Bog"
    poi.correspondingFloor = dungeonFloor.NOXIOUS_SEWERS
    poi.probability = 1.0
    poi.replaceType = "enemy"
    poi.spawnAtDeepness = -1
end

function ADVR.POIEvents.onFound(firstVisit)
end