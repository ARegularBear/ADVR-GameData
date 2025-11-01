function ADVR.onLoad()
	pickup.name = "Cracked Powderhorn"
	pickup.desc = "Pots and crates explode when broken"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 2
	pickup.price = 45
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
	pickup.entityDeathListeners = {"prop_pot", "prop_crate", "prop_crate_small"}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onEntityDeath(living, source)
	if source == player.LocalPlayerRef then
		local pos = living.transform.position
		pickup.CallFunctionIn("Explode", 0.075, pos)
	end
end

function Explode(position)
	local explosion = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, position).GetComponent_Explosion_()
	explosion.damage = (player.PrimaryDamage.GetValueFloat() + player.SecondaryDamage.GetValueFloat()) * 0.75
end