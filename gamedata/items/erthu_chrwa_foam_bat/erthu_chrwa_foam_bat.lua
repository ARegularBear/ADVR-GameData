function ADVR.onLoad()
	pickup.name = "Foam Bat"
	pickup.desc = "Initially decreases weapon damage, but destroying enemies will increase it past the original values"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true

	-- Variables
	GoalMultiplier = 0.65 -- added with start multiplier we will end up at 1.15, so a 15% increase in damage
	StartMultiplier = 0.5
	CurrentMultiplier = 0
	KillsNeeded = 24
	IncreaseAmount = 0

	-- Internal variables
	KillsToGo = 0
	SaveKey = "kills_to_go_foam_bat"
end

function ADVR.onPickup()
	pickup.RegisterItem()

	KillsToGo = KillsNeeded
	IncreaseAmount = 1 / KillsNeeded * GoalMultiplier
	CurrentMultiplier = StartMultiplier

	if game.runSaveManager.isInLoadRoutine then
		KillsToGo = game.LoadInt(SaveKey, 0)
		return
	end

	game.SaveInt(SaveKey, KillsToGo)
	player.PrimaryDamage.RegisterMultiplier(pickup.id, StartMultiplier)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, StartMultiplier)
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() == false or source ~= player.LocalPlayerRef then
		return
	end
	
	-- Increase the stats if needed.
	if KillsToGo > 0 then
		CurrentMultiplier = CurrentMultiplier + IncreaseAmount
		player.PrimaryDamage.ChangeMultiplier(pickup.id, CurrentMultiplier)
		player.SecondaryDamage.ChangeMultiplier(pickup.id, CurrentMultiplier)
		KillsToGo = KillsToGo - 1

		game.SaveInt(SaveKey, KillsToGo)

		if KillsToGo == 0 then
			player.PrimaryDamage.RegisterAddend(pickup.id, 2)
			player.SecondaryDamage.RegisterAddend(pickup.id, 2)
		end
	end
end
