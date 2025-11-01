function ADVR.onLoad()
    achievement.name = "The Anosmic"
	achievement.desc = "Traverse The Noxious Sewers without taking any damage."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.SEBWR_MIASMIC_TOADSKIN
	PlayerDamaged = false
	achievement.priority = -10000
	achievement.insightReward = 4
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.NOXIOUS_SEWERS and PlayerDamaged == false) then
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