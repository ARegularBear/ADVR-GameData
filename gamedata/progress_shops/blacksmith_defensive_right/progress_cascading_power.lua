function ADVR.onLoad()
	progress.name = "Cascading Power"
	progress.desc = "Base state boost upgrades have a small chance of getting applied twice when picked up."
	progress.price = 2
	progress.predecessor = progresses.PROGRESS_SWIFT_STRIDE
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPickupTaken(itemUpgrade)
	if itemUpgrade == nil then
		return
	end

	local validUpgrades = {
		relics.ERTHU_CHRWA_GOLD_TOOTH,
		relics.ERTHU_CHRWA_BLOODY_FINGERPRINT,
		relics.ERTHU_CHRWA_GRUESOME_TROPHY,
		relics.ERTHU_CHRWA_OMINOUS_FINGERPRINT,
		relics.ERTHU_CHRWA_THREE_LEAF_CLOVER,
		relics.ERTHU_CHRWA_WEAK_LINK,
		relics.ERTHU_CHRWA_CUSTOMER_CARD
	}
	
	if not table.contains(validUpgrades, itemUpgrade.rolledItem.id) then
		return
	end

	if helperMethods.IsValidWithLuck(0, 0.5) then
		-- aplly the upgrade again
		local dupeUpgrade = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. itemUpgrade.rolledItem.id, vector3.zero)
		progress.CallFunctionIn("UseIt", 0.8, dupeUpgrade.GetComponent_ItemUpgrade_())
		audio.PlaySoundLocal(sounds.ITEM_UPGRADE_PICKUP, player.transform.position)
	end
end

function UseIt(upgrade)
	upgrade.OnUseStart()
end

-- Helper function to check if a table contains a value
function table.contains(tbl, val)
	for _, v in ipairs(tbl) do
		if v == val then
			return true
		end
	end
	return false
end