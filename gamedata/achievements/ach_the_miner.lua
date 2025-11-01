function ADVR.onLoad()
    achievement.name = "The Miner"
	achievement.desc = "Traverse The Gloaming Mines without taking any damage."
	achievement.hideDescription = false
	PlayerDamaged = false
	achievement.priority = -10000
	achievement.insightReward = 7
	achievement.unlocksItem = relics.ERTHU_CHRWA_DURIAN_HUSK
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.GLOAMING_MINES and PlayerDamaged == false) then
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