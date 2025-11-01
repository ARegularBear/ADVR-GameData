function ADVR.onLoad()
    poi.name = "Muddy Cistern"
    poi.correspondingFloor = dungeonFloor.NOXIOUS_SEWERS
    poi.probability = 0.5
    poi.replaceType = "secret"
    poi.spawnAtDeepness = -1
end

function ADVR.POIEvents.onFound(firstVisit)
end