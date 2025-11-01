function ADVR.onLoad()
	progress.name = "Tethered Bolt"
	progress.desc = "You can retrieve your crossbow's bolt more quickly and from a greater distance."
	progress.price = 1
	progress.predecessor = nil
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(worldGenerator)
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().pullbackDistance = 3.5
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().pullbackSpeed = 12
end