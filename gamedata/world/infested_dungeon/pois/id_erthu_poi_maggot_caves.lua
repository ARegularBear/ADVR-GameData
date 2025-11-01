function ADVR.onLoad()
    poi.name = "Maggot Tunnels"
    poi.correspondingFloor = dungeonFloor.INFESTED_DUNGEON
    poi.probability = 1.0
    poi.replaceType = "enemy"
    poi.spawnAtDeepness = -1

    poi.CreateTextureOverride("wall", "id_erthu_poi_maggot_caves_texture_override_wall.png", 360, 1024 - 64)
    poi.CreateTextureOverride("ground", "id_erthu_poi_maggot_caves_texture_override_ground.png", 0, 1024 - 193)
    poi.CreateTextureOverride("ceil", "id_erthu_poi_maggot_caves_texture_override_ground.png", 0, 1024 - 453)
    poi.CreateTextureOverride("ground2", "id_erthu_poi_maggot_caves_texture_override_ground.png", 0, 1024 - 258)
end

function ADVR.POIEvents.onFound(firstVisit)
end