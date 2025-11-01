function ADVR.onLoad()
	progress.name = "Willful Hearts"
	progress.desc = "<i>Items offerring different types of protection may appear within The Ancient Dungeon</i>"
	progress.price = 50
	progress.predecessor = "progress_devilish_deals"

	base.postObjectSpawnListeners = {
		game.GetObjectMapping("item_ethereal_heart"),
	}
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPostObjectSpawn(prefab, override)
	-- Chance to reroll the ethereal heart
	if math.random() > 0.33 then
		local itemUpgrade = override.GetComponent_ItemUpgrade_()
		itemUpgrade.forceSpawn = GetRandomHeart()
	end
end

function GetRandomHeart()
	local hearts = {
		{ name = "erthu_chrwa_winsome_heart", probability = 0.4},
		{ name = "erthu_chrwa_covetous_heart", probability = 0.6},
		{ name = "erthu_chrwa_impassioned_heart", probability = 0.9},
		{ name = "erthu_chrwa_tortured_heart", probability = 1.0},
		{ name = "erthu_chrwa_resolute_heart", probability = 1.0},
	}

	  -- Step 1: Select a random heart from the list
	  local randomIndex = math.random(1, #hearts)
	  local selectedHeart = hearts[randomIndex]
  
	  -- Step 2: Check if the selected heart passes its probability threshold
	  local randomChance = math.random()
	  if randomChance <= selectedHeart.probability then
		  return selectedHeart.name
	  else
		  return GetRandomHeart()
	  end
end