
function ADVR.onLoad()
	pickup.name = "Needle of Oroborous"
	pickup.desc = "Ranged strikes deal drastically increased damage, but misses damage you"
	pickup.weight = 33
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true

	ShouldDamagePlayer = false
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRangedHitEntity(infos)
	audio.PlaySoundLocal(sounds.SFX_STRAIGHT_RAZOR, infos.hitPosition)
	return infos.damage * 2
end

function ADVR.onKnifeThrow()
	ShouldDamagePlayer = true
end

function ADVR.onRangedWeaponCollide(knife,collision)
	if ShouldDamagePlayer == false then
		return
	end

	if collision.rigidbody ~= nil then
		local enemy = collision.rigidbody.gameObject.GetComponentInParent(game.GetType("EnemyBase"))
		if enemy == nil then
			player.DamagePlayer(1, false)
		end
	else
		player.DamagePlayer(1, false)
	end

	ShouldDamagePlayer = false
end