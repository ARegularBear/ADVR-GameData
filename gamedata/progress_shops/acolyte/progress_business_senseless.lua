-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Business Sense(less)"
	progress.desc = "<i>Merchants offer an additional item for sale when a purchase is made.</i>"
	progress.price = 40
	progress.predecessor = "progress_i_have_a_system"
end

function ADVR.onDungeonGenerated(worldGenerator)
	HasSpawned = false
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onItemBought(item, pos)
	if game.itemInterpreter.AmountPickupFoundByLocalPlayer(relics.ERTHU_CHRWA_OVERSTOCK_FLYER) == 0 and HasSpawned == false then
		base.CallFunctionIn("Respawn", 1.5, pos)
		HasSpawned = true
	end
end

function Respawn(position)
	game.SpawnObjectNetwork(objects.SHOP_BUY_AREA, position)
end