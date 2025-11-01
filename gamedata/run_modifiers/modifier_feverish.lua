function ADVR.onLoad()
	modifier.name = "Feverish"
	modifier.desc = "You start with less hearts"
    modifier.modifierHint = "-# HP"
    modifier.maxLevel = 2
    modifier.difficultyPerLevel = 0.25
end

function ADVR.ModifierEvents.getFinalValue()
	return modifier.CurrentLevel
end

--- This event gets called whenever a dungeon floor is generating, this specific one is called whenever the first room of a dungeon floor has been generated and (if needed) the player has been teleported into the dungeon.
function ADVR.onDungeonGenerated(worldGenerator)
    if helperMethods.IsInFirstDungeon(worldGenerator) then
        player.MaxHealth = player.MaxHealth - modifier.CurrentLevel * 2
        player.Health = player.MaxHealth
    end
end
