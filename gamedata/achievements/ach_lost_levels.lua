function ADVR.onLoad()
    achievement.name = "Lost Levels"
	achievement.desc = "Discover a hidden floor."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.SEBWR_HAGGLERS_MARK
	achievement.priority = -1000
	achievement.insightReward = 4
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	-- TODO ADD more floors
	if(worldGenerator.worldGeneratorFloor == dungeonFloor.NOXIOUS_SEWERS or worldGenerator.worldGeneratorFloor == dungeonFloor.LUMINOUS_DEPTHS) then
		achievement.Unlock()
	end
end
