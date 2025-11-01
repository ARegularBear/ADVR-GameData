function ADVR.onLoad()
    poi.name = "The Jail"
    poi.correspondingFloor = dungeonFloor.INFESTED_DUNGEON
    poi.probability = 1.0
    poi.replaceType = "enemy"
    poi.spawnAtDeepness = -1
end

function ADVR.POIEvents.onFound(firstVisit)
end