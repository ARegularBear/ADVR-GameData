function ADVR.onLoad()
	pickup.name = "Pit Friend"
	pickup.desc = "Throwing food into pits has a chance to improve a random characteristic"
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL}
	pickup.entityDeathListeners = {objects.ITEM_FOOD_DRAGONFRUIT, objects.ITEM_FOOD_POTATO, objects.ITEM_FOOD_APPLE, objects.ITEM_FOOD_STEAK, objects.ITEM_FOOD_CHICKEN, objects.ITEM_FOOD_ORANGE, objects.ITEM_FOOD_PEAR, objects.ITEM_FOOD_CHEESE, objects.ITEM_FOOD_YAM, objects.ITEM_FOOD_BEET, objects.ITEM_FOOD_PLUM}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
	game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onEntityDeath(livingBaseReference, sourceReference, lastDamageType)
	if game.IsProxy() then
		return
	end

    if lastDamageType ~= damageType.PIT then
		return
	end

	local numberOfUpgrades = 1
	local chance = 0.0

	local foodProperties = {
		[objects.ITEM_FOOD_DRAGONFRUIT] = { upgrades = 2, chance = 1.0 },
		[objects.ITEM_FOOD_STEAK]       = { upgrades = 1, chance = 1.0 },
		[objects.ITEM_FOOD_CHICKEN]     = { upgrades = 1, chance = 1.0 },
		[objects.ITEM_FOOD_APPLE]       = { upgrades = 1, chance = 0.77 },
		[objects.ITEM_FOOD_ORANGE]      = { upgrades = 1, chance = 0.77 },
		[objects.ITEM_FOOD_PEAR]        = { upgrades = 1, chance = 0.77 },
		[objects.ITEM_FOOD_CHEESE]      = { upgrades = 1, chance = 0.77 },
		[objects.ITEM_FOOD_POTATO]      = { upgrades = 1, chance = 0.44 },
		[objects.ITEM_FOOD_YAM]         = { upgrades = 1, chance = 0.44 },
		[objects.ITEM_FOOD_BEET]        = { upgrades = 1, chance = 0.44 },
		[objects.ITEM_FOOD_PLUM]        = { upgrades = 1, chance = 0.44 },
	}

	local props = foodProperties[livingBaseReference.livingId]

	-- If the food ID was found in the table, update the values
	if props then
		numberOfUpgrades = props.upgrades
		chance = props.chance
		audio.PlaySoundLocal(sounds.SFX_PIT_FRIEND, livingBaseReference.transform.position) -- Moved sound play here, assuming it only plays for known food items
	else
		return
	end

	if numberOfUpgrades == 2 then
		helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, 1, 1)
		pickup.SendRPCEvent(2, rpcType.TO_ALL)
	elseif helperMethods.IsValidWithLuck(chance - 0.3, chance + 0.2, chance) then
		pickup.SendRPCEvent(1, rpcType.TO_ALL)
		helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, 1)
	end
end

function ADVR.onRPCReceived(eventID, sourcePlayer)
	local results = nil
	if eventID == 2 then
		results = helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, 1, 1)
	else
		results = helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, 1)
	end

	if results == nil or #results == 0 then
		return
	end

	local changed = ""
	for i = 0, #results - 1 do
		if i ~= 0 then
			changed = changed .. "\n"
		end
		
		changed = changed .. "<color=#289407>" .. results[i] .. "</color>"
	end
	game.ShowMessageInWorld(changed, 4)
end