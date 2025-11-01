function ADVR.onLoad()
	pickup.name = "Deafening Bell"
	pickup.desc = "When hit, nearby enemies are knocked back"
	pickup.weight = 100
	pickup.tier = 1
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage)
	-- knockback the enemies --
	local enemies = game.GetEnemiesInRadius(4, player.transform.position)
	for v in enemies do
		if v.isBoss() == false then
			v.RpcKnockback(6, player.transform.position, 15, 1)
		end
	end
	audio.PlaySoundNetwork(sounds.SFX_DEAFENING_BELL, player.transform.position)

	return damage
end