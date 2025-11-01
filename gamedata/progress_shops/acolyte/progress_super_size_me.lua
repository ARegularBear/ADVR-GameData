-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Super Size Me"
	progress.desc = "<i>Food has a chance of getting upgraded to the next tier</i>"
	progress.price = 50
	progress.predecessor = "progress_marvellous_marks"

	local apple = game.GetObjectMapping(objects.ITEM_FOOD_APPLE)
	local dragonFruit =	game.GetObjectMapping(objects.ITEM_FOOD_DRAGONFRUIT)
	local potato = game.GetObjectMapping(objects.ITEM_FOOD_POTATO)
	local steak = game.GetObjectMapping(objects.ITEM_FOOD_STEAK)
	local yam = game.GetObjectMapping(objects.ITEM_FOOD_YAM)
	local plum = game.GetObjectMapping(objects.ITEM_FOOD_PLUM)
	local beet = game.GetObjectMapping(objects.ITEM_FOOD_BEET)
	local pear = game.GetObjectMapping(objects.ITEM_FOOD_PEAR)
	local chicken = game.GetObjectMapping(objects.ITEM_FOOD_CHICKEN)

	base.preObjectSpawnListeners = {
		apple,
		potato,
		steak,
		yam,
		plum,
		beet,
		pear,
		chicken,
	}

	-- PREFAB = {UPGRADED_FOOD, CHANCE(0.0->1.0)}
	UpgradeTable = {
		[objects.ITEM_FOOD_POTATO] = {apple, 0.1},
		[objects.ITEM_FOOD_APPLE] = {steak, 0.05},
		[objects.ITEM_FOOD_STEAK] = {dragonFruit, 0.0125},
		[objects.ITEM_FOOD_YAM] = {apple, 0.1},
		[objects.ITEM_FOOD_PLUM] = {steak, 0.05},
		[objects.ITEM_FOOD_BEET] = {steak, 0.05},
		[objects.ITEM_FOOD_PEAR] = {steak, 0.05},
		[objects.ITEM_FOOD_CHICKEN] = {dragonFruit, 0.0125},
	}
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPreObjectSpawn(prefab, override, position)
	if override == nil then
		return override
	end

	local data = UpgradeTable[override.name]
	if data == nil then
		return override
	end

	if helperMethods.RandomFromPosition(position) < data[2] then
		return data[1]
	end

	return override
end
