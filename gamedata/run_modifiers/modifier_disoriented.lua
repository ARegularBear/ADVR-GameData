function ADVR.onLoad()
	modifier.name = "Disoriented"
	modifier.desc = "The dungeon is much larger..."
    modifier.modifierHint = "+#%"
    modifier.maxLevel = 4
    modifier.difficultyPerLevel = 0.05
end

function ADVR.ModifierEvents.getFinalValue()
	return modifier.CurrentLevel * 25
end

--- This event gets called right before a dungeon floor is about to generate. This may be handy if you want to influence any generation before the starting room has been generated.
function ADVR.onPreDungeonGenerated(worldGenerator)
    worldGenerator.generationDetails.roomClusterSize = worldGenerator.generationDetails.roomClusterSize + modifier.CurrentLevel
    worldGenerator.generationDetails.branchesPerCluster = worldGenerator.generationDetails.branchesPerCluster + modifier.CurrentLevel / 2
end
