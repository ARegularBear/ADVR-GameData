function ADVR.onLoad()
	pickup.name = "Myopic Lens"
	pickup.desc = "Your damage is drastically increased, but it alternates between your primary and secondary weapon"
	pickup.weight = 40
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.BOSS }
	HitCounter = 0
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		if HitCounter % 2 == 0 then
			return infos.damage + helperMethods.GetRangedDamageStat().GetValueFloat()
		else
			return 1
		end
	end
	
	if HitCounter % 2 == 0 then
		if infos.entity.IsEnemy() then
			HitCounter = HitCounter + 1
		end
		return infos.damage + helperMethods.GetRangedDamageStat().GetValueFloat()
	else
		if infos.entity.IsEnemy() then
			HitCounter = HitCounter + 1
		end
		return 1
	end
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		if HitCounter % 2 == 1 then
			return infos.damage + helperMethods.GetMeleeDamageStat().GetValueFloat()
		else
			return 1
		end
	end

	if HitCounter % 2 == 1 then
		if infos.entity.IsEnemy() then
			HitCounter = HitCounter + 1
		end
		return infos.damage + helperMethods.GetMeleeDamageStat().GetValueFloat()
	else
		if infos.entity.IsEnemy() then
			HitCounter = HitCounter + 1
		end
		return 1
	end
end