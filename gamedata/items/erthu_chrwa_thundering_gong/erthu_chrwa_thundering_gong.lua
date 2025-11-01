function ADVR.onLoad()
	pickup.name = "Thundering Gong"
	pickup.desc = "Melee strikes deal a small amount of damage to nearby enemies"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		local enemies = game.GetEnemiesInRadius(9, player.transform.position, true)
		for livingBase in enemies do
			if livingBase.gameObject ~= infos.entity.gameObject then
				livingBase.DoHit(infos.usedWeapon.networkObject, 1, damageType.PLAYER_PRIMARY_NO_KNOCKBACK, infos.hitPosition)
			end
		end
	end

	return infos.damage
end