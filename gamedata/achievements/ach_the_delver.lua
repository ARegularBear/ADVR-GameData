function ADVR.onLoad()
    achievement.name = "The Delver"
	achievement.desc = "Traverse The Infested Dungeon without taking any damage."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_SLOBBERING_TOTEM
	PlayerDamaged = false
	achievement.priority = -10000
	achievement.insightReward = 5
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.INFESTED_DUNGEON and PlayerDamaged == false) then
		achievement.Unlock()
	end
end

function ADVR.onDungeonGenerated(worldGenerator)
	PlayerDamaged = false
end

function ADVR.onPlayerHit(damage)
	if damage > 0 then
		PlayerDamaged = true
	end
	return damage
end