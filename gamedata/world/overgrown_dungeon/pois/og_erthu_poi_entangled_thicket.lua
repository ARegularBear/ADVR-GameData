function ADVR.onLoad()
    poi.name = "Entangled Thicket"
    poi.correspondingFloor = dungeonFloor.OVERGROWN_GATEHOUSE
    poi.probability = 1.0
    poi.replaceType = "enemy"
    poi.spawnAtDeepness = -1

    poi.CreateTextureOverride("wall", "og_erthu_poi_entangled_thicket_texture_override_wall.png", 360, 1024 - 64)
    poi.CreateTextureOverride("ceiling", "og_erthu_poi_entangled_thicket_texture_override_ceiling.png", 0, 1024 - 453)
end

function ADVR.POIEvents.onFound(firstVisit)
end