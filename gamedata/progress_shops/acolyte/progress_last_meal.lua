-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Last Meal"
	progress.desc = "<i>Stored food is automatically consumed when lethal damage could occur</i>"
	progress.price = 80
	progress.predecessor = "progress_gourmet_selections"
	progress.priority = -99999
end

function ADVR.onPlayerHit(damage)
	if damage >= player.RealHealth then
		-- if player would die, consume food instead (if it exists)
		for i = 0, 1 do
			if game.inventory.slots[i].objectInSlot ~= nil then
				local itemFood = game.inventory.slots[i].objectInSlot.gameObject.GetComponent_ItemFood_()
				if itemFood ~= nil then
					itemFood.OnTakeFromSlot()
					game.Delete(itemFood.gameObject)
					audio.PlaySoundLocal(sounds.DEATH_REVIVE_FOOD_EAT_FROM_SLOT, player.transform.position)
					return 0
				end
			end
		end
	end
	return damage
end

function ADVR.ProgressEvents.onBuy()
end