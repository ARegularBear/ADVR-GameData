-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Precious Pottery"
	progress.desc = "<i>Interspersed among the mundane ceramics, golden pots brimming with coin can rarely be found.</i>"
	progress.price = 100
	progress.predecessor = "progress_devilish_deals"
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(worldGenerator)
	if worldGenerator.worldGeneratorFloor == dungeonFloor.ARENA then
		return
	end

	if player.newGamePlusLevel == 0 then		
		info = wallDecoratorWallInfo.__new()
		info.identifier = "goldenPot"
		info.possibleDecos = {game.stringToObjectMapper.GetObject("prop_pot_golden")}
		info.maxDistancesFromMiddle = vector3.__new(1, 0, 0)
		info.offset = vector3.__new(0, 0.001, 0.375)
		info.checkCollisions = true
		info.amountPerWall = 0.0065
		game.helperMethods.AddWallDecoratorEntryFor( worldGenerator.worldGeneratorFloor, info )
	end
end