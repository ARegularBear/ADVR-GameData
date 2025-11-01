function ADVR.onLoad()
    achievement.name = "The Librarian"
	achievement.desc = "Traverse The Forgotten Library without taking any damage."
	achievement.hideDescription = false
	PlayerDamaged = false
	achievement.priority = -10000
	achievement.insightReward = 6
	achievement.unlocksItem = relics.ERTHU_CHRWA_DOWRY_CHEST
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.FORGOTTEN_LIBRARY and PlayerDamaged == false) then
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