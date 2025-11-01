function ADVR.onLoad()
	pickup.name = "Merchants Mark"
	pickup.desc = "Once charged, use to convert nearby relics to coins"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = 4
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local pickups = game.FindObjectsByTypeUnsorted(game.GetType("ItemUpgrade"))
	for p in pickups do
		if vector3.Distance(p.transform.position, player.transform.position) < 5 then
			if p.currentlyInShop == false then
				player.currentCash = player.currentCash + p.rolledItem.tier * 12
				game.Delete(p.gameObject)	
			end
		end
	end
end