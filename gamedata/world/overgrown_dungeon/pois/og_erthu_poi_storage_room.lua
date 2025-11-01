function ADVR.onLoad()
    poi.name = "Abandoned Storage"
    poi.correspondingFloor = dungeonFloor.OVERGROWN_GATEHOUSE
    poi.probability = 1.0
    poi.replaceType = "item"
    poi.spawnAtDeepness = -1

    poi.CreateTextureOverride("wall", "og_erthu_poi_storage_room_texture_override_wall.png", 360, 1024 - 64)
end

function ADVR.POIEvents.onFound(firstVisit)
end