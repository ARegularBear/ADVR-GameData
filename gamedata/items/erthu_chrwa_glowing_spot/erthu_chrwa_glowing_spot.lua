function ADVR.onLoad()
	pickup.name = "Glowing Spot"
	pickup.desc = "Reduce bosses' health by 25% with your first weapon strike"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS}
	pickup.priority = -100 --low priority so the swordHitEntity runs last
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsBoss() and infos.entity.MaxHealth == infos.entity.Health then
			audio.PlaySoundNetwork(sounds.SFX_GLOWING_ORANGE_SPOT, infos.hitPosition)
			return infos.entity.MaxHealth * 0.25 + infos.damage
		end
	end

	return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsBoss() and infos.entity.MaxHealth == infos.entity.Health then
			audio.PlaySoundNetwork(sounds.SFX_GLOWING_ORANGE_SPOT, infos.hitPosition)
			return infos.entity.MaxHealth * 0.25 + infos.damage
		end
	end

	return infos.damage
end