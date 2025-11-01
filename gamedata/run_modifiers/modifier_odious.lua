function ADVR.onLoad()
	modifier.name = "Odious"
	modifier.desc = "You start with less luck and less discount"
    modifier.modifierHint = "-#%"
    modifier.maxLevel = 3
    modifier.difficultyPerLevel = 0.05
end

function ADVR.ModifierEvents.getFinalValue()
	return modifier.CurrentLevel * 10
end

--- This event gets called whenever a dungeon floor is generating, this specific one is called whenever the first room of a dungeon floor has been generated and (if needed) the player has been teleported into the dungeon.
function ADVR.onDungeonGenerated(worldGenerator)
    if helperMethods.IsInFirstDungeon(worldGenerator) and game.IsHost() then
        player.Luck.RegisterAddend("modifier_odious", -0.1 * modifier.CurrentLevel)
        player.ShopDiscount.RegisterAddend("modifier_odious", -0.1 * modifier.CurrentLevel)
    end
end
