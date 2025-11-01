function ADVR.onLoad()
	pickup.name = "Curse of Famine"
	pickup.desc = "Food is less likely to appear in the arena"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.isCurse = true
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true

	HasRun = false
end

function ADVR.onPickup()
	pickup.RegisterItem()
	ReduceWeights()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	ReduceWeights()
end

function ReduceWeights()
	local arena = game.FindObjectByType(game.GetType("ArenaManager")) ---@type ArenaManager
	if arena ~= nil then
		local potatoWeight = arena.runtimeValues.lootWaveWeights.GetWeight(objects.ITEM_FOOD_POTATO)
		arena.runtimeValues.lootWaveWeights.SetWeight(objects.ITEM_FOOD_POTATO, potatoWeight * 0.75)
		local appleWeight = arena.runtimeValues.lootWaveWeights.GetWeight(objects.ITEM_FOOD_APPLE)
		arena.runtimeValues.lootWaveWeights.SetWeight(objects.ITEM_FOOD_APPLE, appleWeight * 0.75)
		local steakWeight = arena.runtimeValues.lootWaveWeights.GetWeight(objects.ITEM_FOOD_STEAK)
		arena.runtimeValues.lootWaveWeights.SetWeight(objects.ITEM_FOOD_STEAK, steakWeight * 0.75)
		local dragonfruitWeight = arena.runtimeValues.lootWaveWeights.GetWeight(objects.ITEM_FOOD_DRAGONFRUIT)
		arena.runtimeValues.lootWaveWeights.SetWeight(objects.ITEM_FOOD_DRAGONFRUIT, dragonfruitWeight * 0.75)
	end
end

function IsAllowedToSpawn()
	return true
end