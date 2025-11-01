function ADVR.onLoad()
	pickup.name = "Dragon Lung"
	pickup.desc = "When hit, nearby enemies are set on fire"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage)
	local enemies = game.GetEnemiesInRadius(4, player.transform.position)
	for v in enemies do
		v.applyEffect(damageType.FIRE, player.PrimaryDamage.GetValueFloat() * 2.5)
		audio.PlaySoundLocal(sounds.SFX_DRAGON_LUNG, player.transform.position)
	end
	return damage
end