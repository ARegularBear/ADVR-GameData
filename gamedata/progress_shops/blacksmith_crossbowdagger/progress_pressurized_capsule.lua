function ADVR.onLoad()
	progress.name = "Pressurized Capsule"
	progress.desc = "The size of the explosion caused by your crossbow bolt's strike is increased."
	progress.price = 2
	progress.predecessor = progresses.PROGRESS_TETHERED_BOLT
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(worldGenerator)
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().networkedExplosionRadius = 3.2
end