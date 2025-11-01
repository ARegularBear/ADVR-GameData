function ADVR.onLoad()
	modifier.name = "Bleeding"
	modifier.desc = "Aberant enemies appear in greater numbers"
    modifier.modifierHint = "+#%"
    modifier.maxLevel = 4
    modifier.difficultyPerLevel = 0.05
end

function ADVR.ModifierEvents.getFinalValue()
	return modifier.CurrentLevel * 10
end

--- This event gets called whenever a dungeon floor is generating, this specific one is called whenever the first room of a dungeon floor has been generated and (if needed) the player has been teleported into the dungeon.
function ADVR.onDungeonGenerated(worldGenerator)
    if helperMethods.IsInFirstDungeon(worldGenerator) or game.runSaveManager.isInLoadRoutine then
        player.ProbabilityForChampionEnemy = modifier.CurrentLevel * 0.1
    end
end
