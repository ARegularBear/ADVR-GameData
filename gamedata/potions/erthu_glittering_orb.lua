function ADVR.onLoad()
	potion.name = "Glittering Orb"
	potion.desc = "Throw to transform nearby enemies or objects in gold."
	potion.weight = 15
	potion.effectTime = 10
	potion.price = 15
	potion.spawnsIn = {relicPool.SACRIFICE}
	potion.color = colors.Create(350.0/255.0,350.0/255.0,70.0/255.0,1)
    potion.contactDamage = false
	game.dropTableHandler.CreateDropTable("midasPotion")
	game.dropTableHandler.AddToDropTable("midasPotion", "item_coin", 1, 1, 1, 15, 20)

	potion.createEffectInstance = true
	potion.supportedInMultiplayer = true

	game.RegisterForRPCEvents(potion)
end

function ADVR.PotionEvents.onPotionBreak(tmpPotion, tmpEffectInstance, stateAuthority)

	if stateAuthority then
		local living = game.GetLivingInRadius(2, tmpPotion.transform.position)
		local objectsTurnedIntoGold = 0
		for v in living do
			if objectsTurnedIntoGold > 3 then
				break
			end

			if v ~= nil and v.gameObject ~= nil then
				-- check if potion --
				local itemPotion = v.gameObject.GetComponent_ItemPotion_()
				local enemy = v.gameObject.GetComponent_EnemyBase_()
				local canTurnToGold = itemPotion == nil and (enemy == nil or not enemy.isBoss())

				if canTurnToGold then
					objectsTurnedIntoGold = objectsTurnedIntoGold + 1
					potion.SendRPCEvent(0, vector3.zero, v.networkObject, rpcType.TO_ALL)
				end
			end
		end
	end
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position, networkObject)
	local material = game.stringToObjectMapper.GetMaterial("gold")

	if networkObject == nil or networkObject.gameObject == nil then
		return
	end

	-- double food heal amount
	local food = networkObject.gameObject.GetComponent_ItemFood_()
	if food ~= nil then
		food.healAmount = food.healAmount * 2
	end

    -- replace normal chest with golden ones
	local chest = networkObject.gameObject.GetComponent_Chest_()
    if chest ~= nil and chest.livingId == "prop_chest_default" and networkObject.HasStateAuthority then
        if chest.networkedInvincible == base.ToNetworkBool(false) then
            local transformOldChest = networkObject.gameObject.transform
            game.Delete(networkObject.gameObject)
            local newChest = game.SpawnObjectNetwork("prop_chest_golden", transformOldChest.position)
            newChest.transform.rotation = transformOldChest.rotation
            return
        end
    end

    -- replace normal pots with golden ones
	local pot = networkObject.gameObject.GetComponent_LivingBase_()
    if pot ~= nil and pot.livingId == "prop_pot" and networkObject.HasStateAuthority then
        local transformOldPot = networkObject.gameObject.transform
        game.Delete(networkObject.gameObject)
        local newPot = game.SpawnObjectNetwork(objects.PROP_POT_GOLDEN, transformOldPot.position)
        newPot.transform.rotation = transformOldPot.rotation
    end

    -- replace normal slimes with golden slimes 
	local slime = networkObject.gameObject.GetComponent_LivingBase_()
    if slime ~= nil and string.find(slime.livingId, "slime") and networkObject.HasStateAuthority then
        local transformOldPot = networkObject.gameObject.transform
        game.Delete(networkObject.gameObject)
        local newSlime = game.SpawnObjectNetwork(objects.ENEMY_GOLDEN_SLIME, transformOldPot.position)
        newSlime.transform.rotation = transformOldPot.rotation
    end

	-- color in gold 
	local components = networkObject.gameObject.GetComponentsInChildren(game.GetType("MeshRenderer")) ---@type MeshRenderer[]
	if components ~= nil then
		for i=0, #components - 1 do
			if components[i] ~= nil then
				if components[i].GetComponent_TextMeshPro_() == nil then
					components[i].material = material
				end
			end
		end
	end

	-- add drop table if object has none, if yes, rename it 
	local dropOnDeath = networkObject.gameObject.GetComponent_DropOnDeath_()
	if dropOnDeath == nil then
		dropOnDeath = networkObject.gameObject.AddComponent(game.GetType("DropOnDeath")) ---@type DropOnDeath
	end
	dropOnDeath.dropTableName = "midasPotion"
	dropOnDeath.SubscribeEvents()

	-- add custom data to object, indicating that it is golden
	helperMethods.AttachCustomData(networkObject.gameObject, "is_golden", true)
end

function ADVR.PotionEvents.onPotionRunOut()
end