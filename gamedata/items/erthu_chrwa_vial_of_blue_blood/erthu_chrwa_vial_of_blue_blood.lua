function ADVR.onLoad()
	pickup.name = "Vial of Blue Blood"
	pickup.desc = "When hit, your number of coins decrease instead of your health"
	pickup.weight = 20
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 3
	pickup.price = 50
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
	pickup.globalTickDelay = 1.0
	pickup.priority = -9999
end

function ADVR.onPickup()
	-- needs to be applied before registering the item, because of globalTickCheck
	player.currentCash = player.currentCash + 50

	pickup.RegisterItem()
	game.playerController.playerStatsUI.playerHP.gameObject.SetActive(false)

	AllPlayers = game.GetAllPlayersArray()
	for player in AllPlayers do
		player.playerController.textPlayerName.transform.GetChild(0).gameObject.SetActive(false)
	end

	ScaleSpectatorCamHP()

	player.MaxHealth = 12
end

function ScaleSpectatorCamHP()
	if game.playerController == nil or game.playerController.spectatorCamera == nil then
		return
	end
	SpectatorCamHP = game.playerController.spectatorCamera.GetComponentInChildren(game.GetType("UI_HP"))

	if SpectatorCamHP == nil then
		return
	end

	OriginalScale = SpectatorCamHP.transform.localScale
	SpectatorCamHP.transform.localScale = vector3.__new(0, 0, 0)
end

function ADVR.onGameReloadMP()
	if SpectatorCamHP == nil then
		return
	end
	SpectatorCamHP.transform.localScale = OriginalScale
	AllPlayers = game.GetAllPlayersArray()
	for player in AllPlayers do
		player.playerController.textPlayerName.transform.GetChild(0).gameObject.SetActive(true)
	end
end

function ADVR.onPickupProxies(originalPlayerRef)
	player.currentCash = player.currentCash + 50

	AllPlayers = game.GetAllPlayersArray()
	for player in AllPlayers do
		player.playerController.textPlayerName.transform.GetChild(0).gameObject.SetActive(false)
	end

	ScaleSpectatorCamHP()

	pickup.RegisterItemNoSync()
	game.playerController.playerStatsUI.playerHP.gameObject.SetActive(false)
	player.MaxHealth = 12
end

function ADVR.onPlayerHit(damage)
	player.currentCash = player.currentCash - damage * 15 * math.max(1, player.newGamePlusLevel)
	if player.SharedCashPool < 0 then
		player.OnDeath()
	end
	return 1
end

function ADVR.onGlobalTick()
	if player.SharedCashPool <= 0 and not player.isDead then
		player.OnDeath()
		return
	end
	player.Health = 10
	player.MaxHealth = 12
	player.RemoveEtherealHealth(20, false)
end

function ADVR.onFoodEaten(food)
	if food.healAmount > 5 then
		food.healAmount = 5
	end
	player.currentCash = player.currentCash + food.healAmount * 15
end

function ADVR.onPlayerValueChanged(val)
    if val == playerValues.ETHEREAL_HEALTH and player.EtherealHealth > 0 then
		player.RemoveEtherealHealth(player.EtherealHealth, false)
	elseif val == playerValues.HEALTH then
		if player.Health > 20 then
			player.Health = 20
		end
	end
end