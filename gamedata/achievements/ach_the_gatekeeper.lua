function ADVR.onLoad()
    achievement.name = "The Gatekeeper"
	achievement.desc = "Traverse The Overgrown Gatehouse without taking any damage."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_GLOWING_SPOT
	PlayerDamaged = false
	achievement.priority = -10000
	achievement.insightReward = 4
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.OVERGROWN_GATEHOUSE and PlayerDamaged == false) then
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