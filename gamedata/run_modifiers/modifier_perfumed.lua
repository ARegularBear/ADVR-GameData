function ADVR.onLoad()
	modifier.name = "Perfumed"
	modifier.desc = "Enemies appear in greater numbers"
    modifier.modifierHint = "+#%"
    modifier.maxLevel = 6
    modifier.difficultyPerLevel = 0.05
end

function ADVR.ModifierEvents.getFinalValue()
	return modifier.CurrentLevel * 10
end

--- This event gets called whenever a dungeon floor is generating, this specific one is called whenever the first room of a dungeon floor has been generated and (if needed) the player has been teleported into the dungeon.
function ADVR.onPreDungeonGenerated(worldGenerator)
    player.duplicateEnemyMultiplier = modifier.CurrentLevel * 0.125
end