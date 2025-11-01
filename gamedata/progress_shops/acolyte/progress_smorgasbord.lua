-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Smorgasbord"
	progress.desc = "<i>Merchants will always offer some food for adventurers that arrive with low health.</i>"
	progress.price = 80
	progress.predecessor = "progress_i_have_a_system"

	-- Variables
	FullHeartItemChance = 0.33
	AppleSpawnChance = 0.15
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onRoomEntered(enteredRoom)
	if game.IsPlayerWhoStartedRun() == false then
		return
	end

	-- TODO: Make this work for all players and not just the owner 
	if player.Health > 2 or enteredRoom.type ~= roomTypes.SHOP then
		return
	end

	-- If the player has one full hearth then it should be a random chance
	if player.Health == 2 and math.random() > FullHeartItemChance then
		return
	end

	local foundItems = game.FindObjectsByTypeSorted(game.GetType("BuyItem"))
	local itemsInShop = {}

	-- First we check which BuyItems are really inside the shop we entered
	for item in foundItems do
		local room = game.currentWorldGenerator.GetRoomAtRealPos(item.transform.position)
		if room ~= nil and room == enteredRoom then
			table.insert(itemsInShop, item)
		end
	end

	-- Now we can check if it already contains food, otherwise there's no need to add
	for _, item in pairs(itemsInShop) do
		if helperMethods.IsInstanceOfType(item.spawnedItem.gameObject, "ItemFood") == true then
			-- We found a food item, return!
			logging.Log(("[Smorgasbord] Found food in the shop, returning"))
			return
		end
	end

	-- Loop over the items to just get an item
	for _, item in pairs(itemsInShop) do
		-- First we destroy the previous spawned item and then we spawn the food
		game.Delete(item.spawnedItem.gameObject)

		-- Determine whether or not it should be an apple or a potato
		local foodObject = nil
		if helperMethods.RandomFromPosition(item.transform.position) < AppleSpawnChance then
			-- foodObject = game.GetObjectMapping(objects.ITEM_FOOD_APPLE)
			game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, item.transform.position)
		else 
			-- foodObject = game.GetObjectMapping("item_food_potato")
			game.SpawnObjectNetwork(objects.ITEM_FOOD_POTATO, item.transform.position)
		end
		
		-- Return so we don't spawn more than one food!
		return
	end
end
