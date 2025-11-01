function ADVR.onLoad()
	pickup.name = "Potluck Ladle"
	pickup.desc = "Rare relics may appear where they previously could not"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 80
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	RandomizeDropTables()
end

function RandomizeDropTables()
	local dropTables = game.dropTableHandler.GetDropTablesByName("all")
	for dropTable in dropTables do
		for key, value in pairs(dropTable.dropEntries) do
			if string.find(value.objectId, "item_upgrade_") then
				value.objectId = "item_upgrade_all"
			end
		end
	end
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	RandomizeDropTables()
end