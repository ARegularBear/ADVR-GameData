function ADVR.onLoad()
	pickup.name = "Burlap Blindfold"
	pickup.desc = "Drastically increases all your characteristics, but relics will not longer be identifieable in advance"
	pickup.weight = 66
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
	PickupsDictionary = {}

	game.RegisterForRPCEvents(pickup)
end


function ADVR.onPickup()
	FillDictornaryWithDefaultValues()
	pickup.RegisterItem()
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 2)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 2)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.EvasionChance.RegisterAddend(pickup.id, 0.3)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.15)
	if game.runSaveManager.isInLoadRoutine == false then
		HidePickupStats()
	end
end


function ADVR.onPickupProxies(originalPlayerRef)
	FillDictornaryWithDefaultValues()
	pickup.RegisterItemNoSync()
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 2)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 2)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.EvasionChance.RegisterAddend(pickup.id, 0.3)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.15)
	HidePickupStats()
end


function ADVR.onPickupTaken(pick)
	pickup.SendRPCEvent(2, pick.rolledItem.id, rpcType.TO_ALL)
	ShowStatsOfCertainPickup(pick)
end

function ADVR.onRPCReceived(eventID, sourcePlayer, pickupId)
	ShowStatsOfCertainPickup(game.itemInterpreter.GetPickupById(pickupId))
end


function FillDictornaryWithDefaultValues()
	for pick in game.itemInterpreter.pickupsOnDisk do
		PickupsDictionary[pick.id] = {
			name = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation(pick.id .. "_name"),
			desc = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation(pick.id .. "_desc"),
			sprite = pick.sprite
		}
	end
end


function HidePickupStats()
	AllActivePickups = game.itemInterpreter.GetActivePickupsFromAllPlayers()
	for pick in game.itemInterpreter.pickupsOnDisk do
		if not IsStringInList(AllActivePickups, pick.id) then
			pick.sprite = nil
			game.localizationInterpreter.currentlySelectedLanguage.SetTranslation(pick.id .. "_desc", "???")
			game.localizationInterpreter.currentlySelectedLanguage.SetTranslation(pick.id .. "_name", "???")		
		end
	end
end

function ADVR.onSaveLoaded()
	HidePickupStats()
	AllActivePickups = game.itemInterpreter.GetActivePickupsFromAllPlayers()
	for pick in game.itemInterpreter.pickupsOnDisk do
		if IsStringInList(AllActivePickups, pick.id) then
			ShowStatsOfCertainPickup(pick)
		end
	end
end

function ShowStatsOfCertainPickup(pick)
	local orginalPickupData = PickupsDictionary[pick.id]
	pick.sprite = orginalPickupData.sprite
	game.localizationInterpreter.currentlySelectedLanguage.SetTranslation(pick.id .. "_name", pick.name)
	game.localizationInterpreter.currentlySelectedLanguage.SetTranslation(pick.id .. "_desc", pick.desc)
end


function IsStringInList(list, target)
    for value in list do
        if value.id == target then
            return true
        end
    end
    return false
end