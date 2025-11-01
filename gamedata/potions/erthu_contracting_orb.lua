function ADVR.onLoad()
	potion.name = "Contracting Orb"
	potion.desc = "Throw to temporarily reduce the size of anything nearby."
	potion.weight = 25
	potion.effectTime = 30
	potion.price = 15
	potion.spawnsIn = {relicPool.SHOP, relicPool.SECRET, relicPool.SACRIFICE}
	potion.color = colors.Create(201.0/255.0,125.0/255.0,300.0/255.0,1)

	potion.affectsPlayer = true
	potion.affectsEnemies = false
	potion.affectsLiving = true
	potion.breakEffectDistance = 2
	potion.showActiveVignette = false
	potion.createEffectInstance = true
	potion.supportedInMultiplayer = false
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance)
	if effectInstance.affectedPlayer ~= nil then
		player.ScaleTo(0.5, 1.5)
	end

	if effectInstance.affectedLivings ~= nil then
		for v in effectInstance.affectedLivings do
			if v ~= nil and v.transform ~= nil and v.isBoss() == false then
				-- inventory item check --
				local bi = v.gameObject.GetComponent_BaseInteract_()
				if bi ~= nil and bi.isInInventory then
					return
				end 

				v.ScaleTo(v.transform.localScale.x * 0.5, 1.5)

				-- shopkeeper check --
				local shopkeeper = v.gameObject.GetComponent_Shopkeeper_()
				if shopkeeper ~= nil then
					ReduceUpgradePrice(v.transform.position)
				end
			end
		end
	end
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
	if potion.GetTimesPlayerAffected() == 0 then
		player.ScaleTo(1, 1.5)
	end

	if effectInstance.affectedLivings ~= nil then
		for v in effectInstance.affectedLivings do
			if v ~= nil and v.transform ~= nil and v.isBoss() == false then
				local bi = v.gameObject.GetComponent_BaseInteract_()
				if bi ~= nil and bi.isInInventory then
					return
				end 
				v.ScaleTo(v.transform.localScale.x * 2, 1.5)
			end
		end
	end
end

function ReduceUpgradePrice(pos)
	local upgrades = game.FindObjectsByTypeUnsorted(game.GetType("ItemUpgrade")) ---@type ItemUpgrade[]

	for i = 0, #upgrades - 1 do
		if vector3.Distance(upgrades[i].transform.position, pos) < 7 then
			upgrades[i].PriceInShop = upgrades[i].UnmodifiedPriceInShop * 0.5
		end
	end
end
