function ADVR.onLoad()
    achievement.name = "The Spelunker"
	achievement.desc = "Traverse The Luminous Depths without taking any damage."
	achievement.hideDescription = false
	PlayerDamaged = false
	achievement.priority = -10000
	achievement.insightReward = 7
	achievement.unlocksItem = relics.SEBWR_BURLAP_BLINDFOLD
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.LUMINOUS_DEPTHS and PlayerDamaged == false) then
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