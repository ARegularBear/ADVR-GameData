function ADVR.onLoad()
	pickup.name = "Catgut Mesh"
	pickup.desc = "Deflected enemy projectiles do more damage"
	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onMeleeHitEntity(hitInfos)
	if hitInfos.entity == nil then
		return hitInfos.damage
	end
	
	if hitInfos.entity ~= nil then
		local bulletBase = hitInfos.entity.GetComponent_BulletBase_()
		if bulletBase ~= nil then
			bulletBase.damageMultiplier = 2.0
		end
	end
	
	return hitInfos.damage
end