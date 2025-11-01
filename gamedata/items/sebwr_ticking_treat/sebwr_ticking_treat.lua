function ADVR.onLoad()
	pickup.name = "Ticking Treat"
	pickup.desc = "Food explodes when striking enemies"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
	game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onObjectGrab(object, hand)
	if object.gameObject.GetComponent_ItemFood_() ~= nil then
		local collisionModdingHelper = object.gameObject.GetComponent_CollisionModdingHelper_()
		if collisionModdingHelper == nil then
			local newColl = object.gameObject.AddComponent(game.GetType("CollisionModdingHelper")) ---@type CollisionModdingHelper|Component
			newColl.layerMask = layerMask.GetMask("Enemy", "EnemyNoCollide")
		end
	end
end

function ADVR.onObjectCollide(object, collision)
	-- Check why the collision is done twice...
	local explosion = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, object.gameObject.transform.position).GetComponent_Explosion_()
	local food = object.gameObject.GetComponent_ItemFood_()

	explosion.damage =  food.healAmount * 15
	game.Delete(object.gameObject)
end