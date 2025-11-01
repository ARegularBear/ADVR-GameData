function ADVR.onLoad()
	pickup.name = "Threshing Blade"
	pickup.desc = "Weapon damage is divided equally among nearby enemies"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true

	-- This is to make sure that all other items are run first so we don't get weird damage outputs
	-- on the hit enemy because an item after this increased the value. This shouldn't mess up
	-- the milestones though because they are at priority -1000
	pickup.priority = -900 

	EnemyDamageRange = 10.0
	DisabledThunderingGong = false
	DisabledWeightedPommel = false
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onSecondaryHitEntity(hitInfo)
	return HandleHit(hitInfo, true)
end

function ADVR.onPrimaryHitEntity(hitInfo)
	return HandleHit(hitInfo, false)
end

function HandleHit(hitInfo, isRanged)
	if hitInfo.entity == nil or hitInfo.entity.IsEnemy() == false then
		return hitInfo.damage
	end
	
	local enemies = FilterEnemies(game.GetEnemiesInRadius(EnemyDamageRange, hitInfo.entity.transform.position, true), hitInfo.entity)
	if #enemies == 0 then
		return hitInfo.damage
	end

	local newDamage = hitInfo.damage / (#enemies + 1)
	newDamage = mathf.RoundToInt(newDamage)

	-- Make sure you never do 0 or even less damage because that's just unfair.
	if newDamage <= 0 then
		newDamage = 1
	end

	-- Check if the 'gong' has been picked up and should be disabled.
	if DisabledThunderingGong == false and game.itemInterpreter.GetPickupById(relics.ERTHU_CHRWA_THUNDERING_GONG).AmountActiveLocal() > 0 then
		DisabledThunderingGong = true

		local gongDiskRepresentation = game.itemInterpreter.GetItemById(relics.ERTHU_CHRWA_THUNDERING_GONG) 
		gongDiskRepresentation.UnregisterEvents()
	end

	-- Check if the 'pommel' has been bought and should be disabled.
	local augment = game.progressHandler.GetProgressById(progresses.PROGRESS_WEIGHTED_POMMEL)
	if DisabledWeightedPommel == false and augment.IsBought() == true then
		DisabledWeightedPommel = true
		
		augment.UnregisterEvents()
	end

	-- Apply the extra damage from the gong and the pommel if they were disabled, which means
	-- they are active but are applied by this item! Do note that ranged damage shouldn't
	-- boost the damage number because these are melee only upgrades/items!
	local isSword = game.GetPlayerWeaponCombo().id == "swordknife"

	if isRanged == false and DisabledThunderingGong == true then
		newDamage = newDamage + 1
	end

	if isRanged == false and isSword == true and DisabledWeightedPommel == true then
		newDamage = newDamage + 1
	end

	for _, enemy in pairs(enemies) do
		enemy.DoEffectHit(newDamage, damageType.PLAYER_PRIMARY_KNOCKBACK)
	end

	return newDamage
end

function FilterEnemies(enemies, originalEnemy)
	local result = {}
	for enemy in enemies do
		if enemy.gameObject ~= originalEnemy.gameObject and enemy.networkedInvincible == base.ToNetworkBool(false) then
			table.insert(result, enemy)
		end
	end
	return result
end
